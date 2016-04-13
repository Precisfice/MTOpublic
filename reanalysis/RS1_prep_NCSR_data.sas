/*PROC PRINTTO NEW*/
/*  LOG="&outputs/RS1.log";*/
/*RUN;*/

* I-1: Generate formatted unrestricted and restricted data sets ;
* ---------------------------------------------------------------- ;
options fmtsearch = ( NCSR ); * We put formats into NCSR library ;

* WORK.DA20240P2 & WORK.DA20240P5 to contain respectively unrestricted & restricted data ;
%macro import_ncsr_data;
%IF &workstation = Seattle %THEN %DO;
proc cimport infile="&ncsr/20240-0002-Data.stc" lib=WORK isfileutf8=T; run;
proc cimport infile="&ncsr/20240-0005-Data-REST.stc" lib=WORK isfileutf8=T; run;
%END;
%IF &workstation = SLC %THEN %DO;
proc cimport infile="&ncsr/20240-0002-Data.stc" lib=WORK isfileutf8=F; run;
proc cimport infile="&ncsr/20240-0005-Data-REST.stc" lib=WORK isfileutf8=F; run;
%END;
%mend;

%import_ncsr_data;

* Formatting code provided by ICPSR converts DA20240P(2|5) --> formatted S20240P(2|5) ;
%include "&ncsr/20240-0002-Supplemental_syntax.sas";
%include "&ncsr/20240-0005-Supplemental_syntax-REST.sas";

* I-2: Merge by CPES Case Id ;
* ----------------------------- ;
proc sort data = S20240P2;
by CPESCASE;
run;

data S20240P5;
Set Da20240p5_format;
run;

proc sort data = S20240P5;
by CPESCASE;
run;

data NCSR.ncsr;
merge S20240P2 S20240P5;
by CPESCASE;
run;

* I-3: Encode race, sex, PTSD as used in the imputation model of [1] ;
* --------------------------------------------------------------------- ;
data NCSR.ncsr;
  set NCSR.ncsr;

  IF RANCEST in(7, 8) THEN RHISP = 1;
                      ELSE RHISP = 0;
  IF RANCEST in(9, 10) THEN RBLK = 1; *(9) AFRO-CARIBBEAN, (10) AFRICAN AMERICAN ;
                       ELSE RBLK = 0;
  IF RANCEST in(4, 12) THEN ROTH = 1; *(4) ALL OTHER ASIAN, (12) ALL OTHER ;
                       ELSE ROTH = 0;
  SEXF = sex;

  * Remaining var tweaks in this section were copied from Ptsd-mtoncsr-youth.sas ;

  * Calculate PTSD diagnosis and sub-criteria variables ;
  %include "&folder/Ptsd.sas";

  * Cases to use in NCSR have Worst Event A1,C1,D1 criteria or Random Event A1,C1,D1 criteria ;
  * NB: short varname pts_smpl was used instead of ncsr_pts_sample to maintain v6 compatibility for XPORT ;
  if (dsmptsa1 = 1 and dwptsc1 = 1 and dwptsd1 = 1) or (dsmptsa1 = 1 and drptsc1 = 1 and drptsd1 = 1)
    then pts_smpl = 1;
  else pts_smpl = 0;

  * Use worst event for PTSD data, otherwise use random event PTSD data ;
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

* I-4: Run a PROC CONTENTS ;
* ------------------------ ;

ods pdf file = "&outputs/RS1-NCSR_Contents.pdf";
proc contents data = NCSR.ncsr;
run;
ods pdf close;

* I-5: (Seattle only) Export NCSR data + formats to XPORT files readable by SUDAAN ;
* -------------------------------------------------------------------------------- ;
%macro export_ncsr_for_sudaan;
%IF workstation = Seattle %THEN %DO;
  * Export NCSR data in SASXPORT format for use by SUDAAN ;
  libname OUT XPORT "&ncsr/ncsr.xpt";
  * TODO: Ensure that only the needed variables are output ;
  data OUT.ncsr;
    set NCSR.ncsr(keep=DSM_PTS age sexf rhisp rblk roth PT41 PT42 PT43
                       PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
                       PT209 PT211 PT212 PT213 PT214 PT233 PT237
                       NCSRWTSH NCSRWTLG PTS_SMPL);
  run;

  * Now also create the format catalog in XPORT format ;
  proc format lib=NCSR cntlout=fmtdat;
  run;
  libname XOUT XPORT "&ncsr/ncsrlev.xpt";
  proc copy in=WORK out=XOUT;
    select fmtdat;
  run;
%END;
%mend;

%export_ncsr_for_sudaan;
