
/* /data/kessler/MTO_file_for_Youth_MH_paper/ */
OPTIONS NOFMTERR MPRINT LINESIZE=80;
LIBNAME mto '/data/kessler/MTO_file_for_Youth_MH_paper/Data_Updated_20131011/';
LIBNAME mtoold '/data/kessler/MTO_file_for_Youth_MH_paper/Data_Updated_20130719/';
LIBNAME home '/home/hwang/MTO/work_folder';
LIBNAME jrrdata '/home/hwang/MTO/MTO_revision_10112013/DATA';
%INCLUDE '/data/kessler/MTO_file_for_Youth_MH_paper/Data_Updated_20130719/sas_adytobs_fmts_20120406.sas';
%INCLUDE '/data/kessler/MTO_file_for_Youth_MH_paper/Data_Updated_20130719/sas_wgt_formats.sas';
ODS RESULTS OFF;

ods html style=sasweb file="/home/hwang/MTO/MTO_revision_10112013/design_new.html";
proc freq  data=mto.mto_yt_mh_ppr_file_20131011;
 tables  ra_site*f_svy_bl_tract_masked_id/list missing;
 where f_svy_final_disp^="NI-DC";
run;
ods html close;

*===============================================;
*	MACRO: STORES LIST OF VARIABLES IN MACRO
*===============================================;

/* DONT FORGET TO SET &outname AS GLOBAL !! */
%MACRO VAR_CONCAT(filename,colname,outname);
	DATA _NULL_; SET &filename;
		CALL SYMPUT('varcount',_N_);
	RUN;
	%LET lastvar = ;
	%DO iter = 1 %TO &varcount;
		DATA _NULL_; SET &filename;
			IF &iter = _N_;
			CALL SYMPUT('current',STRIP(&colname));
		DATA this;
			a = "&lastvar";
			b = "&current";
			c = a||' '||b;
			CALL SYMPUT('lastvar',STRIP(c));
		RUN;
	%END;
	DATA _NULL_; SET this;
		CALL SYMPUT("&outname",c);
	RUN;
%MEND;

*===============================================;
*	MACRO: MAKE YOUTH PTSD VARS
*===============================================;
%MACRO MAKE_YOUTH_PTSD(rawvar);
/*IF &rawvar NE 1 THEN &rawvar = 5;*/
IF &rawvar = 1 THEN &rawvar._new = 1;
IF &rawvar = 5 THEN &rawvar._new = 0;
%MEND;

*===============================================;
*	MACRO: EXTRACT PREVALENCE & SE
*===============================================;

%MACRO GET_VALUES;
  IF _N_ = 1 THEN DO;
  	CALL SYMPUT('f_ctr',colpercent);
	CALL SYMPUT('f_ctr_se',colstderr);
  END;
  IF _N_ = 2 THEN DO;
  	CALL SYMPUT('f_int',colpercent);
	CALL SYMPUT('f_int_se',colstderr);
  END;
  IF _N_ = 3 THEN DO;
  	CALL SYMPUT('m_ctr',colpercent);
	CALL SYMPUT('m_ctr_se',colstderr);
  END;
  IF _N_ = 4 THEN DO;
  	CALL SYMPUT('m_int',colpercent);
	CALL SYMPUT('m_int_se',colstderr);
  END;
%MEND;

*===============================================;
*	MACRO: USED TO MAKE CONDUCT DISORDER
*===============================================;

/* Macro for making new categories */
%MACRO New_Categories(orig,newname);
  /*&newname._12m = 0;*/
  IF &orig = 0 THEN &newname._12m = 0;
  IF &orig = 1 THEN &newname._12m = 1;
  IF &orig IN (2,3) THEN &newname._12m = 2;
  IF &orig IN (4,5) THEN &newname._12m = 3;
  if &orig > 5 THEN &newname._12m = 4;
%MEND;

%MACRO Define_Conduct_Disorder(thres);
  IF YRB16B_U16A >= &thres THEN PropCrimes_Cat_&thres.x = 1;
  IF SUM(YRB16D_U16B,YRB16F_U16C) >= &thres THEN  Theft_Cat_&thres.x = 1;
  IF SUM(YRB16H_U16D,YRB15_U15) >= &thres THEN Deceitful_Cat_&thres.x = 1;
  IF YRB16J_U16E >= &thres THEN SeriousFights_Cat_&thres.x = 1;
  IF YRB18_U18 >= &thres THEN RuleViolation_Cat_&thres.x = 1;
  IF SUM(PropCrimes_Cat_&thres.x,
         Theft_Cat_&thres.x,
         Deceitful_Cat_&thres.x,
         SeriousFights_Cat_&thres.x,
         RuleViolation_Cat_&thres.x) >= 3 THEN cd_&thres.x = 1;
  ELSE cd_&thres.x = 0;
%MEND;

/*data with total sample*/
DATA impdata;
 SET home.impdata;
RUN;
PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN; 
/*data restricted to males*/
DATA impdata_m;
 SET home.impdata;
 IF x_f_ch_male=1;
RUN;
PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN;
/*data restricted to females*/
DATA impdata_f;
 SET home.impdata;
 IF x_f_ch_male=0;
RUN;
PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN; 

%MACRO jrrwgts(indata,weight,stratum,nclust,out);
** Create a data set with &nclust (=35 for MTO) weights. Each of the weights 
is set to zero for half the strata and used in one of 35 iterations;
DATA one;
     SET &indata;

%MACRO wgtcal ;

        %DO i=1 %TO &nclust ;
        pwt&i=&weight;
        IF &STRATUM=%EVAL(&i+0) AND SECU=1 THEN pwt&i=pwt&i*2 ;
        IF &STRATUM=%EVAL(&i+0) AND SECU=2 THEN pwt&i=0 ;
        %end;
%MEND;
%wgtcal ;

DATA impdata_jrr;
 SET one;
PROC SORT; BY strata secu;
RUN;
DATA impdata_jrrm;
 SET one;
 IF x_f_ch_male=1;
PROC SORT; BY strata secu;
RUN;
DATA impdata_jrrf;
 SET one;
 IF x_f_ch_male=0;
PROC SORT; BY strata secu;
RUN;

