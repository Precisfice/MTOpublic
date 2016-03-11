PROC PRINTTO NEW
  LOG="&outputs/RS4.log";
RUN;

* This section is adapted from the first few lines of Ptsd_MTO_youth.sas ;
proc sort data = NBER.Mto_jama_preimp_20160111 out = NBER.Mto_jama_preimp_sorted;
by ppid;
run;

data NBER.Mto_jama_preimp_fixed;
set NBER.Mto_jama_preimp_sorted;
format _numeric_;
%include "&folder/Datafix2-mto-youth.sas";
%include "&folder/agefix-youth.sas";
run;
