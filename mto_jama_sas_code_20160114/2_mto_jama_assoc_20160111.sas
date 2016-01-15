/*
Program Name: 02_mto_jama_assoc_YYYYMMDD.sas

Modified by: Matt Sciandra and Lisa Sanbonmatsu from program called "MTO_table4_alt.sas" created by Ron Kessler's team at Harvard Medical School.  
Last Modified: 1/11/16
Purpose:      To replicate the regression analysis for the Moving to Opportunity (MTO) findings in the Journal of the American Medical Assocation (JAMA) paper
		      "Associations of Housing Mobility Interventions for Children in High-Poverty Neighborhoods With Subsequent Mental Disorders During Adolescence".
USER NOTES:
- The user must change the "pgmdir" and "mto" libname statements to match the file locations on his/her own computer

Steps:
1.  SET GLOBALS AND DIRECTORIES;
2.  DEFINE MACROS;
3.  MAIN PROGRAM ;
	3A: Create strata and secu variables for jackknife;
	3B: Call macro to generate replication dataset;
	3C: Create datasets restricted to males and females;
	3D: Create weights for jackknife;
	3E: Run Table 4 Estimates for Each Disorder;
	3F: Run Table 5 Estimates for Each Disorder;
*/


*===============================================;
*===============================================;
*	STEP 1.  SET GLOBALS AND DIRECTORIES;
*===============================================;
*===============================================;

** Set today's date;
%let today=%sysfunc(date(),yymmddn8.);
%put "&today";

OPTIONS NOFMTERR MPRINT LINESIZE=80;

/* !!!! USER MUST UPDATE DIRECTORY LOCATION FOR FORMATS/OUTPUT FILE AND DATA LOCATION. !!!! */
libname home "~/mtoproj/m10_data/papers/icpsr_archive/jama/"; 
%let outdata = ~/mtoproj/m10_data/papers/icpsr_archive/jama/;
libname outdata "&outdata."; 

%let impdata = home.mto_jama_imputed_20160111; 
%let preimpdata = home.mto_jama_preimp_20160111; 

%let maindir = ~/mtoproj/m10_pgm/papers/icpsr_archive/jama/; 

%let t4_log = &maindir.mto_revision_T4_all_&today..log;
%let t4_lst = &maindir.mto_revision_T4_all_&today..lst;

%let t5_log = &maindir.mto_revision_T5_all_&today..log;
%let t5_lst = &maindir.mto_revision_T5_all_&today..lst;

%let jrr_dat = &outdata.DATA2;
%let t5_xls = &maindir.mto_revision_T5_all_&today..xls;
%let t4_xls = &maindir.mto_revision_T4_all_&today..xls;

%let dat_fem = &outdata.DATA2/female/;
%let dat_male = &outdata.DATA2/male/;


*===============================================;
*===============================================;
*	STEP 2.  DEFINE MACROS;
*===============================================;
*===============================================;


*===============================================;
*	MACROS: makestr_d - divide single or multiple tracks into secu;
*===============================================;

%MACRO makestr_d(city=,track=,lm1=,lm2=,strata=,secu=,);

DATA pop;
 SET mto1 (KEEP=ppid ra_site f_svy_bl_tract_masked_id);

 IF ra_site=&city AND f_svy_bl_tract_masked_id IN &track ;

PROC SORT;
 BY ra_site f_svy_bl_tract_masked_id;

DATA pop;
 SET pop;

 num=_N_;

DATA pop&strata&secu;
 SET pop;

 IF num>=&lm1 AND num<=&lm2;

 strata&strata&secu=1; 

RUN;
PROC SORT;
 BY ppid;
RUN;

%MEND;


*===============================================;
*	MACROS: makestr_c - combine multiple tracks into 1 secu;
*===============================================;


%MACRO makestr_c(city=,track=,strata=,secu=,);

DATA pop;
 SET mto1 (KEEP=ppid ra_site f_svy_bl_tract_masked_id);

 IF ra_site=&city AND f_svy_bl_tract_masked_id IN &track ;

PROC SORT;
 BY ra_site f_svy_bl_tract_masked_id;

DATA pop&strata&secu;
 SET pop;

 strata&strata&secu=1; 

RUN;
PROC SORT;
 BY ppid;
RUN;

%MEND;


*===============================================;
*	MACROS: makededata - create data for jackknife;
*===============================================;


%MACRO makededata;

