
%Let folder =E:\NSCR Replication study\MTO Data and codes;
%Include "&folder\Ptsd_MTO_youth.sas";




/*Begin reproduction code*/

/*Cohort includes those interviewed who were:*/
/*1. between 0-8yo at baseline*/
/*2. between 13-19yo at survey date*/
/*3. between 13-17yo in December 2007 */

Data analysis_set;
set Mental_health_yt_20101004;
where 0<= f_svy_age_bl_imp <=8 and  13 <= f_svy_age_iw <= 19 and 13<= f_svy_age2007_imp <=17;
run;
