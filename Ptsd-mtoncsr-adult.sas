************************************************************************
* PROGRAM: Ptsd-mtoncsr-adult-061510.sas                               *
* DATE: 6/15/10                                                        *
*                                                                      *
* MTO Adult                                                            *
* Calculate MTO Adult PTSD diagnosis using NCSR and MTO data           *
************************************************************************;
options ps = 65 nocenter mprint macrogen;

libname ncsr '/data/kessler/ncsr/data';
libname mto '/home/sampson/MTO100410/adult';
libname LIBRARY '/home/sampson/MTO100410/adult';
libname mtomp '/home/petukhov/MTO/data';

%macro a;

/* NCSR Main questionnaire PTSD data */
data ncsr_main;
set ncsr.ncsr_main(keep = sampleid SC1 PT:);
format _numeric_;
run;

proc sort data = ncsr_main; by sampleid; run;

/* NCSR demographics data */
data ncsr_dem;
set ncsr.ncsr_dem(keep = sampleid age str15 secu sexf rhisp rblk rwh roth finalp2wt);
if finalp2wt ^= .;
format _numeric_;
run;

proc sort data = ncsr_dem; by sampleid; run;

/* Combine NCSR data */
data ncsr;
merge ncsr_main(in = a) ncsr_dem(in = b);
by sampleid;
length sampleid_num 8;
if a & b;
sampleid_num = put(sampleid, 15.0);

/* Calculate PTSD diagnosis and sub-criteria variables */
%include '/home/jin/WMH/NSHS/REPLICATION/DIAGNOSIS/Ptsd.sas';

/* Cases to use in NCSR have Worst Event A1,C1,D1 criteria or Random Event A1,C1,D1 criteria  */
if (dsmptsa1 = 1 and dwptsc1 = 1 and dwptsd1 = 1) or (dsmptsa1 = 1 and drptsc1 = 1 and drptsd1 = 1) 
   then ncsr_pts_sample = 1;
else ncsr_pts_sample = 0;

/* Use worst event for PTSD data, otherwise use random event PTSD data */
if PT69 ^= . then PT209 = PT69;
if PT71 ^= . then PT211 = PT71;
if PT72 ^= . then PT212 = PT72;
if PT73 ^= . then PT213 = PT73;
if PT74 ^= . then PT214 = PT74;
if PT102 ^= . then PT233 = PT102;
if PT106 ^= . then PT237 = PT106;

array PTVAR PT41-PT46 PT48 PT50 PT50_1 PT51 PT55 PT209-PT214 PT233 PT237;
do over PTVAR;
   if PTVAR ^= 1 then PTVAR = 0;
end;

if dsm_pts ^= 1 then dsm_pts = 0;

run;

/* New Adult MTO data */
data mental_health_ad_20101004;
set mto.mental_health_ad_20101004;
format _numeric_;
%include '/home/jin/MTO/ADULT/DIAGNOSIS/Datafix2-mto-adult.sas';
%include '/home/jin/MTO/ADULT/DIAGNOSIS/agefix-adult.sas';
run;

proc sort data = mental_health_ad_20101004; by ppid; run;

data mental_health_ad_all;
set mental_health_ad_20101004;
by ppid;
run;

%macro mtoptsd(datain, pfx, dataout);

   /* MTO Adult questionnaire PTSD data */
   data &dataout;
   set &datain(keep = ppid &pfx.CV1_PT13 &pfx.CV2_PT14 &pfx.CV3_PT15 &pfx.CV4_PT16 &pfx.CV5_PT17
                      &pfx.CV6_PT18 &pfx.CV7_PT20 &pfx.CV8_PT22 &pfx.CV9_PT22_1 &pfx.CV10_PT23
                      &pfx.CV11_PT27 &pfx.CV13_PT62 &pfx.CV14_PT64 &pfx.CV14a &pfx.CV14b_PT64a
                      &pfx.CV14c &pfx.CV22_PT261 &pfx.CV15_PT269 &pfx.CV16_PT270 &pfx.CV17_PT271 
                      &pfx.CV18_PT272 &pfx.CV19_PT273 &pfx.CV20_PT274 &pfx.CV21_PT275
                      &pfx.CV24_PT269 &pfx.CV25_PT270 &pfx.CV26_PT271 &pfx.CV27_PT272 
                      &pfx.CV28_PT273 &pfx.CV29_PT274 &pfx.CV30_PT275 
                      f_svy_age_iw f_svy_ethnic f_svy_race f_svy_gender f_wt_totsvy);

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

