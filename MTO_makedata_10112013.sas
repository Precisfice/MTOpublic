
/* /data/kessler/MTO_file_for_Youth_MH_paper/ */
OPTIONS NOFMTERR MPRINT LINESIZE=80;
LIBNAME mto '/data/kessler/MTO_file_for_Youth_MH_paper/Data_Updated_20131011/';
LIBNAME mtoold '/data/kessler/MTO_file_for_Youth_MH_paper/Data_Updated_20130719/';
LIBNAME home '/home/hwang/MTO/work_folder';
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

ODS HTML STYLE=sasweb FILE="/home/hwang/MTO/MTO_revision_10112013/mto_contents.html";

PROC CONTENTS DATA=mto.mto_yt_mh_ppr_file_20131011;
RUN;

ODS HTML CLOSE;

PROC FREQ DATA=mto.mto_yt_mh_ppr_file_20131011;
 TABLES f_svy_final_disp ra_grp_:
        x_f_ch_age13*x_f_ch_age14*x_f_ch_age15*x_f_ch_age16*x_f_ch_age17
        x_f_c2_hosp x_f_c2_lowbw x_f_c2_read x_f_ch_schplay
        x_f_ad_nevmarr x_f_ad_parentu18 x_f_ad_working
        x_f_ad_edged*x_f_ad_edgradhs x_f_ad_edinsch
        x_f_ad_le_35*x_f_ad_36_40*x_f_ad_41_45*x_f_ad_46_50 
        x_f_ch_age13*x_f_ch_age14*x_f_ch_age15*x_f_ch_age16
        x_f_hh_size2*x_f_hh_size3*x_f_hh_size4
        ycv1_pt13 ycv2_pt14 ycv3_pt15 ycv4_pt16 ycv5_pt17 ycv6_pt18 
		ycv7_pt20 ycv8_pt22 ycv9_pt22_1 ycv10_pt23 ycv11_pt27
        f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt
        x_f_hh_afdc x_f_hh_car x_f_hh_disabl x_f_hh_noteens 
	    x_f_hh_victim
        x_f_hood_5y x_f_hood_chat x_f_hood_nbrkid x_f_hood_nofamily 
		x_f_hood_nofriend x_f_hood_unsafenit x_f_hood_verydissat 
        x_f_hous_fndapt x_f_hous_mov3tm x_f_hous_movdrgs x_f_hous_movschl x_f_hous_sec8bef
        ymh_cov_hh_inc_le7k ymh_cov_hh_inc_le9k ymh_cov_hh_inc_le12k ymh_cov_hh_inc_le17k
        f_svy_bl_mov_drug_gang_nomiss x_f_ch_bl_age617
        x_f_site_balt x_f_site_bos x_f_site_chi x_f_site_la
        f_svy_tot_yt_elig f_svy_sample2007 f_svy_phase2_elig  f_svy_phase2_sel/LIST MISSING;
 WHERE flag_paper_ymh=0;
RUN;
PROC FREQ DATA=mto.mto_yt_mh_ppr_file_20131011;
 TABLES f_svy_final_disp ra_grp_:
        x_f_ch_age13*x_f_ch_age14*x_f_ch_age15*x_f_ch_age16*x_f_ch_age17
        x_f_c2_hosp x_f_c2_lowbw x_f_c2_read x_f_ch_schplay
        x_f_ad_nevmarr x_f_ad_parentu18 x_f_ad_working
        x_f_ad_edged*x_f_ad_edgradhs x_f_ad_edinsch
        x_f_ad_le_35*x_f_ad_36_40*x_f_ad_41_45*x_f_ad_46_50 
        x_f_ch_age13*x_f_ch_age14*x_f_ch_age15*x_f_ch_age16
        x_f_hh_size2*x_f_hh_size3*x_f_hh_size4
        ycv1_pt13 ycv2_pt14 ycv3_pt15 ycv4_pt16 ycv5_pt17 ycv6_pt18 
		ycv7_pt20 ycv8_pt22 ycv9_pt22_1 ycv10_pt23 ycv11_pt27
        f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt
        x_f_hh_afdc x_f_hh_car x_f_hh_disabl x_f_hh_noteens 
	    x_f_hh_victim
        x_f_hood_5y x_f_hood_chat x_f_hood_nbrkid x_f_hood_nofamily 
		x_f_hood_nofriend x_f_hood_unsafenit x_f_hood_verydissat 
        x_f_hous_fndapt x_f_hous_mov3tm x_f_hous_movdrgs x_f_hous_movschl x_f_hous_sec8bef
        ymh_cov_hh_inc_le7k ymh_cov_hh_inc_le9k ymh_cov_hh_inc_le12k ymh_cov_hh_inc_le17k
        f_svy_bl_mov_drug_gang_nomiss x_f_ch_bl_age617
       x_f_site_balt x_f_site_bos x_f_site_chi x_f_site_la/LIST MISSING;
 WHERE flag_paper_ymh=1;
RUN;

PROC FREQ DATA=mto.mto_yt_mh_ppr_file_20131011;
 TABLES flag_paper_ymh*f_svy_tot_yt_elig
        flag_paper_ymh*f_svy_phase2_elig
        flag_paper_ymh*f_svy_phase2_elig*f_svy_phase2_sel
        flag_paper_ymh*f_svy_sample2007
        f_svy_tot_yt_elig*f_svy_sample2007/LIST MISSING;
RUN;

DATA mto;
 SET mto.mto_yt_mh_ppr_file_20131011;
RUN;
/*leave out deceased*/

DATA home.mto1;
 SET mto ;

IF ra_grp_exp = 1 OR ra_grp_s8 = 1 THEN intervention = 1;
	ELSE intervention = 0;
/* CAT VAR FOR CTR/S8/EXP */
group = '1) CONTROL';
IF ra_grp_exp = 1 OR ra_grp_s8= 1 THEN group = '2) INT    ';

/*GENDER*/

/*
1 observation for x_f_ch_male (gender) missing
based on having 0 on both f_svy_gender_num (Numerical gender variable: 1=Male, 0=Female) 
and x_f_ad_male (Male Sample Adult), code to Female
*/

IF x_f_ch_male=. THEN x_f_ch_male=0;

/* DUMMY FOR AGES 13-17 */
IF x_f_ch_age13 = 1 OR x_f_ch_age14 = 1 OR x_f_ch_age15 = 1 OR 
	x_f_ch_age16 = 1 OR x_f_ch_age17 = 1
	THEN x_f_age1317 = 1; ELSE x_f_age1317 = 0;

/* OLD AND RACE CODING  */
/* IF x_f_ad_race_black NE 1 AND x_f_ad_race_other NE 1 THEN x_f_ad_race_ref = 1;
	ELSE x_f_ad_race_ref = 0; */ 

/* NEW RACE CODING (RENAME MATTS VARIABLES */
nonhisp_black = ymh_cov_ad_ethrace_black_nonhisp ;
hisp_any = ymh_cov_ad_ethrace_hisp_anyrace;
nonhisp_other = ymh_cov_ad_ethrace_other_nonhisp ;
nonhisp_white = ymh_cov_ad_ethrace_ref;

/* REFERENCE CATEGORIES */

/*

IF x_f_c2_hosp NE 1 AND x_f_c2_hosp_miss NE 1 THEN x_f_c2_hosp_ref = 1;
	ELSE x_f_c2_hosp_ref = 0;
IF x_f_c2_lowbw NE 1 AND x_f_c2_lowbw_miss NE 1 THEN x_f_c2_lowbw_ref = 1;
	ELSE x_f_c2_lowbw_ref = 0;
IF x_f_c2_read NE 1 AND x_f_c2_read_miss NE 1 THEN x_f_c2_read_ref = 1;
	ELSE x_f_c2_read_ref = 0;
IF x_f_ch_schplay NE 1 AND x_f_ch_schplay_miss NE 1 THEN x_f_ch_schplay_ref = 1;
	ELSE x_f_ch_schplay_ref = 0;
*/

/* OLD AND INCORRECT AD_EDU CODING */
/*IF x_f_ad_edged = 0 AND x_f_ad_edgradhs = 0 AND x_f_ad_edgradhs_miss = 0 AND x_f_ad_edinsch = 0 
	THEN x_f_ad_edref = 1; ELSE x_f_ad_edref = 0;*/ 

