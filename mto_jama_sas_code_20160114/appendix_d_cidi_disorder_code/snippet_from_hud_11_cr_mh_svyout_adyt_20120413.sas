* snippet_from_hud_11_cr_mh_svyout_adyt_20140413.sas *;
* This snippet shows how the MTO mental health subprograms fed into the main youth data recodes.*;
* Original program was last modified on April 13, 2014. *;

**************************************************************************************;
* INCOMPLETE PORTION OF CODE *;
**************************************************************************************;
;

/* 
This SAS snippet contains the code that was used to create the MTO youth mental health outcomes.  This program 
uses %include to pull in specific pieces of SAS code for creating the outcomes.  
*/
;

* DIRECTORY SHORTCUTS & DATE REFERENCES;
%let pgmdate = 20120413;

* [OMITTED PORTIONS];

%let pgmdir = ~/mtoproj/m10_pgm/svy_analysis/hud_deliv/;
%let diagyt = &pgmdir.mh_diagnostic/youth/;

* INPUT DATASET SHORTCUTS;
%let ytraw = clean.mto_fnl_raw_data_yt_&pgmdate.; * Youth cleaned-up raw data file;
%let wgts = wgtcov.mto_fnl_wgts_&pgmdate.; * Weights file;

%let mhoutyt = outcomes.mh_svyout_yt_&pgmdate;  * New youth outcomes;

* MACROS;
* create PTSD outcomes based on code in the "Ptsd-mtoncsr-ad.sas" program
	- not including the DATA, SET, and KEEP statement due to structual differences between NBER & HMS programs
	- adding in code using slopes from Excel spreadsheet from HMS for predicting probability of PTSD;

%macro ptsd(pfx);
	* Criteria A1;
	if &pfx.CV1_PT13=1 or &pfx.CV2_PT14=1 or &pfx.CV3_PT15=1 or &pfx.CV4_PT16=1 or &pfx.CV5_PT17=1 or
		&pfx.CV6_PT18=1 or &pfx.CV7_PT20=1 or &pfx.CV8_PT22=1 or &pfx.CV9_PT22_1=1 or &pfx.CV10_PT23=1 or
		&pfx.CV11_PT27=1 then f_mh_pts_a1=1;
			else f_mh_pts_a1=0;

	* Criteria C1;
	if sum(&pfx.CV21_PT275=1 or &pfx.CV30_PT275=1, &pfx.CV15_PT269=1 or &pfx.CV24_PT269=1,
		&pfx.CV16_PT270=1 or &pfx.CV25_PT270=1, &pfx.CV17_PT271=1 or &pfx.CV26_PT271=1, 
		&pfx.CV18_PT272=1 or &pfx.CV27_PT272=1) >= 3 then f_mh_pts_c1=1;              /* Yes */
			else f_mh_pts_c1=0;

	* Criteria D1;
	if (&pfx.CV19_PT273=1 or &pfx.CV28_PT273=1) and (&pfx.CV20_PT274=1 or &pfx.CV29_PT274=1)
		then f_mh_pts_d1=1;  
			else f_mh_pts_d1=0;

	if f_mh_pts_a1=1 and f_mh_pts_c1=1 and f_mh_pts_d1=1 then mto_ptsd_sample=1;
		else mto_ptsd_sample=0;

	array PTVAR &pfx.CV1_PT13 &pfx.CV2_PT14 &pfx.CV3_PT15 &pfx.CV4_PT16 &pfx.CV5_PT17
				&pfx.CV6_PT18 &pfx.CV7_PT20 &pfx.CV8_PT22 &pfx.CV9_PT22_1 &pfx.CV10_PT23
				&pfx.CV11_PT27 &pfx.CV13_PT62 &pfx.CV15_PT269 &pfx.CV16_PT270 &pfx.CV17_PT271
				&pfx.CV18_PT272 &pfx.CV19_PT273 &pfx.CV20_PT274 &pfx.CV21_PT275
				&pfx.CV24_PT269 &pfx.CV25_PT270 &pfx.CV26_PT271 &pfx.CV27_PT272 &pfx.CV28_PT273 
				&pfx.CV29_PT274 &pfx.CV30_PT275;
	do over PTVAR;
		if PTVAR~=1 then PTVAR=0;
	end; 

	* Gender;
	if f_svy_gender='F' then sexf=1;
		else sexf=0;

	* Race;
	rhisp=0;
	rwh=0;
	rblk=0;
	roth=0;
	if f_svy_ethnic=1 then rhisp=1;
		else do;
			if f_svy_race=1 then rblk=1;
				else if f_svy_race=2 then rwh=1;
				else if f_svy_race in(3,4,5) then roth=1;
		end;

	*in_mto=1; * commented out in NBER version;

	if 0<=f_svy_age_iw<=18 then age=18;
		else age=f_svy_age_iw;

	* Create corresponding NCSR variables;
	if &pfx.CV15_PT269=1 or &pfx.CV24_PT269=1 then PT211=1;
		else PT211=0;
	if &pfx.CV16_PT270=1 or &pfx.CV25_PT270=1 then PT212=1;
		else PT212=0;
	if &pfx.CV17_PT271=1 or &pfx.CV26_PT271=1 then PT213=1;
		else PT213=0;
	if &pfx.CV18_PT272=1 or &pfx.CV27_PT272=1 then PT214=1;
		else PT214=0;
	if &pfx.CV19_PT273=1 or &pfx.CV28_PT273=1 then PT233=1;
		else PT233=0;
	if &pfx.CV20_PT274=1 or &pfx.CV29_PT274=1 then PT237=1;
		else PT237=0;
	if &pfx.CV21_PT275=1 or &pfx.CV30_PT275=1 then PT209=1;
		else PT209=0;

	format _numeric_;
	* note: the HMS version uses a RENAME instead of creating new variables, but doing so here means using
			the ISR variable names in the prediction calculation, so creating new variables instead;
	array old {*} &pfx.CV1_PT13 &pfx.CV2_PT14 &pfx.CV3_PT15 &pfx.CV4_PT16 &pfx.CV5_PT17 &pfx.CV6_PT18
				  &pfx.CV7_PT20 &pfx.CV8_PT22 &pfx.CV9_PT22_1 &pfx.CV10_PT23 &pfx.CV11_PT27;
	array new {*} PT41 PT42 PT43 PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55;
	do i = 1 to dim(old);
		new{i}=old{i};
	end;