%mtoptsd(mental_health_ad_all,H, mental_health_ad);

proc sort data = mental_health_ad; by ppid; run;

/* Combine NCSR, MTO Adult, youth data */
data ncsr_mto;
set ncsr mental_health_ad(in = ad);
length ppid_num 8;

ppid_num = put(ppid, 15.0);
if in_mto = 1 then finalp2wt = f_wt_totsvy;
if ad = 1 then mto_adult = 1;
_one_ = 1;
run;

proc sort data = ncsr_mto; by str15 secu; run;

%let indvar = age sexf rhisp rblk roth PT41 PT42 PT43 PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
              PT209 PT211 PT212 PT213 PT214 PT233 PT237;

/* Predict NCSR PTSD using PTSD data */
proc rlogist data = ncsr_mto design = wr filetype = sas;
model dsm_pts = age sexf rhisp rblk roth PT41 PT42 PT43 PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
                PT209 PT211 PT212 PT213 PT214 PT233 PT237;
nest _one_;
weight finalp2wt;
subpopn ncsr_pts_sample = 1;
test waldchi;
idvar age sexf rhisp rblk roth PT41 PT42 PT43 PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
      PT209 PT211 PT212 PT213 PT214 PT233 PT237 sampleid_num ppid_num f_svy_age_iw f_wt_totsvy 
      mto_ptsd_sample mto_adult HCV13_PT62 HCV14_PT64 HCV14a HCV14b_PT64a HCV14c HCV22_PT261;
output beta / filetype = sas filename = beta1 replace  betafmt = F6.4;
setenv decwidth = 4;
output idvar subpopn expected / filetype = sas filename = pred1 replace;
run;

data pred_ptsd_adult;
set pred1(where = (mto_adult = 1));
length ppid $10.;
ppid = input(ppid_num, 15.);
if mto_adult = 1 then output pred_ptsd_adult;
run;

data mtomp.fnlpred_ptsd_adult(keep = ppid f_mh_pts_evr_ad f_mh_pts_aoo_ad f_mh_pts_rec_ad);
set pred_ptsd_adult;
/* Calculate lifetime PTSD by comparing random # to predicted probability */
ptsd_random = ranuni(1234567);
if mto_ptsd_sample = 1 and 0 < ptsd_random <= expected then f_mh_pts_evr_ad = 1;
else f_mh_pts_evr_ad = 0;

******************************************************************************************
* Calculate Recency of PTSD for DSM                                                      *
******************************************************************************************;

if HCV14b_PT64a <= f_svy_age_iw then pts_ons = HCV14b_PT64a;
else pts_ons = HCV14c;

if pts_ons IN(.D, .R) then pts_ons = .;
if pts_ons > f_svy_age_iw then pts_ons = .;

if HCV22_PT261 = 1 or pts_ons = f_svy_age_iw then pts_rec = f_svy_age_iw;

if pts_rec IN(.D, .R) then pts_rec = .;

if 0 <= pts_ons < 4 then pts_ons = 4;
if 0 <= pts_rec < 4 then pts_rec = 4;

if f_mh_pts_evr_ad = 1 then do;
    f_mh_pts_aoo_ad = pts_ons;            
    f_mh_pts_rec_ad = pts_rec;            
end;

run;

proc freq data = mtomp.fnlpred_ptsd_adult;
title 'Adult PTSD, new diagnosis lifetime and 12 month';
tables f_mh_pts_evr_ad / list missing;
run;

%mend a;

%a;

