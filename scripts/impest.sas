/* Attempt to reproduce the PTSD imputation model
 * using SAS PROC SURVEYLOGISTIC instead of SUDAAN.
 * I find that the coefficients themselves match to
 * the 4th decimal place (roughly 1 part in 10^5),
 * and that the standard errors match to within about
 * 1% in relative terms.
 */
ods pdf file = "&myfolders/outputs/impest.pdf";
proc surveylogistic
  varmethod=taylor
  data=NCSR.ncsr(keep=DSM_PTS age sexf rhisp rblk roth PT41 PT42 PT43
                      PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
                      PT209 PT211 PT212 PT213 PT214 PT233 PT237
                      NCSRWTSH NCSRWTLG PTS_SMPL
                 where=(pts_smpl=1));
  model dsm_pts(event='(1) ENDORSED')
                = age sexf rhisp rblk roth PT41 PT42 PT43
                  PT44 PT45 PT46 PT48 PT50 PT50_1 PT51 PT55
                  PT209 PT211 PT212 PT213 PT214 PT233 PT237;
  weight ncsrwtlg;
run;

/* Additionally, examine the age distribution for questions
 * of generalizability.  How does the pts_sampl=1 population
 * differ from the full NCS-R sample?
 */
proc sort data=NCSR.ncsr;
  by pts_smpl;
proc means data=NCSR.ncsr;
  var age;
  by pts_smpl;
run;

/* Plot a histogram to show the age density clearly,
 * both for pts_smpl=1 and pts_smpl=0 groups.
 */
ods graphics / reset attrpriority=color width=5in height=3in imagename='NCSR_age';
proc sgplot data=NCSR.ncsr;
  histogram age / group=pts_smpl filltype=gradient transparency=0.5
                  nbins=75 name='est';
  density age / group=pts_smpl;
  xaxis display=(nolabel) min=15 max=90;
  yaxis grid;
  keylegend 'est' / location=inside across=1 position=topright;
run;
ods pdf close;