%MEND;
%jrrwgts(home.impdata,f_wt_totcore98,strata,35);
/*
Table 2:
 Run the table in tab "T2a" from "/home/hwang/MTO/MTO_revision_10112013/MTO_revision_tables_10232013.xlsx"
*/

 %MACRO codeimp(num);
   IF domain="Imputation Number=&num" THEN _imputation_=&num;
 %MEND;
 %MACRO codeallimp;
  %codeimp(1);
  %codeimp(2);
  %codeimp(3);
  %codeimp(4);
  %codeimp(5);
  %codeimp(6);
  %codeimp(7);
  %codeimp(8);
  %codeimp(9);
  %codeimp(10);
  %codeimp(11);
  %codeimp(12);
  %codeimp(13);
  %codeimp(14);
  %codeimp(15);
  %codeimp(16);
  %codeimp(17);
  %codeimp(18);
  %codeimp(19);
  %codeimp(20);
 %MEND;
%MACRO runmodels(data=,dep=,controls=,modnum=,);

/*
Logsitic Model
*/

PROC SURVEYLOGISTIC DATA = &data  ; 
   STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
   DOMAIN _imputation_;
   MODEL &dep (EVENT='1') = &controls / COVB; 
   WEIGHT f_wt_totcore98 ;
   OUTPUT OUT=preddata PREDICTED=pp;
   ODS OUTPUT parameterestimates=parmest  
              OddsRatios = or   
              covb=covm  ;
RUN;


DATA parmest; SET parmest (WHERE=(CMISS(domain)=0)); %codeallimp;
DATA or; SET or (WHERE=(CMISS(domain)=0)); %codeallimp; 
DATA covm; SET covm (WHERE=(CMISS(domain)=0)); %codeallimp;
RUN;

/*
Get OR and chisquare tests through Mianalyze
*/

PROC MIANALYZE PARMS = parmest  XPXI=covm;
   MODELEFFECTS intercept &controls ;
   ODS OUTPUT ParameterEstimates = outres;

   %IF &modnum=1 OR &modnum=2 OR &modnum=4 OR &modnum=5 OR &modnum=7 OR &modnum=8 %THEN %DO;
   ODS OUTPUT TestMultStat = outtests;
   %END;

   %IF &modnum=1 %THEN %DO; 
   test1: TEST ra_grp_exp=ra_grp_s8=0 / MULT;
   %END;
   %IF &modnum=2 %THEN %DO; 
   test1: TEST intervention=ra_grp_s8=0 / MULT;
   %END; 
   %IF &modnum=4 %THEN %DO; 
   test1: TEST ra_grp_exp=ra_grp_s8=0 / MULT; 
   %END;
   %IF &modnum=5 %THEN %DO; 
   test1: TEST intervention=ra_grp_s8=0 / MULT; 
   %END;
   %IF &modnum=7 %THEN %DO; 
   test1: TEST ra_grp_exp=ra_grp_s8=0 / MULT; 
   test2: TEST int_main1=int_main2=0 / MULT;
   %END;
   %IF &modnum=8 %THEN %DO; 
   test1: TEST intervention=ra_grp_s8=0 / MULT; 
   test2: TEST int_either=int_main2=0 / MULT;
   %END;

RUN;

DATA outres1 (KEEP=parm or lowor upor chivalue p) ; 
 SET outres; 
 IF parm ^="intercept";
 or = EXP(estimate);
 lowor = EXP(lclmean);
 upor = EXP(uclmean);
   

 chivalue=tvalue*tvalue;
 p=probt;
 

 parm=UPCASE(parm);
RUN;

%IF &modnum=1 OR &modnum=2 OR &modnum=4 OR &modnum=5 OR &modnum=7 OR &modnum=8 %THEN %DO;
DATA outtests1 (KEEP=test chigrp&modnum pgrp&modnum); 
 SET outtests;

 chiv=FValue*NumDF; 

 chigrp&modnum=chiv;
 pgrp&modnum=probF;
RUN;
%END;


%IF &modnum=1 %THEN %DO;
DATA col1 (DROP=parm); SET outres1 (WHERE=(parm="RA_GRP_EXP") RENAME=(or=or&modnum._1 lowor=lowor&modnum._1 upor=upor&modnum._1 chivalue=chivalue&modnum._1 p=p&modnum._1));  
DATA col2 (DROP=parm); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(or=or&modnum._2 lowor=lowor&modnum._2 upor=upor&modnum._2 chivalue=chivalue&modnum._2 p=p&modnum._2)); 
DATA model1or_&dep ;
 MERGE col1 col2 outtests1 (KEEP=chigrp&modnum pgrp&modnum);
RUN;
%END;

%IF &modnum=2 %THEN %DO;
DATA col3 (DROP=parm); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(or=or&modnum._1 lowor=lowor&modnum._1 upor=upor&modnum._1 chivalue=chivalue&modnum._1 p=p&modnum._1));  
DATA col4 (DROP=parm); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(or=or&modnum._2 lowor=lowor&modnum._2 upor=upor&modnum._2 chivalue=chivalue&modnum._2 p=p&modnum._2)); 
DATA model2or_&dep ;
 MERGE col3 col4 outtests1 (KEEP=chigrp&modnum pgrp&modnum);
RUN;
%END;

%IF &modnum=3 %THEN %DO;
DATA col5 (DROP=parm); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(or=or&modnum._1 lowor=lowor&modnum._1 upor=upor&modnum._1 chivalue=chivalue&modnum._1 p=p&modnum._1));   
DATA model3or_&dep ;
 MERGE col5;
RUN;
%END; 

%IF &modnum=4 %THEN %DO;
DATA col__1 (DROP=parm); SET outres1 (WHERE=(parm="RA_GRP_EXP") RENAME=(or=or&modnum._1 lowor=lowor&modnum._1 upor=upor&modnum._1 chivalue=chivalue&modnum._1 p=p&modnum._1));  
DATA col__2 (DROP=parm); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(or=or&modnum._2 lowor=lowor&modnum._2 upor=upor&modnum._2 chivalue=chivalue&modnum._2 p=p&modnum._2)); 
DATA col__3 (DROP=parm); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(or=or&modnum._3 lowor=lowor&modnum._3 upor=upor&modnum._3 chivalue=chivalue&modnum._3 p=p&modnum._3));  
DATA model4or_&dep ;
 MERGE col__1 col__2 col__3  outtests1 (KEEP=chigrp&modnum pgrp&modnum) ;