DATA popall;
 MERGE mto1 (KEEP=ppid ra_site f_svy_bl_tract_masked_id)

       %DO i=1 %TO 35;
       pop&i.1 (KEEP=ppid strata&i.1)
	   pop&i.2 (KEEP=ppid strata&i.2)
	   %END;
	;
 BY ppid;

 %DO j=1 %TO 35;

  IF strata&j.1=1 THEN DO; strata=&j; secu=1; END;
  IF strata&j.2=1 THEN DO; strata=&j; secu=2; END;

 %END;

RUN;


%MEND;


*===============================================;
*	MACROS: WGTCAL;
*===============================================;

%MACRO wgtcal ;
        %DO i=1 %TO &nclust ;
        pwt&i=&weight;
        IF &STRATUM=%EVAL(&i+0) AND SECU=1 THEN pwt&i=pwt&i*2 ;
        IF &STRATUM=%EVAL(&i+0) AND SECU=2 THEN pwt&i=0 ;
        %end;
%MEND;

*===============================================;
*	MACROS: JRRWGTS;
*===============================================;


%MACRO jrrwgts(indata,weight,stratum,nclust,out);
** Create a data set with &nclust (=35 for MTO) weights. Each of the weights 
*is set to zero for half the strata and used in one of 35 iterations;

DATA one;
     SET &indata;

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


*===============================================;
*	MACRO: CODEIMP;
*===============================================;

 %MACRO codeimp(num);
   IF domain="Imputation Number=&num" THEN _imputation_=&num;
 %MEND;

 
*===============================================;
*	MACRO: CODEALLIMP;
*===============================================;
 
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


*===============================================;
*	MACRO: calcCI - Calculate AR 95% Confidence Interval;
*===============================================;

%MACRO calcCI(pre);

 s=SUM( %DO d=1 %TO 1; %DO j=1 %TO 35;  ((or&modnum._&pre - or&modnum._&pre._&d._&j)**2),   %END; %END;   0); /*note: 0 is at the end so SUM loop will not end with ','*/
 stderr1 = SQRT(s);
 lowor&modnum._&pre =or&modnum._&pre-stderr1*1.96;
 upor&modnum._&pre  =or&modnum._&pre+stderr1*1.96;

%MEND;


*===============================================;
*	MACRO: jrrdatasets - Calculate AR 95% Confidence Interval;
*===============================================;

%MACRO jrrdatasets(data);


%DO d=1 %TO 1;

