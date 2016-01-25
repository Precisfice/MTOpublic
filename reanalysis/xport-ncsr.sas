%IF workstation = Seattle %THEN %DO;

* Export NCSR data in SASXPORT format for use by SUDAAN ;
libname OUT XPORT "&ncsr./ncsr.xpt";
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
libname XOUT XPORT "&ncsr./ncsrlev.xpt";
proc copy in=WORK out=XOUT;
  select fmtdat;
run;

%END;