RUN;
%END;

%IF &modnum=5 %THEN %DO;
DATA col__4 (DROP=parm); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(or=or&modnum._1 lowor=lowor&modnum._1 upor=upor&modnum._1 chivalue=chivalue&modnum._1 p=p&modnum._1));  
DATA col__5 (DROP=parm); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(or=or&modnum._2 lowor=lowor&modnum._2 upor=upor&modnum._2 chivalue=chivalue&modnum._2 p=p&modnum._2)); 
DATA col__6 (DROP=parm); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(or=or&modnum._3 lowor=lowor&modnum._3 upor=upor&modnum._3 chivalue=chivalue&modnum._3 p=p&modnum._3));  
DATA model5or_&dep ;
 MERGE col__4 col__5 col__6  outtests1 (KEEP=chigrp&modnum pgrp&modnum) ;
RUN;
%END;

%IF &modnum=6 %THEN %DO;
DATA col__7 (DROP=parm); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(or=or&modnum._1 lowor=lowor&modnum._1 upor=upor&modnum._1 chivalue=chivalue&modnum._1 p=p&modnum._1));   
DATA col__8 (DROP=parm); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(or=or&modnum._2 lowor=lowor&modnum._2 upor=upor&modnum._2 chivalue=chivalue&modnum._2 p=p&modnum._2));  
DATA model6or_&dep ;
 MERGE col__7 col__8;
RUN;
%END;


%IF &modnum=7 %THEN %DO;
DATA col_1 (DROP=parm); SET outres1 (WHERE=(parm="RA_GRP_EXP") RENAME=(or=or&modnum._1 lowor=lowor&modnum._1 upor=upor&modnum._1 chivalue=chivalue&modnum._1 p=p&modnum._1));  
DATA col_2 (DROP=parm); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(or=or&modnum._2 lowor=lowor&modnum._2 upor=upor&modnum._2 chivalue=chivalue&modnum._2 p=p&modnum._2)); 
DATA col_3 (DROP=parm); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(or=or&modnum._3 lowor=lowor&modnum._3 upor=upor&modnum._3 chivalue=chivalue&modnum._3 p=p&modnum._3)); 
DATA col_4 (DROP=parm); SET outres1 (WHERE=(parm="INT_MAIN1") RENAME=(or=or&modnum._4 lowor=lowor&modnum._4 upor=upor&modnum._4 chivalue=chivalue&modnum._4 p=p&modnum._4)); 
DATA col_5 (DROP=parm); SET outres1 (WHERE=(parm="INT_MAIN2") RENAME=(or=or&modnum._5 lowor=lowor&modnum._5 upor=upor&modnum._5 chivalue=chivalue&modnum._5 p=p&modnum._5)); 
DATA outtests1_&modnum._1 (KEEP=chigrp1_&modnum p1grp_&modnum); SET outtests1  (WHERE=(test="test1") RENAME=(chigrp&modnum=chigrp1_&modnum pgrp&modnum=p1grp_&modnum));
DATA outtests1_&modnum._2 (KEEP=chigrp2_&modnum p2grp_&modnum); SET outtests1  (WHERE=(test="test2") RENAME=(chigrp&modnum=chigrp2_&modnum pgrp&modnum=p2grp_&modnum)); 
DATA model7or_&dep ;
 MERGE col_1 col_2 col_3 col_4 col_5 outtests1_&modnum._1 outtests1_&modnum._2;
RUN;
%END;

%IF &modnum=8 %THEN %DO;
DATA col_6 (DROP=parm); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(or=or&modnum._1 lowor=lowor&modnum._1 upor=upor&modnum._1 chivalue=chivalue&modnum._1 p=p&modnum._1));  
DATA col_7 (DROP=parm); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(or=or&modnum._2 lowor=lowor&modnum._2 upor=upor&modnum._2 chivalue=chivalue&modnum._2 p=p&modnum._2)); 
DATA col_8 (DROP=parm); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(or=or&modnum._3 lowor=lowor&modnum._3 upor=upor&modnum._3 chivalue=chivalue&modnum._3 p=p&modnum._3)); 
DATA col_9 (DROP=parm); SET outres1 (WHERE=(parm="INT_EITHER") RENAME=(or=or&modnum._4 lowor=lowor&modnum._4 upor=upor&modnum._4 chivalue=chivalue&modnum._4 p=p&modnum._4)); 
DATA col_10 (DROP=parm); SET outres1 (WHERE=(parm="INT_MAIN2") RENAME=(or=or&modnum._5 lowor=lowor&modnum._5 upor=upor&modnum._5 chivalue=chivalue&modnum._5 p=p&modnum._5)); 
DATA outtests1_&modnum._1 (KEEP=chigrp1_&modnum p1grp_&modnum); SET outtests1  (WHERE=(test="test1") RENAME=(chigrp&modnum=chigrp1_&modnum pgrp&modnum=p1grp_&modnum));
DATA outtests1_&modnum._2 (KEEP=chigrp2_&modnum p2grp_&modnum); SET outtests1  (WHERE=(test="test2") RENAME=(chigrp&modnum=chigrp2_&modnum pgrp&modnum=p2grp_&modnum)); 
DATA model8or_&dep ;
 MERGE col_6 col_7 col_8 col_9 col_10 outtests1_&modnum._1 outtests1_&modnum._2;
RUN;
%END;

%IF &modnum=9 %THEN %DO;
DATA col_11 (DROP=parm); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(or=or&modnum._1 lowor=lowor&modnum._1 upor=upor&modnum._1 chivalue=chivalue&modnum._1 p=p&modnum._1));   
DATA col_12 (DROP=parm); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(or=or&modnum._2 lowor=lowor&modnum._2 upor=upor&modnum._2 chivalue=chivalue&modnum._2 p=p&modnum._2)); 
DATA col_13 (DROP=parm); SET outres1 (WHERE=(parm="INT_EITHER") RENAME=(or=or&modnum._3 lowor=lowor&modnum._3 upor=upor&modnum._3 chivalue=chivalue&modnum._3 p=p&modnum._3)); 
DATA model9or_&dep ;
 MERGE col_11 col_12 col_13;
