* Read covariance matrix for imputation model ;
data covar;
  infile "/folders/myfolders/outputs/covmat01.dbs"; * TODO: abstract to FILENAME stmt;
  input @25 Intercept
  		+1 Age
  		+1 SEXF
  		+1 RHISP
  		+1 RBLK
  		+1 ROTH
  		+1 PT41
  		+1 PT42
  		+1 PT43
  		+1 PT44
  		+1 PT45
  		+1 PT46
  		+1 PT48
  		+1 PT50
  		+1 PT50_1
  		+1 PT51
  		+1 PT55
  		+1 PT209
  		+1 PT211
  		+1 PT212
  		+1 PT213
  		+1 PT214
  		+1 PT233
  		+1 PT237
  		;
  if _N_ <= 24;
run;

proc print data=covar;
run;

* Read coefficients from my replication attempt, along with std errs ;
* TODO: read lines 115-138 of "slopes.txt", starting at column #44;
data coef_rep;
  infile "/folders/myfolders/outputs/slopes.txt" firstobs=115;
  if _N_<=24;
  input @44 coef
  		+1 stderr
  		;
run;  

proc print data=coef_rep;
run;

* Compare diagonal of covariance matrix with squared stderrs ;
proc iml;
  * (A) Read these data sets into IML matrices/vectors ;
  use covar;
  read all var _num_ into cov[colname=CovarNames];
  close covar;
  print cov[colname=CovarNames rowname=CovarNames];
  use coef_rep;
  read all var "coef" into mycoef;
  read all var "stderr" into mystderr;
  close coef_rep;
  print (mycoef`)[colname=CovarNames rowname="my coefs"];
  print (mystderr`)[colname=CovarNames rowname="my stderrs"];
  * (B) Extract the diagonal of the covariance matrix ;
  variances = vecdiag(cov);
  * (C) Print the maximum of the difference var - stderr^2 ;
  maxdiff = max(variances - mystderr##2);
  print maxdiff;
run;

* Compare my coefficients graphically with those of Kessler et al. ;
proc import datafile="/folders/myfolders/PTSD_slopes_from_NCSR.csv"
     out=coef_ori
     dbms=csv
     replace;
     getnames=yes;
run;

proc print data=coef_ori;
run;

* Show the 'error' in my replication, in standard errors ;
proc iml;
  use coef_ori;
  read all var "Beta" into theircoef;
  close coef_ori;
  use coef_rep;
  read all var "coef" into mycoef;
  read all var "stderr" into mystderr;
  close coef_rep;
  absolute_error = theircoef - mycoef;
  relative_error = absolute_error / mystderr;
  print relative_error;
  * TODO: Combine both sets of estimates and abs/rel errors in 1 table ;
  * TODO: Include a HISTOGRAM in the output! ;
run;

/*
%let N=1000;

proc iml;
Mean = {1,2,3};
Cov = {3 2 1,
	   2 4 0,
	   1 0 5};
call randseed(4321);
X = RandNormal(&N, Mean, Cov);

SampleMean = mean(X);
SampleCov = cov(X);

c = "x1":"x3";
print(X[1:5,])[Label="First 5 obs: MV Normal"];
print SampleMean[colname=c];
print SampleCov[colname=c];
*/