/*
Education variables:
 x_f_ad_edged - At baseline, adult had a GED (Baseline, AD.e).
 x_f_ad_edgradhs - At baseline, sample adult reported having completed high school (Baseline, AD.e).
*/

	/* NEW AD_ED CODING PROVIDED BY MATT (8/28/2012) Updated (9/10/2012) */
if x_f_ad_edged=0 and x_f_ad_edgradhs=0 /*and x_f_ad_edgradhs_miss = 0*/ then x_f_ad_edref=1;
  else if x_f_ad_edged=1 or x_f_ad_edgradhs=1 /*or x_f_ad_edgradhs_miss = 1*/ then x_f_ad_edref=0; 

/* MAKE NESTED VERSIONS OF EDUCATION */
/*IF x_f_ad_edgradhs_miss = 1 THEN educ_miss = 1; ELSE educ_miss = 0;*/
  
IF x_f_ad_edged^=. AND x_f_ad_edgradhs^=. AND x_f_ad_edref^=. THEN DO;  
 IF x_f_ad_edref = 1 THEN educ_miss_ref = 1; ELSE educ_miss_ref = 0;
 IF x_f_ad_edref = 1 OR x_f_ad_edged = 1 THEN educ_miss_ref_ged = 1; ELSE educ_miss_ref_ged = 0;
END;

/* MAKE NESTED VERSIONS OF ADULT AGE (NOTE: no missings for the following age variables used so ELSE statement is okay)*/
IF x_f_ad_le_35 = 1 THEN ad_age_le35 = 1; ELSE ad_age_le35 = 0;
IF x_f_ad_le_35 = 1 OR x_f_ad_36_40 = 1 THEN ad_age_le40 = 1; ELSE ad_age_le40 = 0;
IF x_f_ad_le_35 = 1 OR  x_f_ad_36_40 = 1 OR x_f_ad_41_45 = 1 THEN ad_age_le45 = 1; ELSE ad_age_le45 = 0;
IF x_f_ad_le_35 = 1 OR  x_f_ad_36_40 = 1 OR x_f_ad_41_45 = 1 OR x_f_ad_46_50 = 1 THEN ad_age_le50 = 1; ELSE ad_age_le50 = 0;
/* MAKE NESTED VERSIONS OF CHILD AGE (NOTE: no missings for the following age variables used so ELSE statement is okay)*/
IF x_f_ch_age13 = 1 THEN ch_age_lt14 = 1; ELSE ch_age_lt14 = 0;
IF x_f_ch_age13 = 1 OR x_f_ch_age14 = 1 THEN ch_age_lt15 = 1; ELSE ch_age_lt15 = 0;
IF x_f_ch_age13 = 1 OR x_f_ch_age14 = 1 OR x_f_ch_age15 = 1 THEN ch_age_lt16 = 1; ELSE ch_age_lt16 = 0;
IF x_f_ch_age13 = 1 OR x_f_ch_age14 = 1 OR x_f_ch_age15 = 1 OR x_f_ch_age16 = 1 THEN ch_age_lt17 = 1; ELSE ch_age_lt17 = 0;
/* MAKE NESTED VERSIONS OF HH SIZE 
IF x_f_hh_size2 = 1 OR x_f_hh_size3 = 1 OR x_f_hh_size4 = 1 THEN hhsize_2plus = 1; ELSE hhsize_2plus = 0;
IF x_f_hh_size3 = 1 OR x_f_hh_size4 = 1 THEN hhsize_3plus = 1; ELSE hhsize_3plus = 0;
IF x_f_hh_size4 = 1 THEN hhsize_4plus = 1; ELSE hhsize_4plus = 0;
 (NOTE: no missings for the following HHS variables used so ELSE statement is okay)*/

IF x_f_hh_size2 = x_f_hh_size3 = x_f_hh_size4 = 0 THEN hhsize_5plus = 1; ELSE hhsize_5plus = 0;
IF x_f_hh_size4 = 1 OR hhsize_5plus = 1 THEN hhsize_4plus = 1; else hhsize_4plus = 0;
IF x_f_hh_size3 = 1 OR hhsize_4plus = 1 THEN hhsize_3plus = 1; ELSE hhsize_3plus = 0;

/* MAKE INTERACTIONS BETWEEN SITES AND VOUCHER GROUPS */
int_exp_chi = ra_grp_exp*x_f_site_chi;
int_exp_balt = ra_grp_exp*x_f_site_balt;
int_exp_bos = ra_grp_exp*x_f_site_bos;
int_exp_la = ra_grp_exp*x_f_site_la;
int_s8_chi = ra_grp_s8*x_f_site_chi;
int_s8_balt = ra_grp_s8*x_f_site_balt;
int_s8_bos = ra_grp_s8*x_f_site_bos;
int_s8_la = ra_grp_s8*x_f_site_la;
/* MAKE INTERACTIONS BETWEEN SITES AND INTERVENTION DUMMY */
int_chi = intervention*x_f_site_chi;
int_balt = intervention*x_f_site_balt;
int_bos = intervention*x_f_site_bos;
int_la = intervention*x_f_site_la;
/* YOUTH PTSD ITEMS */

%MAKE_YOUTH_PTSD(ycv1_pt13);
%MAKE_YOUTH_PTSD(ycv2_pt14);
%MAKE_YOUTH_PTSD(ycv3_pt15); 
%MAKE_YOUTH_PTSD(ycv4_pt16); 
%MAKE_YOUTH_PTSD(ycv5_pt17);
%MAKE_YOUTH_PTSD(ycv6_pt18);
%MAKE_YOUTH_PTSD(ycv7_pt20); 
%MAKE_YOUTH_PTSD(ycv8_pt22); 
%MAKE_YOUTH_PTSD(ycv9_pt22_1); 
%MAKE_YOUTH_PTSD(ycv10_pt23);
%MAKE_YOUTH_PTSD(ycv11_pt27);
yt_ptsd_count = SUM(ycv1_pt13_new,ycv2_pt14_new,ycv3_pt15_new,ycv4_pt16_new,ycv5_pt17_new,ycv6_pt18_new,
					ycv7_pt20_new,ycv8_pt22_new,ycv9_pt22_1_new,ycv10_pt23_new,ycv11_pt27_new);

