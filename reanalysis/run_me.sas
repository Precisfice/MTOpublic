/* Top-level script for reanalysis of reported PTSD findings of Kessler et al [1] */

/* PHASE 0 -- Define folders to match your directory setup
 **********************************************************/

%LET workstation = Seattle;
*%LET workstation = SLC;

%IF workstation = Seattle %THEN %DO;
  %LET folder = /folders/myfolders;
  %LET reanalysis = &folder./reanalysis;
  %LET outputs = &folder./outputs;
  %LET ncsr = &folder./protected/ICPSR_20240/data;
  * MTO libref undefined on Seattle workstation pending licensing ;
  *%LET mto = &folder./protected/MTO/data;
%END;

%IF workstation = SLC %THEN %DO;
  %LET folder = E:\NSCR_Replication_study;
  * TODO: Correct the following as needed. They assume a flat directory structure ;
  %LET reanalysis = &folder;
  %LET outputs = &folder;
  %LET ncsr = &folder;
  %LET mto = &folder;
%END;

LIBNAME NCSR "&ncsr";
LIBNAME MTO "&mto";

/* PHASE I -- Prepare NCSR data (merge public + restricted files, misc var adjustments)
 ***************************************************************************************/
 *                                                           add/remove forward slash --^ ;
 *                                                           to enable/disable PHASE I    ;
 
* I-1: Generate formatted unrestricted and restricted data sets ;
* ---------------------------------------------------------------- ;
options fmtsearch = ( NCSR ); * We put formats into NCSR library ;

* WORK.DA20240P2 & WORK.DA20240P5 to contain respectively unrestricted & restricted data ;
proc cimport infile="&ncsr/20240-0002-Data.stc" lib=WORK isfileutf8=T; run;
proc cimport infile="&ncsr/20240-0005-Data-REST.stc" lib=WORK isfileutf8=T; run;

* Formatting code provided by ICPSR converts DA20240P(2|5) --> formatted S20240P(2|5) ;
%include "&ncsr/20240-0002-Supplemental_syntax.sas";
%include "&ncsr/20240-0005-Supplemental_syntax-REST.sas";

* I-2: Merge by CPES Case Id ;
* ----------------------------- ;
proc sort data = S20240P2;
by CPESCASE;
run;

proc sort data = S20240P5;
by CPESCASE;
run;

data NCSR.ncsr;
merge S20240P2 S20240P5;
by CPESCASE;
run;

* I-3: Encode race, sex, PTSD as used in the imputation model of [1] ;
* --------------------------------------------------------------------- ;
data NCSR.ncsr;
  set NCSR.ncsr;

  IF RANCEST in(7, 8) THEN RHISP = 1;
                      ELSE RHISP = 0;
  IF RANCEST in(9, 10) THEN RBLK = 1; *(9) AFRO-CARIBBEAN, (10) AFRICAN AMERICAN ;
                       ELSE RBLK = 0;
  IF RANCEST in(4, 12) THEN ROTH = 1; *(4) ALL OTHER ASIAN, (12) ALL OTHER ;
                       ELSE ROTH = 0;
  SEXF = sex;

  * Remaining var tweaks in this section were copied from Ptsd-mtoncsr-youth.sas ;

  * Calculate PTSD diagnosis and sub-criteria variables ;
  %include "&folder./Ptsd.sas";

  * Cases to use in NCSR have Worst Event A1,C1,D1 criteria or Random Event A1,C1,D1 criteria ;
  * NB: short varname pts_smpl was used instead of ncsr_pts_sample to maintain v6 compatibility for XPORT ;
  if (dsmptsa1 = 1 and dwptsc1 = 1 and dwptsd1 = 1) or (dsmptsa1 = 1 and drptsc1 = 1 and drptsd1 = 1)
    then pts_smpl = 1;
  else pts_smpl = 0;

  * Use worst event for PTSD data, otherwise use random event PTSD data ;
  if PT69 ^= . then PT209 = PT69;
  if PT71 ^= . then PT211 = PT71;
  if PT72 ^= . then PT212 = PT72;
  if PT73 ^= . then PT213 = PT73;
  if PT74 ^= . then PT214 = PT74;
  if PT102 ^= . then PT233 = PT102;
  if PT106 ^= . then PT237 = PT106;

  array PTVAR PT41-PT46 PT48 PT50 PT50_1 PT51 PT55 PT209-PT214 PT233 PT237;
  do over PTVAR;
    if PTVAR ^= 1 then PTVAR = 0;
  end;

  if dsm_pts ^= 1 then dsm_pts = 0;
run;

* I-4: Run a PROC CONTENTS ;
* ------------------------ ;

