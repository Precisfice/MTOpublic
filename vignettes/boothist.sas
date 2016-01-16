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

* 2. Plot the superimposed histograms, with density estimates ;
title 'Bootstrapped Estimate of Low-Poverty Voucher Effect on PTSD';
proc sgplot data=bogus_or_ci;
   histogram Odds_Ratio / fillattrs=graphdata1 transparency=0.7 binstart=-3 binwidth=0.05;
   density Odds_Ratio / lineattrs=graphdata1;
   histogram Lower_CL / fillattrs=graphdata2 transparency=0.5 binstart=-3 binwidth=0.05;
   density Lower_CL / lineattrs=graphdata2;
   histogram Upper_CL / fillattrs=graphdata3 transparency=0.5 binstart=-3 binwidth=0.05;
   density Upper_CL / lineattrs=graphdata3;
   keylegend / location=inside position=topright noborder across=2;
   yaxis grid;
   xaxis display=(nolabel) values=(-3 to 3 by 0.5);
run;
