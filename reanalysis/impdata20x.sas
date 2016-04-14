/* Perform the 20x multiple imputation of missing covariates
 ************************************************************/
PROC PRINTTO;
RUN;

%include "&reanalysis/mtoptsd_macro.sas";
%let preimp = NBER.Mto_jama_preimp_fixed;
%mtoptsd(&preimp,Y,preimp_xwalk ); * Crosswalk MTO-->NCSR PTSD varnames ;

data vars (keep = ppid ptsd_random f_svy_race f_svy_ethnic f_svy_gender);
  set NCSR.Mental_health_yt_20150612;
  format _Numeric_;
  ptsd_random=ranuni(1234567);
run;

proc sort data = vars;
by PPID; run;
proc sort data = preimp_xwalk;
by PPID; run;

data preimp_xwalk2;
  format _numeric_;
  merge preimp_xwalk (in=jama) vars;
  by PPID;
  if jama;
run;

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

data fnlpred_ptsd_youth;
set pred_ptsd_youth;
/* Calculate lifetime PTSD by comparing random # to predicted probability */
if mto_ptsd_sample = 1 then do;
  if 0 < ptsd_random <= pred_prob then f_mh_pts_evr_yt = 1;
  else f_mh_pts_evr_yt = 0;
end;

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
* ... but in order to reproduce the original input, we must ;
* avoid coding the f_mh_pts_y_yt for the uninterviewed -DCN ;
if f_svy_age_iw IN(.D,.R,.)
then f_mh_pts_y_yt = .;

/* Invoke a slightly modified version of Matt Sciandra's imputation code
 * in which the MI seed has been parametrized for sensitivity analysis.
 */

/* TODO: Pass in NBER.Mto_jama_preimp_fixed as 'preimp',
 *       only with the f_mh_pts_y_yt outcome taken from
 *       fnlpred_ptsd_youth. 
 */

data imod_derived_ptsd_outcome;
  merge NBER.Mto_jama_preimp_fixed (in=L)
        fnlpred_ptsd_youth(keep=ppid f_mh_pts_y_yt f_mh_pts_y_yt_orig);
  by ppid;
  if L;
run;
%let preimp = imod_derived_ptsd_outcome;
*%let preimp = NBER.Mto_jama_preimp_20160111;
*%let preimp = NBER.Mto_jama_preimp_fixed;
%let imputed = MTO.cached_&imod._&mi_seed._imputed; * Cache MI work by (imod,mi_seed) ;
%include "&folder/mto_jama_sas_code_20160114/1_mto_jama_impute_data_20160111.sas";

dm 'clear log'; * Otherwise, log may fill up, and user is prompted to empty it ;

%let dep = f_mh_pts_y_yt;
%let controls = ra_grp_exp ra_grp_s8;

PROC SURVEYLOGISTIC DATA = &imputed(WHERE=(x_f_ch_male=1)); 
     STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
     DOMAIN _imputation_;
     MODEL &dep (EVENT='1') = &controls / COVB; 
     WEIGHT f_wt_totcore98 ;
     OUTPUT OUT=preddata PREDICTED=pp;
     ODS OUTPUT parameterestimates=parmest  
                OddsRatios = or   
                covb=covm  ;
RUN;

%MACRO codeimp(num);
   IF domain="Imputation Number=&num" THEN _imputation_=&num;
 %MEND;

 %MACRO codeallimp;
  %codeimp(1); %codeimp(2); %codeimp(3); %codeimp(4); %codeimp(5);
  %codeimp(6); %codeimp(7); %codeimp(8); %codeimp(9); %codeimp(10);
  %codeimp(11); %codeimp(12); %codeimp(13); %codeimp(14); %codeimp(15);
  %codeimp(16); %codeimp(17); %codeimp(18); %codeimp(19); %codeimp(20);
 %MEND;

DATA parmest; SET parmest (WHERE=(CMISS(domain)=0)); %codeallimp;
DATA or; SET or (WHERE=(CMISS(domain)=0)); %codeallimp; 
DATA covm; SET covm (WHERE=(CMISS(domain)=0)); %codeallimp;
RUN;

PROC MIANALYZE PARMS = parmest  XPXI=covm;
     MODELEFFECTS intercept &controls ;
     ODS OUTPUT ParameterEstimates = outres;
RUN;

DATA MTO.orci_&imod._&mi_seed (KEEP=parm or lowor upor imod seed) ; 
  SET outres; 
  IF parm ^="intercept";
  or = EXP(estimate);
  lowor = EXP(lclmean);
  upor = EXP(uclmean);
  parm=UPCASE(parm);
  imod="&imod";
  seed=&mi_seed;
RUN;

%PUT &imod;
