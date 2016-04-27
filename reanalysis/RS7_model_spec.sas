/* Examine the sensitivity of the voucher-on-PTSD effect estimates
 * to alternative specifications of the PTSD imputation model, as
 * estimated in RS2 above.
 */

* Define module to resample PTSD imputation model coefficients ;
%macro resample_betas(spec, N);
proc iml;
  use betas&spec;
    read all var _num_ into alt_beta_&spec;
  close betas&spec;
  use covs&spec;
    read all var _num_ into alt_cov_&spec[colname=CovarNames];
  close covs&spec;
  call randseed(2016);
  betas_posterior_samples = RandNormal(&N, alt_beta_&spec, alt_cov_&spec);
  * Simply overwrite the first sample with the estimated beta vector ;
  betas_posterior_samples[1,] = alt_beta_&spec`;
  create betas_samples_&spec from betas_posterior_samples[colname=CovarNames];
    append from betas_posterior_samples;
  close betas_samples_&spec;
  store betas_posterior_samples;
quit;
%mend resample_betas;

%resample_betas(a0r0s40, 10);
%resample_betas(a0r0s99, 10);
%resample_betas(a0r1s40, 10);
%resample_betas(a0r1s99, 10);
%resample_betas(a1r0s40, 10);
%resample_betas(a1r0s99, 10);
%resample_betas(a1r1s40, 10);
%resample_betas(a1r1s99, 10);

%macro write_ptsd_imputation_formula(betas_table, index);
  %global formula;
  data _null_;
    set &betas_table;
    if _N_ = &index;
	* In case of missing coefs, set to zero ;
	if AGE=. then AGE=0;
    if SEXF=. then SEXF=0;
    if RHISP=. then RHISP=0;
    if RBLK=. then RBLK=0;
    if ROTH=. then ROTH=0;
    if PT41=. then PT41=0;
    if PT42=. then PT42=0;
    if PT43=. then PT43=0;
    if PT44=. then PT44=0;
    if PT45=. then PT45=0;
    if PT46=. then PT46=0;
    if PT48=. then PT48=0;
    if PT50=. then PT50=0;
    if PT50_1=. then PT50_1=0;
    if PT51=. then PT51=0;
    if PT55=. then PT55=0;
    if PT209=. then PT209=0;
    if PT211=. then PT211=0;
    if PT212=. then PT212=0;
    if PT213=. then PT213=0;
    if PT214=. then PT214=0;
    if PT233=. then PT233=0;
    if PT237=. then PT237=0;
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
%mend write_ptsd_imputation_formula;

* For each of the 8 models, replicate JAMA ORs & CIs ;
%macro generate_alt_results(pr_seed, mi_seedL, mi_seedR);
  %global imod;
  %global formula;
  %do mi_seed = &mi_seedL %to &mi_seedR;
  %do a=0 %to 1;
    %do r=0 %to 1;
	  %do s=40 %to 99 %by 59;
        %let imod = A&a.R&r.S&s.;
        %write_ptsd_imputation_formula(betas_samples_&imod, 1);
        %include "&reanalysis/impdata20x.sas";
	  %end; * s loop ;
	%end; * r loop ;
  %end; * a loop ;
  %end; * mi_seed loop ;
%mend generate_alt_results;

/* Completed
*/
%generate_alt_results(pr_seed=1234567, mi_seedL=524230, mi_seedR=524239);
%generate_alt_results(pr_seed=123456 , mi_seedL=524230, mi_seedR=524239);
%generate_alt_results(pr_seed=12345  , mi_seedL=524230, mi_seedR=524239);
%generate_alt_results(pr_seed=1234   , mi_seedL=524230, mi_seedR=524239);
%generate_alt_results(pr_seed=123    , mi_seedL=524230, mi_seedR=524239);

* The 'alt_orci' table collects estimates from 8 alternate specifications ;
data alt_orci;
attrib imod length=$7;
  set MTO.orci_a:; * Read numerous named outputs orci_<imod>_<seed> ;
  log_or = log(or);
  log_lowor = log(lowor);
  log_upor = log(upor);
  attrib parm label="Voucher Type";
  rename parm=voucher;
run;

proc sort data=alt_orci;
  by voucher imod pr_seed mi_seed; * sort by voucher type to ease visual inspection;
run;

* Export ORCI to tab-delimited file friendly to 'git diff' et al. ; 
proc export data=alt_orci
  outfile="&outputs/alt_orci.tab"
  dbms=tab
  REPLACE;
run;
