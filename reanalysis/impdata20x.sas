/* Perform the 20x multiple imputation of missing covariates
 ************************************************************/

/*To do: Adapt Matt Sciandra's imputation code*/

/* Run the PTSD imputation model on the resulting dataset
 *********************************************************/

/*%LET VARLISTC = ad_age edcat x_f_ad_edinsch racecat x_f_ad_nevmarr*/
/*x_f_ad_parentu18 x_f_ad_working x_f_c2_hosp x_f_c2_lowbw ch_age x_f_ch_schplay*/
/*x_f_ch_specmed x_f_hh_afdc x_f_hh_car x_f_hh_disabl x_f_hh_noteens hhsizecat*/
/*x_f_hh_victim x_f_hood_5y x_f_hood_chat x_f_hood_nbrkid x_f_hood_nofamily*/
/*x_f_hood_nofriend x_f_hood_unsafenit x_f_hood_verydissat x_f_hous_fndapt*/
/*x_f_hous_mov3tm x_f_hous_movdrgs x_f_hous_movschl x_f_hous_sec8bef inccat*/
/*ra_site ycv1_pt13_new ycv2_pt14_new ycv3_pt15_new ycv4_pt16_new ycv5_pt17_new*/
/*ycv6_pt18_new ycv7_pt20_new ycv8_pt22_new ycv9_pt22_1_new ycv10_pt23_new*/
/*ycv11_pt27_new x_f_ch_male mov_drugs x_f_ch_bl_age617 large_family*/
/*exclude_lrgfam hardtoreach exclude_htr;*/

/* Let us impute only those vars we actually need for our later work,
   which I identify starting from a keep= option in Ptsd_MTO_youth.sas
   and from this omitting all non-missing variables. */
/*%LET varimp = YCV1_PT13 YCV2_PT14 YCV3_PT15 YCV4_PT16 YCV5_PT17*/
/*              YCV6_PT18 YCV7_PT20 YCV8_PT22 YCV9_PT22_1 YCV10_PT23*/
/*              YCV11_PT27 YCV13_PT62 YCV14_PT64 YCV14b_PT64a*/
/*              YCV14c YCV22_PT261 YCV15_PT269 YCV16_PT270 YCV17_PT271 */
/*              YCV18_PT272 YCV19_PT273 YCV20_PT274 YCV21_PT275*/
/*              YCV24_PT269 YCV25_PT270 YCV26_PT271 YCV27_PT272 */
/*              YCV28_PT273 YCV29_PT274 YCV30_PT275;*/
/**/
/**/
/*%LET NBER = E:\NSCR_Replication_study\NBER;*/
/*Libname NBER "&NBER";*/
/**/
/*data preimpdata0;*/
/*set NBER.Mto_jama_preimp_20160111;*/
/*format _numeric_;*/
/*%include "&folder\Datafix2-mto-youth.sas";*/
/*%include "&folder\agefix-youth.sas";*/
/*run;*/

/*PROC MI data = NBER.Mto_jama_preimp_20160111 nimpute = 5 out=impdata0 SEED=524232;*/
/*class &VARLISTC;*/
/*FCS reg (&varimp=&VARLISTC); */
/*var &varimp &VARLISTC;*/
/*run;*/

*%include "C:/Users/Anolinx/MTO/mto_jama_sas_code_20160114/1_mto_jama_impute_data_20160111.sas";

%mtoptsd(MTO.Mto_jama_imputed,Y, impdata); * Crosswalk MTO-->NCSR PTSD varnames ;

/* This stretch of code allows this script to run in a 'standalone' mode
   for testing and refactoring purposes.  In its intended application
   in the reanalysis, this script is usually *given* a formula by the
   code that invokes it.  If not, however, we default to exactly that
   formula used in the JAMA paper.
 */
%MACRO set_formula;
	%GLOBAL formula ;
	%IF &formula=%str() %THEN * default to the formula used in the JAMA paper ;
		%LET formula = 1*(-1.515)+AGE*(0.0263)+SEXF*(0.1105)+
		RHISP*(-0.0819)+RBLK*(-0.5597)+ROTH*(-0.9751)+PT41*(-0.5603)+
		PT42*(0.0504)+PT43*(-0.3877)+PT44*(0.1148)+PT45*(-0.1614)+
		PT46*(0.5993)+PT48*(0.078)+PT50*(0.4687)+PT50_1*(0.4591)+
		PT51*(0.1683)+PT55*(-0.2237)+PT209*(0.3664)+PT211*(-0.0581)+
		PT212*(0.2516)+PT213*(0.1159)+PT214*(0.64)+PT233*(0.8654)+PT237*(0.1323);
%MEND set_formula;
%set_formula;
%PUT Formula: &formula;

data pred_ptsd_youth;
set impdata;
Age = f_svy_age_iw;
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
