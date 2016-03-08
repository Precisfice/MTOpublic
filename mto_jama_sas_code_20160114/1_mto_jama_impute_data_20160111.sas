/*
Program Name: 01_mto_jama_impute_data_YYYYMMDD.sas
Modified by: Matt Sciandra from program called "MTO_makedata.sas" created by Ron Kessler's team at Harvard Medical School.  
Last Modified: 1/11/16
Purpose: To create the imputed dataset needed for replication of the Moving to Opportunity (MTO) findings in the Journal of the American Medical Assocation (JAMA)
		 paper "Associations of Housing Mobility Interventions for Children in High-Poverty Neighborhoods With Subsequent Mental Disorders During Adolescence".

USER NOTES:
- The user must change the "pgmdir" and "mto" libname statements to match the file locations on his/her own computer
- This program was run using SAS 9.3. The user may run into issues using other versions of SAS. 

OTHER NOTES:
- Sample selection flags:
	+ exclude_lrgfam (exclude because of large family)
	+ exclude_htr (exclude because hard to reach)
	+ interview_decline (refused or declined to be interviewed)
	+ incapacitated (incapacitated or were in the hospital or in prison)
	+ never_found (Never found among those we went after)
	+ There is also a flag for being dead (variable name is 'dead'), we exclude these people for analysis 
	+ There is also a flag for if the person actually to do the interview (variable name: flag_paper_jama)
- f_wt_totsvy (weight to use)
- 3 dummies for the intervention groups:
	1. ra_Grp_Exp  (Family Randomized into Experimental Group)
	2. ra_Grp_S8  (Family Randomized into Section 8 Group)
	3. ra_grp_control (Control group)
- Variables in the analysis:
	%LET adage = ad_age_le35 ad_age_le40 ad_age_le45 ad_age_le50;
	%LET edvars = educ_miss_ref educ_miss_ref_ged  x_f_ad_edinsch;
	%LET demos = nonhisp_black hisp_any nonhisp_other nonhisp_white;
	%LET pers =   x_f_ad_nevmarr x_f_ad_parentu18 x_f_ad_working;
	%LET c2vars = x_f_c2_hosp x_f_c2_lowbw x_f_c2_read  ; 
	%LET chage = ch_age_lt14 ch_age_lt15 ch_age_lt16 ch_age_lt17;
	%LET schvars = x_f_ch_schplay  x_f_ch_specmed;
	%LET hhvars = x_f_hh_afdc x_f_hh_car x_f_hh_disabl x_f_hh_noteens 
			  hhsize_3plus hhsize_4plus hhsize_5plus x_f_hh_victim;
	%LET hoodvars = x_f_hood_5y x_f_hood_chat x_f_hood_nbrkid x_f_hood_nofamily 
			x_f_hood_nofriend x_f_hood_unsafenit x_f_hood_verydissat;
	%LET housvars = x_f_hous_fndapt x_f_hous_mov3tm x_f_hous_movdrgs x_f_hous_movschl x_f_hous_sec8bef;
	%LET incvars = ymh_cov_hh_inc_le7k ymh_cov_hh_inc_le9k ymh_cov_hh_inc_le12k ymh_cov_hh_inc_le17k;
	%LET sitevars = x_f_site_balt x_f_site_bos x_f_site_chi x_f_site_la;
	%LET ptsdvars = ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new ycv6_pt18_new 
			ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new ycv11_pt27_new;
	%LET dxvars= f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt ymh_cd_3x_y;
	%LET convars= x_f_ch_male f_svy_bl_mov_drug_gang_nomiss x_f_ch_bl_age617 ;

STEPS:
1. Set up SAS for use
2. Define macros used in the code
	2a. Variable concatenator
	2b. Macro for imputation of all the variables with missing data, excluding mental disorders
3. Prepare data for use
	3a. Read in pre-imputation data and recode/create new variables as necessary
	3b. Limit file to non-deceased youth and complete additional pre-imputation recodes
4. Call imputation macro for each treatment group
5. Combine imputed datasets and create output dataset
	5a. Stack datasets for each treatment group and recode variables using imputed data
	5b. Merge baseline age in years and categorical treatment group variable back onto main file
	5c. Sort data by ID and imputation iteration number and create final dataset 
	5d. Output contents of final dataset
*/

