* Draw 10^5 different sets of imputation coefficients from the posterior      ;
* density implied by the original coefficients of the JAMA article, taken     ;
* together with their variance-covariance matrix received from Nancy Sampson. ;
* Demonstrate that the mean and covariance matrix for these samples match     ;
* closely the desired values.   ;

libname OUTPUTS "&outputs";
proc iml;
  title1 "Sampling from joint posterior of PTSD model coefficients";
  title2 "(with illustrative sample printouts and checks on sample mean and covariance)";
  load their_beta their_cov CovarNames;
  call randseed(2016);
  betas_posterior_samples = RandNormal(100000, their_beta, their_cov);
  * Simply overwrite the first sample with the original beta vector ;
  betas_posterior_samples[1,] = their_beta;
  sample_labels = {"Original" "Sample 1" "Sample 2" "Sample 3" "Sample 4"};
  print(betas_posterior_samples[1:5,])[Label="Original and first 4 sampled coefficient vectors"
   colname=CovarNames rowname=sample_labels];
  create OUTPUTS.betas_samples from betas_posterior_samples[colname=CovarNames];
  append from betas_posterior_samples;
  close OUTPUTS.betas_samples;
  SampleMean = mean(betas_posterior_samples);
  SampleCov = cov(betas_posterior_samples);
  compare_means = SampleMean // their_beta;
  print compare_means[colname=CovarNames rowname={"Sample Mean" "Their Betas"}];
  print SampleCov[colname=CovarNames rowname=CovarNames];
  cov_diff = SampleCov - their_cov;
  print cov_diff[colname=CovarNames rowname=CovarNames];
  store betas_posterior_samples;


* Define the %mtoptsd macro needed by impdata20x.sas, which is    ;
* %included by the bootstrap loop below.                          ;
* --------------------------------------------------------------- ;
%include "&reanalysis/mtoptsd_macro.sas";

* Iterate over the betas_posterior_samples, constructing a model    ;
* formula for each one and passing it to the impdata20x.sas script. ;
* Collect the resulting voucher effect estimates with their CIs.    ;

%Macro nesting_loops(howmanymods, lowerseed, upperseed);
%do 	imod = 1          %to &howmanymods;
	%do seed = &lowerseed %to &upperseed;