RUN;
%END;

/*
Absolute Risk and Absolute Risk Reduction
*/

/*Total*/

%IF &modnum=1 %THEN %DO;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE ra_grp_exp=1;
 ODS OUTPUT STATISTICS=m1;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE ra_grp_s8=1;
 ODS OUTPUT STATISTICS=m2;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE ra_grp_exp=0 AND ra_grp_s8=0;
 ODS OUTPUT STATISTICS=m3;

RUN;

PROC SQL NOPRINT;
   SELECT mean
   INTO : mean_exp
   From m1;
   SELECT mean
   INTO : mean_s8
   From m2;
   SELECT mean
   INTO : mean_control
   From m3;
QUIT;
  
 DATA abrow1;
  or&modnum._1=&mean_exp*100;
  or&modnum._2=&mean_s8*100;
  or&modnum._c=&mean_control*100;

 DATA abrow2; 
  or&modnum._1=(&mean_control-&mean_exp)*100; 
  or&modnum._2=(&mean_control-&mean_s8)*100; 
 RUN;

   
%END;


%IF &modnum=2 %THEN %DO;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE intervention=1;
 ODS OUTPUT STATISTICS=m1;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE ra_grp_s8=1;
 ODS OUTPUT STATISTICS=m2;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE intervention=0 AND ra_grp_s8=0;
 ODS OUTPUT STATISTICS=m3;

RUN;

PROC SQL NOPRINT;
   SELECT mean
   INTO : mean_exp
   From m1;
   SELECT mean
   INTO : mean_s8
   From m2;
   SELECT mean
   INTO : mean_control
   From m3;
QUIT;
  
 DATA abrow1;
  or&modnum._1=&mean_exp*100;
  or&modnum._2=&mean_s8*100;
  or&modnum._c=&mean_control*100;

 DATA abrow2; 
  or&modnum._1=(&mean_control-&mean_exp)*100; 
  or&modnum._2=(&mean_control-&mean_s8)*100; 
 RUN;

%END;


%IF &modnum=3 %THEN %DO;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE intervention=1;
 ODS OUTPUT STATISTICS=m1; 

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE intervention=0 ;
 ODS OUTPUT STATISTICS=m3;

RUN;

PROC SQL NOPRINT;
   SELECT mean
   INTO : mean_exp
   From m1; 
   SELECT mean
   INTO : mean_control
   From m3;
QUIT;
  
 DATA abrow1;
  or&modnum._1=&mean_exp*100; 
  or&modnum._c=&mean_control*100;

 DATA abrow2; 
  or&modnum._1=(&mean_control-&mean_exp)*100;  
 RUN;

%END;



%IF &modnum=7 %THEN %DO;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE ra_grp_exp=1;
 ODS OUTPUT STATISTICS=m1;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE ra_grp_s8=1;
 ODS OUTPUT STATISTICS=m2;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE ra_grp_exp=0 AND ra_grp_s8=0;
 ODS OUTPUT STATISTICS=m3;


PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE x_f_ch_male=1;
 ODS OUTPUT STATISTICS=m4;


PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE x_f_ch_male=0;
 ODS OUTPUT STATISTICS=m5;


PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE int_main1=1;
 ODS OUTPUT STATISTICS=m6;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE int_main2=1;
 ODS OUTPUT STATISTICS=m7;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE int_main1=0 AND int_main2=0;
 ODS OUTPUT STATISTICS=m8;

RUN;


PROC SQL NOPRINT;
   SELECT mean
   INTO : mean_1
   From m1;
   SELECT mean
   INTO : mean_2
   From m2;
   SELECT mean
   INTO : mean_c1
   From m3;
   SELECT mean
   INTO : mean_3
   From m4;
   SELECT mean
   INTO : mean_c2
   From m5;
   SELECT mean
   INTO : mean_4
   From m6;
   SELECT mean
   INTO : mean_5
   From m7;
   SELECT mean
   INTO : mean_c3
   From m8;
QUIT;
  
 DATA abrow1;
  or&modnum._1=&mean_1*100;
  or&modnum._2=&mean_2*100;
  or&modnum._c1=&mean_c1*100;
  or&modnum._3=&mean_3*100;
  or&modnum._c2=&mean_c2*100;
  or&modnum._4=&mean_4*100;
  or&modnum._5=&mean_5*100;
  or&modnum._c3=&mean_c3*100;

 DATA abrow2; 
  or&modnum._1=(&mean_c1-&mean_1)*100; 
  or&modnum._2=(&mean_c1-&mean_2)*100; 
  or&modnum._3=(&mean_c2-&mean_3)*100; 
  or&modnum._4=(&mean_c3-&mean_4)*100; 
  or&modnum._5=(&mean_c3-&mean_5)*100; 
 RUN;

%END;


%IF &modnum=8 %THEN %DO;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE intervention=1;
 ODS OUTPUT STATISTICS=m1;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE ra_grp_s8=1;
 ODS OUTPUT STATISTICS=m2;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE intervention=0 AND ra_grp_s8=0;
 ODS OUTPUT STATISTICS=m3;


PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE x_f_ch_male=1;
 ODS OUTPUT STATISTICS=m4;


PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE x_f_ch_male=0;
 ODS OUTPUT STATISTICS=m5;


PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE int_either=1;
 ODS OUTPUT STATISTICS=m6;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE int_main2=1;
 ODS OUTPUT STATISTICS=m7;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE int_either=0 AND int_main2=0;
 ODS OUTPUT STATISTICS=m8;

RUN;


PROC SQL NOPRINT;
   SELECT mean
   INTO : mean_1
   From m1;
   SELECT mean
   INTO : mean_2
   From m2;
   SELECT mean
   INTO : mean_c1
   From m3;
   SELECT mean
   INTO : mean_3
   From m4;
   SELECT mean
   INTO : mean_c2
   From m5;
   SELECT mean
   INTO : mean_4
   From m6;
   SELECT mean
   INTO : mean_5
   From m7;
   SELECT mean
   INTO : mean_c3
   From m8;
