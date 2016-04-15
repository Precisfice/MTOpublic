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
  create betas_samples from betas_posterior_samples[colname=CovarNames];
  append from betas_posterior_samples;
  close betas_samples;
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

%MACRO bootstrap_loop(pr_seed, imodL, imodR, mi_seedL, mi_seedR);

%DO imod = &imodL %TO &imodR; 
  %DO mi_seed = &mi_seedL %TO &mi_seedR;

    data _null_;
      set betas_samples;
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

  %END; * mi_seed loop ;
%END; * imod loop ;

%MEND bootstrap_loop;

/* We split the bootstrap grid into blocks of 100,
 * each of which can be filled (at ~4 mins per cell)
 * in a reasonable ~7 hour overnight run.
 */

/* Completed
*/
%bootstrap_loop(pr_seed=123    , imodL=1, imodR=10, mi_seedL=524230, mi_seedR=524239);
%bootstrap_loop(pr_seed=1234   , imodL=1, imodR=10, mi_seedL=524230, mi_seedR=524239);
%bootstrap_loop(pr_seed=12345  , imodL=1, imodR=10, mi_seedL=524230, mi_seedR=524239);
%bootstrap_loop(pr_seed=123456 , imodL=1, imodR=10, mi_seedL=524230, mi_seedR=524239);
%bootstrap_loop(pr_seed=1234567, imodL=1, imodR=10, mi_seedL=524230, mi_seedR=524239);

* The 'ORCI' table collects our bootstrap results for analysis ;
data orci;
  attrib imod length=$7;
  set MTO.orci_:; * NB: colon as 'wildcard' ;
  log_or = log(or);
  log_lowor = log(lowor);
  log_upor = log(upor);
  attrib parm label="Voucher Type";
  rename parm=voucher;
run;

data betas_samples_with_imod;
  set betas_samples;
  imod = right(put(_N_,7.)));
run;

proc sort data=orci;
  by imod pr_seed mi_seed;
run;

proc sort data=betas_samples_with_imod;
  by imod;
run;

data orci;
  merge orci (in=oink) betas_samples_with_imod;
  by imod;
  if oink;
run;

proc sort data=orci;
  by voucher imod pr_seed mi_seed; * sort by voucher type to ease visual inspection;
run;

* Export ORCI to tab-delimited file friendly to 'git diff' et al. ; 
proc export data=orci
  outfile="&outputs/orci.tab"
  dbms=tab
  REPLACE;
run;

* Calculate a single, bootstrapped estimate of CI, OR ;
proc means data=orci;
  class voucher;
  var log_or log_lowor log_upor;
  output out=boot_effects;
run;

* TODO: De-log these results ;
data boot_effects;
  set boot_effects(where=(_TYPE_=1 & _STAT_='MEAN'));
  or = exp(log_or);
  lowor = exp(log_lowor);
  upor = exp(log_upor);
  keep voucher or lowor upor;
  *attribute parm label="Voucher Type";
run;