IF yt_ptsd_count^=. THEN DO;
IF yt_ptsd_count > 0 THEN yt_ptsd_any = 1; ELSE yt_ptsd_any = 0;
IF yt_ptsd_count > 1 THEN yt_ptsd_2plus = 1; ELSE yt_ptsd_2plus = 0;
IF yt_ptsd_count > 2 THEN yt_ptsd_3plus = 1; ELSE yt_ptsd_3plus = 0;
END;


  /* 7 items used for factor analysis */ 

	/* Drug Sales */
  %New_Categories(YRB15_U15,DrugSales);
  /* Destroy Property */
  %New_Categories(YRB16B_U16A,PropCrimes);
  /* Stole less than $50 */
  %New_Categories(YRB16D_U16B,StoleLT50);
  /* Stole more than $50 */
  %New_Categories(YRB16F_U16C,StoleGT50);
  /* Other Propery Crimes */
  %New_Categories(YRB16H_U16D,OtherPropCrimes);
  /* Serious Fights */
  %New_Categories(YRB16J_U16E,SeriousFights);
  /* Carry a Gun */
  %New_Categories(YRB18_U18,CarryGun);

  /* Initialize categorical dummies for defining CD*/
  PropCrimes_Cat_2x = 0;
  Theft_Cat_2x = 0;
  Deceitful_Cat_2x = 0;
  SeriousFights_Cat_2x = 0;
  RuleViolation_Cat_2x = 0;

  PropCrimes_Cat_3x = 0;
  Theft_Cat_3x = 0;
  Deceitful_Cat_3x = 0;
  SeriousFights_Cat_3x = 0;
  RuleViolation_Cat_3x = 0;

  PropCrimes_Cat_5x = 0;
  Theft_Cat_5x = 0;
  Deceitful_Cat_5x = 0;
  SeriousFights_Cat_5x = 0;
  RuleViolation_Cat_5x = 0;
  
  /* Define Conduct Disorder */
  %Define_Conduct_Disorder(2);
  %Define_Conduct_Disorder(3);
  %Define_Conduct_Disorder(5);
  
  LABEL cd_2x = '12M Conduct Disorder - 3 out of 5 (Destroy Prop/Theft/Deceitfulness/Serious Fights/Carry Gun) - Each requiring at least 2 instances'
        cd_3x = '12M Conduct Disorder - 3 out of 5 (Destroy Prop/Theft/Deceitfulness/Serious Fights/Carry Gun) - Each requiring at least 3 instances'
        cd_5x = '12M Conduct Disorder - 3 out of 5 (Destroy Prop/Theft/Deceitfulness/Serious Fights/Carry Gun) - Each requiring at least 5 instances';

  /*
  PROC FREQ=mto.mto_yt_mh_ppr_file_20131011
  TABLES YRB16B_U16A YRB16D_U16B YRB16F_U16C YRB16H_U16D YRB15_U15 YRB16J_U16E YRB18_U18;
  WHERE flag_paper_ymh=0;
  RUN;

  note: variables are missing completely where flag_paper_ymh=0, so code conduct to missing
  */
  
  IF flag_paper_ymh=0 THEN DO;
   cd_2x=.; cd_3x=.; cd_5x=.; 
  END;
  

  /*include conduct disorder in any disruptive*/

    IF cd_3x=1 THEN ymh_disrupt_y=1;

	/* COUNT NUMBER OF DX */
	dx_count = SUM(f_mh_deph_y_yt,ymh_bipolar_i_ii_y,f_mh_pds_y_yt,
					f_mh_pts_y_yt,f_mh_odd_y_yt,f_mh_ied_y_yt,cd_3x);

	IF dx_count^=. THEN DO;
	 IF dx_count >= 1 THEN ymh_any_y_new = 1; ELSE ymh_any_y_new = 0;
	 IF dx_count >= 2 THEN dx_2plus_new = 1; ELSE dx_2plus_new = 0;
	END;
	/* short names for dx vars */
	deph = f_mh_deph_y_yt;
	bip = ymh_bipolar_i_ii_y;
	pds = f_mh_pds_y_yt;
	pts = f_mh_pts_y_yt;
	odd = f_mh_odd_y_yt;
	ied = f_mh_ied_y_yt;
	cd = cd_3x;
	any = ymh_any_y_new;
	two = dx_2plus_new;
	
	/* just in case */
	mood = MAX(deph,bip);
	anx = MAX(pds,pts);
	dis = MAX(odd,ied,cd);

/*extra variables from Irving*/

int_baseage_exp=x_f_ch_bl_age617*ra_grp_exp;
int_baseage_s8=x_f_ch_bl_age617*ra_grp_s8;
int_baseage_int=x_f_ch_bl_age617*intervention;


int_drugs_exp=f_svy_bl_mov_drug_gang_nomiss*ra_grp_exp;
int_drugs_s8=f_svy_bl_mov_drug_gang_nomiss*ra_grp_s8;
int_drugs_int=f_svy_bl_mov_drug_gang_nomiss*intervention;



/*
new race variable

ymh_cov_ad_ethrace_black_nonhisp - black, non-Hispanic
ymh_cov_ad_ethrace_hisp_anyrace - Hispanic, any race
ymh_cov_ad_ethrace_other_nonhisp - Asian, American Indian, or Other race, non-Hispanic
ymh_cov_ad_ethrace_ref - white, non-Hispanic

Ron wants the interaction with race/ethnicity first coded as black, non-hispanic vs all others
Then re-do the interaction coding as  black, non-hispanic vs. hispanic, any race 
(dropping from the equation non-hispanic whites and non-hispanic Asian, Amer. Indian or other non-hispanic

*/
 
nonhisp_black2=nonhisp_black;

/*
new dummies
1.	Large family Y/N f_svy_tot_yt_elig>3
2.	Excluded because of large family y/n: f_svy_sample2007="EY" (n=188)
3.	The 701 hard-to-reach people can be identified by f_svy_phase2_elig=1. 246 
4.	the 455 who were excluded can be identified by f_svy_phase2_elig=1 & f_svy_phase2_sel=0.

NOTE: none of the raw variables have any missings or invalid values, so ELSE statement is okay to use
*/

IF f_svy_tot_yt_elig>3 THEN large_family=1; ELSE large_family=0;
IF f_svy_sample2007="EY" THEN exclude_lrgfam=1; ELSE exclude_lrgfam=0;
IF f_svy_phase2_elig=1 THEN hardtoreach=1; ELSE hardtoreach=0;
IF f_svy_phase2_elig=1 AND f_svy_phase2_sel=0 THEN exclude_htr=1; ELSE exclude_htr=0; /*f_svy_final_disp="NS-P2"*/
 
 
/*Refused or declined to be interviewed*/

IF f_svy_final_disp IN ("NI-RR","NI-RI") THEN interview_decline=1; ELSE interview_decline=0;

/*Incapacitated or were in the hospital or in prison*/

IF f_svy_final_disp IN ("NI-IC" ,"NI-PC") THEN incapacitated=1; ELSE incapacitated=0;
 
/*Never found (among those we tried to go after)*/

IF f_svy_final_disp="NI-TR" THEN never_found=1; ELSE never_found=0;

IF f_svy_final_disp="NI-DC" THEN dead=1; ELSE dead=0;

/*
note: convert -1 values (structural missings) to missing
*/

IF x_f_c2_hosp=-1  THEN DO; hosp_str=1;  x_f_c2_hosp=.; END;
IF x_f_c2_lowbw=-1 THEN DO; lowbw_str=1; x_f_c2_lowbw=.; END;
IF x_f_c2_read=-1  THEN DO; read_str=1;  x_f_c2_read=.; END;
 
/*rename "move away because of gang and drugs" variable, because variable name is too long*/

mov_drugs=f_svy_bl_mov_drug_gang_nomiss;

/*
variable descriptions:

flags:
exclude_lrgfam (exclude because of large family)
exclude_htr (exclude because hard to reach)
interview_decline (refused or declined to be interviewed)
incapacitated (incapacitated or were in the hospital or in prison)
never_found (Never found among those we went after)

there is also a flag for being dead (variable name is 'dead'), we exclude these people for analysis 

f_wt_totsvy (weight to use)

There is also a flag for if the person actually too the interview (variable name: flag_paper_ymh)

3 dummies for the intervention groups:

ra_Grp_Exp  (Family Randomized into Experimental Group)
ra_Grp_S8  (Family Randomized into Section 8 Group)
ra_grp_control (Control group)



variables in the analysis:


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
%LET dxvars= f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt cd_3x;
%LET convars= x_f_ch_male f_svy_bl_mov_drug_gang_nomiss x_f_ch_bl_age617 ;


*/

IF f_svy_final_disp IN ("IW-P2","IW-PF","IW-TF") THEN notinterviewed=0; ELSE notinterviewed=1; 

RUN; 
PROC FREQ;
 TABLES f_svy_final_disp*interview_decline*incapacitated*never_found*dead/LIST MISSING;
RUN;


/*
stepwise regression to see which baseline control to keep for raking weights
*/
/*
PROC LOGISTIC DATA=home.mto1;
MODEL notinterviewed (EVENT='1') = x_f_c2_read x_f_c2_hosp x_f_c2_lowbw x_f_ch_schplay x_f_ch_specmed
                                ch_age_lt14 ch_age_lt15 ch_age_lt16 ch_age_lt17
                                hisp_any nonhisp_white nonhisp_black nonhisp_other 
                                educ_miss_ref educ_miss_ref_ged x_f_ad_edinsch x_f_ad_working x_f_ad_nevmarr x_f_ad_parentu18
                                ad_age_le35 ad_age_le40 ad_age_le45 ad_age_le50
                                ymh_cov_hh_inc_le7k ymh_cov_hh_inc_le9k ymh_cov_hh_inc_le12k ymh_cov_hh_inc_le17k
                                x_f_hh_disabl x_f_hh_afdc x_f_hh_car 
                                hhsize_3plus hhsize_4plus hhsize_5plus
                                x_f_hh_victim x_f_hood_unsafenit x_f_hood_verydissat x_f_hous_fndapt x_f_hood_5y
                                x_f_hous_mov3tm  x_f_hous_sec8bef x_f_hood_nofamily x_f_hood_nofriend x_f_hood_chat
                                x_f_hood_nbrkid mov_drugs x_f_hous_movschl x_f_hh_noteens
		/ SELECTION=forward SLENTRY=0.05 ;
 WEIGHT f_wt_totcore98;
RUN; 
*/
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

