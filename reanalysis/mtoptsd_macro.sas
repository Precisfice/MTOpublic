/* Macro 'mtopdsd' is copied wholesale from Ptsd_MTO_youth.sas.
 * It computes the several PTSD criteria that were operationalized
 * in the MTO Youth Final Survey, and also cross-walks from NCSR
 * to MTO survey question variables, by renaming MTO variables to
 * their NCSR equivalents.
 * This enables the PTSD imputation model estimated in NCSR to be
 * applied AS-IS to MTO data, without renaming its RHS variables.
 * (It is a dual-purpose macro intended for both A=adult and
 * Y=youth data sets -- hence its 2nd argument.)
 */
%macro mtoptsd(datain, pfx, dataout);

   * MTO Adult questionnaire PTSD data ;
   data &dataout;
   set &datain;

   * Criteria A1 ;
   if &pfx.CV1_PT13 = 1 or &pfx.CV2_PT14 = 1 or &pfx.CV3_PT15 = 1 or &pfx.CV4_PT16 = 1 or &pfx.CV5_PT17 = 1 or
      &pfx.CV6_PT18 = 1 or &pfx.CV7_PT20 = 1 or &pfx.CV8_PT22 = 1 or &pfx.CV9_PT22_1 = 1 or &pfx.CV10_PT23 = 1 or
      &pfx.CV11_PT27 = 1 then f_mh_pts_a1 = 1;
   else f_mh_pts_a1 = 0;

   * Criteria C1 ;
   if sum(&pfx.CV21_PT275 = 1 or &pfx.CV30_PT275 = 1, &pfx.CV15_PT269 = 1 or &pfx.CV24_PT269 = 1,
          &pfx.CV16_PT270 = 1 or &pfx.CV25_PT270 = 1, &pfx.CV17_PT271 = 1 or &pfx.CV26_PT271 = 1,
          &pfx.CV18_PT272 = 1 or &pfx.CV27_PT272 = 1) >= 3 then f_mh_pts_c1 = 1;              * Yes ;
   else f_mh_pts_c1 = 0;

   * Criteria D1 ;
   if (&pfx.CV19_PT273 = 1 or &pfx.CV28_PT273 = 1) and (&pfx.CV20_PT274 = 1 or &pfx.CV29_PT274 = 1)
       then f_mh_pts_d1 = 1;  * Yes ;
   else f_mh_pts_d1 = 0;

   if f_mh_pts_a1 = 1 and f_mh_pts_c1 = 1 and f_mh_pts_d1 = 1 then mto_ptsd_sample = 1;
   else mto_ptsd_sample = 0;

   array PTVAR &pfx.CV1_PT13 &pfx.CV2_PT14 &pfx.CV3_PT15 &pfx.CV4_PT16 &pfx.CV5_PT17
               &pfx.CV6_PT18 &pfx.CV7_PT20 &pfx.CV8_PT22 &pfx.CV9_PT22_1 &pfx.CV10_PT23
               &pfx.CV11_PT27 &pfx.CV13_PT62 &pfx.CV15_PT269 &pfx.CV16_PT270 &pfx.CV17_PT271
               &pfx.CV18_PT272 &pfx.CV19_PT273 &pfx.CV20_PT274 &pfx.CV21_PT275
               &pfx.CV24_PT269 &pfx.CV25_PT270 &pfx.CV26_PT271 &pfx.CV27_PT272 &pfx.CV28_PT273
               &pfx.CV29_PT274 &pfx.CV30_PT275;
   do over PTVAR;
      if PTVAR ^= 1 then PTVAR = 0;
   end;

   * Gender ;
   if f_svy_gender = 'F' then sexf = 1;
   else sexf = 0;

   * Race ;
   rhisp = 0;
   rwh = 0;
   rblk = 0;
   roth = 0;
   if f_svy_ethnic = 1 then rhisp = 1;
   else do;
      if f_svy_race = 1 then rblk = 1;
      else if f_svy_race = 2 then rwh = 1;
      else if f_svy_race IN(3,4,5) then roth = 1;
   end;

   in_mto = 1;

   if 0 <= f_svy_age_iw <= 18 then age = 18;
   else age = f_svy_age_iw;

   * Create corresponding NCSR variables ;
   if &pfx.CV15_PT269 = 1 or &pfx.CV24_PT269 = 1 then PT211 = 1;
   else PT211 = 0;

   if &pfx.CV16_PT270 = 1 or &pfx.CV25_PT270 = 1 then PT212 = 1;
   else PT212 = 0;

   if &pfx.CV17_PT271 = 1 or &pfx.CV26_PT271 = 1 then PT213 = 1;
   else PT213 = 0;

   if &pfx.CV18_PT272 = 1 or &pfx.CV27_PT272 = 1 then PT214 = 1;
   else PT214 = 0;

   if &pfx.CV19_PT273 = 1 or &pfx.CV28_PT273 = 1 then PT233 = 1;
   else PT233 = 0;

   if &pfx.CV20_PT274 = 1 or &pfx.CV29_PT274 = 1 then PT237 = 1;
   else PT237 = 0;

   if &pfx.CV21_PT275 = 1 or &pfx.CV30_PT275 = 1 then PT209 = 1;
   else PT209 = 0;

   format _numeric_;
   rename &pfx.CV1_PT13 = PT41
          &pfx.CV2_PT14 = PT42
          &pfx.CV3_PT15 = PT43
          &pfx.CV4_PT16 = PT44
          &pfx.CV5_PT17 = PT45
          &pfx.CV6_PT18 = PT46
          &pfx.CV7_PT20 = PT48
          &pfx.CV8_PT22 = PT50
          &pfx.CV9_PT22_1 = PT50_1
          &pfx.CV10_PT23 = PT51
          &pfx.CV11_PT27 = PT55;
   run;

%mend mtoptsd;
