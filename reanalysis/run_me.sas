/* Top-level script for reanalysis of reported PTSD findings of Kessler et al [1] */

/*  STEP 0 -- Define folders to match your directory setup
 **********************************************************/

%LET workstation = Seattle;
*%LET workstation = SLC;

%macro map_workstation_dirs;
  %GLOBAL folder;     * code from Kessler et al & NBER ;
  %GLOBAL reanalysis; * code written for the reanalysis ;
  %GLOBAL outputs;    * directory for outputs ;
  %GLOBAL ncsr;       * location of NCSR data files ;
  %GLOBAL mto;        * location of MTO data files ;
  %GLOBAL nber;        * location of MTO data files ;
  %IF &workstation = Seattle %THEN %DO;
    %LET folder = /folders/myfolders;
    %LET reanalysis = &folder/reanalysis;
    %LET outputs = &folder/outputs;
    %LET ncsr = &folder/protected/ICPSR_20240/data;
    *%LET mto = &folder/protected/MTO/data;
    * MTO libref undefined on Seattle workstation pending licensing to DNC LLC ;
    %LET mto = &folder/simulated/MTO/data;
    %LET nber = &mto/NBER;
  %END;
  
  %IF &workstation = SLC %THEN %DO;
    %LET folder = C:/Users/Anolinx/MTO;
    %LET reanalysis = &folder/reanalysis;
    %LET outputs = &folder/outputs;
    %LET ncsr = E:/NSCR_Replication_study;
    %LET mto = E:/NSCR_Replication_study;
    %LET nber = &mto/NBER;
  %END;
%mend;

%map_workstation_dirs;

LIBNAME NCSR "&ncsr";
libname mto "&mto";
Libname NBER "&nber";
libname OUTPUTS "&outputs";

/*  STEP I -- Prepare NCSR data (merge public + restricted files, misc var adjustments)
 */ 
%include "&reanalysis/RS1_prep_NCSR_data.sas";

/*  STEP II -- Estimate PTSD imputation models
 */
%include "&reanalysis/RS2_estimate_PTSD_imp_models.sas";

/*  STEP III -- Compare coefficients
 */
%include "&reanalysis/RS3_compare_coefficients.sas";

/*  STEP IV -- Prepare the MTO data
 */
%include "&reanalysis/RS4_prep_MTO_data.sas";

/*  STEP V -- Compare MTO vs NCS-R age distributions
 */
%include "&reanalysis/RS5_contrast_age_dists.sas";

/*  STEP VI -- Bootstrap the voucher effects
 */
PROC PRINTTO NEW
  LOG="&outputs/RS6.log";
RUN;
%include "&reanalysis/RS6_bootstrap_ORs.sas";
PROC PRINTTO;
RUN;
/* --- References ---
1. Kessler RC, Duncan GJ, Gennetian LA, et al. Associations of Housing Mobility Interventions
   for Children in High-Poverty Neighborhoods with Subsequent Mental Disorders during Adolescence.
   JAMA 311, no. 9 (March 5, 2014): 937-48. doi:10.1001/jama.2014.607.
    
    */
