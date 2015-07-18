%LET folder = E:\NSCR Replication study;
Libname NCSR "&folder";
/*First import transport files*/


		/*WORK.DA20240P2 is unrestricted, */
proc cimport infile="&folder\20240-0002-Data.stc" lib=WORK; run;

		/*WORK.DA20240P5 is restricted.*/
proc cimport infile="&folder\20240-0005-Data-REST.stc" lib=WORK; run;

/*Merge by CPES Case Id*/

proc sort data = DA20240P2;
by CPESCASE;
run; 

proc sort data = DA20240P5;
by CPESCASE;
run; 

Data combined NCSR.combined;
merge DA20240P2 DA20240P5;
by CPESCASE;
run; 




ods csv file = "&folder\contents NCSR &sysdate..csv";
proc contents data = combined;
run;
ods csv close; 


/*Logistic regression*/

	/*DSM_PTS (Lifetime)*/
	/*D_PTS12 (DSM-IV Posttraumatic Stress Disorder (12Mo))*/


ods pdf file = "&folder\Gen1 Logistic.pdf";
Proc logistic data = combined;
class sex RANCEST PT41 PT42 PT43 PT44
PT45 PT46 PT48 PT50 PT50_1 PT51 PT55 
PT211 PT212 PT213 PT214 PT233
PT237
;

model D_PTS12 = 
Age sex RANCEST PT41 PT42 PT43 PT44
PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
PT209 PT211 PT212 PT213 PT214 PT233
PT237
;
run;
ods pdf close; 



proc freq data = combined;
tables D_PTS12;
run;
