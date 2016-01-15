***********************************************************************************
* PROGRAM: Bipolar-mto-youth.sas                                                  *         
* DATE: 4/15/10                                                                   * 
* Check whether Criteria are met for Bipolar I, Bipolar II, Bipolar subthrheshold *
* MTO Youth                                                                       *
* New and old Version of Bipolar                                                  *
* Onset, recency of Bipolar I, Bipolar II, Bipolar subthreshold                   *
* are calculated                                                                  *
*                                                                                 *
***********************************************************************************;

/* Old Bipolar diagnosis */

%macro bipold;

/* Bipolar I -- DSM-IV criteria               */

f_mh_bipolarI_old = mh_man_old;

if f_mh_bipolarI_old = 1 then do;    /* Onset, recency for DSM-IV Bipolar I */

   bipolarI_ond_old = man_ond_old;
   bipolarI_recd_old = max(man_recd_old, f_mh_dep_rec_yt);

end;

/* Bipolar II -- DSM-IV criteria               */

************************************************************************************************
* Criteria A: Presence (or history) of one or more Major Deprssive Episodes                    *
*                                                                                              *      
*             F_MH_DEP_EVR = Yes(1)                                                            *   
************************************************************************************************;      

if f_mh_dep_evr_yt = 1 then f_mh_bipolarIIa_old = 1 ;
else f_mh_bipolarIIa_old = 5;


************************************************************************************************
* Criteria B: Presence (or history) of at least one Hypomanic Episode                          *
*                                                                                              *      
*            MH_HYP_OLD = Yes(1)                                                               *   
************************************************************************************************;      

if mh_hyp_old = 1 then f_mh_bipolarIIb_old = 1 ;
else f_mh_bipolarIIb_old = 5;

************************************************************************************************
* Criteria C: There has never been a Manic Episode or Mixed Episode                            *
*                                                                                              *      
*                      DSM_MAN_OLD is NOT Yes(1)                                               *   
************************************************************************************************;      

if mh_man_old ^= 1 then f_mh_bipolarIIc_old = 1 ;
else f_mh_bipolarIIc_old = 5;

**************************************************************************************************
* Criteria E: The symptoms cause clinically significant distress or impairment in social,        *
*             occupational, or other important areas of functioning.                             *
*                                                                                                *      
*             YMA9_M9 is (3,4,5)                                                                 *
*                                                                                                *
*             Note: M9a, M27 series, M29, M33 from NCSR are deleted                              *
**************************************************************************************************;      

if YMA9_M9 IN(3,4,5) then f_mh_bipolarIIe_old = 1;        /* Yes */
else if YMA9_M9 IN (1,2) then f_mh_bipolarIIe_old = 5;    /* No */
else if YMA9_M9 = .D then f_mh_bipolarIIe_old = 9;        /* Don't know */
else if YMA9_M9 = .R then f_mh_bipolarIIe_old = 8;        /* Refuse */

********************************************************************************
* Check if all criteria are met for DSM-IV Bipolar II                          *
********************************************************************************;

if f_mh_bipolarIIa_old = 1 and f_mh_bipolarIIb_old = 1 and f_mh_bipolarIIc_old = 1 and
   f_mh_bipolarIIe_old = 1 then f_mh_bipolarII_old = 1;                        *All criteria are met;
else f_mh_bipolarII_old = 5;                                                   *criteria are not met;

*********************************************************************************
* Calculate Onset, Recency of Bipolar II for DSM                                *                             
*********************************************************************************;

bipolarII_on_old = min(YMA10a_M18a, YMA10b_M18b1);     /* Bipolar II onset */

if bipolarII_on_old IN(.D,.R) then bipolarII_on_old = .;

bipolarII_rec_old = max(f_mh_dep_rec_yt, hyp_recd_old);  /* Bipolar II recency */

