/*  An approximate reproduction of PTSD findings from Table 5 of the JAMA paper,
    suitable for 'connecting the hoses' of the full coefficient resampling loop. */

* Much of this script is based on MTO__makedata_10112013.sas & MTO_table4_alt.sas ;

* Establish &varlistc and &varimp macro variables -- just very rough guesses to start! ;

* Just pick a few non-missing variables to serve as basis for imputation ;

%LET varlistc = f_svy_age_bl_imp f_svy_gender;
%LET folder = E:\NSCR Replication study\MTO Data and codes;

/*Running Kessler Format sas programs*/

/*%INCLUDE '&folder/sas_adytobs_fmts_20120406.sas';*/
/*%INCLUDE '&folder/sas_wgt_formats.sas';*/

%Include "&folder\Ptsd_MTO_youth.sas";

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
    
* Perform the 20x mulitple imputation of missing covariates ;

proc sort data =  Fnlpred_ptsd_youth; 
by ppid; run;

proc sort data =  Mental_health_yt_20101004; 
by ppid; run;

data Mental_health_yt_20101004_2;
merge Fnlpred_ptsd_youth Mental_health_yt_20101004;
by ppid; run;


PROC MI DATA= Mental_health_yt_20101004_2  NIMPUTE=5 OUT=impdata0 SEED=524232;
 CLASS &varlistc ;
 FCS Reg (&varimp = &varlistc);
 VAR &varlistc &varimp;
RUN; 
 


 
/* NOTE: Here is where the top of our imputation coefficient resampling loop will go,
         once we've succeeded in obtaining a first set of results using the original
         imputation coeffs taken from the PTSD_slopes_from_NCSR.csv file. */

* Run the PTSD imputation model on the resulting dataset, using original coeffs ;
%mtoptsd(impdata0,Y, impdata); * Y => youth in this dual-purpose adult/youth script ;

* Obtain a voucher effect on PTSD (sans clustering of stderrs since we lack -tract-) ;


%LET dep = f_mh_pts_rec_yt;
%LET controls = ra_grp_exp ra_grp_s8; * modnum=1 ;

/*ods pdf file = "&folder\surveyselect.pdf";*/
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
/*ods pdf close;*/
