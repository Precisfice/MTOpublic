/* A stand-in for the 'impdata20x.sas' script, serving to demonstrate
 * how our model-uncertainty abstraction loop (from 'simbetas.sas')
 * might pass a model formula to that script's PTSD imputation procs,
 * and how the estimated voucher-effect odds ratio might be extracted
 * for later analysis.
 */

/* First, demonstrate that we've sucessfully passed 'formula',
 * simply by writing the &formula to the log.
 * This printout merely stands in for the substantive work done
 * in Ptsd_MTO_youth.sas, which actually *uses* the formula to
 * impute PTSD outcomes.
 */
*%PUT &formula;

/* Next, demonstrate how an OR from PROC SURVEYLOGISTIC may be saved.
 * The code is based on Example 111.2 in the SAS/STAT 14.1 User's Guide.
 */
proc surveylogistic data=meps;
   stratum VARSTR99;
   cluster VARPSU99;
   weight PERWT99F;
   class SEX RACEX POVCAT99;
   model INSCOV99 = TOTEXP99 SEX RACEX POVCAT99 / link=glogit;
   /* Extract the OR for 'SEX FEMALE vs MALE' effect on 'PUBLIC ONLY'
    * insurance status, as well as the lower and upper bounds of CI.
    */
   ODS OUTPUT OddsRatios=ORs;
run;

PROC PRINT DATA=ORs;
RUN;


