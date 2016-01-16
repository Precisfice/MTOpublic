************************************************************************
* PROGRAM: Ptsd-mtoncsr-youth-060510.sas                               *
* DATE: 6/5/10                                                         *
*                                                                      *
* MTO Youth                                                            *
* Calculate MTO Youth PTSD diagnosis using NCSR and MTO data           *
************************************************************************;
/*rsubmit;*/
/*options ps = 65 nocenter mprint macrogen;*/

/*Updating file location*/
%LET folder =E:\NSCR_Replication_study;
libname mto "&folder";


/*libname mto '/data/kessler/mto/youth/data';*/
/*libname LIBRARY '/data/kessler/mto/youth/data';*/

%macro a;

/*proc sort data = mto.mental_health_yt_20101004 out = mental_health_yt_20101004;*/
proc sort data = mto.mental_health_yt_20150612 out = mental_health_yt_20101004;

by ppid;
run;

data mental_health_yt_20101004;
set mental_health_yt_20101004;
format _numeric_;
%include "&folder\Datafix2-mto-youth.sas";
%include "&folder\agefix-youth.sas";
run;

%macro mtoptsd(datain, pfx, dataout);

   /* MTO Adult questionnaire PTSD data */
   data &dataout;
   set &datain;

   /* Criteria A1 */
   if &pfx.CV1_PT13 = 1 or &pfx.CV2_PT14 = 1 or &pfx.CV3_PT15 = 1 or &pfx.CV4_PT16 = 1 or &pfx.CV5_PT17 = 1 or
      &pfx.CV6_PT18 = 1 or &pfx.CV7_PT20 = 1 or &pfx.CV8_PT22 = 1 or &pfx.CV9_PT22_1 = 1 or &pfx.CV10_PT23 = 1 or
      &pfx.CV11_PT27 = 1 then f_mh_pts_a1 = 1;
   else f_mh_pts_a1 = 0;

   /* Criteria C1 */
   if sum(&pfx.CV21_PT275 = 1 or &pfx.CV30_PT275 = 1, &pfx.CV15_PT269 = 1 or &pfx.CV24_PT269 = 1,
          &pfx.CV16_PT270 = 1 or &pfx.CV25_PT270 = 1, &pfx.CV17_PT271 = 1 or &pfx.CV26_PT271 = 1, 
          &pfx.CV18_PT272 = 1 or &pfx.CV27_PT272 = 1) >= 3 then f_mh_pts_c1 = 1;              /* Yes */
   else f_mh_pts_c1 = 0;

   /* Criteria D1 */
   if (&pfx.CV19_PT273 = 1 or &pfx.CV28_PT273 = 1) and (&pfx.CV20_PT274 = 1 or &pfx.CV29_PT274 = 1)
       then f_mh_pts_d1 = 1;  /* Yes */
   else f_mh_pts_d1 = 0;

   if f_mh_pts_a1 = 1 and f_mh_pts_c1 = 1 and f_mh_pts_d1 = 1 then mto_ptsd_sample = 1;
   else mto_ptsd_sample = 0;

   array PTVAR &pfx.CV1_PT13 &pfx.CV2_PT14 &pfx.CV3_PT15 &pfx.CV4_PT16 &pfx.CV5_PT17
               &pfx.CV6_PT18 &pfx.CV7_PT20 &pfx.CV8_PT22 &pfx.CV9_PT22_1 &pfx.CV10_PT23
               &pfx.CV11_PT27 &pfx.CV13_PT62 &pfx.CV15_PT269 &pfx.CV16_PT270 &pfx.CV17_PT271
               &pfx.CV18_PT272 &pfx.CV19_PT273 &pfx.CV20_PT274 &pfx.CV21_PT275
               &pfx.CV24_PT269 &pfx.CV25_PT270 &pfx.CV26_PT271 &pfx.CV27_PT272 &pfx.CV28_PT273 
               &pfx.CV29_PT274 &pfx.CV30_PT275;
   do over PTVAR;
      if PTVAR ^= 1 then PTVAR = 0;
   end; 

   /* Gender */
   if f_svy_gender = 'F' then sexf = 1;
   else sexf = 0;

   /* Race */
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

   in_mto = 1;

   if 0 <= f_svy_age_iw <= 18 then age = 18;
   else age = f_svy_age_iw;

   /* Create corresponding NCSR variables */
   if &pfx.CV15_PT269 = 1 or &pfx.CV24_PT269 = 1 then PT211 = 1;
   else PT211 = 0;

   if &pfx.CV16_PT270 = 1 or &pfx.CV25_PT270 = 1 then PT212 = 1;
   else PT212 = 0;

   if &pfx.CV17_PT271 = 1 or &pfx.CV26_PT271 = 1 then PT213 = 1;
   else PT213 = 0;

   if &pfx.CV18_PT272 = 1 or &pfx.CV27_PT272 = 1 then PT214 = 1;
   else PT214 = 0;

   if &pfx.CV19_PT273 = 1 or &pfx.CV28_PT273 = 1 then PT233 = 1;
   else PT233 = 0;

   if &pfx.CV20_PT274 = 1 or &pfx.CV29_PT274 = 1 then PT237 = 1;
   else PT237 = 0;

   if &pfx.CV21_PT275 = 1 or &pfx.CV30_PT275 = 1 then PT209 = 1;
   else PT209 = 0;

   format _numeric_;
   rename &pfx.CV1_PT13 = PT41
          &pfx.CV2_PT14 = PT42
          &pfx.CV3_PT15 = PT43
          &pfx.CV4_PT16 = PT44
          &pfx.CV5_PT17 = PT45
          &pfx.CV6_PT18 = PT46
          &pfx.CV7_PT20 = PT48
          &pfx.CV8_PT22 = PT50
          &pfx.CV9_PT22_1 = PT50_1
          &pfx.CV10_PT23 = PT51
          &pfx.CV11_PT27 = PT55;
   run;

