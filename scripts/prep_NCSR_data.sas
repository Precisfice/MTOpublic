/*First import transport files*/

* STEP 1: Generate formatted unrestricted and restricted data sets ;

* WORK.DA20240P2 contains the unrestricted NCSR data ;
proc cimport infile="&ncsr/20240-0002-Data.stc" lib=WORK isfileutf8=T; run;
* Additional formatting code provided by ICPSR ... ;
%include "&ncsr/20240-0002-Supplemental_syntax.sas";
* .. converts DA20240P2 --> formatted S20240P2 ;

* WORK.DA20240P5 contains the restricted NCSR data ;
proc cimport infile="&ncsr/20240-0005-Data-REST.stc" lib=WORK isfileutf8=T; run;
* Additional formatting code provided by ICPSR ... ;
%include "&ncsr/20240-0005-Supplemental_syntax-REST.sas";
* .. converts DA20240P5 --> formatted S20240P5 ;

* STEP 2: Merge by CPES Case Id ;
proc sort data = S20240P2;
by CPESCASE;
run; 

proc sort data = S20240P5;
by CPESCASE;
run; 
data NCSR.ncsr;
merge S20240P2 S20240P5;
by CPESCASE;
run; 

/*
 * TODO: Add FORMATs to these variables?
 */

* STEP 3: Encode race, sex, PTSD as used in the imputation model of [1] ;
data NCSR.ncsr;
set NCSR.ncsr;

* Race is hispanic ;
If RANCEST in(7, 8) then RHISP = 1;
	                Else RHISP = 0;
* Race is black ;
If RANCEST in(9, 10) then RBLK = 1; *(9) AFRO-CARIBBEAN, (10) AFRICAN AMERICAN ;
					 Else RBLK = 0;
* Race is other ;
If RANCEST in(4, 12) then ROTH = 1; *(4) ALL OTHER ASIAN, (12) ALL OTHER ;
                     Else ROTH = 0;
	SEXF = sex;
	*drop sex;

* Encode a 0/1 version of DSM_PTS ;
if DSM_PTS = 5 then PTSD_01 = 0; * (5)=NOT ENDORSED ;
               else PTSD_01 = 1; * (1)=ENDORSED ;

run;

* STEP 4: Run a PROC CONTENTS on the file ;

*Output: pdf file with contents of proc contents on NCSR merged (restricted & unrestricted) data;
ods pdf file = "&myfolders/outputs/contents_NCSR_&sysdate..pdf";
proc contents data = NCSR.ncsr;
run;
ods pdf close;

/* ---

	* Multiple imputation (n-impute = 20) ;
	* EM algorithm to find maximum ;
	* likelihood estimates for a multivariate normal distribution ;

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
	*Using FCS (fully conditional specification) 
	for arbitrary (rather than monotone) 
	pattern of missingness;
run;
--- */