if f_mh_bipolarII_old = 1 then do;             /* Bipolar II onset, recency, persistence for DSM */
   bipolarII_ond_old = bipolarII_on_old;       /* assigned only if Bipolar II criteria are met */
   bipolarII_recd_old = bipolarII_rec_old;
end;

%mend bipold;

%bipold;

/* New Bipolar diagnosis */

%macro bipolar;

%macro tdy_bip(newvar,part1,part2);

*Calculate length of time in days, from # of units and unit of time;

   if &part1 < 99998 then do;
      select (&part2);
         when(1) &newvar = &part1 / 24;
         when(2) &newvar = &part1;
         when(3) &newvar = 7*&part1;
         when(4) &newvar = 30*&part1;
         when(5) &newvar = 365*&part1;
         otherwise;
      end;
   end;
   if &newvar >= 99998 then &newvar = 99995;
   if &part1 IN(.D,.R) then &newvar = .;

%mend tdy_bip;

%macro tyr_bip(newvar,part1,part2);

*Calculate length of time in years, from # of units and unit of time; 

   if &part1 < 99998 then do;
      select (&part2);
         when(1) &newvar = &part1 / (365 * 24); 
         when(2) &newvar = &part1 / 365; 
         when(3) &newvar = &part1 / 52; 
         when(4) &newvar = &part1 / 12; 
         when(5) &newvar = &part1; 
         otherwise;
      end; 
   end;
   if &part1 IN(.D,.R) then &newvar = .;

%mend tyr_bip;

%tdy_bip(M3b_day, YMA2b_M3b, YMA2c_M3b);  /* Calculate total time for variables */
%tdy_bip(M3d_day, YMA2e_M3d, YMA2f_M3d);
%tdy_bip(M6b_day, YMA6b_M6b, YMA6c_M6b);
%tdy_bip(M6d_day, YMA6e_M6d, YMA6f_M6d);

man_dur = max(M3b_day, M3d_day, M6b_day, M6d_day);

n_mansym = sum(mh_manb1 = 1, mh_manb2 = 1, mh_manb3 = 1, mh_manb4 = 1, mh_manb5 = 1, mh_manb6 = 1, mh_manb7 = 1);

/* New Bipolar categories */
if f_mh_bipolarI_old = 1 and n_mansym >= 6 and
   sum(YMA7b_M7b = 1, YMA7c_M7c = 1, YMA7k_M7k = 1, YMA7l_M7l = 1, YMA7o_M7o = 1) >= 2 then cidi_bipolar = 5;
else if (f_mh_bipolarI_old = 1 and f_mh_dep_evr_yt = 1 and YMA1_M1 = 1 and YMA7i_M7i = 1) or
        (f_mh_bipolarII_old = 1 and man_dur >= 14 and
         sum(YMA7b_M7b = 1, YMA7c_M7c = 1, YMA7k_M7k = 1, YMA7l_M7l = 1, YMA7o_M7o = 1) >= 2)
   then cidi_bipolar = 4;
else if f_mh_bipolarII_old = 1 or 
       (f_mh_bipolarI_old = 1 and (f_mh_dep_evr_yt ^= 1 or YMA1_M1 ^= 1 or YMA7i_M7i ^= 1)) 
   then cidi_bipolar = 3;
else if mh_hyp_old = 1 then cidi_bipolar = 2;
else cidi_bipolar = 1;

if cidi_bipolar = 5 then f_mh_bipolarI_evr_yt = 1;    /* Bipolar I */
else f_mh_bipolarI_evr_yt = 0;

if cidi_bipolar = 4 then f_mh_bipolarII_evr_yt = 1;    /* Bipolar II */
else f_mh_bipolarII_evr_yt = 0;

if cidi_bipolar IN(2,3) then f_mh_bipolarsub_evr_yt = 1;   /* Bipolar sub-threshold */
else f_mh_bipolarsub_evr_yt = 0;

**************************************************************
* Create mania, hypomania, sub-hypomania variables           *
**************************************************************;

f_mh_man_evr_yt = f_mh_bipolarI_evr_yt;

