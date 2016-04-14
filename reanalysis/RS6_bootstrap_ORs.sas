* Draw 10^5 different sets of imputation coefficients from the posterior      ;
* density implied by the original coefficients of the JAMA article, taken     ;
* together with their variance-covariance matrix received from Nancy Sampson. ;
* Demonstrate that the mean and covariance matrix for these samples match     ;
* closely the desired values.   ;

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
quit;

/* Here is the main bootstrap loop, abstracting away the arbitrariness
 * connected with sampling variation in the NCSR-based PTSD imputation
 * model coefficients, as well as choice of seed used for multiple
 * imputation of missing covariates and uninterviewed subjects.
 */

%MACRO bootstrap_loop(imodL, imodR, seedL, seedR);

%DO imod = &imodL %TO &imodR; 
 %DO mi_seed= &seedL %TO &seedR;

    data _null_;
      set OUTPUTS.betas_samples;
      if _N_ = &imod; * TODO: In general, &imod ;
      form = trim('1'||'*('||trim(left(put(Intercept,10.4)))||')+'||
        'AGE'||'*('||trim(left(put(AGE,10.4)))||')+'||
        'SEXF'||'*('||trim(left(put(SEXF,10.4)))||')+'||
        'RHISP'||'*('||trim(left(put(RHISP,10.4)))||')+'||
        'RBLK'||'*('||trim(left(put(RBLK,10.4)))||')+'||
        'ROTH'||'*('||trim(left(put(ROTH,10.4)))||')+'||
        'PT41'||'*('||trim(left(put(PT41,10.4)))||')+'||
        'PT42'||'*('||trim(left(put(PT42,10.4)))||')+'||
        'PT43'||'*('||trim(left(put(PT43,10.4)))||')+'||
        'PT44'||'*('||trim(left(put(PT44,10.4)))||')+'||
        'PT45'||'*('||trim(left(put(PT45,10.4)))||')+'||
        'PT46'||'*('||trim(left(put(PT46,10.4)))||')+'||
        'PT48'||'*('||trim(left(put(PT48,10.4)))||')+'||
        'PT50'||'*('||trim(left(put(PT50,10.4)))||')+'||
        'PT50_1'||'*('||trim(left(put(PT50_1,10.4)))||')+'||
        'PT51'||'*('||trim(left(put(PT51,10.4)))||')+'||
        'PT55'||'*('||trim(left(put(PT55,10.4)))||')+'||
        'PT209'||'*('||trim(left(put(PT209,10.4)))||')+'||
        'PT211'||'*('||trim(left(put(PT211,10.4)))||')+'||
        'PT212'||'*('||trim(left(put(PT212,10.4)))||')+'||
        'PT213'||'*('||trim(left(put(PT213,10.4)))||')+'||
        'PT214'||'*('||trim(left(put(PT214,10.4)))||')+'||
        'PT233'||'*('||trim(left(put(PT233,10.4)))||')+'||
        'PT237'||'*('||trim(left(put(PT237,10.4))))||')';
      call symput('formula',form);
    run;

    %include "&reanalysis/impdata20x.sas";

  %END; * imod loop ;
%END; * seed loop ;

%MEND bootstrap_loop;

%bootstrap_loop(imodL=3, imodR=4, seedL=524232, seedR=524233);
%bootstrap_loop(imodL=1, imodR=4, seedL=524230, seedR=524231);
%bootstrap_loop(imodL=1, imodR=4, seedL=524234, seedR=524239);
%bootstrap_loop(imodL=5, imodR=8, seedL=524230, seedR=524239);

* The 'ORCI' table collects our bootstrap results for analysis ;
data orci;
  set MTO.orci_:; * Read numerous named outputs outres1_<imod>_<seed> ;
  * TODO: Restrict to experimental voucher ;
run;

data betas_samples_with_imod;
  set OUTPUTS.betas_samples;
  imod = _N_;
run;

proc sort data=orci;
  by parm;
run;

data OUTPUTS.orci;
  merge orci (in=oink) betas_samples_with_imod;
  by imod;
  if oink;
run;

* Export ORCI to tab-delimited file friendly to 'git diff' et al. ; 
proc export data=OUTPUTS.orci
  outfile="&outputs/orci.tab"
  dbms=tab
  REPLACE;
run;

