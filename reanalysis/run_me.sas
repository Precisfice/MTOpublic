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
%END;

%IF workstation = SLC %THEN %DO;
  %LET folder = E:\NSCR_Replication_study;
  * TODO: Correct the following as needed. They assume a flat directory structure ;
  %LET reanalysis = &folder;
  %LET outputs = &folder;
  %LET ncsr = &folder;
%END;


LIBNAME NCSR "&ncsr";

/* PHASE I -- Prepare NCSR data
 *******************************/

* Merge public + restricted NCSR data, impute missing values ;
%include "&reanalysis./prep_NCSR_data.sas";

* (Seattle only) Export NCSR data + formats to XPORT files readable by SUDAAN ;
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

/* PHASE II -- Estimate PTSD imputation models
 **********************************************/

%include "&reanalysis./impest.sas";

/* PHASE III -- Prepare the MTO data
 ************************************/

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

/* PHASE IV -- Bootstrap the voucher effects
 ********************************************/

%include "&reanalysis./compare_coefs.sas"; * Compare PTSD model coefs -- theirs vs ours vs alt models ;

%include "&reanalysis./simbetas.sas"; * Run the bootstrap ;

/* --- References ---
1. Kessler RC, Duncan GJ, Gennetian LA, et al. Associations of Housing Mobility Interventions
   for Children in High-Poverty Neighborhoods with Subsequent Mental Disorders during Adolescence.
   JAMA 311, no. 9 (March 5, 2014): 937–48. doi:10.1001/jama.2014.607.
    
    */
