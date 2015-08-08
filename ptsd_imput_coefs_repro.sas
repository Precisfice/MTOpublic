%LET folder = E:\NSCR Replication study;
	/*Modify location to match home folder:
	Needs: 
	20240-0002-Data.stc
	20240-0002-Supplemental_syntax.sas
	20240-0005-Data-REST.stc
	20240-0005-Supplemental_syntax-REST.sas
	PTSD_slopes_from_NCSR.csv
	*/
%Include "&folder\prep_NCSR_data.sas";

/*Logistic regression*/

	/*DSM_PTS (Lifetime)*/
	/*D_PTS12 (DSM-IV Posttraumatic Stress Disorder (12Mo))*/

	/*For stand-alone full pdf & to output estimated probabilities*/
ods pdf file = "&folder\Gen1 Logistic MI &sysdate..pdf";
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
            OUTFILE= "&folder\predicted_prob_ptsd_NCSR.csv" 
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
