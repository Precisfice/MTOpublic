/* Perform the 20x multiple imputation of missing covariates
 ************************************************************/
*PROC PRINTTO;
*RUN;
%MACRO receive_mi_seed_with_default;
	%GLOBAL mi_seed;
	%IF (&mi_seed=) %THEN %LET mi_seed = 524232; * Default to the seed used in JAMA paper ;
%MEND receive_mi_seed_with_default;

%receive_mi_seed_with_default;
%PUT MI_SEED = &mi_seed;

* repeat defs + reinclude to enable standalone testing ;
%let folder = C:/Users/Anolinx/MTO;
%let reanalysis = &folder/reanalysis;
%include "&reanalysis/mtoptsd_macro.sas";

* Input data file: pre-imputation dataset (one observation for each youth);
%LET NBER = E:/NSCR_Replication_study/NBER;
Libname NBER "&NBER";
%let preimp = NBER.Mto_jama_preimp_20160111;
%mtoptsd(preimp_xwalk,Y, &preimp); * Crosswalk MTO-->NCSR PTSD varnames ;

/* This stretch of code allows this script to run in a 'standalone' mode
   for testing and refactoring purposes.  In its intended application
   in the reanalysis, this script is usually *given* a formula by the
   code that invokes it.  If desired, however, we can default to exactly
   that formula used in the JAMA paper.
 ************************************************************************/
 *                                            add/remove forward slash --^ ;
 *                                            to fix/parametrize formula   ;

%LET formula = 1*(-1.515)+AGE*(0.0263)+SEXF*(0.1105)+
			RHISP*(-0.0819)+RBLK*(-0.5597)+ROTH*(-0.9751)+PT41*(-0.5603)+
			PT42*(0.0504)+PT43*(-0.3877)+PT44*(0.1148)+PT45*(-0.1614)+
			PT46*(0.5993)+PT48*(0.078)+PT50*(0.4687)+PT50_1*(0.4591)+
			PT51*(0.1683)+PT55*(-0.2237)+PT209*(0.3664)+PT211*(-0.0581)+
			PT212*(0.2516)+PT213*(0.1159)+PT214*(0.64)+PT233*(0.8654)+PT237*(0.1323);
*/
%PUT Formula: &formula;

data pred_ptsd_youth;
set preimp_xwalk;
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

/* Invoke a slightly modified version of Matt Sciandra's imputation code
   TODO: Consider setting macro variable 'imputed' here, before %INCLUDEing
         the 1_..sas file.  Lifting from '1_..sas' file the burden of setting
         this variable would help restore it closer to its original form as
         delivered by NBER.
 */
* NB: The choice of seed is parametrized here by DCN+ARW to permit sensitivity analyses ;
%MACRO set_impdata_filename_per_mi_seed;
	%GLOBAL imputed;
	%IF &mi_seed=524232 %THEN %DO;
		%LET imputed = MTO.mto_jama_imputed; * Default output name ;
		%END;
	%ELSE %DO;
		%LET imputed = MTO.mto_&mi_seed._imputed; * Name of output for arbitrary seed choice ;
		%END;

	%PUT Imputed output file will be named: &imputed;
%MEND set_impdata_filename_per_mi_seed

%set_impdata_filename_per_mi_seed;
%include "&folder/mto_jama_sas_code_20160114/1_mto_jama_impute_data_20160111.sas";
dm 'clear log'; * Otherwise, log may fill up, and user is prompted to empty it ;

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