QUIT;
  
 DATA abrow1;
  or&modnum._1=&mean_1*100;
  or&modnum._2=&mean_2*100;
  or&modnum._c1=&mean_c1*100;
  or&modnum._3=&mean_3*100;
  or&modnum._c2=&mean_c2*100;
  or&modnum._4=&mean_4*100;
  or&modnum._5=&mean_5*100;
  or&modnum._c3=&mean_c3*100;

 DATA abrow2; 
  or&modnum._1=(&mean_c1-&mean_1)*100; 
  or&modnum._2=(&mean_c1-&mean_2)*100; 
  or&modnum._3=(&mean_c2-&mean_3)*100; 
  or&modnum._4=(&mean_c3-&mean_4)*100; 
  or&modnum._5=(&mean_c3-&mean_5)*100; 
 RUN;

%END;




%IF &modnum=9 %THEN %DO;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE intervention=1;
 ODS OUTPUT STATISTICS=m1;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE intervention=0 ;
 ODS OUTPUT STATISTICS=m3;


PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE x_f_ch_male=1;
 ODS OUTPUT STATISTICS=m4;


PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE x_f_ch_male=0;
 ODS OUTPUT STATISTICS=m5;


PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE int_either=1;
 ODS OUTPUT STATISTICS=m6;

PROC SURVEYMEANS DATA=preddata;
 STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
 VAR pp;
 WEIGHT f_wt_totcore98;
 WHERE int_either=0 ;
 ODS OUTPUT STATISTICS=m8;

RUN;


PROC SQL NOPRINT;
   SELECT mean
   INTO : mean_1
   From m1;
   SELECT mean
   INTO : mean_c1
   From m3;
   SELECT mean
   INTO : mean_2
   From m4;
   SELECT mean
   INTO : mean_c2
   From m5;
   SELECT mean
   INTO : mean_3
   From m6;
   SELECT mean
   INTO : mean_c3
   From m8;
QUIT;
  
 DATA abrow1;
  or&modnum._1=&mean_1*100;
  or&modnum._c1=&mean_c1*100;
  or&modnum._2=&mean_2*100;
  or&modnum._c2=&mean_c2*100;
  or&modnum._3=&mean_3*100;
  or&modnum._c3=&mean_c3*100;

 DATA abrow2; 
  or&modnum._1=(&mean_c1-&mean_1)*100;  
  or&modnum._2=(&mean_c2-&mean_2)*100; 
  or&modnum._3=(&mean_c3-&mean_3)*100;  
 RUN;

   
%END;

/*
confidence intervals
*/
%MACRO jrrdatasets(data);


%DO d=1 %TO 1;

DATA imp_dat&d;
 SET &data (KEEP=ppid ra_site f_svy_bl_tract_masked_id strata secu _imputation_
                 f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt 
                 f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt cd_3x 
				 ra_grp_exp ra_grp_s8 intervention x_f_ch_male int_main1 int_main2 int_either
                 f_wt_totcore98 pwt:);
 /*IF _imputation_ = &d;*/
RUN;


PROC SORT;
 BY strata secu;