if f_mh_bipolarII_evr_yt = 1 or (f_mh_bipolarsub_evr_yt = 1 and f_mh_bipolarI_old = 1) then f_mh_hyp_evr_yt = 1;
else f_mh_hyp_evr_yt = 0;

if f_mh_bipolarsub_evr_yt = 1 and (f_mh_bipolarII_old = 1 or mh_hyp_old = 1) then f_mh_hypsub_evr_yt = 1;
else f_mh_hypsub_evr_yt = 0;

/* Calculate onset and recency ages and persistence   */

man_on = min(YMA10a_M18a, YMA10b_M18b1);   /* Mania onset */

if man_on IN(.D,.R) then man_on = .;

if YMA2_M3 = 1 then do;
   man_rec1 = YMA2a_M3a;                     /* Mania recency */        
   man_per1 = M3by;                    /* Mania persistence*/
end; 
else if YMA2_M3 IN(5,.D,.R) then do;
   man_rec1 = YMA2d_M3c;                      /* Mania recency */      
   man_per1 = M3dy;                     /* Mania persistence */
end;
if YMA5_M6 = 1 then do;
   man_rec2 = YMA6a_M6a;                     /* Mania recency */        
   man_per2 = M6by;                    /* Mania persistence */
end; 
else if YMA5_M6 IN(5,8,9) then do;
   man_rec2 = YMA6d_M6c;                     /* Mania recency */      
   man_per2 = M6dy;                    /* Mania persistence */
end;

if man_rec1 IN(.D,.R) then man_rec1 = .;
if man_rec2 IN(.D,.R) then man_rec2 = .;

if YMA11_M19 = 1 then man_rec3 = f_svy_age_iw;
else man_rec3 = YMA13_M19d;
if man_rec3 IN(.D,.R) then man_rec3 = .;

man_rec = max(man_rec1, man_rec2, man_rec3);

hyp_on = min(YMA10a_M18a, YMA10b_M18b1);   /* Hypomania onset */
if hyp_on IN(.D, .R) then mh_hyp_on = .;

if YMA2_M3 = 1 then do;
   hyp_rec1 = YMA2a_M3a;               /* Hypomania recency */        
   hyp_per1 = M3by;                    /* Hypomania persistence*/
end; 
else if YMA2_M3 IN(5,.D,.R) then do;
       hyp_rec1 = YMA2d_M3c;                /* Hypomania recency */      
       hyp_per1 = M3dy;                     /* Hypomania persistence */
end;
if YMA5_M6 = 1 then do;
   hyp_rec2 = YMA6a_M6a;                 /* Hypomania recency */        
   hyp_per2 = M6by;                      /* Hypomania persistence */
end; 
else if YMA5_M6 IN(5,8,9) then do;
   hyp_rec2 = YMA6d_M6c;               /* Hypomania recency */      
   hyp_per2 = M6dy;                    /* Hypomania persistence */
end;

if YMA11_M19 = 1 then hyp_rec3 = f_svy_age_iw;
else hyp_rec3 = YMA13_M19d;

if hyp_rec1 IN(.D,.R) then hyp_rec1 = .;
if hyp_rec2 IN(.D,.R) then hyp_rec2 = .;
if hyp_rec3 IN(.D,.R) then hyp_rec3 = .;

hyp_rec = max(hyp_rec1, hyp_rec2, hyp_rec3);

if hyp_on IN(.D,.R) then hyp_on = .;
if hyp_rec IN(.D,.R) then hyp_rec = .;

if f_mh_man_evr_yt = 1 then do;    /* Onset, recency for DSM-IV Mania */
   f_mh_man_aoo_yt = man_on;
   f_mh_man_rec_yt = man_rec;
end;

if f_mh_hyp_evr_yt = 1 then do;    /* Onset, recency for DSM-IV Hypomania */
   f_mh_hyp_aoo_yt = hyp_on;
   f_mh_hyp_rec_yt = hyp_rec;
