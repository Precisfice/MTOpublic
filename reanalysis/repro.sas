/* Attempt to reproduce in one shot the voucher-on-PTSD effects
 * estimates from the JAMA paper
 ************************************************************/

%LET workstation = SLC;

%macro map_workstation_dirs;
  %GLOBAL folder;     * code from Kessler et al & NBER ;
  %GLOBAL reanalysis; * code written for the reanalysis ;
  %GLOBAL outputs;    * directory for outputs ;
  %GLOBAL ncsr;       * location of NCSR data files ;
  %GLOBAL mto;        * location of MTO data files ;
  %IF &workstation = Seattle %THEN %DO;
    %LET folder = /folders/myfolders;
    %LET reanalysis = &folder/reanalysis;
    %LET outputs = &folder/outputs;
    %LET ncsr = &folder/protected/ICPSR_20240/data;
    * MTO libref undefined on Seattle workstation pending licensing to DNC LLC ;
    *%LET mto = &folder/protected/MTO/data;
  %END;
  
  %IF &workstation = SLC %THEN %DO;
    %LET folder = C:/Users/Anolinx/MTO;
    %LET reanalysis = &folder/reanalysis;
    %LET outputs = &folder/outputs;
    %LET ncsr = E:/NSCR_Replication_study;
    %LET mto = E:/NSCR_Replication_study;
  %END;
%mend;

%map_workstation_dirs;

LIBNAME NCSR "&ncsr";
libname mto "&mto";

/* NOTE: This idempotent invocation of the Sciandra/Sanbonmatsu code
 *       may readily be commented out once it has run once, to speed
 *       whatever further debugging may be necessary.
 **********************************************************************/
*%include "C:/Users/Anolinx/MTO/mto_jama_sas_code_20160114/1_mto_jama_impute_data_20160111.sas";
/* ~~~ */

/* To enable application of the %mtoptsd macro as defined in Ptsd_MTO_youth.sas,
 * we restore the original variable names in the 20x imputed data, removing the
 * '_new' suffix appended by the Sciandra/Sanbonmatsu code to key PTSD variables:
 ********************************************************************************/
data impdata_orignames;
    set MTO.Mto_jama_imputed;
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
   run;

/* Macro 'mtopdsd' is copied wholesale from Ptsd_MTO_youth.sas.
 * It computes the several PTSD criteria that were operationalized
 * in the MTO Youth Final Survey, and also cross-walks from NCSR
 * to MTO survey question variables, by renaming MTO variables to
 * their NCSR equivalents.
 * This enables the PTSD imputation model estimated in NCSR to be
 * applied AS-IS to MTO data, without renaming its RHS variables.
 * (It is a dual-purpose macro intended for both A=adult and
 * Y=youth data sets -- hence its 2nd argument.)
 ******************************************************************/
%macro mtoptsd(datain, pfx, dataout);

   * MTO Adult questionnaire PTSD data ;
   data &dataout;
   set &datain;

   * Criteria A1 ;
   if &pfx.CV1_PT13 = 1 or &pfx.CV2_PT14 = 1 or &pfx.CV3_PT15 = 1 or &pfx.CV4_PT16 = 1 or &pfx.CV5_PT17 = 1 or
      &pfx.CV6_PT18 = 1 or &pfx.CV7_PT20 = 1 or &pfx.CV8_PT22 = 1 or &pfx.CV9_PT22_1 = 1 or &pfx.CV10_PT23 = 1 or
      &pfx.CV11_PT27 = 1 then f_mh_pts_a1 = 1;
   else f_mh_pts_a1 = 0;

   * Criteria C1 ;
   if sum(&pfx.CV21_PT275 = 1 or &pfx.CV30_PT275 = 1, &pfx.CV15_PT269 = 1 or &pfx.CV24_PT269 = 1,
          &pfx.CV16_PT270 = 1 or &pfx.CV25_PT270 = 1, &pfx.CV17_PT271 = 1 or &pfx.CV26_PT271 = 1,
          &pfx.CV18_PT272 = 1 or &pfx.CV27_PT272 = 1) >= 3 then f_mh_pts_c1 = 1;              * Yes ;
   else f_mh_pts_c1 = 0;

   * Criteria D1 ;
   if (&pfx.CV19_PT273 = 1 or &pfx.CV28_PT273 = 1) and (&pfx.CV20_PT274 = 1 or &pfx.CV29_PT274 = 1)
       then f_mh_pts_d1 = 1;  * Yes ;
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

   * Gender ;
   if f_svy_gender = 'F' then sexf = 1;
   else sexf = 0;

   * Race ;
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

   * Create corresponding NCSR variables ;
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

%mtoptsd(impdata_orignames,Y, impdata_crosswalked); * Crosswalk MTO-->NCSR PTSD varnames ;

ods pdf file="&outputs/impdata_crosswalked_contents.pdf";
proc contents data = impdata_crosswalked;
run;
ods pdf close; 

* Hard-code the original JAMA formula exactly as determined by CSV coefs file ;
%LET formula = 1*(-1.515)+AGE*(0.0263)+SEXF*(0.1105)+
RHISP*(-0.0819)+RBLK*(-0.5597)+ROTH*(-0.9751)+PT41*(-0.5603)+
PT42*(0.0504)+PT43*(-0.3877)+PT44*(0.1148)+PT45*(-0.1614)+
PT46*(0.5993)+PT48*(0.078)+PT50*(0.4687)+PT50_1*(0.4591)+
PT51*(0.1683)+PT55*(-0.2237)+PT209*(0.3664)+PT211*(-0.0581)+
PT212*(0.2516)+PT213*(0.1159)+PT214*(0.64)+PT233*(0.8654)+PT237*(0.1323);

data pred_ptsd_youth;
set impdata_crosswalked;
Age = f_svy_age_iw;
* TODO: Are the following really necessary? Does %mtoptsd not set next 4 vars adequately? ;
SEXF = 1-x_f_ch_male;
RHISP = hisp_any;
RBLK = nonhisp_black;
ROTH = nonhisp_other;
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


/* Obtain a voucher effect on PTSD
 **********************************/

%LET dep = f_mh_pts_rec_yt;
%LET controls = ra_grp_exp ra_grp_s8; * i.e., modnum=1 ;

/* This PROC comes from 'MTO_table4_alt.sas'; we comment out
 * the original clustering of stderrs, since we lack the TRACT
 * variable pending delivery of the RAD.
 */
PROC SURVEYLOGISTIC DATA = fnlpred_ptsd_youth ;
   STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
   DOMAIN _imputation_;
   MODEL &dep (EVENT='1') = &controls / COVB; 
   WEIGHT f_wt_totsvy ;
   ODS OUTPUT parameterestimates=parmest  
              OddsRatios = ors;   
RUN;