%MEND;

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

DATA mto1 (WHERE=(f_svy_final_disp^="NI-DC"));
 SET home.mto1;

 /*recode categoricals*/

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

 IF x_f_site_balt=1 THEN site=1;
 IF x_f_site_bos=1 THEN site=2;
 IF x_f_site_chi=1 THEN site=3;
 IF x_f_site_la=1 THEN site=4;
 IF site=. THEN site=5;

RUN;
PROC FREQ DATA=mto1;
 TABLES ad_age*ad_age_le35*ad_age_le40*ad_age_le45*ad_age_le50
        edcat*x_f_ad_edged*x_f_ad_edgradhs*x_f_ad_edref*educ_miss_ref*educ_miss_ref_ged
		racecat*nonhisp_black*hisp_any*nonhisp_other*nonhisp_white
        ch_age*ch_age_lt14*ch_age_lt15*ch_age_lt16*ch_age_lt17
		hhsizecat*hhsize_3plus*hhsize_4plus*hhsize_5plus
		inccat*ymh_cov_hh_inc_le7k*ymh_cov_hh_inc_le9k*ymh_cov_hh_inc_le12k*ymh_cov_hh_inc_le17k
        site*x_f_site_balt*x_f_site_bos*x_f_site_chi*x_f_site_la/LIST MISSING;
RUN;

/*get missing pattern*/


%MACRO runtestMI;

%LET adage = ad_age;
%LET edvars = edcat /*added*/ x_f_ad_edinsch;
%LET demos = racecat;
%LET pers =   x_f_ad_nevmarr x_f_ad_parentu18 x_f_ad_working;
%LET c2vars = x_f_c2_hosp x_f_c2_lowbw x_f_c2_read  ; /* C2VARS NEED x_f_ch_bl_age617 IN STEPWISE ! */
%LET chage = ch_age;
%LET schvars = x_f_ch_schplay  x_f_ch_specmed;
%LET hhvars = x_f_hh_afdc x_f_hh_car x_f_hh_disabl x_f_hh_noteens 
	      hhsizecat x_f_hh_victim;
%LET hoodvars = x_f_hood_5y x_f_hood_chat x_f_hood_nbrkid x_f_hood_nofamily 
		x_f_hood_nofriend x_f_hood_unsafenit x_f_hood_verydissat;
%LET housvars = x_f_hous_fndapt x_f_hous_mov3tm x_f_hous_movdrgs x_f_hous_movschl x_f_hous_sec8bef;
%LET incvars = inccat;
%LET sitevars = site;
%LET convars= x_f_ch_male mov_drugs x_f_ch_bl_age617 large_family exclude_lrgfam hardtoreach exclude_htr;
%LET ptsdvars = ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new ycv6_pt18_new 
		ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new ycv11_pt27_new;
%LET dxvars= f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt cd_3x;

DATA mto2 ;
 SET mto1;
 KEEP famid ppid ra_date flag_paper_ymh ra_Grp_Exp ra_Grp_S8 ra_grp_control 
      f_wt_totcore98 f_wt_totsvy f_svy_bl_tract_masked_id i_svy_final_disp i_svy_iw_date
      &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
      &incvars &sitevars &ptsdvars &dxvars &convars;
RUN;


PROC MI DATA=mto2 NIMPUTE=0 OUT=mtoimp SEED=524232 ROUND=1; 
 VAR &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
     &incvars &sitevars &ptsdvars &dxvars &convars;
RUN; 

%MEND;
/*
%runtestMI;
*/
/*
mental disorders can be imputed all together, nothing else has monotone missing patterns
*/

/*
below loops imputations for all the variables with missings, 
excluding mental disorders
*/

%MACRO runMI(grp);

%LET adage = ad_age;
%LET edvars = edcat /*added*/ x_f_ad_edinsch;
%LET demos = racecat;
%LET pers =   x_f_ad_nevmarr x_f_ad_parentu18 x_f_ad_working;
%LET c2vars = x_f_c2_hosp x_f_c2_lowbw x_f_c2_read  ; /* C2VARS NEED x_f_ch_bl_age617 IN STEPWISE ! */
%LET chage = ch_age;
%LET schvars = x_f_ch_schplay  x_f_ch_specmed;
%LET hhvars = x_f_hh_afdc x_f_hh_car x_f_hh_disabl x_f_hh_noteens 
	      hhsizecat x_f_hh_victim;
%LET hoodvars = x_f_hood_5y x_f_hood_chat x_f_hood_nbrkid x_f_hood_nofamily 
		x_f_hood_nofriend x_f_hood_unsafenit x_f_hood_verydissat;
%LET housvars = x_f_hous_fndapt x_f_hous_mov3tm x_f_hous_movdrgs x_f_hous_movschl x_f_hous_sec8bef;
%LET incvars = inccat;
%LET sitevars = site;
%LET convars= x_f_ch_male mov_drugs x_f_ch_bl_age617 large_family exclude_lrgfam hardtoreach exclude_htr;
%LET ptsdvars = ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new ycv6_pt18_new 
		ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new ycv11_pt27_new;
%LET dxvars= f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt cd_3x;

DATA mto2 (WHERE=(&grp=1));
 SET mto1;
 KEEP famid ppid ra_date ra_site flag_paper_ymh ra_Grp_Exp ra_Grp_S8 ra_grp_control 
      f_wt_totcore98 f_wt_totsvy f_svy_bl_tract_masked_id i_svy_final_disp i_svy_iw_date
	  AD_AGE_LE35 AD_AGE_LE40 AD_AGE_LE45 AD_AGE_LE50 
      CH_AGE_LT14 CH_AGE_LT15 CH_AGE_LT16 CH_AGE_LT17 
      HHSIZE_3PLUS HHSIZE_4PLUS HHSIZE_5PLUS 
      X_F_SITE_BALT X_F_SITE_BOS X_F_SITE_CHI X_F_SITE_LA  ymh_cov_ad_single_mother f_c9010t_perpov_bl
      &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
      &incvars &sitevars &ptsdvars &dxvars &convars;
RUN;



/*get number of missing for each variable*/
PROC MEANS DATA=mto2 NMISS ; 
 VAR &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
     &incvars &sitevars &ptsdvars /*&dxvars*/ &convars;
 ODS OUTPUT SUMMARY=a1;
RUN;
PROC TRANSPOSE DATA=a1 OUT=a2;
RUN;
DATA a3;
 SET a2;
 new_str = tranwrd(_NAME_,"_NMiss", ""); 
RUN;
/*data with list of variable names with no missings*/
DATA nomiss_o;
 SET a3 (WHERE=(col1=0));
/*data with list of variables with missings, ordered by the # of missings from small to large*/
DATA missings;
 SET a3 (WHERE=(col1>0));
RUN;


PROC SORT;
 BY col1;
RUN; 

 
/*count number of variables with missing*/ 

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

/*
DATA test; SET missings;
 CALL SYMPUT('numvars',_n_);
 CALL SYMPUT('numvarsp',_n_+1);
 n1=&numvars;
 n2=&numvarsp;
 RUN; 
*/

%LET numvars_n=%EVAL(&numvars+0);
%LET numvarsp=%EVAL(&numvars_n+1);
%LET pnum1=%EVAL(&numvarsp+0);

/*repeat loop for each variables that have missings, with the least missing first*/

DATA mtoimp1;
 SET mto2;
RUN;

%GLOBAL varlistn;

PROC PRINTTO NEW
 LOG="/home/hwang/MTO/runlog.log"
 PRINT="/home/hwang/MTO/runlst.lst";
RUN;
%variable_concatenator(missings,new_str,varlistn);
PROC PRINTTO NEW;
RUN;