end;

if f_mh_hypsub_evr_yt = 1 then do;    /* Onset, recency for DSM-IV Sub-Hypomania */
   f_mh_hypsub_aoo_yt = hyp_on;
   f_mh_hypsub_rec_yt = hyp_rec;
end;

if f_mh_bipolarI_evr_yt = 1 then do;    /* Onset, recency for DSM-IV Bipolar I */
   f_mh_bipolarI_aoo_yt = man_on;
   f_mh_bipolarI_rec_yt = max(f_mh_man_rec_yt, f_mh_dep_rec_yt);
end;

bipolarII_on = min(YMA10a_M18a, YMA10b_M18b1);     /* Bipolar II onset */

if bipolarII_on IN(.D,.R) then bipolarII_on = .;

bipolarII_rec = max(f_mh_dep_rec_yt, hyp_rec);  /* Bipolar II recency */
if bipolarII_rec IN(.D,.R) then bipolarII_rec = .;

if f_mh_bipolarII_evr_yt = 1 and f_mh_bipolarI_old = 1 then do;    /* Onset, recency for new DSM-IV Bipolar I */
   f_mh_bipolarII_aoo_yt = man_on;                             /* with old DSM-IV Bipolar I                */
   f_mh_bipolarII_rec_yt = max(man_rec,f_mh_dep_rec_yt);
end;
if f_mh_bipolarII_evr_yt = 1 and f_mh_bipolarII_old = 1 then do;    /* Onset, recency for new DSM-IV Bipolar II */
   f_mh_bipolarII_aoo_yt = bipolarII_on;                        /* with old DSM-IV Bipolar II               */
   f_mh_bipolarII_rec_yt = bipolarII_rec;
end;

if f_mh_bipolarsub_evr_yt = 1 and f_mh_bipolarI_old = 1 then do;    /* Onset, recency for DSM-IV Bipolar Subthreshold */
   f_mh_bipolarsub_aoo_yt = man_on;                                 /* with old DSM-IV Bipolar I                      */
   f_mh_bipolarsub_rec_yt = max(man_rec, f_mh_dep_rec_yt);
end;
if f_mh_bipolarsub_evr_yt = 1 and f_mh_bipolarII_old = 1 then do;    /* Onset, recency for DSM-IV Bipolar Subthreshold */
   f_mh_bipolarsub_aoo_yt = bipolarII_on;                            /* with old DSM-IV Bipolar II                     */
   f_mh_bipolarsub_rec_yt = bipolarII_rec; 
end; 
if f_mh_bipolarsub_evr_yt = 1 and f_mh_bipolarI_old ^= 1 and f_mh_bipolarII_old ^ = 1 and
   mh_hyp_old = 1 then do;                                       /* Onset, recency for DSM-IV Bipolar Subthreshold */
   f_mh_bipolarsub_aoo_yt = bipolarII_on;                           /* with DSM-IV Hypomania without Bipolar I/II     */
   f_mh_bipolarsub_rec_yt = bipolarII_rec;
end;

if f_mh_bipolarsub_evr_yt = 1 and
   (YDE14_D38 = 1 or YMA11_M19 = 1 or
       (f_svy_age_iw ~IN(.,.D,.R) and       
         (YMA2a_M3a = f_svy_age_iw or YMA2d_M3c = f_svy_age_iw or YMA6a_M6a = f_svy_age_iw or 
          YMA6d_M6c = f_svy_age_iw or YMA10a_M18a = f_svy_age_iw or YMA10b_M18b1 = f_svy_age_iw or 
          YMa13_M19d = f_svy_age_iw or YDE13a_D37a = f_svy_age_iw or YDE13b_D37b1 = f_svy_age_iw or 
          YDE14b_D38c = f_svy_age_iw
         )
       )
    ) then f_mh_bipolarsub_rec_yt = f_svy_age_iw;

%mend bipolar;

%bipolar;