DATA imp_dat&d;
 SET &data (KEEP=ppid ra_site f_svy_bl_tract_masked_id strata secu _imputation_
                 f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt 
                 f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt ymh_cd_3x_y 
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


 DATA abrow1;
  MERGE abrow1 abrow1_&d._&j;
 
 DATA abrow2;
  MERGE abrow2 abrow2_&d._&j;
  
 RUN;

  
  %END;

%END;
 
%MEND;



*===============================================;
*	MACRO: runmodels - run estmation models;
*===============================================;


%MACRO runmodels(data=,dep=,controls=,modnum=);

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

   %IF &modnum=1 OR &modnum=2 %THEN %DO;
   ODS OUTPUT TestMultStat = outtests;
   %END;

   %IF &modnum=1 %THEN %DO; 
   test1: TEST ra_grp_exp=ra_grp_s8=0 / MULT;
   %END;
   %IF &modnum=2 %THEN %DO; 
   test1: TEST intervention=ra_grp_s8=0 / MULT;
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



*** CALL JRRDATASETS TO CREATE DATA FOR ABS RISK CIs ***;

%jrrdatasets(&data);

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
  length est_type $20.; 
  SET abrow1 (in=inrow1) abrow2 (in = inrow2) model&modnum.or_&dep (in=inrow3);
  if inrow1 then est_type = "Abs_Risk";
  else if inrow2 then est_type = "Risk_Reduction";
  else if inrow3 then est_type = "Odds Ratio";
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



DATA jrrdata.model&modnum._&dep;
 SET model&modnum._&dep;
RUN;


%MEND; 



*===============================================;
*	MACRO: Table4 - generate table 4 estimates of combined boys and girls;
*===============================================;


%MACRO Table4(data,dep);

%runmodels(data=&data,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);

DATA &dep._models123;
 length depvar $32. modelnum 8. subsample $12.;
 MERGE model1_&dep (in = in1 KEEP=or1_1 lowor1_1 upor1_1 chivalue1_1 p1_1
                         or1_2 lowor1_2 upor1_2 chivalue1_2 p1_2 
		                 or1_c lowor1_c upor1_c
                         chigrp1 pgrp1 est_type)
;

depvar = "&dep";
if in1 = 1 then modelnum = 1;
subsample = "COMBINED";

RUN;

DATA model123;
 SET model123 &dep._models123;
RUN;
 
%MEND;
 

*===============================================;
*	MACRO: Table5 - generate table 5 estimates for boys and girls separately;
*===============================================;


%MACRO Table5(dep);

LIBNAME jrrdata "&dat_male";

%runmodels(data=impdata_jrrm,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);


DATA &dep._models123;
 length depvar $32. modelnum 8. subsample $12.;
 
 MERGE model1_&dep (in = in1 KEEP=or1_1 lowor1_1 upor1_1 chivalue1_1 p1_1

                         or1_2 lowor1_2 upor1_2 chivalue1_2 p1_2 
		                 or1_c lowor1_c upor1_c
                         chigrp1 pgrp1 est_type)
;
depvar = "&dep";
if in1 = 1 then modelnum = 1;
subsample = "M";
				 				 
RUN;

DATA model123_m;
   SET model123_m &dep._models123 (in =indep);
   if indep then depvar = "&dep";
RUN;

LIBNAME jrrdata "&dat_fem";


%runmodels(data=impdata_jrrf,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);


DATA &dep._models123;
 MERGE model1_&dep (in = in1 KEEP=or1_1 lowor1_1 upor1_1 chivalue1_1 p1_1
                         or1_2 lowor1_2 upor1_2 chivalue1_2 p1_2 
		                 or1_c lowor1_c upor1_c
                         chigrp1 pgrp1 est_type)
;
depvar = "&dep";
if in1 = 1 then modelnum = 1;
subsample = "F";

RUN;

DATA model123_f;
 length depvar $32. modelnum 8. subsample $12.;

SET model123_f &dep._models123 (in =indep);
if indep then depvar = "&dep";

RUN;
%MEND;



*===============================================;
*===============================================;
*	STEP 3.  MAIN PROGRAM ;
*===============================================;
*===============================================;


*===============================================;
*	3A: Create strata and secu variables for jackknife;
*===============================================;

/*data with total sample*/
DATA impdata0;
  set &impdata;
RUN;

proc sort data = impdata0 (keep = ppid ra_site f_svy_bl_tract_masked_id _imputation_ where = (_imputation_ = 1) ) out = tempclust ;
  by ra_site f_svy_bl_tract_masked_id ppid;
run;

/* Exclude Deceased */;
   

DATA mto1 (WHERE=(f_svy_final_disp^="NI-DC"));
 SET &preimpdata;
RUN; 


/*
create design variable for JRR (2 SECU for STRATA
*/


/*
city 1
*/

%makestr_d(city=1, track= (12), lm1=1,lm2=33,strata=1,secu=1 );
%makestr_d(city=1, track= (12), lm1=34,lm2=66,strata=1,secu=2 );

%makestr_d(city=1, track= (12), lm1=67,lm2=99,strata=2,secu=1 );
%makestr_d(city=1, track= (12), lm1=100,lm2=131,strata=2,secu=2 );

%makestr_c(city=1, track= (25,29,36,44,57,70,101), strata=3,secu=1 );
%makestr_d(city=1, track= (107,115), lm1=1,lm2=30,strata=3,secu=2 );

%makestr_d(city=1, track= (107,115), lm1=31,lm2=60,strata=4,secu=1 );
%makestr_d(city=1, track= (107,115), lm1=61,lm2=90,strata=4,secu=2 );

%makestr_d(city=1, track= (182), lm1=1,lm2=33,strata=5,secu=1 );
%makestr_d(city=1, track= (182), lm1=34,lm2=66,strata=5,secu=2 );

%makestr_d(city=1, track= (128,183,192,198), lm1=1,lm2=28, strata=6,secu=1 );
%makestr_d(city=1, track= (128,183,192,198), lm1=29,lm2=57, strata=6,secu=2 );

%makestr_d(city=1, track= (128,183,192,198), lm1=58,lm2=86, strata=7,secu=1 );
%makestr_d(city=1, track= (128,183,192,198), lm1=87,lm2=119, strata=7,secu=2 );


/*
city 2
*/


%makestr_c(city=2, track= (9,34,114,126,41,50,58), strata=8,secu=1 );
%makestr_c(city=2, track= (94), strata=8,secu=2 );

%makestr_c(city=2, track= (62,20,22,26,38,78,87,133,142,146,149,174), strata=9,secu=1 );
%makestr_d(city=2, track= (157,177,129), lm1=1,lm2=52,strata=9,secu=2 );

%makestr_d(city=2, track= (157,177,129), lm1=53,lm2=104,strata=10,secu=1 );
%makestr_d(city=2, track= (157,177,129), lm1=105,lm2=157,strata=10,secu=2 );

%makestr_d(city=2, track= (172,179,181,61,104), lm1=1,lm2=50,strata=11,secu=1 );
%makestr_d(city=2, track= (172,179,181,61,104), lm1=51,lm2=100,strata=11,secu=2 );

%makestr_d(city=2, track= (68,96,191), lm1=1,lm2=51,strata=12,secu=1 );
%makestr_d(city=2, track= (68,96,191), lm1=52,lm2=102,strata=12,secu=2 );

%makestr_d(city=2, track= (68,96,191), lm1=103,lm2=153,strata=13,secu=1 );
%makestr_d(city=2, track= (68,96,191), lm1=154,lm2=204,strata=13,secu=2 );

%makestr_d(city=2, track= (68,96,191), lm1=205,lm2=256,strata=14,secu=1 );
%makestr_d(city=2, track= (68,96,191), lm1=257,lm2=308,strata=14,secu=2 );

/*
city 3
*/

%makestr_c(city=3, track= (6,4), strata=15,secu=1 );
%makestr_d(city=3, track= (130), lm1=1,lm2=65,strata=15,secu=2 );

%makestr_d(city=3, track= (130), lm1=66,lm2=131,strata=16,secu=1 );
%makestr_d(city=3, track= (130), lm1=132,lm2=197,strata=16,secu=2 );

%makestr_d(city=3, track= (187,143,2,10,21,27,72,81,90,124,127,159,162,164,102), lm1=1,lm2=55,strata=17,secu=1 );
%makestr_d(city=3, track= (187,143,2,10,21,27,72,81,90,124,127,159,162,164,102), lm1=56,lm2=111,strata=17,secu=2 );

%makestr_d(city=3, track= (74), lm1=1,lm2=63,strata=18,secu=1 );
%makestr_d(city=3, track= (74), lm1=64,lm2=127,strata=18,secu=2 );

%makestr_d(city=3, track= (95), lm1=1,lm2=61,strata=19,secu=1 );
%makestr_d(city=3, track= (95), lm1=62,lm2=122,strata=19,secu=2 );

%makestr_d(city=3, track= (95), lm1=123,lm2=183,strata=20,secu=1 );
%makestr_d(city=3, track= (95), lm1=184,lm2=244,strata=20,secu=2 );

%makestr_d(city=3, track= (121), lm1=1,lm2=61,strata=21,secu=1 );
%makestr_d(city=3, track= (121), lm1=62,lm2=123,strata=21,secu=2 );


/*
city 4
*/

%makestr_d(city=4, track= (5,8,13,14), lm1=1,lm2=61,strata=22,secu=1 );
%makestr_d(city=4, track= (5,8,13,14), lm1=62,lm2=122,strata=22,secu=2 );

%makestr_c(city=4, track= (28), strata=23,secu=1 );
%makestr_c(city=4, track= (15,73), strata=23,secu=2 );

%makestr_d(city=4, track= (112), lm1=1,lm2=65,strata=24,secu=1 );
%makestr_d(city=4, track= (112), lm1=66,lm2=130,strata=24,secu=2 );

%makestr_d(city=4, track= (136), lm1=1,lm2=60,strata=25,secu=1 );
%makestr_d(city=4, track= (136), lm1=61,lm2=120,strata=25,secu=2 );

%makestr_d(city=4, track= (136), lm1=121,lm2=180,strata=26,secu=1 );
%makestr_d(city=4, track= (136), lm1=181,lm2=241,strata=26,secu=2 );

%makestr_c(city=4, track= (166), strata=27,secu=1 );
%makestr_c(city=4, track= (86,99), strata=27,secu=2 );

%makestr_c(city=4, track= (45,47,53,59,65,69,93,77), strata=28,secu=1 );
%makestr_c(city=4, track= (85,40,89,97,100,103,137,145,147,153,154,163,165,188), strata=28,secu=2 );


/*
city 5
*/


%makestr_c(city=5, track= (158), strata=29,secu=1 );
%makestr_c(city=5, track= (98,105,108), strata=29,secu=2 );

%makestr_c(city=5, track= (48,52), strata=30,secu=1 );
%makestr_c(city=5, track= (11,49,7,23,30), strata=30,secu=2 );

%makestr_c(city=5, track= (31,16,19,43,33), strata=31,secu=1 );
%makestr_c(city=5, track= (54,109,138), strata=31,secu=2 );

%makestr_c(city=5, track= (55,64,66,67,75), strata=32,secu=1 );
%makestr_c(city=5, track= (79,88,91,110,134), strata=32,secu=2 );

%makestr_c(city=5, track= (113,122,141,139), strata=33,secu=1 );
%makestr_c(city=5, track= (119,170,180), strata=33,secu=2 );

%makestr_c(city=5, track= (144,148,152,155,160,169), strata=34,secu=1 );
%makestr_c(city=5, track= (176,189,193,56,140,196,135,199,39), strata=34,secu=2 );

%makestr_d(city=5, track= (35,125,123,63), lm1=1,lm2=57,strata=35,secu=1 );
%makestr_d(city=5, track= (35,125,123,63), lm1=58,lm2=114,strata=35,secu=2 );
 

PROC SORT DATA=mto1;
 BY ppid;


*===============================================;
*	3B: Call macro to generate replication dataset;
*===============================================;

%makededata;


PROC SORT DATA= impdata0;
 BY ppid;

proc sort data = popall ;
by ppid;
run;

data impdata;
  merge impdata0 popall (keep = ppid strata secu);
  by ppid;
run;

PROC FREQ;
 TABLES strata secu strata*ra_site secu*ra_site / missing norow nocol nopercent;
RUN;

PROC FREQ;
 TABLES strata*secu strata*secu*ra_site*f_svy_bl_tract_masked_id/LIST MISSING;
RUN;


PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id ;
RUN; 


*===============================================;
*	3C: Create datasets restricted to males and females;
*===============================================;

/* data restricted to males */
DATA impdata_m;
  set impdata;
 IF x_f_ch_male=1;
RUN;

PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN;

/*data restricted to females*/
DATA impdata_f;
  set impdata;
  IF x_f_ch_male=0;
RUN;

PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN; 


*===============================================;
*	3D: Create weights for jackknife;
*===============================================;

%jrrwgts(impdata,f_wt_totcore98,strata,35);


*===============================================;
*	3E: Run Table 4 Estimates for Each Disorder;
*===============================================;
;

/* reset library */

LIBNAME jrrdata "&jrr_dat";

Proc Printto New
Log = "&t4_log"
Print = "&t4_lst";
Run;


DATA model123; 
length depvar $32 est_type $20.;
delete;
RUN; 


%Table4(impdata_jrr,f_mh_deph_y_yt);
%Table4(impdata_jrr,ymh_bipolar_i_ii_y);
%Table4(impdata_jrr,f_mh_pds_y_yt);
%Table4(impdata_jrr,f_mh_pts_y_yt);
%Table4(impdata_jrr,f_mh_odd_y_yt);
%Table4(impdata_jrr,f_mh_ied_y_yt);
%Table4(impdata_jrr,ymh_cd_3x_y); 


Proc Printto New;
Run;

DATA jrrdata.Table4_withCI;
 SET model123;
RUN;


ODS HTML STYLE=minimal FILE="&t4_xls";

PROC PRINT DATA=jrrdata.Table4_withCI noobs;
RUN;


ODS HTML CLOSE;

PROC print data = jrrdata.Table4_withCI;
RUN;



*===============================================;
*	3F: Run Table 5 Estimates for Each Disorder;
*===============================================;
;


Proc Printto New
Log = "&t5_log"
Print = "&t5_lst";
Run;

DATA model123_m; 
length depvar $32 est_type $20.;
delete;
run;

DATA model123_f; 
length depvar $32 est_type $20.;
delete;
RUN; 


%Table5(f_mh_deph_y_yt);
%Table5(ymh_bipolar_i_ii_y);
%Table5(f_mh_pds_y_yt);
%Table5(f_mh_pts_y_yt);
%Table5(f_mh_odd_y_yt);
%Table5(f_mh_ied_y_yt);
%Table5(ymh_cd_3x_y); 

Proc Printto New;
Run;


LIBNAME jrrdata "&jrr_dat";

DATA jrrdata.T5_male;
 SET model123_m;
DATA jrrdata.T5_female;
 SET model123_f;
RUN;


* output to html *;
ODS HTML STYLE=minimal FILE="&t5_xls";

PROC PRINT DATA=jrrdata.T5_male noobs; 
PROC PRINT DATA=jrrdata.T5_female noobs;
RUN;

ODS HTML CLOSE;

* print to main log *;
PROC PRINT DATA=jrrdata.T5_male; 
PROC PRINT DATA=jrrdata.T5_female;
RUN;