%DO i=1 %TO &numvars;
  %LET varimp=%SCAN(&varlistn,&i,' '); 
  %LET pnum=%EVAL(&i+1);


PROC MEANS DATA=mtoimp&i NMISS ; 
 VAR &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
     &incvars &sitevars &ptsdvars /*&dxvars*/ &convars;
 ODS OUTPUT SUMMARY=a1;
RUN;
PROC TRANSPOSE DATA=a1 OUT=a2;
RUN;
DATA a3;
 SET a2;
 new_str = tranwrd(_NAME_,"_NMiss", ""); 
RUN;
/*data with list of variable names with no missings*/
DATA nomiss&i;
 SET a3 (WHERE=(col1=0));
RUN;

%GLOBAL varlistc;



PROC PRINTTO NEW
 LOG="/home/hwang/MTO/runlog.log"
 PRINT="/home/hwang/MTO/runlst.lst";
RUN;
%variable_concatenator(nomiss&i,new_str,varlistc);

PROC PRINTTO NEW;
RUN;
 

DATA mtoimp&i;
 SET mtoimp&i;
 &varimp._old=&varimp;
RUN;

PROC PRINTTO NEW
 LOG="/home/hwang/MTO/impoutput/implog_&grp._&i..log"
 PRINT="/home/hwang/MTO/impoutput/implst_&grp._&i..lst";
RUN;

%IF &i=1 %THEN %DO;
PROC MI DATA=mtoimp&i NIMPUTE=20 OUT=mtoimp&pnum SEED=524232;
 CLASS &varlistc &varimp;
 MONOTONE LOGISTIC (&varimp = &varlistc);
 VAR &varlistc &varimp;
RUN; 
%END;
%ELSE %DO;
 %IF &varimp=edcat %THEN %DO;
 PROC MI DATA=mtoimp&i NIMPUTE=1 OUT=mtoimp&pnum SEED=524232 ROUND=1 MINIMUM=1 MAXIMUM=3;
  CLASS &varlistc ;
  MONOTONE REGRESSION (&varimp = &varlistc);
  VAR &varlistc &varimp;
 RUN; 
 %END;
 %ELSE %IF &varimp=racecat %THEN %DO;
 PROC MI DATA=mtoimp&i NIMPUTE=1 OUT=mtoimp&pnum SEED=524232 ROUND=1 MINIMUM=1 MAXIMUM=4;
  CLASS &varlistc ;
  MONOTONE REGRESSION (&varimp = &varlistc);
  VAR &varlistc &varimp;
 RUN; 
 %END;
 %ELSE %IF &varimp=inccat %THEN %DO;
 PROC MI DATA=mtoimp&i NIMPUTE=1 OUT=mtoimp&pnum SEED=524232 ROUND=1 MINIMUM=1 MAXIMUM=5;
  CLASS &varlistc ;
  MONOTONE REGRESSION (&varimp = &varlistc);
  VAR &varlistc &varimp;
 RUN; 
 %END;
 %ELSE %DO;
 PROC MI DATA=mtoimp&i NIMPUTE=1 OUT=mtoimp&pnum SEED=524232;
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

 PROC MI DATA=mtoimp&pnum1 NIMPUTE=1 OUT=mtoimp_final SEED=524232;
  CLASS &varlistc &dxvars;
  MONOTONE LOGISTIC (&dxvars = &varlistc);
  VAR &varlistc &dxvars;
 RUN; 

 /*impute controls in prevalence tables that were not part of analysis models*/
 PROC MI DATA=mtoimp_final NIMPUTE=1 OUT=mtoimp_final1 SEED=524232;
  CLASS &varlistc &dxvars ymh_cov_ad_single_mother;
  MONOTONE LOGISTIC (ymh_cov_ad_single_mother=  &varlistc &dxvars);
  VAR &varlistc &dxvars ymh_cov_ad_single_mother;
 RUN; 
 
 PROC MI DATA=mtoimp_final1 NIMPUTE=1 OUT=mtoimp_final2 SEED=524232 MINIMUM=0 MAXIMUM=1;
  CLASS &varlistc &dxvars ymh_cov_ad_single_mother ;
  MONOTONE REGRESSION (f_c9010t_perpov_bl = &varlistc &dxvars ymh_cov_ad_single_mother);
  VAR &varlistc &dxvars ymh_cov_ad_single_mother f_c9010t_perpov_bl;
 RUN;  


PROC FREQ;
 TABLES flag_paper_ymh*(&dxvars)/LIST MISSING;
RUN;

DATA mto_&grp;
 SET mtoimp_final2;
RUN;
%MEND;

PROC PRINTTO NEW
 LOG="/home/hwang/MTO/MTO_revision_10112013/output/runimputedata.log"
 PRINT="/home/hwang/MTO/MTO_revision_10112013/output/runimputedata.lst";
RUN;
%runMI(ra_Grp_Exp);
%runMI(ra_Grp_S8);
%runMI(ra_grp_control);

PROC PRINTTO NEW;
RUN;




DATA impdata;
 SET mto_ra_Grp_Exp
     mto_ra_Grp_S8
     mto_ra_grp_control;

/*recode nested variables*/

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

RUN;
PROC SORT DATA=impdata;
 BY _imputation_ ppid;
RUN;

/*
PROC FREQ DATA=impdata;
 TABLES ad_age_le35* ad_age_le40 *ad_age_le45* ad_age_le50
        educ_miss_ref* educ_miss_ref_ged
		nonhisp_black *hisp_any *nonhisp_other *nonhisp_white
		hhsize_3plus*hhsize_4plus*hhsize_5plus 
        ymh_cov_hh_inc_le7k*ymh_cov_hh_inc_le9k*ymh_cov_hh_inc_le12k*ymh_cov_hh_inc_le17k 
      /LIST MISSING;
 WHERE flag_paper_ymh=1;
RUN;*/


%MACRO runit;

%LET adage = ad_age_le35 ad_age_le40 ad_age_le45 ad_age_le50;
%LET edvars = educ_miss_ref educ_miss_ref_ged /*added*/ x_f_ad_edinsch;
%LET demos = nonhisp_black hisp_any nonhisp_other nonhisp_white;
%LET pers =   x_f_ad_nevmarr x_f_ad_parentu18 x_f_ad_working;
%LET c2vars = x_f_c2_hosp x_f_c2_lowbw x_f_c2_read  ; /* C2VARS NEED x_f_ch_bl_age617 IN STEPWISE ! */
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
%LET dxvars= f_mh_deph_y_yt ymh_bipolar_i_ii_y f_mh_pds_y_yt f_mh_pts_y_yt f_mh_odd_y_yt f_mh_ied_y_yt cd_3x;
%LET convars= x_f_ch_male mov_drugs x_f_ch_bl_age617 large_family exclude_lrgfam hardtoreach exclude_htr ymh_cov_ad_single_mother f_c9010t_perpov_bl;

PROC MEANS DATA=impdata NMISS ; 
 VAR &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
     &incvars &sitevars &ptsdvars &dxvars &convars;
 ODS OUTPUT SUMMARY=a1;
RUN;
%MEND;
%runit;



 
DATA impdata;
 SET impdata;
 
 IF ra_Grp_Exp=1 OR ra_Grp_S8=1 THEN intervention=1; ELSE intervention=0;

 /*interaction terms*/

 int_main1=x_f_ch_male*ra_Grp_Exp;
 int_main2=x_f_ch_male*ra_Grp_S8;
 int_either=x_f_ch_male*intervention;

 /*recode number of traumatic events after imputations*/

 yt_ptsd_count=.;yt_ptsd_any=.;yt_ptsd_2plus=.;yt_ptsd_3plus=.;
 yt_ptsd_count = SUM(ycv1_pt13_new,ycv2_pt14_new,ycv3_pt15_new,ycv4_pt16_new,ycv5_pt17_new,ycv6_pt18_new,
					ycv7_pt20_new,ycv8_pt22_new,ycv9_pt22_1_new,ycv10_pt23_new,ycv11_pt27_new);

 IF yt_ptsd_count^=. THEN DO;
 IF yt_ptsd_count > 0 THEN yt_ptsd_any = 1; ELSE yt_ptsd_any = 0;
 IF yt_ptsd_count > 1 THEN yt_ptsd_2plus = 1; ELSE yt_ptsd_2plus = 0;
 IF yt_ptsd_count > 2 THEN yt_ptsd_3plus = 1; ELSE yt_ptsd_3plus = 0;
 END;