************************************************;
********** Step 1. Set up SAS for use **********;
************************************************;

/* !!!! NOTE: This program was run using SAS 9.3. The user may run into issues using other versions of SAS. !!!! */

** Set directories, libraries, and datasets;
/* !!!! USER MUST UPDATE DIRECTORY LOCATION FOR FORMATS/OUTPUT FILE AND DATA LOCATION. !!!! */
* Location of formats programs and output location for log/results;
%let pgmdir = C:/Users/Anolinx/MTO/outputs;
* Data file location;
libname mto "E:/NSCR_Replication_study";
* Input data file: pre-imputation dataset (one observation for each youth);
%LET NBER = E:/NSCR_Replication_study/NBER;
Libname NBER "&NBER";
%let preimp = NBER.Mto_jama_preimp_20160111;
* Output data file: post-imputation dataset (20 observations for each youth, 1 for each of the imputations run);
* NB: The choice of seed is parametrized here by DCN+ARW to permit sensitivity analyses ;
%MACRO set_impdata_filename_per_seed_1;
	%GLOBAL imputed;
	%IF &seed_1=524232 %THEN %DO;
		%LET imputed = MTO.mto_jama_imputed; * Default output name ;
		%END;
	%ELSE %DO;
		%LET imputed = MTO.mto_&seed_1._imputed; * Name of output for arbitrary seed choice ;
		%END;

	%PUT Imputed output file will be named: &imputed;
%MEND set_impdata_filename_per_seed_1

%set_impdata_filename_per_seed_1;

* Set options;
ODS RESULTS OFF;
OPTIONS NOFMTERR MPRINT LINESIZE=80;
* Note: formats are available for most variables on the input data file (see mto_jama_formats_20160109.sas), but applying them before the imputation 
  will generate values that are not consistent with those generated by a version of the program that does not apply them before the imputation;

  
************************************************************;
********** Step 2. Define macros used in the code **********;
************************************************************;

**** Step 2a. Variable concatenator ****;
%MACRO variable_concatenator(filename,colname,outname);

DATA _null_; SET &filename;
 CALL SYMPUT('varcount',_n_);
 RUN;
 %LET lastvar = ;
 %DO iter = 1 %TO &varcount;
  DATA _null_;
   SET &filename;
   IF &iter=_n_;
   CALL SYMPUT('current',strip(&colname));
  DATA this;
   a="&lastvar";
   b="&current";
   c=a||' '||b;
   CALL SYMPUT('lastvar',strip(c));
  RUN;
 %END;
 DATA _null_; SET this;
  CALL SYMPUT("&outname",c);
 RUN;

%MEND variable_concatenator;


**** Step 2b. Macro for imputation of all the variables with missing data, excluding mental disorders ****;
/*
PROC MI:

Do separately among 
ra_grp_control - Control group dummy variable created from ra_group
ra_Grp_Exp - Family Randomized into Experimental Group
ra_Grp_S8 - Family Randomized into Section 8 Group

-Use all variables used for analysis
-Do not use the frequency as a proxy for weights. 
-Once you have the 20 multiply imputed datasets (play with the number to see if you can determine 
the best number of datasets to use Alan said he thought that proc MI gave you some statistic for this) 
you will run the logistic regression to predict each mental disorder with just the 2 intervention dummies 
(leave out control group and don't include the covariates that we controlled for in the paper).  
-Do a test of significance for the 2 groups.  
-Then add in gender and test the interaction between the 2 dummies and female. 
*/
%MACRO runMI(grp);

%LET adage = ad_age;
%LET edvars = edcat x_f_ad_edinsch;
%LET demos = racecat;
%LET pers =   x_f_ad_nevmarr x_f_ad_parentu18 x_f_ad_working;
%LET c2vars = x_f_c2_hosp x_f_c2_lowbw x_f_c2_read  ; * C2VARS NEED x_f_ch_bl_age617 IN STEPWISE ! ;
%LET chage = ch_age;
%LET schvars = x_f_ch_schplay  x_f_ch_specmed;
%LET hhvars = x_f_hh_afdc x_f_hh_car x_f_hh_disabl x_f_hh_noteens 
	      hhsizecat x_f_hh_victim;