%mend ptsd;


* PROGRAM CODE;
* read in formats;
%include "&pgmdir.formats/sas_adytobs_fmts_20120406.sas";
%include "&pgmdir.formats/sas_wgt_formats.sas";


* [ADULT SECTIONS OMITTED.];

*************************************************************************************;
*************************************************************************************;
*************************************** YOUTH ***************************************;
*************************************************************************************;
*************************************************************************************;

** Prep Youth data;

*** Final Youth Data;
data ytraw;
	set &ytraw (keep = ppid YNB1 YK6: YSC: YDE: YMA: YGA: YPD: YIE: YOD: YCV:);
run; *N=5101;

proc sort data=ytraw; 
	by ppid; 
run;

data youth_dia1;
	merge ytraw (in=inraw) wgts (in=inwgt);
	by ppid;
	if f_svy_iwcompl_yt=1; * keep only interviewed youth;
	z_inraw=inraw;
	z_inwgt=inwgt;

	***********************;
	**** NBER OUTCOMES ****;
	***********************;
	label f_mh_calm_yt = "f_mh_calm_yt - Youth was calm and peaceful most or all of the time during the past 30 days (YK67)";
	if YK67 in(1,2) then f_mh_calm_yt=1;
		else if YK67 in(3,4,5) then f_mh_calm_yt=0;
		else if missing(YK67) then f_mh_calm_yt=YK67;

	*********************;
	**** HMS RECODES ****;
	*********************;

	******************;
	** K6/BRIEF SDQ **;
	******************;

	** Brief SDQ (flip 1s & 2s from raw data) **;
	if YK68=1 then brief_YK68=2; 
		else if YK68=2 then brief_YK68=1; 
		else brief_YK68=0;
	if YK612=1 then brief_YK612=2; 
		else if YK612=2 then brief_YK612=1; 
		else brief_YK612=0;
	if YK69 in(1,2,3) then brief_YK69=YK69-1; 
		else brief_YK69=0;
	if YK611 in(1,2,3) then brief_YK611=YK611-1; 
		else brief_YK611=0;
	if YK610 in(1,2,3) then brief_YK610=YK610-1; 
		else brief_YK610=0;
	* note: HMS program creates temp versions of the raw score & cutoff, then creates outcomes. Skipping middle part here;
	f_mh_sdq_raw_yt=sum(brief_YK68,brief_YK612,brief_YK69,brief_YK611,brief_YK610);
	if f_mh_sdq_raw_yt>=6 then f_mh_sdq_ser_yt=1; 
		else if 0<=f_mh_sdq_raw_yt<6 then f_mh_sdq_ser_yt=0; * HMS version sets all non-1s to 0;

	* Set all missing, do not know, refuse, to none *;
		* note: we looked into whether to code missing as missing (not as none), but only ~1% of Rs are 
				missing on any of the 6 items (and almost all who are missing any are missing only 1 of 6);
	array k6_raw  {*} yk61-yk66;
	array k6_tmp  {*} tmp_yk61-tmp_yk66;
	array k6_flip {*} flip_yk61-flip_yk66;
	do i = 1 to dim(k6_raw);
		if k6_raw{i} in(1,2,3,4,5) then k6_tmp{i}=k6_raw{i};
			else k6_tmp{i}=5;
		k6_flip{i}=5-k6_tmp{i};
	end;

	f_mh_k6_raw_yt=sum(of flip_yk62,flip_yk64,flip_yk63,flip_yk61,flip_yk65,flip_yk66);
	if f_mh_k6_raw_yt>=13 then f_mh_k6_ser_yt=1; * _yt missing in other program;
		else if 0<=f_mh_k6_raw_yt<13 then f_mh_k6_ser_yt=0; * =5 in other program & sets all non-1s to 5;

	***************;
	** DISORDERS **;
	***************;
	* Run %INCLUDE statements to create diagnoses for all disorders;
	%include "&diagyt.Datafix2-mto-youth.sas";
	%include "&diagyt.agefix-youth.sas";
	%ptsd(Y);
	* use slopes from HMS' PTSD prediction from NSCR data to create predicted probability of PTSD
		- see "PTSD_slopes_from_NCSR.xls" in "diagnostic" subfolder of main mental health program directory;
	expected = 1/(1+exp(-1*(-1.515 	
		+  0.0263*AGE 	+ 0.1105*SEXF  + -0.0819*RHISP  + -0.5597*RBLK    + -0.9751*ROTH
 		+ -0.5603*PT41	+ 0.0504*PT42  + -0.3877*PT43   +  0.1148*PT44    + -0.1614*PT45
 		+  0.5993*PT46	+ 0.078*PT48   +  0.4687*PT50   +  0.4591*PT50_1  +  0.1683*PT51
 		+ -0.2237*PT55	+ 0.3664*PT209 + -0.0581*PT211  +  0.2516*PT212   +  0.1159*PT213
 		+  0.64*PT214 	+ 0.8654*PT233 +  0.1323*PT237)));
	ptsd_random=ranuni(1234567);
	if mto_ptsd_sample=1 and 0<ptsd_random<=expected then f_mh_pts_evr_yt=1;
		else f_mh_pts_evr_yt=0;

	* Calculate Recency of PTSD for DSM ;
	if YCV14b_PT64a <= f_svy_age_iw then pts_ons = YCV14b_PT64a;
		else pts_ons = YCV14c;

	if pts_ons in(.D,.R) then pts_ons=.;
	if pts_ons>f_svy_age_iw then pts_ons=.;
	if 0<=pts_ons<4 then pts_ons=4;

	if YCV22_PT261=1 or pts_ons=f_svy_age_iw then pts_rec=f_svy_age_iw;
	if pts_rec in(.D,.R) then pts_rec=.;
	if 0<=pts_rec<4 then pts_rec=4;

	if f_mh_pts_evr_yt=1 then do;
	    f_mh_pts_aoo_yt=pts_ons;            
	    f_mh_pts_rec_yt=pts_rec;            
	end;
	%include "&diagyt.Screen-mto-youth.sas";
	%include "&diagyt.Depression-mto-youth.sas";
	%include "&diagyt.Mania-mto-youth.sas";
	%include "&diagyt.Hypomania-mto-youth.sas";
	%include "&diagyt.Bipolar-mto-youth.sas";
	%include "&diagyt.Mjdepdis-mto-youth.sas";
	%include "&diagyt.Pattack-mto-youth.sas";
	%include "&diagyt.Pdis-mto-youth.sas";
	%include "&diagyt.GAD-mto-youth.sas";
	%include "&diagyt.IED-mto-youth.sas";
	%include "&diagyt.ODD-mto-youth.sas";
	%include "&diagyt.12month-mto-youth.sas";
run;


