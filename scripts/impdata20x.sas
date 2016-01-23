/* To enable prototyping of the bootstrapping loop of our reanalysis
 * pending receipt of the MTO Youth Restricted Access Dataset (RAD),
 * we use this script as a functional 'placeholder', in conjunction
 * with the post-imputation MTO dataset received in May 2015.
 * This script incorporates functionality drawn from two scripts
 * provided by Nancy A. Sampson on 12/7/2015:
 *    - MTO_makedata_10112013.sas
 *    - MTO_table4_alt.sas
 * 
 * Our bootstrap loop resamples the PTSD imputation model from its
 * frequentist sampling distribution, invoking the code ... 
 */

/* TODO: If &formula is not already set, then set it to the
 *       original value.  (Actually, maybe this should be done
 *       in the Ptsd_MTO_youth.sas file.  That would very nicely
 *       make this code work standalone.)
 */

/* We include Ptsd_MTO_youth.sas, which has been modified by
 * COMMENTING OUT the section of code that reads the original
 * imputation coefficients from a CSV file and assembles a
 * model RHS &formula.  By decoupling the &formula from the
 * CSV file in this way, we effectively turn &formula into a
 * PARAMETER of 'Ptsd_MTO_youth.sas'.  With only this minor
 * modification to the original authors' code, we are able to
 * invoke it simply by %include'ing it after setting a value
 * for &folder.  (That value-setting occurs within the bootstrap
 * loop of 'simbetas.sas', followed immediately by an %include
 * of THIS script.)  This software design is motivated by the
 * desire to achieve our reanalysis with as little modification
 * as possible of the original authors' code.
 */
%Include "&folder\Ptsd_MTO_youth.sas";
    
* Perform the 20x multiple imputation of missing covariates ;

proc sort data =  Fnlpred_ptsd_youth; 
by ppid; run;

proc sort data =  Mental_health_yt_20101004; 
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

* Run the PTSD imputation model on the resulting dataset ;
%mtoptsd(impdata0,Y, impdata); * Y => youth in this dual-purpose adult/youth script ;

* Obtain a voucher effect on PTSD ;

%LET dep = f_mh_pts_rec_yt;
%LET controls = ra_grp_exp ra_grp_s8; * i.e., modnum=1 ;

/* We comment out the original clustering of stderrs,
 * since we lack the TRACT variable pending delivery
 * of the RAD.
 */
PROC SURVEYLOGISTIC DATA = impdata ;
   STRATA ra_site; *CLUSTER f_svy_bl_tract_masked_id;
   DOMAIN _imputation_;
   MODEL &dep (EVENT='1') = &controls / COVB; 
   WEIGHT f_wt_totsvy ;
   *OUTPUT OUT=preddata PREDICTED=pp;
   ODS OUTPUT parameterestimates=parmest  
              OddsRatios = ors;   
              *covb=covm  ;
RUN;