%LET hoodvars = x_f_hood_5y x_f_hood_chat x_f_hood_nbrkid x_f_hood_nofamily 
		x_f_hood_nofriend x_f_hood_unsafenit x_f_hood_verydissat;
%LET housvars = x_f_hous_fndapt x_f_hous_mov3tm x_f_hous_movdrgs x_f_hous_movschl x_f_hous_sec8bef;
%LET incvars = inccat;
%LET sitevars = ra_site;
%LET convars= x_f_ch_male mov_drugs x_f_ch_bl_age617 large_family exclude_lrgfam hardtoreach exclude_htr;
* NB: 'tevars' was called 'ptsdvars' in the original NBER code ;
%LET tevars = ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new ycv6_pt18_new 
		ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new ycv11_pt27_new;
* These are the 10 vars informing PTSD Criteria C1 ;
%LET c1vars = YCV21_PT275 YCV30_PT275 YCV15_PT269 YCV24_PT269
              YCV16_PT270 YCV25_PT270 YCV17_PT271 YCV26_PT271
              YCV18_PT272 YCV27_PT272;
* These are the 4 vars informing PTSD Criteria D1 ;
%LET d1vars = YCV19_PT273 YCV28_PT273 YCV20_PT274 YCV29_PT274;
* These 3 vars are required for calculating 'recency' of PTSD ;
%LET recvars = YCV14B_PT64A YCV14C YCV22_PT261;
* NB: 'ptsdvars' has been expanded vs original NBER code, to include now *all* PTSD-related questions ;
%LET ptsdvars = &tevars &c1vars &d1vars &recvars;
%LET dxvars= f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt ymh_cd_3x_y;

DATA mto2 (WHERE=(&grp=1));
 SET mto1;
 KEEP famid ppid ra_date ra_site flag_paper_jama ra_Grp_Exp ra_Grp_S8 ra_grp_control 
      f_wt_totcore98 f_wt_totsvy f_svy_bl_tract_masked_id 
	  AD_AGE_LE35 AD_AGE_LE40 AD_AGE_LE45 AD_AGE_LE50 
      CH_AGE_LT14 CH_AGE_LT15 CH_AGE_LT16 CH_AGE_LT17 
      HHSIZE_3PLUS HHSIZE_4PLUS HHSIZE_5PLUS 
      X_F_SITE_BALT X_F_SITE_BOS X_F_SITE_CHI X_F_SITE_LA  ymh_cov_ad_single_mother f_c9010t_perpov_bl
      &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
      &incvars &sitevars &ptsdvars &dxvars &convars; 
RUN;

*get number of missing for each variable*;
PROC MEANS DATA=mto2 NMISS ; 
 VAR &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
     &incvars &sitevars &ptsdvars &convars; *&dxvars*;
 ODS OUTPUT SUMMARY=a1;
RUN;
PROC TRANSPOSE DATA=a1 OUT=a2;
RUN;
DATA a3;
 SET a2;
 new_str = tranwrd(_NAME_,"_NMiss", ""); 
RUN;
*data with list of variable names with no missings*;
DATA nomiss_o;
 SET a3 (WHERE=(col1=0));
*data with list of variables with missings, ordered by the # of missings from small to large*;
DATA missings;
 SET a3 (WHERE=(col1>0));
RUN;

PROC SORT;
 BY col1;
RUN; 
 
*count number of variables with missing*;
DATA test;
 SET missings;
 num=_N_;
 dum=1;
DATA test;
 SET test;
 BY dum;
 IF last.dum;

PROC SQL NOPRINT;
   SELECT num
   INTO : numvars
   From test; 
QUIT;

%LET numvars_n=%EVAL(&numvars+0);
%LET numvarsp=%EVAL(&numvars_n+1);
%LET pnum1=%EVAL(&numvarsp+0);

*repeat loop for each variables that have missings, with the least missing first*;
DATA mtoimp1;
 SET mto2;
