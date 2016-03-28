* Univariate descriptive statistics for dummy data simulation ;
proc iml;
  use NBER.Mto_jama_preimp_20160111;
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
  close OUTPUTS.preimp_chardesc;