RUN;

  %DO j=1 %TO 35;
  PROC SURVEYLOGISTIC DATA = imp_dat&d  ; 
     STRATA strata; CLUSTER secu;
     DOMAIN _imputation_;
     MODEL &dep (EVENT='1') = &controls  ; 
     WEIGHT pwt&j ;
     OUTPUT OUT=preddata&d._&j PREDICTED=pp; ;
  RUN;


  /*
  calculate absolute risk and ARR for each iteration
  */

  /*Model 1*/
  %IF &modnum=1 %THEN %DO;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE ra_grp_exp=1;
   ODS OUTPUT STATISTICS=m1;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE ra_grp_s8=1;
   ODS OUTPUT STATISTICS=m2;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE ra_grp_exp=0 AND ra_grp_s8=0;
   ODS OUTPUT STATISTICS=m3;

  RUN;

  PROC SQL NOPRINT;
     SELECT mean
     INTO : mean_exp
     From m1;
     SELECT mean
     INTO : mean_s8
     From m2;
     SELECT mean
     INTO : mean_control
     From m3;
  QUIT;
  
   DATA abrow1_&d._&j;
    or&modnum._1_&d._&j=&mean_exp*100;
    or&modnum._2_&d._&j=&mean_s8*100;
    or&modnum._c_&d._&j=&mean_control*100;
  
   DATA abrow2_&d._&j; 
    or&modnum._1_&d._&j=(&mean_control-&mean_exp)*100; 
    or&modnum._2_&d._&j=(&mean_control-&mean_s8)*100; 
   RUN;
   
  %END;

  /*Model 2*/
  %IF &modnum=2 %THEN %DO;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE intervention=1;
   ODS OUTPUT STATISTICS=m1;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE ra_grp_s8=1;
   ODS OUTPUT STATISTICS=m2;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE intervention=0 AND ra_grp_s8=0;
   ODS OUTPUT STATISTICS=m3;

  RUN;

  PROC SQL NOPRINT;
     SELECT mean
     INTO : mean_exp
     From m1;
     SELECT mean
     INTO : mean_s8
     From m2;
     SELECT mean
     INTO : mean_control
     From m3;
  QUIT;
  
   DATA abrow1_&d._&j;
    or&modnum._1_&d._&j=&mean_exp*100;
    or&modnum._2_&d._&j=&mean_s8*100;
    or&modnum._c_&d._&j=&mean_control*100;
  
   DATA abrow2_&d._&j; 
    or&modnum._1_&d._&j=(&mean_control-&mean_exp)*100; 
    or&modnum._2_&d._&j=(&mean_control-&mean_s8)*100; 
   RUN;
 
  %END;


  /*Model 3*/
  %IF &modnum=3 %THEN %DO;
  
  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE intervention=1;
   ODS OUTPUT STATISTICS=m1; 

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE intervention=0 ;
   ODS OUTPUT STATISTICS=m3;

  RUN;

  PROC SQL NOPRINT;
     SELECT mean
     INTO : mean_exp
     From m1; 
     SELECT mean
     INTO : mean_control
     From m3;
  QUIT;
  
   DATA abrow1_&d._&j;
    or&modnum._1_&d._&j=&mean_exp*100; 
    or&modnum._c_&d._&j=&mean_control*100;
  
   DATA abrow2_&d._&j; 
    or&modnum._1_&d._&j=(&mean_control-&mean_exp)*100;  
   RUN;
 
   
  %END;


  /*Model 7*/

  %IF &modnum=7 %THEN %DO;
  
  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE ra_grp_exp=1;
   ODS OUTPUT STATISTICS=m1;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE ra_grp_s8=1;
   ODS OUTPUT STATISTICS=m2;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE ra_grp_exp=0 AND ra_grp_s8=0;
   ODS OUTPUT STATISTICS=m3;


  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE x_f_ch_male=1;
   ODS OUTPUT STATISTICS=m4;


  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE x_f_ch_male=0;
   ODS OUTPUT STATISTICS=m5;


  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE int_main1=1;
   ODS OUTPUT STATISTICS=m6;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE int_main2=1;
   ODS OUTPUT STATISTICS=m7;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE int_main1=0 AND int_main2=0;
   ODS OUTPUT STATISTICS=m8;

  RUN;


  PROC SQL NOPRINT;
     SELECT mean
     INTO : mean_1
     From m1;
     SELECT mean
     INTO : mean_2
     From m2;
     SELECT mean
     INTO : mean_c1
     From m3;
     SELECT mean
     INTO : mean_3
     From m4;
     SELECT mean
     INTO : mean_c2
     From m5;
     SELECT mean
     INTO : mean_4
     From m6;
     SELECT mean
     INTO : mean_5
     From m7;
     SELECT mean
     INTO : mean_c3
     From m8;
  QUIT;
  
   DATA abrow1_&d._&j;
    or&modnum._1_&d._&j=&mean_1*100;
    or&modnum._2_&d._&j=&mean_2*100;
    or&modnum._c1_&d._&j=&mean_c1*100;
    or&modnum._3_&d._&j=&mean_3*100;
    or&modnum._c2_&d._&j=&mean_c2*100;
    or&modnum._4_&d._&j=&mean_4*100;
    or&modnum._5_&d._&j=&mean_5*100;
    or&modnum._c3_&d._&j=&mean_c3*100;

   DATA abrow2_&d._&j; 
    or&modnum._1_&d._&j=(&mean_c1-&mean_1)*100; 
    or&modnum._2_&d._&j=(&mean_c1-&mean_2)*100; 
    or&modnum._3_&d._&j=(&mean_c2-&mean_3)*100; 
    or&modnum._4_&d._&j=(&mean_c3-&mean_4)*100; 
    or&modnum._5_&d._&j=(&mean_c3-&mean_5)*100; 
   RUN;
 
   
  %END;

  /*Model 8*/

  %IF &modnum=8 %THEN %DO;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE intervention=1;
   ODS OUTPUT STATISTICS=m1;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE ra_grp_s8=1;
   ODS OUTPUT STATISTICS=m2;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE intervention=0 AND ra_grp_s8=0;
   ODS OUTPUT STATISTICS=m3;


  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE x_f_ch_male=1;
   ODS OUTPUT STATISTICS=m4;


  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE x_f_ch_male=0;
   ODS OUTPUT STATISTICS=m5;


  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE int_either=1;
   ODS OUTPUT STATISTICS=m6;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE int_main2=1;
   ODS OUTPUT STATISTICS=m7;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE int_either=0 AND int_main2=0;
   ODS OUTPUT STATISTICS=m8;
  
  RUN;


  PROC SQL NOPRINT;
     SELECT mean
     INTO : mean_1
     From m1;
     SELECT mean
     INTO : mean_2
     From m2;
     SELECT mean
     INTO : mean_c1
     From m3;
     SELECT mean
     INTO : mean_3
     From m4;
     SELECT mean
     INTO : mean_c2
     From m5;
     SELECT mean
     INTO : mean_4
     From m6;
     SELECT mean
     INTO : mean_5
     From m7;
     SELECT mean
     INTO : mean_c3
     From m8;
  QUIT;
  
   DATA abrow1_&d._&j;
    or&modnum._1_&d._&j=&mean_1*100;
    or&modnum._2_&d._&j=&mean_2*100;
    or&modnum._c1_&d._&j=&mean_c1*100;
    or&modnum._3_&d._&j=&mean_3*100;
    or&modnum._c2_&d._&j=&mean_c2*100;
    or&modnum._4_&d._&j=&mean_4*100;
    or&modnum._5_&d._&j=&mean_5*100;
    or&modnum._c3_&d._&j=&mean_c3*100;

   DATA abrow2_&d._&j; 
    or&modnum._1_&d._&j=(&mean_c1-&mean_1)*100; 
    or&modnum._2_&d._&j=(&mean_c1-&mean_2)*100; 
    or&modnum._3_&d._&j=(&mean_c2-&mean_3)*100; 
    or&modnum._4_&d._&j=(&mean_c3-&mean_4)*100; 
    or&modnum._5_&d._&j=(&mean_c3-&mean_5)*100; 
   RUN;
 
   
  %END;




  /*Model 9*/
  %IF &modnum=9 %THEN %DO;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE intervention=1;
   ODS OUTPUT STATISTICS=m1;
  
  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE intervention=0 ;
   ODS OUTPUT STATISTICS=m3;


  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE x_f_ch_male=1;
   ODS OUTPUT STATISTICS=m4;


  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE x_f_ch_male=0;
   ODS OUTPUT STATISTICS=m5;


  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE int_either=1;
   ODS OUTPUT STATISTICS=m6;

  PROC SURVEYMEANS DATA=preddata&d._&j;
   STRATA strata; CLUSTER secu;
   VAR pp;
   WEIGHT pwt&j;
   WHERE int_either=0 ;
   ODS OUTPUT STATISTICS=m8;

  RUN;


  PROC SQL NOPRINT;
     SELECT mean
     INTO : mean_1
     From m1;
     SELECT mean
     INTO : mean_c1
     From m3;
     SELECT mean
     INTO : mean_2
     From m4;
     SELECT mean
     INTO : mean_c2
     From m5;
     SELECT mean
     INTO : mean_3
     From m6;
     SELECT mean
     INTO : mean_c3
     From m8;
  QUIT;
  
   DATA abrow1_&d._&j;
    or&modnum._1_&d._&j=&mean_1*100;
    or&modnum._c1_&d._&j=&mean_c1*100;
    or&modnum._2_&d._&j=&mean_2*100;
    or&modnum._c2_&d._&j=&mean_c2*100;
    or&modnum._3_&d._&j=&mean_3*100;
    or&modnum._c3_&d._&j=&mean_c3*100;

   DATA abrow2_&d._&j; 
    or&modnum._1_&d._&j=(&mean_c1-&mean_1)*100;  
    or&modnum._2_&d._&j=(&mean_c2-&mean_2)*100; 
    or&modnum._3_&d._&j=(&mean_c3-&mean_3)*100;  
   RUN;
 
   
  %END;


 DATA abrow1;
  MERGE abrow1 abrow1_&d._&j;
 DATA abrow2;
  MERGE abrow2 abrow2_&d._&j;
  
 RUN;

  
  %END;