ods pdf file = "&outputs./PHASE_I.pdf";
proc contents data = NCSR.ncsr;
run;
ods pdf close;

* I-5: (Seattle only) Export NCSR data + formats to XPORT files readable by SUDAAN ;
* -------------------------------------------------------------------------------- ;
%IF workstation = Seattle %THEN %DO;
  * Export NCSR data in SASXPORT format for use by SUDAAN ;
  libname OUT XPORT "&ncsr./ncsr.xpt";
  * TODO: Ensure that only the needed variables are output ;
  data OUT.ncsr;
    set NCSR.ncsr(keep=DSM_PTS age sexf rhisp rblk roth PT41 PT42 PT43
                       PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
                       PT209 PT211 PT212 PT213 PT214 PT233 PT237
                       NCSRWTSH NCSRWTLG PTS_SMPL);
  run;

  * Now also create the format catalog in XPORT format ;
  proc format lib=NCSR cntlout=fmtdat;
  run;
  libname XOUT XPORT "&ncsr./ncsrlev.xpt";
  proc copy in=WORK out=XOUT;
    select fmtdat;
  run;
%END;

/* end of PHASE I */

/* PHASE II -- Estimate PTSD imputation models
 **********************************************/
 *                  add/remove forward slash --^ ;
 *                  to enable/disable PHASE II   ;

* Estimate the PTSD imputation model employed by Kessler et al., ;
* and additionally several variations on that model to abstract  ;
* away some of the arbitrariness of their model specification.   ;
ods pdf file = "&outputs/impest.pdf";

* This macro allows the PTSD imputation model to be estimated  ;
* with several simple modifications.  Variable AGE may be      ;
* included (as with the original model), or excluded from the  ;
* model specification.  Likewise, RACE (coded as 3 summies in  ;
* the original model) may also be optionally omitted from the  ;
* model.  Finally, the model may be estimated optionally in a  ;
* younger NCSR subset than the 18-85yo cohort originally used. ;
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
* On the Seattle workstation where this code was prototyped, ;
* SAS-callable SUDAAN is unavailable.  Consequently, we use  ;
* PROC SURVEYLOGISTIC instead of PROC RLOGIST as used by the ;
* original authors in Ptsd-mtoncsr-youth.sas.                ;
* I have found that PROC SURVEYLOGISTIC coefficients match   ;
* those of SUDAAN (invoked at the command line) to the 4th   ;
* decimal place (roughly 1 part in 10^5), and the standard   ;
* errors match to within about 1% in relative terms.         ;
* Thus, whatever differences are introduced by this PROC     ;
* substitution are probably negligible compared with the     ;
* differences between our ICPSR-licensed NCSR data set and   ;
* the (publicly unavailable) raw NCSR data held by Kessler   ;
* and colleagues.                                            ;
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

* Additionally, examine the age distribution for questions ;
* of generalizability.  How does the pts_smpl=1 population ;
* differ from the full NCS-R sample?                       ;
proc sort data=NCSR.ncsr;
  by pts_smpl;
proc means data=NCSR.ncsr;
  var age;
  by pts_smpl;
run;

* Plot a histogram to show the age density clearly, ;
* both for pts_smpl=1 and pts_smpl=0 groups.        ;
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

/* end of PHASE II */

/* PHASE III -- Prepare the MTO data
 ************************************/
 *        add/remove forward slash --^ ;
 *        to enable/disable PHASE III  ;

* This section is adapted from the first few lines of Ptsd_MTO_youth.sas ;
proc sort data = mto.mental_health_yt_20150612 out = mental_health_yt_20101004;
by ppid;
run;

data mental_health_yt_20101004;
set mental_health_yt_20101004;
format _numeric_;
%include "&folder\Datafix2-mto-youth.sas";
%include "&folder\agefix-youth.sas";
run;

/* end of PHASE III */

/* PHASE IV -- Bootstrap the voucher effects
 ********************************************/
 *                add/remove forward slash --^ ;
 *                to enable/disable PHASE IV   ;

%include "&reanalysis./compare_coefs.sas"; * Compare PTSD model coefs -- theirs vs ours vs alt models ;

%include "&reanalysis./simbetas.sas"; * Run the bootstrap ;

/* end of PHASE IV */

/* --- References ---
1. Kessler RC, Duncan GJ, Gennetian LA, et al. Associations of Housing Mobility Interventions
   for Children in High-Poverty Neighborhoods with Subsequent Mental Disorders during Adolescence.
   JAMA 311, no. 9 (March 5, 2014): 937–48. doi:10.1001/jama.2014.607.
    
    */
