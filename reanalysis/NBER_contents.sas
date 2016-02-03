LIBNAME NBER "E:\NSCR_Replication_study\NBER";

ods pdf file = "E:\NSCR_Replication_study\NBER\contents mto_jama_preimp_20160111.pdf";
proc contents data = NBER.mto_jama_preimp_20160111;
run;
ods pdf close; 

ods pdf file = "E:\NSCR_Replication_study\NBER\contents mto_jama_imputed_20160111.pdf";
proc contents data = NBER.mto_jama_imputed_20160111;
run;
ods pdf close; 
