* Additionally, examine the age distribution for questions ;
* of generalizability.  How does the pts_smpl=1 population ;
* differ from the full NCS-R sample? ;
ods pdf file = "&outputs/RS5-Age_MTO_vs_NCSR.pdf";
title "Age distributions in NCSR and MTO barely overlap";
proc sort data=NCSR.ncsr;
  by pts_smpl;
proc means data=NCSR.ncsr;
  var age;
  by pts_smpl;
run;

* Plot a histogram to show the age density clearly, ;
* both for pts_smpl=1 and pts_smpl=0 groups.        ;
ods graphics / reset attrpriority=color width=5in height=3in imagename='NCSR_age';

%macro plot_age_dens;
%IF &workstation = Seattle %THEN %DO;
proc sgplot data=NCSR.ncsr;
  histogram age / group=pts_smpl filltype=gradient transparency=0.5
                  nbins=75 name='est';
  density age / group=pts_smpl;
  xaxis display=(nolabel) min=15 max=90;
  yaxis grid;
  keylegend 'est' / location=inside across=1 position=topright;
run;
%END;
%IF &workstation = SLC %THEN %DO;
proc sgplot data=NCSR.ncsr;
  histogram age/ nbins=75 name='est';
  density age;
  xaxis display=(nolabel) min=15 max=90;
  yaxis grid;
  keylegend 'est' / location=inside across=1 position=topright;
  by pts_smpl;
run;
%END;
%mend;
%plot_age_dens;
ods pdf close;

* TODO: Plot a similar histogram demonstrating the negligible overlap ;
*       of the age distributions of MTO and NCS-R.                    ;

/*Plotting Age histogram demonstrating the negligible overlap
      of the age distributions of MTO and NCS-R in R*/

Data NCSR_AGES;
SET NCSR.NCSR;
Survey ="(1) NCSR";
keep Age survey;
run;

DATA MTO_AGES;
Set MTO.Mto_jama_preimp_fixed;
Age =  f_svy_age_iw;
Survey="(2) MTO ";
 keep Age survey;
 run;

data Ages;
Set NCSR_AGES MTO_AGES;
run;
