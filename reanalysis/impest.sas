/* Estimate the PTSD imputation model employed by Kessler et al.,
 * and additionally several variations on that model to abstract
 * away some of the arbitrariness of model specification.
 */
ods pdf file = "&myfolders/outputs/impest.pdf";
/* This macro allows the PTSD imputation model to be estimated
 * with several simple modifications.  Variable AGE may be
 * included (as with the original model), or excluded from the
 * model specification.  Likewise, RACE (coded as 3 summies in
 * the original model) may also be optionally omitted from the
 * model.  Finally, the model may be estimated optionally in a
 * younger NCSR subset than the 18-85yo cohort originally used.
 */
%macro est_ptsd_imput_model(incl_age, incl_race, max_age);
%if &incl_age=1 %then
  %do;
  %let age_term=age;
  %end;
%else
  %do;
  %let age_term=%str( );
  %end;
%if &incl_race=1 %then
  %do;
  %let race_terms=rhisp rblk roth;
  %end;
%else
  %do;
  %let race_terms=%str( );
  %end;
%if &max_age=%str() %then %let max_age=99;
%let suffix=A&incl_age.R&incl_race.S&max_age;
/* On the Seattle workstation where this code was prototyped,
 * SAS-callable SUDAAN is unavailable.  Consequently, we use
 * PROC SURVEYLOGISTIC instead of PROC RLOGIST as used by the
 * original authors in Ptsd-mtoncsr-youth.sas.
 * I have found that PROC SURVEYLOGISTIC coefficients match
 * those of SUDAAN (invoked at the command line) to the 4th
 * decimal place (roughly 1 part in 10^5), and the standard
 * errors match to within about 1% in relative terms.
 * Thus, whatever differences are introduced by this PROC
 * substitution are probably negligible compared with the
 * differences between our ICPSR-licensed NCSR data set and
 * the Kessler team's raw NCSR data.
 */
proc surveylogistic
  varmethod=taylor
  data=NCSR.ncsr(keep=DSM_PTS age sexf rhisp rblk roth PT41 PT42 PT43
                      PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
                      PT209 PT211 PT212 PT213 PT214 PT233 PT237
                      NCSRWTSH NCSRWTLG PTS_SMPL
                 where=(pts_smpl=1 and age<=&max_age));
  model dsm_pts(event='(1) ENDORSED')
                = &age_term sexf &race_terms PT41 PT42 PT43
                  PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
                  PT209 PT211 PT212 PT213 PT214 PT233 PT237
        / covb;
  weight ncsrwtlg;
  ods output CovB=covs&suffix
    ParameterEstimates=betas&suffix(keep=Variable Estimate); 
run;
%mend est_ptsd_imput_model;

* Generate a 2x2x2 grid of model results ;
%macro models_grid;
%do age_incl=0 %to 1;
  %do race_incl=0 %to 1;
    %est_ptsd_imput_model(&age_incl,&race_incl,99);
    %est_ptsd_imput_model(&age_incl,&race_incl,40);
  %end;
%end;
%mend models_grid;

%models_grid;

/* Additionally, examine the age distribution for questions
 * of generalizability.  How does the pts_smpl=1 population
 * differ from the full NCS-R sample?
 */
proc sort data=NCSR.ncsr;
  by pts_smpl;
proc means data=NCSR.ncsr;
  var age;
  by pts_smpl;
run;

/* Plot a histogram to show the age density clearly,
 * both for pts_smpl=1 and pts_smpl=0 groups.
 */
ods graphics / reset attrpriority=color width=5in height=3in imagename='NCSR_age';
proc sgplot data=NCSR.ncsr;
  histogram age / group=pts_smpl filltype=gradient transparency=0.5
                  nbins=75 name='est';
  density age / group=pts_smpl;
  xaxis display=(nolabel) min=15 max=90;
  yaxis grid;
  keylegend 'est' / location=inside across=1 position=topright;
run;
ods pdf close;

