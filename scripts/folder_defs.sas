/* Set folder definitions local to this SAS workstation */

%LET myfolders = /folders/myfolders;
%LET ncsr = &myfolders./protected/ICPSR_20240/data;
	/*Modify location to match home folder:
	Needs: 
	20240-0002-Data.stc
	20240-0002-Supplemental_syntax.sas
	20240-0005-Data-REST.stc
	20240-0005-Supplemental_syntax-REST.sas
	PTSD_slopes_from_NCSR.csv
	*/
LIBNAME NCSR "&ncsr";
