/*PROC PRINTTO NEW*/
/*  LOG="&outputs/RS3.log";*/
/*RUN;*/

* Read coefficients from our replication attempt, along with std errs.    ;
* These are found starting at column #44 on lines 115-138 of slopes.txt,  ;
* which is the output log from a SUDAAN run.                              ;
data coef_rep;
  infile "&outputs/slopes.txt" firstobs=115;
  if _N_<=24;
  input @44 coef
      +1 stderr
      ;
run;

* Read the coefficients of the PTSD imputation model ;
* used in the 2014 JAMA paper.                       ;
proc import datafile="&folder/PTSD_slopes_from_NCSR.csv"
     out=coef_ori
     dbms=csv
     replace;
     getnames=yes;
run;

* Read the covariance matrix from original authors ;
data covar_theirs;
  set "&folder/youth_covmatrix.sas7bdat";
run;

* Convert SUDAAN's MODCOV-type output to a SAS7BDAT format compatible ;
* with the variance-covariance matrix (and parameter estimates) as    ;
* received from Nancy Sampson.                                        ;
data covar_ours;
  infile "&outputs/covmat01.dbs";
  * Fill in the leftmost, uninformative columns ;
  PROCNUM = .;
  MODELNO = .;
  NCELL   = .;
  EST_ID  = .;
  IDNUM   = .;
  ROWNUM  = .;
  DDF     = .;
  CHECK   = .;
  RANK    = .;
  * Load the substantive content ;
  input Intercept 25-38 Age SEXF RHISP RBLK ROTH
        PT41 PT42 PT43 PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
        PT209 PT211 PT212 PT213 PT214 PT233 PT237
        ;
run;

* As a check, we print our respective covariance matrices,  ;
* and compare them by several rough methods.                ;
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

* Tabulate our replicated PTSD imputation coefficients for comparison ;
* with those used in the 2014 JAMA paper.                             ;
proc iml;
  load our_cov our_beta their_cov their_beta;
  their_stderr = sqrt(vecdiag(their_cov)`);
  * Load some of the niceties (esp., *labels*) from the CSV;
  use coef_ori;
  *read all var "Beta" into their_beta[rowname=Independent_variable];
  read all var "Independent_variable" into rhs_vars[rowname=Label];
  read all var "Label" into var_detail[rowname=Independent_variable];
  close coef_ori;
  diff_in_stderrs = (their_beta - our_beta)/their_stderr;
  create betas var {rhs_vars our_beta their_beta their_stderr diff_in_stderrs var_detail};
  append var {rhs_vars our_beta their_beta their_stderr diff_in_stderrs var_detail};
run;

ods pdf file = "&outputs/RS3-Betas_Compared.pdf";
proc print data=betas;
  title1 'Comparison of original PTSD imputation model betas with our reproduction attempt';
run;
ods pdf close;
