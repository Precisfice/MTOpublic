/*
 * Here are a few notes entered on 11/12/15 by DCN:
 * 1. The approach to this step may take the form
 *    of a call to SUDAAN, either using PROC RLOGIST
 *    (as in the 'Ptsd-mtoncsr-youth.sas' program
 *    shared by Nancy Simpson) or more directly by
 *    a script that invokes the command-line version
 *    of SUDAAN.  For ease of reference, the original
 *    code is as follows:
 *
 *    /* Predict NCSR PTSD using PTSD data */
 *    proc rlogist data = ncsr_mto design = wr filetype = sas;
 *    model dsm_pts = age sexf rhisp rblk roth PT41 PT42 PT43
 *                    PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
 *                    PT209 PT211 PT212 PT213 PT214 PT233 PT237;
 *    nest _one_;
 *    weight finalp2wt;
 *    subpopn ncsr_pts_sample = 1;
 *    test waldchi;
 *    idvar age sexf rhisp rblk roth PT41 PT42 PT43 PT44 PT45 PT46
 *          PT48 PT50 PT50_1 PT51 PT55 PT209 PT211 PT212 PT213 PT214
 *          PT233 PT237 sampleid_num ppid_num f_svy_age_iw f_wt_totsvy 
 *          mto_ptsd_sample mto_youth YCV13_PT62 YCV14_PT64 YCV14a
 *          YCV14b_PT64a YCV14c YCV22_PT261;
 *    output beta / filetype = sas filename = beta1 replace;
 *    output idvar subpopn expected / filetype = sas filename = pred1 replace;
 *    run;
 *
 *
 * 2. The LHS variable used in the above program is 'dsm_pts',
 *    which is LIFETIME PTSD -- not the 12-MONTH diagnosis.
 *    The model is apparently used to predict lifetime PTSD,
 *    and then 'pts_rec' ("recency") is calculated separately.
 */

/*Logistic regression*/

	/*DSM_PTS (Lifetime)*/
	/*D_PTS12 (DSM-IV Posttraumatic Stress Disorder (12Mo))*/

	/*For stand-alone full pdf & to output estimated probabilities*/
ods pdf file = "&ncsr\Logistic_MI.pdf";
Proc logistic data = NCSR.totali multipass;
class SEXF (ref="1") RHISP RBLK ROTH PT41 PT42 PT43 PT44
	PT45 PT46 PT48 PT50 PT50_1 PT51 PT55 
	PT209 PT211 PT212 PT213 PT214 PT233
	PT237
	/param=ref;

model D_PTS12 = 
Age SEXF RHISP RBLK ROTH PT41 PT42 PT43 PT44
PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
PT209 PT211 PT212 PT213 PT214 PT233
PT237
;
output out=outdata p=pred_prob lower=low upper=up;
run;
ods pdf close; 

	/*Randomly sorting and exporting probabilities*/

data outdata_export;
Set outdata;
rand= ranuni(0);
keep rand pred_prob low up;
run;

proc sort data = outdata_export;
by rand;
run;

PROC EXPORT DATA= WORK.outdata_export 
            OUTFILE= "&ncsr\predicted_prob_ptsd_NCSR.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

ods output ParameterEstimates=estimates;
Proc logistic data = NCSR.totali multipass;
class SEXF (ref="1") RHISP RBLK ROTH PT41 PT42 PT43 PT44
	PT45 PT46 PT48 PT50 PT50_1 PT51 PT55 
	PT209 PT211 PT212 PT213 PT214 PT233
	PT237
	/param=ref;

model D_PTS12 = 
Age SEXF RHISP RBLK ROTH PT41 PT42 PT43 PT44
PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
PT209 PT211 PT212 PT213 PT214 PT233
PT237
;
run;

	data Estimates;
	Set Estimates;
	Variable=UPCASE(Variable);
	run;

/*Comparing coefficients to those employed by Kessler and colleagues*/

data coef;
       infile "&ncsr/PTSD_slopes_from_NCSR.csv" delimiter = ',' MISSOVER DSD  lrecl=32767 firstobs=2 ;
          informat Independent_variable $9. ;
          informat Beta best32. ;
          informat Label $64. ;
          format Independent_variable $9. ;
          format Beta best12. ;
          format Label $64. ;
       input
                   Independent_variable $
                   Beta
                   Label $
       ;
       if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
run;
		data coef;
		set coef;
		Variable=Independent_variable;
		drop Independent_variable;
		run;

proc sort data = coef ;
by Variable;
run;

proc sort data = Estimates ;
by Variable;
run;

data compare;
merge coef Estimates;
by Variable;
run;

ods csv file = "&ncsr\comparing coefficients.csv";
proc print data = compare noobs;
run;
ods csv close; 