RUN; 

PROC SORT ;
 BY _imputation_ ppid;
RUN;
 

DATA newimpdata_1  ;
 MERGE impdata  
       home.newimpdata1 (KEEP=_imputation_ ppid strata secu);
 BY _imputation_ ppid;
RUN;

DATA home.impdata;
 SET newimpdata_1;
RUN;


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

PROC SORT DATA=impdata OUT=impdata1;
 BY ra_site f_svy_bl_tract_masked_id;
RUN;
DATA impdata_trauma;
 SET impdata1;
 IF yt_ptsd_count > 0;
RUN;
PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN;

%MACRO runmodels(data=,dep=,controls=,modnum=,);

PROC SURVEYLOGISTIC DATA = &data  ; 
   STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
   DOMAIN _imputation_;
   MODEL &dep (EVENT='1') = &controls / COVB; 
   WEIGHT f_wt_totcore98 ;

   %IF &modnum=1 %THEN %DO; 
   test: TEST ra_grp_exp=ra_grp_s8=0;
   %END;
   %IF &modnum=2 %THEN %DO; 
   test: TEST intervention=ra_grp_s8=0;
   %END;
   %IF &modnum=3 %THEN %DO; 
   test: TEST intervention=0;
   %END;
   %IF &modnum=4 %THEN %DO; 
   test1: TEST ra_grp_exp=ra_grp_s8=0;
   test2: TEST x_f_ch_male=0;
   %END;
   %IF &modnum=5 %THEN %DO; 
   test1: TEST intervention=ra_grp_s8=0;
   test2: TEST x_f_ch_male=0;
   %END;
   %IF &modnum=6 %THEN %DO; 
   test1: TEST intervention=0;
   test2: TEST x_f_ch_male=0;
   %END;
   %IF &modnum=7 %THEN %DO; 
   test1: TEST ra_grp_exp=ra_grp_s8=0;
   test2: TEST x_f_ch_male=0;
   test3: TEST int_main1=int_main2=0;
   %END;
   %IF &modnum=8 %THEN %DO; 
   test1: TEST intervention=ra_grp_s8=0;
   test2: TEST x_f_ch_male=0;
   test3: TEST int_either=int_main2=0;
   %END;
   %IF &modnum=9 %THEN %DO; 
   test1: TEST intervention=0;
   test2: TEST x_f_ch_male=0;
   test3: TEST int_either=0;
   %END;

   ODS OUTPUT parameterestimates=parmest  
              OddsRatios = or  
              TestStmts=tests_&dep.&modnum 
              covb=covm  ;
RUN;


DATA parmest; SET parmest (WHERE=(CMISS(domain)=0)); %codeallimp;
DATA or; SET or (WHERE=(CMISS(domain)=0)); %codeallimp;
DATA tests; SET tests (WHERE=(CMISS(domain)=0)); %codeallimp;
DATA covm; SET covm (WHERE=(CMISS(domain)=0)); %codeallimp;
RUN;



PROC MIANALYZE PARMS = parmest  XPXI=covm;
   MODELEFFECTS intercept &controls ;
   ODS OUTPUT ParameterEstimates = outres;
   ODS OUTPUT TestMultStat = outtests;

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

DATA outres1 (KEEP=parm orCI chitest or lowor upor) ;
 LENGTH orCI $20;
 LENGTH chitest $20;
 SET outres; 
 IF parm ^="intercept";
 or = EXP(estimate);
 lowor = EXP(lclmean);
 upor = EXP(uclmean);
 
 IF (lowor>1.0 and upor>1.0) OR (lowor<1.0 and upor<1.0) THEN DO;
	  orCI=compress(put(or, 8.1))||"* ("|| 
	       compress(put(lowor, 8.1))||","||
	       compress(put(upor, 8.1))||")";
      
 END;
 ELSE DO;
	  orCI=compress(put(or, 8.1))||" ("|| 
	       compress(put(lowor, 8.1))||","||
	       compress(put(upor, 8.1))||")";
 END;

 chivalue=tvalue*tvalue;

 chitest= compress(put(chivalue, 8.1))||" ("|| 
	      compress(put(probt, 8.3))||")";

 parm=UPCASE(parm);
RUN;

DATA outtests1;
 LENGTH chigrp&modnum $20; /*%IF &modnum=7 OR &modnum=8 %THEN %DO; LENGTH chigrp $20; %END;*/
 SET outtests;

 chiv=FValue*NumDF;
 chigrp&modnum= compress(put(chiv, 8.1))||" ("|| 
	            compress(put(probF, 8.3))||")";


%IF &modnum=1 %THEN %DO;
DATA col1 (KEEP=orCI1 chitest1); SET outres1 (WHERE=(parm="RA_GRP_EXP") RENAME=(orCI=orCI1 chitest=chitest1));  
DATA col2 (KEEP=orCI2 chitest2); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(orCI=orCI2 chitest=chitest2)); 
DATA model1_&dep ;
 MERGE col1 col2 outtests1 (KEEP=chigrp&modnum);
RUN;
%END;

%IF &modnum=2 %THEN %DO;
DATA col3 (KEEP=orCI3 chitest3); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(orCI=orCI3 chitest=chitest3));  
DATA col4 (KEEP=orCI4 chitest4); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(orCI=orCI4 chitest=chitest4)); 
DATA model2_&dep ;
 MERGE col3 col4 outtests1 (KEEP=chigrp&modnum);
RUN;
%END;

%IF &modnum=3 %THEN %DO;
DATA col5 (KEEP=orCI5 chitest5); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(orCI=orCI5 chitest=chitest5));   
DATA model3_&dep ;
 MERGE col5;
RUN;
%END; 

%IF &modnum=4 %THEN %DO;
DATA col__1 (KEEP=orCI1 chitest1); SET outres1 (WHERE=(parm="RA_GRP_EXP") RENAME=(orCI=orCI1 chitest=chitest1));  
DATA col__2 (KEEP=orCI2 chitest2); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(orCI=orCI2 chitest=chitest2)); 
DATA col__3 (KEEP=orCI3 chitest3); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(orCI=orCI3 chitest=chitest3));  
DATA model4_&dep ;
 MERGE col__1 col__2 col__3  outtests1 (KEEP=chigrp&modnum) ;
RUN;
%END;

%IF &modnum=5 %THEN %DO;
DATA col__4 (KEEP=orCI4 chitest4); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(orCI=orCI4 chitest=chitest4));  
DATA col__5 (KEEP=orCI5 chitest5); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(orCI=orCI5 chitest=chitest5)); 
DATA col__6 (KEEP=orCI6 chitest6); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(orCI=orCI6 chitest=chitest6));  
DATA model5_&dep ;
 MERGE col__4 col__5 col__6  outtests1 (KEEP=chigrp&modnum) ;
RUN;
%END;

%IF &modnum=6 %THEN %DO;
DATA col__7 (KEEP=orCI7 chitest7); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(orCI=orCI7 chitest=chitest7));   
DATA col__8 (KEEP=orCI8 chitest8); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(orCI=orCI8 chitest=chitest8));  
DATA model6_&dep ;
 MERGE col__7 col__8;
RUN;
%END;


