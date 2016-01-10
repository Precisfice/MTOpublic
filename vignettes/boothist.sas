/* This is a 'SAS vignette' aiming to prototype code a histogram
 * for visualizing our bootstrapped voucher->PTSD effects estimates.
 */
 
/* 1. Generate data to stand in for 'or_ci' of simbetas.sas.
 *    (To lend some realism to this exercise, we simulate the
 *    sampling distribution for mean and 95% confidence limits
 *    of a Standard Normal variate.) 
 */
%let N = 25;
%let T = 2500;
data bogus_or_ci;
  keep Odds_Ratio Lower_CL Upper_CL;
  do i = 1 to &T.;
    Odds_Ratio = rand("Normal")/sqrt(&N.);
    SumSqDev = rand("ChiSquare", (&N.-1));
    EstSampVar = SumSqDev/&N.;
    EstSampSD = sqrt(EstSampVar);
    Lower_CL = Odds_Ratio - 1.96*EstSampSD;
    Upper_CL = Odds_Ratio + 1.96*EstSampSD;
    output;
  end;
run;

proc means data=bogus_or_ci;
run;

* 2. Stack the data in value-attribute fashion to support overlays ;
data grouped_or_ci;
  keep x varname;
  set bogus_or_ci(in=OR rename=(Odds_Ratio=x))
      bogus_or_ci(in=LL rename=(Lower_CL=x))
      bogus_or_ci(in=UL rename=(Upper_CL=x));
  if      OR=1 then varname = "Odds Ratio";
  else if LL=1 then varname = "Lower CL";
  else if UL=1 then varname = "Upper CL";
  *end;
run;

*PROC PRINT DATA=grouped_or_ci;
*RUN;

* 3. Plot the histogram  for 'Ods Ratio' column ;
ods graphics / reset attrpriority=color width=5in height=3in imagename='BootstrappedORs';
title 'Bootstrapped Estimate of Low-Poverty Voucher Effect on PTSD';
proc sgplot data=grouped_or_ci;
  histogram x / group=varname filltype=gradient transparency=0.5 nbins=400 name='est';
  density x / group=varname;
  xaxis display=(nolabel) min=-3 max=3;
  yaxis grid;
  keylegend 'est' / location=inside across=1 position=topright;
run;