%END;
 
%MEND;
%jrrdatasets(&data);


/*
calculate CIs
*/
 
%MACRO calcCI(pre);

 s=SUM( %DO d=1 %TO 1; %DO j=1 %TO 35;  ((or&modnum._&pre - or&modnum._&pre._&d._&j)**2),   %END; %END;   0); /*note: 0 is at the end so SUM loop will not end with ','*/
 stderr1 = SQRT(s);
 lowor&modnum._&pre =or&modnum._&pre-stderr1*1.96;
 upor&modnum._&pre  =or&modnum._&pre+stderr1*1.96;

%MEND;

%IF &modnum=1 %THEN %DO;

  
 DATA abrow1; 
  SET abrow1;
  %calcCI(1);
  %calcCI(2);
  %calcCI(c); 

 DATA abrow2; 
  SET abrow2; 
  %calcCI(1);
  %calcCI(2);
 RUN;

 DATA model&modnum._&dep;
  SET abrow1 abrow2 model&modnum.or_&dep;
 RUN;
 DATA model&modnum._&dep;
  RETAIN or&modnum._1 lowor&modnum._1 upor&modnum._1 chivalue&modnum._1 p&modnum._1
         or&modnum._2 lowor&modnum._2 upor&modnum._2 chivalue&modnum._2 p&modnum._2 
		 or&modnum._c lowor&modnum._c upor&modnum._c
         chigrp&modnum pgrp&modnum;
  SET model&modnum._&dep;
 RUN;
   
%END;


%IF &modnum=2 %THEN %DO;

 DATA abrow1; 
  SET abrow1;
  %calcCI(1);
  %calcCI(2);
  %calcCI(c); 

 DATA abrow2; 
  SET abrow2;
  %calcCI(1);
  %calcCI(2); 
 RUN;

 DATA model&modnum._&dep;
  SET abrow1 abrow2 model&modnum.or_&dep;
 RUN;
 DATA model&modnum._&dep;
  RETAIN or&modnum._1 lowor&modnum._1 upor&modnum._1 chivalue&modnum._1 p&modnum._1
         or&modnum._2 lowor&modnum._2 upor&modnum._2 chivalue&modnum._2 p&modnum._2 
		 or&modnum._c lowor&modnum._c upor&modnum._c
         chigrp&modnum pgrp&modnum;
  SET model&modnum._&dep;
 RUN;
   
%END;


%IF &modnum=3 %THEN %DO;

 DATA abrow1; 
  SET abrow1;
  %calcCI(1);
  %calcCI(c);  

 DATA abrow2; 
  SET abrow2;
  %calcCI(1);   
 RUN;

 DATA model&modnum._&dep;
  SET abrow1 abrow2 model&modnum.or_&dep;
 RUN;
 DATA model&modnum._&dep;
  RETAIN or&modnum._1 lowor&modnum._1 upor&modnum._1 chivalue&modnum._1 p&modnum._1 
		 or&modnum._c lowor&modnum._c upor&modnum._c;
  SET model&modnum._&dep;
 RUN;
   
%END;



%IF &modnum=7 %THEN %DO;

 DATA abrow1; 
  SET abrow1;
  
  %calcCI(1);
  %calcCI(2);
  %calcCI(c1); 
  %calcCI(3);
  %calcCI(c2);
  %calcCI(4);
  %calcCI(5);
  %calcCI(c3);   

 DATA abrow2; 
  SET abrow2;
  %calcCI(1);
  %calcCI(2); 
  %calcCI(3); 
  %calcCI(4);
  %calcCI(5);  
 RUN;

 DATA model&modnum._&dep;
  SET abrow1 abrow2 model&modnum.or_&dep;
 RUN;
 DATA model&modnum._&dep;
  RETAIN or&modnum._1 lowor&modnum._1 upor&modnum._1 chivalue&modnum._1 p&modnum._1
         or&modnum._2 lowor&modnum._2 upor&modnum._2 chivalue&modnum._2 p&modnum._2 
		 or&modnum._c1 lowor&modnum._c1 upor&modnum._c1 
         or&modnum._3 lowor&modnum._3 upor&modnum._3 chivalue&modnum._3 p&modnum._3 
		 or&modnum._c2 lowor&modnum._c2 upor&modnum._c2 
         or&modnum._4 lowor&modnum._4 upor&modnum._4 chivalue&modnum._4 p&modnum._4
         or&modnum._5 lowor&modnum._5 upor&modnum._5 chivalue&modnum._5 p&modnum._5 
		 or&modnum._c3 lowor&modnum._c3 upor&modnum._c3 

         chigrp1_&modnum p1grp_&modnum chigrp2_&modnum p2grp_&modnum;

  SET model&modnum._&dep;
 RUN;
   
%END;


