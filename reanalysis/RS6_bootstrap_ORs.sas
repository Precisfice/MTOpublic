* Draw 10^5 different sets of imputation coefficients from the posterior      ;
* density implied by the original coefficients of the JAMA article, taken     ;
* together with their variance-covariance matrix received from Nancy Sampson. ;
* Demonstrate that the mean and covariance matrix for these samples match     ;
* closely the desired values.   ;

* Define the %mtoptsd macro needed by impdata20x.sas, which is    ;
* %included by the bootstrap loop below.                          ;
* --------------------------------------------------------------- ;
%include "&reanalysis/mtoptsd_macro.sas";

 %MACRO codeimp(num);
   IF domain="Imputation Number=&num" THEN _imputation_=&num;
 %MEND;

 %MACRO codeallimp;
  %codeimp(1);
  %codeimp(2);
  %codeimp(3);
  %codeimp(4);
  %codeimp(5);
  %codeimp(6);
  %codeimp(7);
  %codeimp(8);
  %codeimp(9);
  %codeimp(10);
  %codeimp(11);
  %codeimp(12);
  %codeimp(13);
  %codeimp(14);
  %codeimp(15);
  %codeimp(16);
  %codeimp(17);
  %codeimp(18);
  %codeimp(19);
  %codeimp(20);
 %MEND;


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

* Iterate over the betas_posterior_samples, constructing a model    ;
* formula for each one and passing it to the impdata20x.sas script. ;
* Cache each imputed data set so generated, to be analyzed below.   ;

  start CacheMI(imod, seed);
  load betas_posterior_samples CovarNames;
  CovarNames[loc(CovarNames='Intercept')] = "1";
  coefs = betas_posterior_samples[imod,];
  coefs = round(coefs, 0.0001); * to constrain formula length ;
  * convert coefs to explicitly (+/-) signed strings ;
  signs = repeat(" ",1,ncol(coefs));
  signs[loc(coefs>=0)] = "+";
  coefs = catx("", signs, coefs);
  * generate formula terms, then concatenate them ;
  terms = catx("*",coefs,CovarNames`);
  formula = rowcatc(terms);
  submit formula seed imod;
    %let formula=&formula; * sets a &formula macro for impdata20x.sas;
    %let mi_seed=&seed;
    %let imod=&imod;
    %include "&reanalysis/impdata20x.sas";
  endsubmit;
  finish CacheMI;
  store module=CacheMI;

* Run the models on the cached imputed data sets, filling ORCI table ;
  start FillORCI(imod, seed);
  *title1 "Constructing PTSD imputation model formulas";
  *title2 "(to be passed one-by-one as 'formula' to Ptsd_MTO_youth.sas)";
  load betas_posterior_samples CovarNames;
  CovarNames[loc(CovarNames='Intercept')] = "1";
  if (^exist("OUTPUTS.orci")) then do;
    create OUTPUTS.orci var {imod seed OddsRatioEst LowerCL UpperCL
     Intercept Age SEXF RHISP RBLK ROTH PT41 PT42 PT43 PT44 PT45 PT46 PT48
     PT50 PT50_1 PT51 PT55 PT209 PT211 PT212 PT213 PT214 PT233 PT237};
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
      submit imod seed ;
      %let imod = &imod;
      %let miseed = &seed;
      %LET imputed = MTO.cached_&imod;           * This 2-stage macro substitution is a workaround for   ;
      %let imputed = &imputed._&miseed._imputed; * apparent macro-sub fragility in IML 'submit' context. ;
      %let controls = ra_grp_exp ra_grp_s8;
      PROC SURVEYLOGISTIC DATA = &imputed(WHERE=(x_f_ch_male=1)); 
         STRATA ra_site; CLUSTER f_svy_bl_tract_masked_id;
         DOMAIN _imputation_;
         MODEL f_mh_pts_y_yt (EVENT='1') = &controls / COVB; 
         WEIGHT f_wt_totcore98 ;
         OUTPUT OUT=preddata PREDICTED=pp;
         ODS OUTPUT parameterestimates=parmest  
                    OddsRatios = or   
                    covb=covm  ;
      RUN;

      DATA parmest; SET parmest (WHERE=(CMISS(domain)=0)); %codeallimp;
      DATA or; SET or (WHERE=(CMISS(domain)=0)); %codeallimp; 
      DATA covm; SET covm (WHERE=(CMISS(domain)=0)); %codeallimp;
      RUN;

      /*
      Get OR and chisquare tests through Mianalyze
      */

      PROC MIANALYZE PARMS = parmest  XPXI=covm;
         MODELEFFECTS intercept &controls ;
         ODS OUTPUT ParameterEstimates = outres;
      RUN;

      DATA outres1 (KEEP=parm or lowor upor) ; 
       SET outres; 
       IF parm ^="intercept";
       or = EXP(estimate);
       lowor = EXP(lclmean);
       upor = EXP(uclmean);
       parm=UPCASE(parm);
      RUN;

      endsubmit;

      * Extract the experimental voucher effect estimate and its CI ;
      use outres1;
        read all var {Parm or lowor upor};
      close outres1;
      effrow = loc(Parm='RA_GRP_EXP');
      OddsRatioEst = or[effrow];
      LowerCL = lowor[effrow];
      UpperCL = upor[effrow];
      formula_head = substr(formula, 1, 255);
      formula_tail = substr(formula, 256);
      edit OUTPUTS.orci;
        append;
      close OUTPUTS.orci;

  submit;
  proc export data=OUTPUTS.orci
    outfile="&outputs/orci.tab"
    dbms=tab
    REPLACE;
  run;
  endsubmit;
  finish FillORCI;
  store module=FillORCI;

* A first test of full 2x2 bootstrap loop ;
  *run CacheMI(1, 524231);
  resume;
  run CacheMI(2, 524231);
  run CacheMI(1, 524232);
/*
proc iml;
  load module=FillORCI;
  do imod = 1 to 2;
    do seed = 524231 to 524232;
      run FillORCI(imod, seed);
    end;
  end;
  quit;
*/
