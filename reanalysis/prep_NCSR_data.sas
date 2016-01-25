/*First import transport files*/

* STEP 1: Generate formatted unrestricted and restricted data sets ;
* We'll put formats into 'NCSR' library ;
options fmtsearch = ( NCSR );

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
	
* STEP 4: Var tweaks copied verbatim from 'Ptsd-mtoncsr-youth.sas'

/* Calculate PTSD diagnosis and sub-criteria variables */
*%include '/home/jin/WMH/NSHS/REPLICATION/DIAGNOSIS/Ptsd.sas';
%include "&folder./Ptsd.sas";

/* Cases to use in NCSR have Worst Event A1,C1,D1 criteria or Random Event A1,C1,D1 criteria  */
/* NB: The var name 'pts_smpl' is used instead of 'ncsr_pts_sample'
       to maintain v6 compatibility for XPORT */
if (dsmptsa1 = 1 and dwptsc1 = 1 and dwptsd1 = 1) or (dsmptsa1 = 1 and drptsc1 = 1 and drptsd1 = 1) 
   then pts_smpl = 1;
else pts_smpl = 0;

/* Use worst event for PTSD data, otherwise use random event PTSD data */
if PT69 ^= . then PT209 = PT69;
if PT71 ^= . then PT211 = PT71;
if PT72 ^= . then PT212 = PT72;
if PT73 ^= . then PT213 = PT73;
if PT74 ^= . then PT214 = PT74;
if PT102 ^= . then PT233 = PT102;
if PT106 ^= . then PT237 = PT106;

array PTVAR PT41-PT46 PT48 PT50 PT50_1 PT51 PT55 PT209-PT214 PT233 PT237;
do over PTVAR;
   if PTVAR ^= 1 then PTVAR = 0;
end;

if dsm_pts ^= 1 then dsm_pts = 0;

run;

* STEP 5: Run a PROC CONTENTS on the file ;

*Output: pdf file with contents of proc contents on NCSR merged (restricted & unrestricted) data;
ods pdf file = "&outputs./contents_NCSR_&sysdate..pdf";
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
