

%LET folder = E:\NSCR Replication study;
Libname NCSR "&folder";
/*First import transport files*/


		/*WORK.DA20240P2 is unrestricted, */
proc cimport infile="&folder\20240-0002-Data.stc" lib=WORK; run;
	/*Additional formatting code provided by NCSR*/
%Include "&folder\20240-0002-Supplemental_syntax.sas";
	/*Takes Da20240p2 --> generates formatted S20240p2*/

		/*WORK.DA20240P5 is restricted.*/
proc cimport infile="&folder\20240-0005-Data-REST.stc" lib=WORK; run;
	/*Additional formatting code provided by NCSR*/
%include "&folder\20240-0005-Supplemental_syntax-REST.sas";
	/*Takes da20240p5 --> generates formatted da20240p5_format*/


/*Merge by CPES Case Id*/

proc sort data = S20240p2;
by CPESCASE;
run; 

proc sort data = da20240p5_format;
by CPESCASE;
run; 

Data combined NCSR.combined;
merge S20240p2 da20240p5_format;
by CPESCASE;
run; 

		/*ods csv file = "&folder\contents NCSR &sysdate..csv";*/
		/*proc contents data = combined;*/
		/*run;*/
		/*ods csv close; */



/*Modify data to reproduce PTSD coefficients*/
data combined_mod;
Set combined;

	/*Race is hispanic*/
If RANCEST in(7, 8) then RHISP = 1; /*(7) MEXICAN, (8) ALL OTHER HISPANIC*/
	                Else RHISP = 0;
	/*Race is black*/
If RANCEST in(9, 10) then RBLK = 1; /*(9) AFRO-CARIBBEAN, (10) AFRICAN AMERICAN*/
					 Else RBLK = 0;
	/*Race is other*/
If RANCEST in(4, 12) then ROTH = 1; /*(4) ALL OTHER ASIAN, (12) ALL OTHER*/
                     Else ROTH = 0;
SEXF = sex;
drop sex;
run;


	/*Multiple imputation (n-impute = 20)*/
	/*EM algorithm to find maximum */
	/*likelihood estimates for a multivariate normal distribution*/

proc mi data=combined_mod out=NCSR.totali nimpute=20;
class D_PTS12 SEXF RHISP RBLK ROTH PT41 PT42 PT43 PT44
PT45 PT46 PT48 PT50 PT50_1 PT51 PT55 
PT209 PT211 PT212 PT213 PT214 PT233
PT237;
var D_PTS12 Age SEXF RHISP RBLK ROTH PT41 PT42 PT43 PT44
PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
PT209 PT211 PT212 PT213 PT214 PT233
PT237;  FCS;
run;


data model;
set NCSR.totali;
keep D_PTS12 Age SEXF RHISP RBLK ROTH PT41 PT42 PT43 PT44
PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
PT209 PT211 PT212 PT213 PT214 PT233
PT237;
run;
/*Logistic regression*/

	/*DSM_PTS (Lifetime)*/
	/*D_PTS12 (DSM-IV Posttraumatic Stress Disorder (12Mo))*/


	/*For stand-alone full pdf & to output estimated probabilities*/
/*ods pdf file = "&folder\Gen1 Logistic MI &sysdate..pdf";*/
/*Proc logistic data = model multipass;*/
/*class SEXF (ref="(1) MALE") RHISP RBLK ROTH PT41 PT42 PT43 PT44*/
/*	PT45 PT46 PT48 PT50 PT50_1 PT51 PT55 */
/*	PT209 PT211 PT212 PT213 PT214 PT233*/
/*	PT237*/
/*	/param=ref;*/
/**/
/*model D_PTS12 = */
/*Age SEXF HISPANIC BLACK OTHER PT41 PT42 PT43 PT44*/
/*PT45 PT46 PT48 PT50 PT50_1 PT51 PT55*/
/*PT209 PT211 PT212 PT213 PT214 PT233*/
/*PT237*/
/*;*/
/*output out=outdata p=pred_prob lower=low upper=up;*/
/*run;*/
/*ods pdf close; */
/*Randomly sorting and exporting probabilities*/

/*data outdata_export;*/
/*Set outdata;*/
/*rand= ranuni(0);*/
/*keep rand pred_prob low up;*/
/*run;*/
/**/
/*proc sort data = outdata_export;*/
/*by rand;*/
/*run;*/
/**/
/*PROC EXPORT DATA= WORK.outdata_export */
/*            OUTFILE= "&folder\predicted_prob_ptsd_NCSR.csv" */
/*            DBMS=CSV REPLACE;*/
/*     PUTNAMES=YES;*/
/*RUN;*/

ods output ParameterEstimates=estimates;
Proc logistic data = model multipass;
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



/*Comparing coefficients to Kessler-derived*/


data coef;
       infile "&folder/PTSD_slopes_from_NCSR.csv" delimiter = ',' MISSOVER DSD  lrecl=32767 firstobs=2 ;
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

ods csv file = "&folder\comparing coefficients.csv";
proc print data = compare noobs;
run;
ods csv close; 
