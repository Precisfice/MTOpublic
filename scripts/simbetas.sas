%LET folder = E:\NSCR_Replication_study; /* for Andy's workstation */

/* Read coefficients from our replication attempt, along with std errs.
 * These are found starting at column #44 on lines 115-138 of "slopes.txt",
 * which is the output log from a SUDAAN run.
 */
data coef_rep;
  infile "&folder\slopes.txt" firstobs=115;
  if _N_<=24;
  input @44 coef
  		+1 stderr
  		;
run; 

* Read the covariance matrix for our estimated imputation coefficients ;
data covar;
  infile "&folder\covmat01.dbs";
  input Intercept 25-38 Age SEXF RHISP RBLK ROTH
  		PT41 PT42 PT43 PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
  		PT209 PT211 PT212 PT213 PT214 PT233 PT237 
  		;
  if _N_ <= 24;
run;

/* Read the coefficients of the PTSD imputation model
 * used in the 2014 JAMA paper.
 */ 
proc import datafile="&folder\PTSD_slopes_from_NCSR.csv"
     out=coef_ori
     dbms=csv
     replace;
     getnames=yes;
run;

/* As a check, we print our respective covariance matrices,
 * and compare them by several rough methods.
 */
proc iml;
  * (A) Read 'ours' into IML matrices/vectors ;
  use covar_ours;
  read all var _num_ into our_cov[colname=CovarNames];
  close covar_ours;
  CovarNames=CovarNames[10:33];
  our_beta = our_cov[25,10:33]; * The 25th row is our_beta ;
  print our_beta[Label="Our betas, now taken from row #25 of covariance matrix"
   colname=CovarNames];
  our_cov = our_cov[1:24,10:33]; * Top right 24x24 matrix is truly our_cov ;
  print our_cov[Label="Covariance matrix from our SUDAAN-estimated PTSD imputation model"
   colname=CovarNames rowname=CovarNames];
  * (B) Read 'theirs' into IML matrices/vectors ;
  use covar_theirs;
  read all var _num_ into their_cov; * ignore their colnames B001-B024 ;
  close covar_theirs;
  their_beta = their_cov[25,10:33]; * The 25th row is their_beta ;
  print their_beta[Label="Their betas, now taken from row #25 of covariance matrix"
   colname=CovarNames];
  their_cov = their_cov[1:24,10:33]; * Top right 24x24 matrix is truly their_cov ;
  print their_cov[Label="Covariance matrix from their PROC RLOGIST PTSD imputation model"
   colname=CovarNames rowname=CovarNames];
  * (C) Ours-vs-theirs covariance matrix comparisons ;
  maxdiff = max(abs(vecdiag(our_cov) - vecdiag(their_cov)));
  print maxdiff[Label="Largest abs diff between our cov diagonal and theirs"];
  * TODO: Compare sum of squared errors? ;
  ss_diffs = sum((our_cov - their_cov)##2);
  ss_elems = sum(their_cov##2);
  R2 = 1.0 - (ss_diffs/ss_elems);
  print R2[Label="Fraction of 'variation' in their covar terms explained by ours"];
  store our_cov our_beta their_cov their_beta CovarNames;
run;

/* Tabulate our replicated PTSD imputation coefficients for comparison
 * with those used in the 2014 JAMA paper.
 */
proc iml;
  load our_cov our_beta their_cov their_beta;
  their_stderr = sqrt(vecdiag(our_cov)`);
  * Load some of the niceties (esp., *labels*) from the CSV;
  use coef_ori;
  *read all var "Beta" into their_beta[rowname=Independent_variable];
  read all var "Independent_variable" into rhs_vars[rowname=Label];
  read all var "Label" into var_detail[rowname=Independent_variable];
  close coef_ori;
  diff_in_stderrs = (their_beta - our_beta)/their_stderr;
  create betas var {rhs_vars their_beta our_beta our_stderr diff_in_stderrs var_detail};
  append var {rhs_vars their_beta our_beta our_stderr diff_in_stderrs var_detail};
run;

proc print data=betas;
  title1 'Comparison of original PTSD imputation model betas with our reproduction attempt';
run;


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
