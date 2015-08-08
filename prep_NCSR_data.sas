
Libname NCSR "&folder";
/*First import transport files*/

		/*WORK.DA20240P2 contains the unrestricted NCSR data, */
proc cimport infile="&folder\20240-0002-Data.stc" lib=WORK; run;
	/*Additional formatting code provided by NCSR*/
%Include "&folder\20240-0002-Supplemental_syntax.sas";
	/*Takes Da20240p2 --> generates formatted S20240p2*/

		/*WORK.DA20240P5 contains the restricted NCSR data.*/
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

	/*Output: pdf file with contents of proc contents on NCSR merged (restricted & unrestricted) data*/
		ods pdf file = "&folder\contents NCSR &sysdate..pdf";
		proc contents data = combined;
		run;
		ods pdf close;


	/*Encode race with dummy variables data to reproduce PTSD coefficients*/
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
PT237; 
	FCS;  
	/*Using FCS (fully conditional specification) 
	for arbitrary (rather than monotone) 
	pattern of missingness*/
run;