%IF &modnum=7 %THEN %DO;
DATA col_1 (KEEP=orCI1 chitest1); SET outres1 (WHERE=(parm="RA_GRP_EXP") RENAME=(orCI=orCI1 chitest=chitest1));  
DATA col_2 (KEEP=orCI2 chitest2); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(orCI=orCI2 chitest=chitest2)); 
DATA col_3 (KEEP=orCI3 chitest3); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(orCI=orCI3 chitest=chitest3)); 
DATA col_4 (KEEP=orCI4 chitest4); SET outres1 (WHERE=(parm="INT_MAIN1") RENAME=(orCI=orCI4 chitest=chitest4)); 
DATA col_5 (KEEP=orCI5 chitest5); SET outres1 (WHERE=(parm="INT_MAIN2") RENAME=(orCI=orCI5 chitest=chitest5)); 
DATA outtests1_&modnum._1 (KEEP=chigrp1_&modnum); SET outtests1  (WHERE=(test="test1") RENAME=(chigrp&modnum=chigrp1_&modnum));
DATA outtests1_&modnum._2 (KEEP=chigrp2_&modnum); SET outtests1  (WHERE=(test="test2") RENAME=(chigrp&modnum=chigrp2_&modnum)); 
DATA model7_&dep ;
 MERGE col_1 col_2 col_3 col_4 col_5 outtests1_&modnum._1 outtests1_&modnum._2;
RUN;
%END;

%IF &modnum=8 %THEN %DO;
DATA col_6 (KEEP=orCI6 chitest6); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(orCI=orCI6 chitest=chitest6));  
DATA col_7 (KEEP=orCI7 chitest7); SET outres1 (WHERE=(parm="RA_GRP_S8") RENAME=(orCI=orCI7 chitest=chitest7)); 
DATA col_8 (KEEP=orCI8 chitest8); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(orCI=orCI8 chitest=chitest8)); 
DATA col_9 (KEEP=orCI9 chitest9); SET outres1 (WHERE=(parm="INT_EITHER") RENAME=(orCI=orCI9 chitest=chitest9)); 
DATA col_10 (KEEP=orCI10 chitest10); SET outres1 (WHERE=(parm="INT_MAIN2") RENAME=(orCI=orCI10 chitest=chitest10)); 
DATA outtests1_&modnum._1 (KEEP=chigrp1_&modnum); SET outtests1  (WHERE=(test="test1") RENAME=(chigrp&modnum=chigrp1_&modnum));
DATA outtests1_&modnum._2 (KEEP=chigrp2_&modnum); SET outtests1  (WHERE=(test="test2") RENAME=(chigrp&modnum=chigrp2_&modnum)); 
DATA model8_&dep ;
 MERGE col_6 col_7 col_8 col_9 col_10 outtests1_&modnum._1 outtests1_&modnum._2;
RUN;
%END;

%IF &modnum=9 %THEN %DO;
DATA col_11 (KEEP=orCI11 chitest11); SET outres1 (WHERE=(parm="INTERVENTION") RENAME=(orCI=orCI11 chitest=chitest11));   
DATA col_12 (KEEP=orCI12 chitest12); SET outres1 (WHERE=(parm="X_F_CH_MALE") RENAME=(orCI=orCI12 chitest=chitest12)); 
DATA col_13 (KEEP=orCI13 chitest13); SET outres1 (WHERE=(parm="INT_EITHER") RENAME=(orCI=orCI13 chitest=chitest13)); 
DATA model9_&dep ;
 MERGE col_11 col_12 col_13;
RUN;
%END;


%MEND; 

DATA model123;
DATA model456;
DATA model789;
RUN;


%MACRO runallmodels(data,dep);

%runmodels(data=&data,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);
%runmodels(data=&data,dep=&dep,controls=intervention ra_grp_s8,modnum=2);
%runmodels(data=&data,dep=&dep,controls=intervention,modnum=3);

DATA &dep._models123;
 MERGE model1_&dep model2_&dep model3_&dep;
RUN;

DATA model123;
 SET model123 &dep._models123;
RUN;

%runmodels(data=&data,dep=&dep,controls=ra_grp_exp ra_grp_s8 x_f_ch_male,modnum=4);
%runmodels(data=&data,dep=&dep,controls=intervention ra_grp_s8 x_f_ch_male,modnum=5);
%runmodels(data=&data,dep=&dep,controls=intervention x_f_ch_male,modnum=6);

DATA &dep._models456;
 MERGE model4_&dep model5_&dep model6_&dep;
RUN;

DATA model456;
 SET model456 &dep._models456;
RUN;

%runmodels(data=&data,dep=&dep,controls=ra_grp_exp ra_grp_s8 x_f_ch_male int_main1 int_main2,modnum=7);
%runmodels(data=&data,dep=&dep,controls=intervention ra_grp_s8 x_f_ch_male int_either int_main2,modnum=8);
%runmodels(data=&data,dep=&dep,controls=intervention x_f_ch_male int_either,modnum=9);

DATA &dep._models789;
 MERGE model7_&dep model8_&dep model9_&dep;
RUN;

DATA model789;
 SET model789 &dep._models789;
RUN;

%MEND;


%MACRO runallmodels_t(data,dep);

%runmodels(data=&data,dep=&dep,controls=ra_grp_exp ra_grp_s8 
                                        ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                        ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                        ycv11_pt27_new yt_ptsd_3plus,modnum=1);
%runmodels(data=&data,dep=&dep,controls=intervention ra_grp_s8 
                                        ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                        ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                        ycv11_pt27_new yt_ptsd_3plus,modnum=2);
%runmodels(data=&data,dep=&dep,controls=intervention 
                                        ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                        ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                        ycv11_pt27_new yt_ptsd_3plus,modnum=3);

DATA &dep._models123;
 MERGE model1_&dep model2_&dep model3_&dep;
RUN;

DATA model123;
 SET model123 &dep._models123;
RUN;

%runmodels(data=&data,dep=&dep,controls=ra_grp_exp ra_grp_s8 x_f_ch_male 
                                        ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                        ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                        ycv11_pt27_new yt_ptsd_3plus,modnum=4);
%runmodels(data=&data,dep=&dep,controls=intervention ra_grp_s8 x_f_ch_male 
                                        ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                        ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                        ycv11_pt27_new yt_ptsd_3plus,modnum=5);
%runmodels(data=&data,dep=&dep,controls=intervention x_f_ch_male 
                                        ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                        ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                        ycv11_pt27_new yt_ptsd_3plus,modnum=6);

DATA &dep._models456;
 MERGE model4_&dep model5_&dep model6_&dep;
RUN;

DATA model456;
 SET model456 &dep._models456;
RUN;

%runmodels(data=&data,dep=&dep,controls=ra_grp_exp ra_grp_s8 x_f_ch_male int_main1 int_main2 
                                        ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                        ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                        ycv11_pt27_new yt_ptsd_3plus,modnum=7);
%runmodels(data=&data,dep=&dep,controls=intervention ra_grp_s8 x_f_ch_male int_either int_main2 
                                        ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                        ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                        ycv11_pt27_new yt_ptsd_3plus,modnum=8);
%runmodels(data=&data,dep=&dep,controls=intervention x_f_ch_male int_either 
                                        ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                        ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                        ycv11_pt27_new yt_ptsd_3plus,modnum=9);

DATA &dep._models789;
 MERGE model7_&dep model8_&dep model9_&dep;
RUN;

DATA model789;
 SET model789 &dep._models789;
RUN;

%MEND;

Proc Printto New
             Log = "/home/hwang/MTO/MTO_revision_10112013/mto_revision.log"
           Print = "/home/hwang/MTO/MTO_revision_10112013/mto_revision.lst";
Run;

%runallmodels(impdata1,f_mh_deph_y_yt);
%runallmodels(impdata1,ymh_bipolar_i_ii_y);
%runallmodels(impdata1,f_mh_pds_y_yt);
%runallmodels(impdata1,f_mh_pts_y_yt);
%runallmodels(impdata1,f_mh_odd_y_yt);
%runallmodels(impdata1,f_mh_ied_y_yt);
%runallmodels(impdata1,cd_3x); 


Proc Printto New;
Run;

ODS HTML STYLE=sasweb FILE="/home/hwang/MTO/MTO_revision_10112013/mdx_models_new.html";

PROC PRINT DATA=model123;
PROC PRINT DATA=model456;
PROC PRINT DATA=model789;
RUN;

ODS HTML CLOSE;

/*
traumatic events
*/


DATA model123;
DATA model456;
DATA model789;
RUN;

Proc Printto New
             Log = "/home/hwang/MTO/MTO_revision_10112013/mto_traumamodels.log"
           Print = "/home/hwang/MTO/MTO_revision_10112013/mto_traumamodels.lst";
Run;
 

