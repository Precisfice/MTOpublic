%LET folder = E:\NSCR Replication study;
Libname NCSR "&folder";
/*First import transport files*/


		/*WORK.DA20240P2 is unrestricted, */
proc cimport infile="&folder\20240-0002-Data.stc" lib=WORK; run;
	/*Additional formatting code provided by NCSR*/
%Include "&folder\20240-0002-Supplemental_syntax.sas";
	/*Takes Da20240p2 --> generates formatted S20240p2*/

		/*WORK.DA20240P5 is restricted.*/
proc cimport infile="&folder\20240-0005-Data-REST.stc" lib=WORK; run;
	/*Additional formatting code provided by NCSR*/
%include "&folder\20240-0005-Supplemental_syntax-REST.sas";
	/*Takes da20240p5 --> generates formatted da20240p5_format*/


/*Merge by CPES Case Id*/

proc sort data = S20240p2;
by CPESCASE;
run; 

proc sort data = da20240p5_format;
by CPESCASE;
run; 

Data combined NCSR.combined;
merge S20240p2 da20240p5_format;
by CPESCASE;
run; 

ods csv file = "&folder\contents NCSR &sysdate..csv";
proc contents data = combined;
run;
ods csv close; 


/*Modify data to reproduce PTSD coefficients*/
/*data combined_mod;*/
/*Set combined;*/




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
