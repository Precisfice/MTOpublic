/* Top-level script for reanalysis of reported PTSD findings of Kessler et al [1] */

%LET scripts = /folders/myfolders/scripts;

* Load misc. definitions specific to your directory setup ;
%include "&scripts./folder_defs.sas";

* Merge public + restricted NCSR data, impute missing values ;
%include "&scripts./prep_NCSR_data.sas";

/***** THE FOLLOWING LINES, NOT YET IMPLEMENTED, ARE COMMENTED OUT

* Reproduce the coefficients used in [1] to impute PTSD outcome ;
%include "&scripts./ptsd_imput_coefs_repro.sas";

* Reproduce the cohort analyzed in [1] ;
%include "&scripts./cohort_repro.sas";

* Reproduce the effects estimates reported in [1] ;
%include "&scripts./voucher_ptsd_effects_repro.sas";

* Abstract away arbitrariness due to random-seed choice for PTSD imputation ;
%include "&scripts./inner_loop.sas";

* Abstract away arbitrariness due to overfitting of PTSD imputation model ;
%include "&scripts./outer_loop.sas";

**********/

/* --- References ---
1. Kessler RC, Duncan GJ, Gennetian LA, et al. Associations of Housing Mobility Interventions
   for Children in High-Poverty Neighborhoods with Subsequent Mental Disorders during Adolescence.
   JAMA 311, no. 9 (March 5, 2014): 937–48. doi:10.1001/jama.2014.607.
    
    */