RUN;

%GLOBAL varlistn;

PROC PRINTTO NEW
 LOG="&pgmdir/02_mto_jama_runlog.log";
 RUN;
%variable_concatenator(missings,new_str,varlistn);
PROC PRINTTO NEW;
RUN;

%DO i=1 %TO &numvars;
  %LET varimp=%SCAN(&varlistn,&i,' '); 
  %LET pnum=%EVAL(&i+1);


PROC MEANS DATA=mtoimp&i NMISS ; 
 VAR &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
     &incvars &sitevars &ptsdvars &convars; * &dxvars;
 ODS OUTPUT SUMMARY=a1;
RUN;
PROC TRANSPOSE DATA=a1 OUT=a2;
RUN;
DATA a3;
 SET a2;
 new_str = tranwrd(_NAME_,"_NMiss", ""); 
RUN;
*data with list of variable names with no missings*;
DATA nomiss&i;
 SET a3 (WHERE=(col1=0));
RUN;

%GLOBAL varlistc;

PROC PRINTTO NEW
 LOG="&pgmdir/02_mto_jama_runlog.log";
 RUN;
%variable_concatenator(nomiss&i,new_str,varlistc);

PROC PRINTTO NEW;
RUN;

DATA mtoimp&i;
 SET mtoimp&i;
 &varimp._old=&varimp;
RUN;

%IF &i=1 %THEN %DO;
PROC MI DATA=mtoimp&i NIMPUTE=20 OUT=mtoimp&pnum SEED=&seed_1;
 CLASS &varlistc &varimp;
 MONOTONE LOGISTIC (&varimp = &varlistc);
 VAR &varlistc &varimp;
RUN; 
%END;
%ELSE %DO;
 %IF &varimp=edcat %THEN %DO;
 PROC MI DATA=mtoimp&i NIMPUTE=1 OUT=mtoimp&pnum SEED=&seed_1 ROUND=1 MINIMUM=1 MAXIMUM=3;
  CLASS &varlistc ;
  MONOTONE REGRESSION (&varimp = &varlistc);
  VAR &varlistc &varimp;
 RUN; 
 %END;
 %ELSE %IF &varimp=racecat %THEN %DO;
 PROC MI DATA=mtoimp&i NIMPUTE=1 OUT=mtoimp&pnum SEED=&seed_1 ROUND=1 MINIMUM=1 MAXIMUM=4;
  CLASS &varlistc ;
  MONOTONE REGRESSION (&varimp = &varlistc);
  VAR &varlistc &varimp;
 RUN; 
 %END;
 %ELSE %IF &varimp=inccat %THEN %DO;
 PROC MI DATA=mtoimp&i NIMPUTE=1 OUT=mtoimp&pnum SEED=&seed_1 ROUND=1 MINIMUM=1 MAXIMUM=5;
  CLASS &varlistc ;
  MONOTONE REGRESSION (&varimp = &varlistc);
  VAR &varlistc &varimp;
 RUN; 
 %END;
 %ELSE %DO;
 PROC MI DATA=mtoimp&i NIMPUTE=1 OUT=mtoimp&pnum SEED=&seed_1;
  CLASS &varlistc &varimp;
  MONOTONE LOGISTIC (&varimp = &varlistc);
  VAR &varlistc &varimp;
 RUN; 
 %END;
%END;

PROC PRINTTO NEW;
RUN;

PROC FREQ;
 TABLES &varimp*&varimp._old/LIST MISSING;
RUN;


%END;

 PROC MI DATA=mtoimp&pnum1 NIMPUTE=1 OUT=mtoimp_final SEED=&seed_1;
  CLASS &varlistc &dxvars;
  MONOTONE LOGISTIC (&dxvars = &varlistc);
  VAR &varlistc &dxvars;
 RUN; 

 *impute controls in prevalence tables that were not part of analysis models;
 PROC MI DATA=mtoimp_final NIMPUTE=1 OUT=mtoimp_final1 SEED=&seed_1;
  CLASS &varlistc &dxvars ymh_cov_ad_single_mother;
  MONOTONE LOGISTIC (ymh_cov_ad_single_mother=  &varlistc &dxvars);
  VAR &varlistc &dxvars ymh_cov_ad_single_mother;
 RUN; 
 
 PROC MI DATA=mtoimp_final1 NIMPUTE=1 OUT=mtoimp_final2 SEED=&seed_1 MINIMUM=0 MAXIMUM=1;
  CLASS &varlistc &dxvars ymh_cov_ad_single_mother ;
  MONOTONE REGRESSION (f_c9010t_perpov_bl = &varlistc &dxvars ymh_cov_ad_single_mother);
  VAR &varlistc &dxvars ymh_cov_ad_single_mother f_c9010t_perpov_bl;
 RUN;  


