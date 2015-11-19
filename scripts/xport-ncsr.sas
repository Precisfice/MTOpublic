* Export NCSR data in SASXPORT format for use by SUDAAN ;
/*
libname OUT XPORT "&ncsr./ncsr.xpt";
* TODO: Ensure that only the needed variables are output ;
data OUT.ncsr;
  set NCSR.ncsr(keep=dsm_pts age sexf rhisp rblk roth PT41 PT42 PT43
                     PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
                     PT209 PT211 PT212 PT213 PT214 PT233 PT237
                     NCSRWTSH NCSRWTLG);
run;
*/
* Now also create the format catalog in XPORT format ;
proc format lib=NCSR cntlout=fmtdat;
run;
/* Hangs, which probably means it worked!
proc print data=fmtdat;
  title "So this is what's inside a format!";
run;
*/
libname XOUT XPORT "&ncsr./ncsrlev.xpt";
proc copy in=WORK out=XOUT;
  select fmtdat;
run;
*/
/*  
proc format library=XOUT fmtlib;
run;
*/
/*
   sampleid_num ppid_num f_svy_age_iw f_wt_totsvy 
   mto_ptsd_sample mto_youth YCV13_PT62 YCV14_PT64 YCV14a
   YCV14b_PT64a YCV14c YCV22_PT261
*/
