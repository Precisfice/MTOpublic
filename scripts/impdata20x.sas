/* To enable prototyping of the bootstrapping loop of our reanalysis
 * pending receipt of the MTO Youth Restricted Access Dataset (RAD),
 * we use this script as a functional 'placeholder', in conjunction
 * with the post-imputation MTO dataset received in May 2015.
 * This script incorporates functionality drawn from three scripts
 * provided by Nancy A. Sampson on the dates noted:
 *    - Ptsd_MTO_youth.sas        (11/13/2014)
 *    - MTO_makedata_10112013.sas (12/07/2015)
 *    - MTO_table4_alt.sas        (12/07/2015)
 * 
 * Our bootstrap loop resamples the PTSD imputation model from its
 * frequentist sampling distribution, invoking the code ... 
 */

/* Perform the 20x multiple imputation of missing covariates
 ************************************************************/

proc sort data =  fnlpred_ptsd_youth; 
by ppid; run;

proc sort data =  mental_health_yt_20101004; 
by ppid; run;

data Mental_health_yt_20101004_2;
merge Fnlpred_ptsd_youth Mental_health_yt_20101004;
by ppid; run;

/* The MTO_makedata_10112013.sas script constructs &varlistc
 * and &varimp macros, that seem to represent (respectively)
 * a list of variables that are completely non-missing, and
 * the list of partly-missing variables to be imputed -- the
 * intent being to use the former to impute the latter.
 * (Of note, Matt Sciandra's 1/14/2016 documentation confirms
 * this understanding as correct.)
 * We set dummy values for these macros here, so that we can
 * achieve some running code that may be refactored or replaced
 * once the RAD is delivered.
 */

* Crudely pick a few non-missing vars to serve as basis for imputation ;
%LET varlistc = f_svy_age_bl_imp f_svy_gender;
/* Let us impute only those vars we actually need for our later work,
   which I identify starting from a keep= option in Ptsd_MTO_youth.sas
   and from this omitting all non-missing variables. */
%LET varimp = YCV1_PT13 YCV2_PT14 YCV3_PT15 YCV4_PT16 YCV5_PT17
              YCV6_PT18 YCV7_PT20 YCV8_PT22 YCV9_PT22_1 YCV10_PT23
              YCV11_PT27 YCV13_PT62 YCV14_PT64 YCV14b_PT64a
              YCV14c YCV22_PT261 YCV15_PT269 YCV16_PT270 YCV17_PT271 
              YCV18_PT272 YCV19_PT273 YCV20_PT274 YCV21_PT275
              YCV24_PT269 YCV25_PT270 YCV26_PT271 YCV27_PT272 
              YCV28_PT273 YCV29_PT274 YCV30_PT275;

PROC MI DATA= Mental_health_yt_20101004_2  NIMPUTE=5 OUT=impdata0 SEED=524232;
 CLASS &varlistc ;
 FCS Reg (&varimp = &varlistc);
 VAR &varlistc &varimp;
RUN; 

/* Run the PTSD imputation model on the resulting dataset
 *********************************************************/

%mtoptsd(impdata0,Y, impdata); * Crosswalk MTO-->NCSR PTSD varnames ;

data pred_ptsd_youth;
set impdata;
pred_prob = exp(&formula)/(1+exp(&formula));
run;

/* Impute lifetime PTSD, then calculate 'recency' to assign 12-month diagnosis
 ******************************************************************************/

/* The code in this section was copied from the end of Ptsd_MTO_youth.sas,
 * with modifications as noted (+++) to support additional analyses.
 */

data fnlpred_ptsd_youth(keep = ppid f_mh_pts_evr_yt f_mh_pts_aoo_yt f_mh_pts_rec_yt f_wt_totsvy
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
PROC SURVEYLOGISTIC DATA = impdata ;
   STRATA ra_site; *CLUSTER f_svy_bl_tract_masked_id;
   DOMAIN _imputation_;
   MODEL &dep (EVENT='1') = &controls / COVB; 
   WEIGHT f_wt_totsvy ;
   ODS OUTPUT parameterestimates=parmest  
              OddsRatios = ors;   
RUN;