proc iml;
  *title1 "Constructing PTSD imputation model formulas";
  *title2 "(to be passed one-by-one as 'formula' to Ptsd_MTO_youth.sas)";
  load betas_posterior_samples CovarNames;
  CovarNames[loc(CovarNames='Intercept')] = "1";
  if (^exist("OUTPUTS.orci")) then do;
    /* SAS/IML is behaving as if it had some limit of 256 chars 
     * for character matrix elements, at least when APPENDing
     * to a data set.  So in order to record the formula for
     * later checking, I simply split it into 2 parts, being
     * sure to allocate plenty of extra room.
     */
    formula_head = subpad(" ",1,255);
    formula_tail = subpad(" ",1,50);
    create OUTPUTS.orci var {imod seed OddsRatioEst LowerCL UpperCL
     Intercept Age SEXF RHISP RBLK ROTH PT41 PT42 PT43 PT44 PT45 PT46 PT48
     PT50 PT50_1 PT51 PT55 PT209 PT211 PT212 PT213 PT214 PT233 PT237
     formula_head formula_tail};
    close OUTPUTS.orci;
  end;
  
    coefs = betas_posterior_samples[imod,];
    coefs = round(coefs, 0.0001); * to constrain formula length ;
    Intercept = coefs[1];
    Age    = coefs[2];
    SEXF   = coefs[3];
    RHISP  = coefs[4];
    RBLK   = coefs[5];
    ROTH   = coefs[6];
    PT41   = coefs[7];
    PT42   = coefs[8];
    PT43   = coefs[9];
    PT44   = coefs[10];
    PT45   = coefs[11];
    PT46   = coefs[12];
    PT48   = coefs[13];
    PT50   = coefs[14];
    PT50_1 = coefs[15];
    PT51   = coefs[16];
    PT55   = coefs[17];
    PT209  = coefs[18];
    PT211  = coefs[19];
    PT212  = coefs[20];
    PT213  = coefs[21];
    PT214  = coefs[22];
    PT233  = coefs[23];
    PT237  = coefs[24];
    * convert coefs to explicitly (+/-) signed strings ;
    signs = repeat(" ",1,ncol(coefs));
    signs[loc(coefs>=0)] = "+";
    coefs = catx("", signs, coefs);
    * generate formula terms, then concatenate them ;
    terms = catx("*",coefs,CovarNames`);
    formula = rowcatc(terms);
    *title1 "Passing this formula to Ptsd_MTO_youth.sas script";
    *print formula;
    *title1;
    
      
      submit formula seed imod;
        %let formula=&formula; * sets a &formula macro for impdata20x.sas;
        %let mi_seed=&seed;
        %let imod=&imod;
        %include "&reanalysis/impdata20x.sas";
      endsubmit;
      
    %end; * mi_seed loop ;
  %end; * imod loop ;
%MEND nesting_loops;

%nesting_loops(howmanymods=1, lowerseed=524200, upperseed=524400);

/* Obtain a voucher effect on PTSD
 **********************************/

%LET dep = f_mh_pts_y_yt;
%LET controls = ra_grp_exp ra_grp_s8; * i.e., modnum=1 ;

/* This PROC is identical to that in 'MTO_table4_alt.sas' and also
 * Matt Sciandra's '2_mto_jama_impute_data_20160111.sas' script.
 */
	%MACRO obtain_voucher_effect(imputed=);
PROC SURVEYLOGISTIC DATA = MTO.&imputed(where=(x_f_ch_male=1 & f_svy_final_disp^="NI-DC")); /*Zero excluded because f_svy_final_disp="NI-DC"*/
   STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
   DOMAIN _imputation_;
   MODEL &dep (EVENT='1') = &controls / COVB; 
   WEIGHT f_wt_totcore98;
   ODS OUTPUT parameterestimates=parmest&imputed  
              OddsRatios = ors&imputed;  
RUN;
	%MEND obtain_voucher_effect;

%obtain_voucher_effect(imputed=Cached_1_524232_imputed);
%obtain_voucher_effect(imputed=Cached_2_524232_imputed);
%obtain_voucher_effect(imputed=Cached_1_524233_imputed);
%obtain_voucher_effect(imputed=Cached_2_524233_imputed);



proc means data =fnlpred_ptsd_youth;
var pred_prob;
run;



* Extract the desired effect estimate and its CI ;
      use ORs;
      read all var {Effect _Imputation_ OddsRatioEst LowerCL UpperCL};
      close ORs;
      effrow = loc(compbl(Effect)='ra_grp_exp'
                       & _Imputation_=.);
      OddsRatioEst = OddsRatioEst[effrow];
      LowerCL = LowerCL[effrow];
      UpperCL = UpperCL[effrow];
      formula_head = substr(formula, 1, 255);
      formula_tail = substr(formula, 256);
      edit OUTPUTS.orci;
        append;
      close OUTPUTS.orci;


/*data Sciandra_imputed;*/
/*set NBER.Mto_jama_imputed_20160111;*/
/*format _numeric_;*/
/*run;*/
/**/
/*PROC SURVEYLOGISTIC DATA = Sciandra_imputed  ; */
/*   STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;*/
/*   DOMAIN _imputation_;*/
/*   MODEL &dep (EVENT='1') = &controls / COVB; */
/*   WEIGHT f_wt_totcore98 ;*/
/*   OUTPUT OUT=preddata PREDICTED=pp;*/
/*   where x_f_ch_male =1;*/
/*   ODS OUTPUT parameterestimates=parmest  */
/*              OddsRatios = or   */
/*              covb=covm  ;*/
/*RUN;*/