%IF &modnum=8 %THEN %DO;

  
 DATA abrow1; 
  SET abrow1;
  %calcCI(1);
  %calcCI(2);
  %calcCI(c1); 
  %calcCI(3);
  %calcCI(c2);
  %calcCI(4);
  %calcCI(5);
  %calcCI(c3);   


 DATA abrow2; 
  SET abrow2;
  %calcCI(1);
  %calcCI(2); 
  %calcCI(3); 
  %calcCI(4);
  %calcCI(5);   

 RUN;

 DATA model&modnum._&dep;
  SET abrow1 abrow2 model&modnum.or_&dep;
 RUN;
 DATA model&modnum._&dep;
  RETAIN or&modnum._1 lowor&modnum._1 upor&modnum._1 chivalue&modnum._1 p&modnum._1
         or&modnum._2 lowor&modnum._2 upor&modnum._2 chivalue&modnum._2 p&modnum._2 
		 or&modnum._c1 lowor&modnum._c1 upor&modnum._c1 
         or&modnum._3 lowor&modnum._3 upor&modnum._3 chivalue&modnum._3 p&modnum._3 
		 or&modnum._c2 lowor&modnum._c2 upor&modnum._c2 
         or&modnum._4 lowor&modnum._4 upor&modnum._4 chivalue&modnum._4 p&modnum._4
         or&modnum._5 lowor&modnum._5 upor&modnum._5 chivalue&modnum._5 p&modnum._5 
		 or&modnum._c3 lowor&modnum._c3 upor&modnum._c3 

         chigrp1_&modnum p1grp_&modnum chigrp2_&modnum p2grp_&modnum;

  SET model&modnum._&dep;
 RUN;
   
%END;




%IF &modnum=9 %THEN %DO;

  
 DATA abrow1; 
  SET abrow1;
  %calcCI(1); 
  %calcCI(c1); 
  %calcCI(2);
  %calcCI(c2); 
  %calcCI(3);   

 DATA abrow2; 
  SET abrow2;
  %calcCI(1);   
  %calcCI(2); 
  %calcCI(3);  
 RUN;

 DATA model&modnum._&dep;
  SET abrow1 abrow2 model&modnum.or_&dep;
 RUN;
 DATA model&modnum._&dep;
  RETAIN or&modnum._1 lowor&modnum._1 upor&modnum._1 chivalue&modnum._1 p&modnum._1
		 or&modnum._c1 lowor&modnum._c1 upor&modnum._c1 
         or&modnum._2 lowor&modnum._2 upor&modnum._2 chivalue&modnum._2 p&modnum._2 
		 or&modnum._c2 lowor&modnum._c2 upor&modnum._c2 
         or&modnum._3 lowor&modnum._3 upor&modnum._3 chivalue&modnum._3 p&modnum._3
		 or&modnum._c3 lowor&modnum._c3 upor&modnum._c3 
;

  SET model&modnum._&dep;
 RUN;
   
%END;

DATA jrrdata.model&modnum._&dep;
 SET model&modnum._&dep;
RUN;


%MEND; 

 

%MACRO Table4(dep);

LIBNAME jrrdata '/home/hwang/MTO/MTO_revision_10112013/DATA/male/';

%runmodels(data=impdata_jrrm,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);
%runmodels(data=impdata_jrrm,dep=&dep,controls=intervention ra_grp_s8,modnum=2);
%runmodels(data=impdata_jrrm,dep=&dep,controls=intervention,modnum=3);

DATA &dep._models123;
 MERGE model1_&dep (KEEP=or1_1 lowor1_1 upor1_1 chivalue1_1 p1_1
                         or1_2 lowor1_2 upor1_2 chivalue1_2 p1_2 
		                 or1_c lowor1_c upor1_c
                         chigrp1 pgrp1)
       model2_&dep (KEEP=or2_1 lowor2_1 upor2_1 chivalue2_1 p2_1
                         or2_2 lowor2_2 upor2_2 chivalue2_2 p2_2 
		                 or2_c lowor2_c upor2_c
                         chigrp2 pgrp2)
       model3_&dep (KEEP=or3_1 lowor3_1 upor3_1 chivalue3_1 p3_1 
		                 or3_c lowor3_c upor3_c);
RUN;

DATA model123_m;
 SET model123_m &dep._models123;
RUN;
 
LIBNAME jrrdata '/home/hwang/MTO/MTO_revision_10112013/DATA/female/';

%runmodels(data=impdata_jrrf,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);
%runmodels(data=impdata_jrrf,dep=&dep,controls=intervention ra_grp_s8,modnum=2);
%runmodels(data=impdata_jrrf,dep=&dep,controls=intervention,modnum=3);

DATA &dep._models123;
 MERGE model1_&dep (KEEP=or1_1 lowor1_1 upor1_1 chivalue1_1 p1_1
                         or1_2 lowor1_2 upor1_2 chivalue1_2 p1_2 
		                 or1_c lowor1_c upor1_c
                         chigrp1 pgrp1)
       model2_&dep (KEEP=or2_1 lowor2_1 upor2_1 chivalue2_1 p2_1
                         or2_2 lowor2_2 upor2_2 chivalue2_2 p2_2 
		                 or2_c lowor2_c upor2_c
                         chigrp2 pgrp2)
       model3_&dep (KEEP=or3_1 lowor3_1 upor3_1 chivalue3_1 p3_1 
		                 or3_c lowor3_c upor3_c);
RUN;

DATA model123_f;
 SET model123_f &dep._models123;
RUN;
%MEND;

Proc Printto New
             Log = "/home/hwang/MTO/MTO_revision_10112013/mto_revision_T4_all.log"
           Print = "/home/hwang/MTO/MTO_revision_10112013/mto_revision_T4_all.lst";
Run;

DATA model123_m; 
DATA model123_f; 
RUN; 
%Table4(f_mh_deph_y_yt);
%Table4(ymh_bipolar_i_ii_y);
%Table4(f_mh_pds_y_yt);
%Table4(f_mh_pts_y_yt);
%Table4(f_mh_odd_y_yt);
%Table4(f_mh_ied_y_yt);
%Table4(cd_3x); 


Proc Printto New;
Run;

LIBNAME jrrdata '/home/hwang/MTO/MTO_revision_10112013/DATA';

DATA jrrdata.T4_male;
 SET model123_m;
DATA jrrdata.T4_female;
 SET model123_f;
RUN;

ODS HTML STYLE=sasweb FILE="/home/hwang/MTO/MTO_revision_10112013/mto_revision_T4_all.html";

PROC PRINT DATA=jrrdata.T4_male; 
PROC PRINT DATA=jrrdata.T4_female;
RUN;

ODS HTML CLOSE;
