/* Top-level script for reanalysis of reported PTSD findings of Kessler et al [1] */

/* PHASE 0 -- Define folders to match your directory setup
 **********************************************************/

* TODO: Rationalize this to separate sections for Seattle and SLC workstations ;
* TODO: Consider even making this conditionally executed code ;
%LET scripts = /folders/myfolders/scripts;
%LET myfolders = /folders/myfolders;
%LET ncsr = &myfolders./protected/ICPSR_20240/data;
	/*Modify location to match home folder:
	Needs: 
	20240-0002-Data.stc
	20240-0002-Supplemental_syntax.sas
	20240-0005-Data-REST.stc
	20240-0005-Supplemental_syntax-REST.sas
	PTSD_slopes_from_NCSR.csv
	*/
LIBNAME NCSR "&ncsr";

%LET folder = E:\NSCR_Replication_study; /* for Andy's workstation */

/* PHASE I -- Prepare NCSR data
 *******************************/

* Merge public + restricted NCSR data, impute missing values ;
%include "&scripts./prep_NCSR_data.sas";

* Export NCSR data + formats to XPORT files readable by SUDAAN ;
%include "&scripts./xport-ncsr.sas"; * Seattle workstation only ;

/* PHASE II -- Estimate PTSD imputation models
 **********************************************/

%include "&scripts./impest.sas";

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

%include "&scripts./compare_coefs.sas"; * Compare PTSD model coefs -- theirs vs ours vs alt models ;

%include "&scripts./simbetas.sas"; * Run the bootstrap ;

/* --- References ---
1. Kessler RC, Duncan GJ, Gennetian LA, et al. Associations of Housing Mobility Interventions
   for Children in High-Poverty Neighborhoods with Subsequent Mental Disorders during Adolescence.
   JAMA 311, no. 9 (March 5, 2014): 937–48. doi:10.1001/jama.2014.607.
    
    */
