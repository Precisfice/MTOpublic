PROC PRINTTO NEW
  LOG="&outputs/RS4.log";
RUN;

* This section is adapted from the first few lines of Ptsd_MTO_youth.sas ;
proc sort data = mto.mental_health_yt_20150612 out = mental_health_yt_20101004;
by ppid;
run;

data mental_health_yt_20101004;
set mental_health_yt_20101004;
format _numeric_;
%include "&folder/Datafix2-mto-youth.sas";
%include "&folder/agefix-youth.sas";
run;

ods pdf file = "&outputs/RS4-MTO_Contents.pdf";
Title "MTO Contents";
proc contents data =mental_health_yt_20101004 ;
run;
ods pdf close; 
