%LET workstation = SLC;

%macro map_workstation_dirs;
  %GLOBAL folder;     * code from Kessler et al & NBER ;
  %GLOBAL reanalysis; * code written for the reanalysis ;
  %GLOBAL outputs;    * directory for outputs ;
  %GLOBAL ncsr;       * location of NCSR data files ;
  %GLOBAL mto;        * location of MTO data files ;
  %GLOBAL NBER;       * location of NBER data filer
  %IF &workstation = Seattle %THEN %DO;
    %LET folder = /folders/myfolders;
    %LET reanalysis = &folder/reanalysis;
    %LET outputs = &folder/outputs;
    %LET ncsr = &folder/protected/ICPSR_20240/data;
    * MTO libref undefined on Seattle workstation pending licensing to DNC LLC ;
    *%LET mto = &folder/protected/MTO/data;
  %END;
  
  %IF &workstation = SLC %THEN %DO;
    %LET folder = C:/Users/Anolinx/MTO;
    %LET reanalysis = &folder/reanalysis;
    %LET outputs = &folder/outputs;
    %LET ncsr = E:/NSCR_Replication_study;
    %LET mto = E:/NSCR_Replication_study;
    %LET NBER = &mto/NBER;
  %END;
%mend;

%map_workstation_dirs;

LIBNAME NCSR "&ncsr";
libname mto "&mto";
Libname NBER "&NBER";
libname OUTPUTS "&outputs";


proc sort data = NBER.Mto_jama_preimp_20160111 out = NBER.Mto_jama_preimp_sorted;
by ppid;
run;

data NBER.Mto_jama_preimp_fixed;
set NBER.Mto_jama_preimp_sorted;
format _numeric_;
%include "&folder/Datafix2-mto-youth.sas";
%include "&folder/agefix-youth.sas";
run;


* Univariate descriptive statistics for dummy data simulation ;
proc iml;
  use NBER.Mto_jama_preimp_fixed;
    read all var _NUM_ into preimp_num[colname=NumNames];
    read all var _CHAR_ into preimp_char[colname=CharNames];
  close;

  varname = 'make_space_for_very_long_var_names';
  val = 0; count = 0; * size & type the columns ;
  create OUTPUTS.preimp_numdesc var{varname val count};
  do i=1 to ncol(preimp_num);
    call tabulate(val, count, preimp_num[,i], "missing");
    varname = repeat(NumNames[i], ncol(count), 1);
    append;
  end;
  delete all where (count < 10);
  close OUTPUTS.preimp_numdesc;

  varname = 'make_space_for_very_long_var_names';
  val = 'enough space for length-42 f_svy_final_desc';
  count = 0; * size & type the columns ;
  create OUTPUTS.preimp_chardesc var{varname val count};
  do i=1 to ncol(preimp_char);
    call tabulate(val, count, preimp_char[,i], "missing");
    varname = repeat(CharNames[i], ncol(count), 1);
    append;
  end;
  delete all where (count < 10);
  close OUTPUTS.preimp_chardesc;
quit;