PROC FREQ;
 TABLES flag_paper_jama*(&dxvars)/LIST MISSING;
RUN;

DATA mto_&grp;
 SET mtoimp_final2;
RUN;

%MEND runMI;


**************************************************;
********** Step 3. Prepare data for use **********;
**************************************************;

**** Step 3a. Read in pre-imputation data and recode/create new variables as necessary ****;
DATA mto1_all (drop=i);
	set &preimp.;

	IF ra_grp_exp = 1 OR ra_grp_s8 = 1 THEN intervention = 1;
		ELSE intervention = 0;
	* CAT VAR FOR CTR/S8/EXP ;
	group = '1) CONTROL';
	IF ra_grp_exp = 1 OR ra_grp_s8= 1 THEN group = '2) INT    ';

	* set N=2 missing gender cases to 0;
	IF x_f_ch_male=. THEN x_f_ch_male=0;

	* DUMMY FOR AGES 13-17 ;
	IF x_f_ch_age13 = 1 OR x_f_ch_age14 = 1 OR x_f_ch_age15 = 1 OR 
		x_f_ch_age16 = 1 OR x_f_ch_age17 = 1
		THEN x_f_age1317 = 1; ELSE x_f_age1317 = 0;

	* NEW RACE CODING (RENAME MATTS VARIABLES ;
	nonhisp_black = ymh_cov_ad_ethrace_black_nonhisp ;
	hisp_any = ymh_cov_ad_ethrace_hisp_anyrace;
	nonhisp_other = ymh_cov_ad_ethrace_other_nonhisp ;
	nonhisp_white = ymh_cov_ad_ethrace_ref;

	* NEW AD_ED CODING PROVIDED BY MATT (8/28/2012) Updated (9/10/2012) ;
	if x_f_ad_edged=0 and x_f_ad_edgradhs=0 then x_f_ad_edref=1;
	  else if x_f_ad_edged=1 or x_f_ad_edgradhs=1 then x_f_ad_edref=0; 

	* MAKE NESTED VERSIONS OF EDUCATION ;
	IF x_f_ad_edged^=. AND x_f_ad_edgradhs^=. AND x_f_ad_edref^=. THEN DO;  
	 IF x_f_ad_edref = 1 THEN educ_miss_ref = 1; ELSE educ_miss_ref = 0;
	 IF x_f_ad_edref = 1 OR x_f_ad_edged = 1 THEN educ_miss_ref_ged = 1; ELSE educ_miss_ref_ged = 0;
	END;

	* MAKE NESTED VERSIONS OF ADULT AGE (NOTE: no missings for the following age variables used so ELSE statement is okay);
	IF x_f_ad_le_35 = 1 THEN ad_age_le35 = 1; ELSE ad_age_le35 = 0;
	IF x_f_ad_le_35 = 1 OR x_f_ad_36_40 = 1 THEN ad_age_le40 = 1; ELSE ad_age_le40 = 0;
	IF x_f_ad_le_35 = 1 OR  x_f_ad_36_40 = 1 OR x_f_ad_41_45 = 1 THEN ad_age_le45 = 1; ELSE ad_age_le45 = 0;
	IF x_f_ad_le_35 = 1 OR  x_f_ad_36_40 = 1 OR x_f_ad_41_45 = 1 OR x_f_ad_46_50 = 1 THEN ad_age_le50 = 1; ELSE ad_age_le50 = 0;
	* MAKE NESTED VERSIONS OF CHILD AGE (NOTE: no missings for the following age variables used so ELSE statement is okay);
	IF x_f_ch_age13 = 1 THEN ch_age_lt14 = 1; ELSE ch_age_lt14 = 0;
	IF x_f_ch_age13 = 1 OR x_f_ch_age14 = 1 THEN ch_age_lt15 = 1; ELSE ch_age_lt15 = 0;
	IF x_f_ch_age13 = 1 OR x_f_ch_age14 = 1 OR x_f_ch_age15 = 1 THEN ch_age_lt16 = 1; ELSE ch_age_lt16 = 0;
	IF x_f_ch_age13 = 1 OR x_f_ch_age14 = 1 OR x_f_ch_age15 = 1 OR x_f_ch_age16 = 1 THEN ch_age_lt17 = 1; ELSE ch_age_lt17 = 0;

	IF x_f_hh_size2 = x_f_hh_size3 = x_f_hh_size4 = 0 THEN hhsize_5plus = 1; ELSE hhsize_5plus = 0;
	IF x_f_hh_size4 = 1 OR hhsize_5plus = 1 THEN hhsize_4plus = 1; else hhsize_4plus = 0;
	IF x_f_hh_size3 = 1 OR hhsize_4plus = 1 THEN hhsize_3plus = 1; ELSE hhsize_3plus = 0;

	* YOUTH PTSD ITEMS ;
	array rawvar {11} ycv1_pt13 ycv2_pt14 ycv3_pt15 ycv4_pt16 ycv5_pt17 ycv6_pt18 ycv7_pt20 ycv8_pt22 ycv9_pt22_1 ycv10_pt23 ycv11_pt27;
	array newvar {11} ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new ycv11_pt27_new;
	do i = 1 to dim(rawvar);
		IF rawvar{i} = 1 THEN newvar{i} = 1;
		IF rawvar{i} = 5 THEN newvar{i} = 0;
	end;
  
	IF flag_paper_jama=0 THEN ymh_cd_3x_y=.; 

	* short names for dx vars ;
	deph = f_mh_deph_y_yt;
	bip = ymh_bipolar_i_ii_y;
	pds = f_mh_pds_y_yt;
	pts = f_mh_pts_y_yt;
	odd = f_mh_odd_y_yt;
	ied = f_mh_ied_y_yt;
	cd = ymh_cd_3x_y;

	* just in case ;
	mood = MAX(deph,bip);
	anx = MAX(pds,pts);
	dis = MAX(odd,ied,cd);

	* 	new dummies
	1.	Large family Y/N f_svy_tot_yt_elig>3
	2.	Excluded because of large family y/n: f_svy_sample2007="EY" (n=188)
	3.	The 701 hard-to-reach people can be identified by f_svy_phase2_elig=1. 246 
	4.	the 455 who were excluded can be identified by f_svy_phase2_elig=1 & f_svy_phase2_sel=0.
	NOTE: none of the raw variables have any missings or invalid values, so ELSE statement is okay to use;
	IF f_svy_tot_yt_elig>3 THEN large_family=1; ELSE large_family=0;
	IF f_svy_sample2007="EY" THEN exclude_lrgfam=1; ELSE exclude_lrgfam=0;
	IF f_svy_phase2_elig=1 THEN hardtoreach=1; ELSE hardtoreach=0;
	IF f_svy_phase2_elig=1 AND f_svy_phase2_sel=0 THEN exclude_htr=1; ELSE exclude_htr=0; *f_svy_final_disp="NS-P2";

	* Refused or declined to be interviewed;
	IF f_svy_final_disp IN ("NI-RR","NI-RI") THEN interview_decline=1; ELSE interview_decline=0;

	* Incapacitated or were in the hospital or in prison;
	IF f_svy_final_disp IN ("NI-IC" ,"NI-PC") THEN incapacitated=1; ELSE incapacitated=0;

	* Never found (among those we tried to go after);
	IF f_svy_final_disp="NI-TR" THEN never_found=1; ELSE never_found=0;

	IF f_svy_final_disp="NI-DC" THEN dead=1; ELSE dead=0;

	* 	note: convert -1 values (structural missings) to missing;
	IF x_f_c2_hosp=-1  THEN DO; hosp_str=1;  x_f_c2_hosp=.; END;
	IF x_f_c2_lowbw=-1 THEN DO; lowbw_str=1; x_f_c2_lowbw=.; END;
	IF x_f_c2_read=-1  THEN DO; read_str=1;  x_f_c2_read=.; END;

	*rename "move away because of gang and drugs" variable, because variable name is too long;
	mov_drugs=f_svy_bl_mov_drug_gang_nomiss;

	IF f_svy_final_disp IN ("IW-P2","IW-PF","IW-TF") THEN notinterviewed=0; ELSE notinterviewed=1; 

RUN; 


**** Step 3b. Limit file to non-deceased youth and complete additional pre-imputation recodes ****;
DATA mto1 (WHERE=(f_svy_final_disp^="NI-DC"));
 SET mto1_all;

	*recode categoricals*;
	 IF ad_age_le35=1 THEN ad_age=1;
	 ELSE IF ad_age_le40=1 THEN ad_age=2;
	 ELSE IF ad_age_le45=1 THEN ad_age=3;
	 ELSE IF ad_age_le50=1 THEN ad_age=4;
	 ELSE ad_age=5;

	 IF x_f_ad_edged=1 THEN edcat=1;
	 ELSE IF x_f_ad_edgradhs=1 THEN edcat=2;
	 ELSE IF x_f_ad_edref=1 THEN edcat=3; 

	 IF nonhisp_black=1 THEN racecat=1;
	 IF hisp_any=1 THEN racecat=2;
	 IF nonhisp_other=1 THEN racecat=3;
	 IF nonhisp_white=1 THEN racecat=4;

	 IF ch_age_lt14=1 THEN ch_age=1;
	 ELSE IF ch_age_lt15=1 THEN ch_age=2;
	 ELSE IF ch_age_lt16=1 THEN ch_age=3;
	 ELSE IF ch_age_lt17=1 THEN ch_age=4;
	 ELSE ch_age=5;

	 IF hhsize_5plus=1 THEN hhsizecat=4;
	 ELSE IF hhsize_4plus=1 THEN hhsizecat=3;
	 ELSE IF hhsize_3plus=1 THEN hhsizecat=2;
	 ELSE hhsizecat=1;

	 IF ymh_cov_hh_inc_le7k=1 THEN inccat=1;
	 ELSE IF ymh_cov_hh_inc_le9k=1 THEN inccat=2;
	 ELSE IF ymh_cov_hh_inc_le12k=1 THEN inccat=3;
	 ELSE IF ymh_cov_hh_inc_le17k=1 THEN inccat=4;
	 ELSE IF ymh_cov_hh_inc_le7k^=. THEN inccat=5; 

RUN;


****************************************************************************;
********** Step 4. Call imputation macro for each treatment group **********;
****************************************************************************;

PROC PRINTTO NEW
 LOG="&pgmdir/02_mto_jama_runimputedata.log"
 PRINT="&pgmdir/02_mto_jama_runimputedata.lst";
 RUN;
%runMI(ra_Grp_Exp);
%runMI(ra_Grp_S8);
%runMI(ra_grp_control);

PROC PRINTTO NEW;
RUN;


********************************************************************************;
********** Step 5. Combine imputed datasets and create output dataset **********;
*******************************************************************************;

**** Step 5a. Stack datasets for each treatment group and recode variables using imputed data ****;
DATA impdata;
 SET mto_ra_Grp_Exp
     mto_ra_Grp_S8
     mto_ra_grp_control;

	*recode nested variables;

	nonhisp_black=0; hisp_any=0; nonhisp_other=0; nonhisp_white=0;
	IF racecat=1 THEN nonhisp_black=1;
	IF racecat=2 THEN hisp_any=1;
	IF racecat=3 THEN nonhisp_other=1;
	IF racecat=4 THEN nonhisp_white=1;

	IF edcat IN (1,3) THEN  educ_miss_ref_ged=1; 
	IF edcat IN (2)   THEN  educ_miss_ref_ged=0; 

	IF edcat IN (3)   THEN educ_miss_ref=1; 
	IF edcat IN (1,2) THEN educ_miss_ref=0; 

	IF inccat=1 THEN ymh_cov_hh_inc_le7k=1;
	IF inccat IN (2,3,4,5) THEN ymh_cov_hh_inc_le7k=0;

	IF inccat IN (1,2)   THEN ymh_cov_hh_inc_le9k=1;
	IF inccat IN (3,4,5) THEN ymh_cov_hh_inc_le9k=0;

	IF inccat IN (1,2,3)   THEN ymh_cov_hh_inc_le12k=1;
	IF inccat IN (4,5)     THEN ymh_cov_hh_inc_le12k=0;

	IF inccat IN (1,2,3,4)   THEN ymh_cov_hh_inc_le17k=1;
	IF inccat IN (5)         THEN ymh_cov_hh_inc_le17k=0;

	 IF ra_Grp_Exp=1 OR ra_Grp_S8=1 THEN intervention=1; ELSE intervention=0;

	 *interaction terms;
	 int_main1=x_f_ch_male*ra_Grp_Exp;
	 int_main2=x_f_ch_male*ra_Grp_S8;
	 int_either=x_f_ch_male*intervention;

	 *recode number of traumatic events after imputations;
	 ymh_pts_event_count=.;ymh_pts_event_ge1=.;ymh_pts_event_ge2=.;ymh_pts_event_ge3=.;
	 ymh_pts_event_count = SUM(ycv1_pt13_new,ycv2_pt14_new,ycv3_pt15_new,ycv4_pt16_new,ycv5_pt17_new,ycv6_pt18_new,
						ycv7_pt20_new,ycv8_pt22_new,ycv9_pt22_1_new,ycv10_pt23_new,ycv11_pt27_new);

	 IF ymh_pts_event_count^=. THEN DO;
		 IF ymh_pts_event_count > 0 THEN ymh_pts_event_ge1 = 1; ELSE ymh_pts_event_ge1 = 0;
		 IF ymh_pts_event_count > 1 THEN ymh_pts_event_ge2 = 1; ELSE ymh_pts_event_ge2 = 0;
		 IF ymh_pts_event_count > 2 THEN ymh_pts_event_ge3 = 1; ELSE ymh_pts_event_ge3 = 0;
	 END;
RUN; 

	
**** Step 5b. Merge baseline age in years and categorical treatment group variable back onto main file ****;
PROC SORT DATA=impdata;
	BY ppid; 
RUN;
 
DATA impdata2;
	MERGE impdata (in=imp) &preimp. (keep = ppid ra_group f_svy_age_bl_imp 
f_svy_age_iw 
x_f_ch_male
);
	BY ppid; 
	if imp;
RUN;


**** Step 5c. Sort data by ID and imputation iteration number and create final dataset ****;
PROC SORT DATA=impdata2;
	BY _imputation_ ppid; 
RUN;
 
DATA &imputed.;
	SET impdata2;
	/* I believe this renaming with _NEW suffixes was intended solely to permit easy
	   application of SUM(.) for calculating ymh_pts_event_count above (line 566),
	   and that it has no other purpose outside this file.  Consequently, I restore
	   the original names at this point, to avoid complicating the 'client code' in
	   our reanalysis. -DCN
	*/
    rename YCV1_PT13_NEW = YCV1_PT13
           YCV2_PT14_NEW = YCV2_PT14
           YCV3_PT15_NEW = YCV3_PT15
           YCV4_PT16_NEW = YCV4_PT16
           YCV5_PT17_NEW = YCV5_PT17
           YCV6_PT18_NEW = YCV6_PT18
           YCV7_PT20_NEW = YCV7_PT20
           YCV8_PT22_NEW = YCV8_PT22
           YCV9_PT22_1_NEW = YCV9_PT22_1
           YCV10_PT23_NEW = YCV10_PT23
           YCV11_PT27_NEW = YCV11_PT27;
RUN;


**** Step 5d. Output contents of final dataset ****;

ods pdf file="&pgmdir/contents_mto_jama_imputed.pdf" style=minimal;
proc contents data=&imputed. varnum;
run;
ods pdf close;

