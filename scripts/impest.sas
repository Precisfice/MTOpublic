/* Attempt to reproduce the PTSD imputation model
 * using SAS PROC SURVEYLOGISTIC instead of SUDAAN.
 * I find that the coefficients themselves match to
 * the 4th decimal place (roughly 1 part in 10^5),
 * and that the variances match to within about 1%
 * in relative terms.
 */
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
