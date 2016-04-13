/* Perform the 20x multiple imputation of missing covariates
 ************************************************************/
PROC PRINTTO;
RUN;

%let preimp = NBER.Mto_jama_preimp_fixed;
%mtoptsd(&preimp,Y,preimp_xwalk ); * Crosswalk MTO-->NCSR PTSD varnames ;

%PUT Formula: &formula;

data vars;
set NCSR.Mental_health_yt_20150612;
format _Numeric_;
ptsd_random=ranuni(1234567);
keep PPID ptsd_random
f_svy_ethnic
f_svy_race;
run;

proc sort data = vars;
by PPID; run;
proc sort data = preimp_xwalk;
by PPID; run;

data preimp_xwalk2;
format _numeric_;
merge preimp_xwalk (in=jama)  vars;
by PPID; if jama; run;

data pred_ptsd_youth;
set preimp_xwalk2;
f_mh_pts_y_yt_orig=f_mh_pts_y_yt;
Age = f_svy_age_iw;
SEXF = 1-x_f_ch_male;
   rhisp = 0;
   rwh = 0;
   rblk = 0;
   roth = 0;
   if f_svy_ethnic = 1 then rhisp = 1;
   else do;
      if f_svy_race = 1 then rblk = 1;
      else if f_svy_race = 2 then rwh = 1;
      else if f_svy_race IN(3,4,5) then roth = 1;
   end;
pred_prob = exp(&formula)/(1+exp(&formula));
run;

/* Impute lifetime PTSD, then calculate 'recency' to assign 12-month diagnosis
 ******************************************************************************/


/* The code in this section was copied from the end of Ptsd_MTO_youth.sas,
 * with modifications as noted (+++) to support additional analyses.
 */

data fnlpred_ptsd_youth; *(keep = ppid f_mh_pts_evr_yt f_mh_pts_aoo_yt f_mh_pts_rec_yt f_wt_totsvy
    ptsd_random pred_prob); * (+++) last 2 vars added ;
set pred_ptsd_youth;
/* Calculate lifetime PTSD by comparing random # to predicted probability */
*ptsd_random = ranuni(1234567);
if mto_ptsd_sample = 1 and 0 < ptsd_random <= pred_prob then f_mh_pts_evr_yt = 1;
else f_mh_pts_evr_yt = 0;

******************************************************************************************
* Calculate Recency of PTSD for DSM                                                      *
******************************************************************************************;

if YCV14b_PT64a <= f_svy_age_iw then pts_ons = YCV14b_PT64a;
else pts_ons = YCV14c;

if pts_ons IN(.D, .R) then pts_ons = .;
if pts_ons > f_svy_age_iw then pts_ons = .;

if YCV22_PT261 = 1 or pts_ons = f_svy_age_iw then pts_rec = f_svy_age_iw;

if pts_rec IN(.D, .R) then pts_rec = .;

if 0 <= pts_ons < 4 then pts_ons = 4;
if 0 <= pts_rec < 4 then pts_rec = 4;

if f_mh_pts_evr_yt = 1 then do;
    f_mh_pts_aoo_yt = pts_ons;            
    f_mh_pts_rec_yt = pts_rec;

/* 12 month PTSD MTO Youth */
/* Cases where HCV14b_PT64a or HCV14c = interview age or HCV22_PT261 is Yes */

if f_mh_pts_evr_yt = 1 and
   (
      (f_svy_age_iw NOT IN(.D,.R,.) and
          (YCV14b_PT64a = f_svy_age_iw or YCV14c = f_svy_age_iw)
      ) or
      YCV22_PT261 = 1 
   ) then f_mh_pts_y_yt = 1;
else f_mh_pts_y_yt = 0;
end;

* The following lines taken from NBER 'Appendix-D' 12month-mto-youth.sas ;
/* 12 month PTSD MTO Youth */
/* Cases where HCV14b_PT64a or HCV14c = interview age or HCV22_PT261 is Yes */

if f_mh_pts_evr_yt = 1 and
   (
      (f_svy_age_iw NOT IN(.D,.R,.) and
          (YCV14b_PT64a = f_svy_age_iw or YCV14c = f_svy_age_iw)
      ) or
      YCV22_PT261 = 1 
   ) then f_mh_pts_y_yt = 1;
else f_mh_pts_y_yt = 0;
run;


/* Invoke a slightly modified version of Matt Sciandra's imputation code
 * in which the MI seed has been parametrized for sensitivity analysis.
 */
%LET imputed = MTO.cached_&imod._&mi_seed._imputed; * Cache MI work by (imod,mi_seed) ;
%put Imputed dataset: &imputed;
%include "&folder/mto_jama_sas_code_20160114/1_mto_jama_impute_data_20160111.sas";
*dm 'clear log'; 
* Otherwise, log may fill up, and user is prompted to empty it ;

