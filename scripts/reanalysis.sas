/* Top-level script for reanalysis of reported PTSD findings of Kessler et al [1] */

%LET scripts = /folders/myfolders/scripts;

/* PHASE I -- Prepare NCSR data
 *******************************/

* Load misc. definitions specific to your directory setup ;
%include "&scripts./folder_defs.sas";

* Merge public + restricted NCSR data, impute missing values ;
%include "&scripts./prep_NCSR_data.sas";

* Export NCSR data + formats to XPORT files readable by SUDAAN ;
%include "&scripts./xport-ncsr.sas"; * Seattle workstation only ;

/* PHASE II -- Estimate PTSD imputation models
 **********************************************/

%include "&scripts./impest.sas";

/* PHASE III -- Bootstrap the voucher effects
 *********************************************/

*%include "&scripts./simbetas.sas";

/* --- References ---
1. Kessler RC, Duncan GJ, Gennetian LA, et al. Associations of Housing Mobility Interventions
   for Children in High-Poverty Neighborhoods with Subsequent Mental Disorders during Adolescence.
   JAMA 311, no. 9 (March 5, 2014): 937–48. doi:10.1001/jama.2014.607.
    
    */