%runallmodels(impdata1,ycv1_pt13_new);
%runallmodels(impdata1,ycv2_pt14_new);
%runallmodels(impdata1,ycv3_pt15_new);
%runallmodels(impdata1,ycv4_pt16_new);
%runallmodels(impdata1,ycv5_pt17_new);
%runallmodels(impdata1,ycv6_pt18_new);
%runallmodels(impdata1,ycv7_pt20_new);
%runallmodels(impdata1,ycv8_pt22_new);
%runallmodels(impdata1,ycv9_pt22_1_new);
%runallmodels(impdata1,ycv10_pt23_new);
%runallmodels(impdata1,ycv11_pt27_new);
%runallmodels(impdata1,yt_ptsd_any);

%runallmodels(impdata_trauma,f_mh_pts_y_yt);
%runallmodels_t(impdata_trauma,f_mh_pts_y_yt);


Proc Printto New;
Run;

ODS HTML STYLE=sasweb FILE="/home/hwang/MTO/MTO_revision_10112013/trauma_models_new.html";

PROC PRINT DATA=model123;
PROC PRINT DATA=model456;
PROC PRINT DATA=model789;
RUN;

ODS HTML CLOSE;
/*
run models 1,2,3 by gender for mdx
*/


DATA impdata1_m;
 SET impdata1;
 IF x_f_ch_male=1;
RUN;
PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN;
 

DATA impdata1_f;
 SET impdata1;
 IF x_f_ch_male=0;
RUN;

PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN;
 


DATA model123_m; 
DATA model123_f; 
RUN;


%MACRO runallmodels_byg(dep);

%runmodels(data=impdata1_m,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);
%runmodels(data=impdata1_m,dep=&dep,controls=intervention ra_grp_s8,modnum=2);
%runmodels(data=impdata1_m,dep=&dep,controls=intervention,modnum=3);

DATA &dep._models123_m;
 MERGE model1_&dep model2_&dep model3_&dep;
RUN;

DATA model123_m;
 SET model123_m &dep._models123_m;
RUN;

%runmodels(data=impdata1_f,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);
%runmodels(data=impdata1_f,dep=&dep,controls=intervention ra_grp_s8,modnum=2);
%runmodels(data=impdata1_f,dep=&dep,controls=intervention,modnum=3);

DATA &dep._models123_f;
 MERGE model1_&dep model2_&dep model3_&dep;
RUN;

DATA model123_f;
 SET model123_f &dep._models123_f;
RUN;


%MEND;

Proc Printto New
             Log = "/home/hwang/MTO/MTO_revision_10112013/mto_revision_bygender.log"
           Print = "/home/hwang/MTO/MTO_revision_10112013/mto_revision_bygender.lst";
Run;

%runallmodels_byg(f_mh_deph_y_yt);
%runallmodels_byg(ymh_bipolar_i_ii_y);
%runallmodels_byg(f_mh_pds_y_yt);
%runallmodels_byg(f_mh_pts_y_yt);
%runallmodels_byg(f_mh_odd_y_yt);
%runallmodels_byg(f_mh_ied_y_yt);
%runallmodels_byg(cd_3x);

Proc Printto New;
Run; 
ODS HTML STYLE=sasweb FILE="/home/hwang/MTO/MTO_revision_10112013/mdx_models123_gender.html";

PROC PRINT DATA=model123_m;
PROC PRINT DATA=model123_f;
RUN;

ODS HTML CLOSE;

/*
trauma events by gender
*/

DATA impdata1_mtrauma;
 SET impdata1;
 IF x_f_ch_male=1 AND yt_ptsd_any>0;
RUN;
PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN;
 

DATA impdata1_ftrauma;
 SET impdata1;
 IF x_f_ch_male=0 AND yt_ptsd_any>0;
RUN;
PROC SORT ;
 BY ra_site f_svy_bl_tract_masked_id;
RUN;


DATA model123_m; 
DATA model123_f; 
RUN;

DATA model123_m; 
DATA model123_f; 
RUN;
/*
use versions of the MACRO:
-using the full datasets split up by gender (use %runallmodels_byg)
-using the trauma subset data split up by gender (use %runallmodels_byg2) 
-using the trauma subset data split up by gender and controlling for trauma events (use %runallmodels_byg3) 
*/

%MACRO runallmodels_byg2(dep);

%runmodels(data=impdata1_mtrauma,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);
%runmodels(data=impdata1_mtrauma,dep=&dep,controls=intervention ra_grp_s8,modnum=2);
%runmodels(data=impdata1_mtrauma,dep=&dep,controls=intervention,modnum=3);

DATA &dep._models123_m;
 MERGE model1_&dep model2_&dep model3_&dep;
RUN;

DATA model123_m;
 SET model123_m &dep._models123_m;
RUN;

%runmodels(data=impdata1_ftrauma,dep=&dep,controls=ra_grp_exp ra_grp_s8,modnum=1);
%runmodels(data=impdata1_ftrauma,dep=&dep,controls=intervention ra_grp_s8,modnum=2);
%runmodels(data=impdata1_ftrauma,dep=&dep,controls=intervention,modnum=3);

DATA &dep._models123_f;
 MERGE model1_&dep model2_&dep model3_&dep;
RUN;

DATA model123_f;
 SET model123_f &dep._models123_f;
RUN;


%MEND;

%MACRO runallmodels_byg3(dep);

%runmodels(data=impdata1_mtrauma,dep=&dep,controls=ra_grp_exp ra_grp_s8
                                                   ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                                   ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                                   ycv11_pt27_new yt_ptsd_3plus,modnum=1);
%runmodels(data=impdata1_mtrauma,dep=&dep,controls=intervention ra_grp_s8
                                                   ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                                   ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                                   ycv11_pt27_new yt_ptsd_3plus,modnum=2);
%runmodels(data=impdata1_mtrauma,dep=&dep,controls=intervention
                                                   ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                                   ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                                   ycv11_pt27_new yt_ptsd_3plus,modnum=3);

DATA &dep._models123_m;
 MERGE model1_&dep model2_&dep model3_&dep;
RUN;

DATA model123_m;
 SET model123_m &dep._models123_m;
RUN;

%runmodels(data=impdata1_ftrauma,dep=&dep,controls=ra_grp_exp ra_grp_s8
                                                   ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                                   ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                                   ycv11_pt27_new yt_ptsd_3plus,modnum=1);
%runmodels(data=impdata1_ftrauma,dep=&dep,controls=intervention ra_grp_s8
                                                   ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                                   ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                                   ycv11_pt27_new yt_ptsd_3plus,modnum=2);
%runmodels(data=impdata1_ftrauma,dep=&dep,controls=intervention
                                                   ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new
                                                   ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new 
                                                   ycv11_pt27_new yt_ptsd_3plus,modnum=3);

DATA &dep._models123_f;
 MERGE model1_&dep model2_&dep model3_&dep;
RUN;

DATA model123_f;
 SET model123_f &dep._models123_f;
RUN;


%MEND;


Proc Printto New
             Log = "/home/hwang/MTO/MTO_revision_10112013/mto_traumamodels_gender.log"
           Print = "/home/hwang/MTO/MTO_revision_10112013/mto_traumamodels_gender.lst";
Run;
 

%runallmodels_byg(ycv1_pt13_new);
%runallmodels_byg(ycv2_pt14_new);
%runallmodels_byg(ycv3_pt15_new);
%runallmodels_byg(ycv4_pt16_new);
%runallmodels_byg(ycv5_pt17_new);
%runallmodels_byg(ycv6_pt18_new);
%runallmodels_byg(ycv7_pt20_new);
%runallmodels_byg(ycv8_pt22_new);
%runallmodels_byg(ycv9_pt22_1_new);
%runallmodels_byg(ycv10_pt23_new);
%runallmodels_byg(ycv11_pt27_new);
%runallmodels_byg(yt_ptsd_any);

%runallmodels_byg2(f_mh_pts_y_yt);
%runallmodels_byg3(f_mh_pts_y_yt);


Proc Printto New;
Run;


ODS HTML STYLE=sasweb FILE="/home/hwang/MTO/MTO_revision_10112013/trauma_models123_gender.html";

PROC PRINT DATA=model123_m;
PROC PRINT DATA=model123_f;
RUN;

ODS HTML CLOSE;
