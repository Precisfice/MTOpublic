/* Draw 10^5 different sets of imputation coefficients from the posterior
 * density implied by the original coefficients of the JAMA article, taken
 * together with their variance-covariance matrix received from Nancy Sampson.
 * Demonstrate that the mean and covariance matrix for these samples match
 * closely the desired values.
 */
proc iml;
  title1 "Sampling from joint posterior of PTSD model coefficients";
  title2 "(with illustrative sample printouts and checks on sample mean and covariance)";
  load their_beta their_cov CovarNames;
  call randseed(2016);
  betas_posterior_samples = RandNormal(100000, their_beta, their_cov);
  sample_labels = "Sample1":"Sample5";
  print(betas_posterior_samples[1:5,])[Label="First 5 sample coefficient vectors"
   colname=CovarNames rowname=sample_labels];
  SampleMean = mean(betas_posterior_samples);
  SampleCov = cov(betas_posterior_samples);
  compare_means = SampleMean // their_beta;
  print compare_means[colname=CovarNames rowname={"Sample Mean" "Their Betas"}];
  print SampleCov[colname=CovarNames rowname=CovarNames];
  cov_diff = SampleCov - their_cov;
  print cov_diff[colname=CovarNames rowname=CovarNames];
  store betas_posterior_samples;
run;

* Define %mtoptsd macro needed by impdata20x.sas, %included in bootstrap loop below ;
%include "&scripts./mtoptsd_macro.sas";

/* Iterate over the betas_posterior_samples, constructing a model
 * formula for each one and passing it to the 'impdata20x.sas'.
 * Collect the resulting voucher effect estimates with their CIs.
 */
proc iml;
  title1 "Constructing PTSD imputation model formulas";
  title2 "(to be passed one-by-one as 'formula' to Ptsd_MTO_youth.sas)";
  load betas_posterior_samples CovarNames;
  CovarNames[loc(CovarNames='Intercept')] = "1";
  reps = 5;
  or_ci = repeat(., reps, 3); * Allocate reps x 3 matrix for ORs, CI ;
  do i = 1 to reps;
    coefs = betas_posterior_samples[i,];
    * convert coefs to explicitly (+/-) signed strings ;
    signs = repeat(" ",1,ncol(coefs));
    signs[loc(coefs>=0)] = "+";
    coefs = catx("", signs, coefs);
    * generate formula terms, then concatenate them ;
    terms = catx("*",coefs,CovarNames`);
    formula = rowcatc(terms);
    title1 "Passing this formula to Ptsd_MTO_youth.sas script";
    print formula;
    title1;
    submit formula; * the 'formula' parameter allows substitution below;
      %let formula=&formula; * sets a &formula macro for impdata20x.sas;
      %include "&folder\impdata20x.sas";
    endsubmit;
    * Extract the desired effect estimate and its CI ;
    use ORs;
    read all var {Effect _Imputation_ OddsRatioEst LowerCL UpperCL};
    close ORs;
    effrow = loc(compbl(Effect)='ra_Grp_Exp'
                     & _Imputation_=.);
    or_ci[i,1] = OddsRatioEst[effrow];
    or_ci[i,2] = LowerCL[effrow];
    or_ci[i,3] = UpperCL[effrow];
  end;
  rownames = ("Rep1":"Rep1000")[1:reps];
  title1 "Collected effect estimates";
  print or_ci[colname={'Odds Ratio' 'Lower CL' 'Upper CL'}
              rowname=rownames];
run;
