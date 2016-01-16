/* Convert SUDAAN's MODCOV-type output to a SAS7BDAT format compatible
 * with the variance-covariance matrix (and parameter estimates) as
 * provided by Nancy Sampson.
 */

* 1. Read the covariance matrix from original authors ;

data covar_theirs;
  set "&folder/youth_covmatrix.sas7bdat";
run;


* 2. Read the covariance matrix for our estimated imputation coefficients ;

data covar_ours;
  infile "&folder/covmat01.dbs";
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