%mend mtoptsd;

%mtoptsd(mental_health_yt_20101004,Y, mental_health_yt);

/*
data coef;
       infile "&folder/PTSD_slopes_from_NCSR.csv" delimiter = ',' MISSOVER DSD  lrecl=32767 firstobs=2 ;
          informat Independent_variable $9. ;
          informat Beta best32. ;
          informat Label $64. ;
          format Independent_variable $9. ;
          format Beta best12. ;
          format Label $64. ;
       input
                   Independent_variable $
                   Beta
                   Label $
       ;
       if _ERROR_ then call symputx('_EFIERR_',1);  * set ERROR detection macro variable ;
run;

proc print data = coef;
run;

data formula;
set coef (where = (beta ne 0)) end = done;
if independent_variable = 'INTERCEPT' then independent_variable = '1';
newvar = trim(independent_variable);
newcoef = trim(left(beta));
length all $1000;
retain all;
if not done then all = trim(all)||trim(newvar)||'*'||'('||trim(newcoef)||')'||'+';
if done then do;
   all = trim(all)||trim(newvar)||'*'||'('||trim(newcoef)||')';
   call symput('formula',all);
end;
run;
%put &formula;
*/
data pred_ptsd_youth;
set mental_health_yt;
pred_prob = exp(&formula)/(1+exp(&formula));

run;

****
* TODO 1: Add 'ptsd_random' and 'pred_prob' vars to the 'keep' list below
****;
data fnlpred_ptsd_youth(keep = ppid f_mh_pts_evr_yt f_mh_pts_aoo_yt f_mh_pts_rec_yt f_wt_totsvy);
set pred_ptsd_youth;
/* Calculate lifetime PTSD by comparing random # to predicted probability */
ptsd_random = ranuni(1234567);
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
end;

run;

proc freq data = fnlpred_ptsd_youth;
weight f_wt_totsvy;
title 'Youth PTSD, new diagnosis lifetime, weighted';
tables f_mh_pts_evr_yt  / list missing;
run;

proc freq data = fnlpred_ptsd_youth;
title 'Youth PTSD, new diagnosis lifetime, unweighted';
tables f_mh_pts_evr_yt  / list missing;
run;

/****
* TODO 2: Uncomment the code below, and debug as necessary
****/
  /*
  data fnlpred_ptsd_youth(keep = ppid mto_ptsd_sample pred_prob ptsd_random f_mh_pts_evr_yt );
    set inputfor2x2;
  run;
  
  proc export data=inputfor2x2
    outfile='&folder\whereoutputgoes\inputfor2x2.txt'
    dbms=tab;
  run;

  */
  
/****
* TODO 3: Inspect the txt file to ensure it poses no danger of subject identification,
*         and check it in.
****/

%mend a;

%a;
/*endrsubmit;*/






