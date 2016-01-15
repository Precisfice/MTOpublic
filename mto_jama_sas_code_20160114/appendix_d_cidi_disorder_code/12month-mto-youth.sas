*************************************************************************************************
* PROGRAM: 12month-mto-youth.sas                                                                *
* DATE: 4/9/10                                                                                  *
*                                                                                               *
* MTO Youth                                                                                     *
* Determines 12 month diagnosis for DSM-IV                                                      *
*************************************************************************************************;

%macro month12;

/* 12 month prevalence Depression MTO Youth */

if f_mh_dep_evr_yt = 1 and
   (YDE14_D38 = 1 or
       ( 
         f_svy_age_iw NOT IN(.D,.R,.) and 
         (YDE6a_D22a = f_svy_age_iw or YDE6d_D22c = f_svy_age_iw or YDE13a_D37a = f_svy_age_iw or 
          YDE13b_D37b1 = f_svy_age_iw or YDE14b_D38c = f_svy_age_iw)
       )
   ) then f_mh_dep_y_yt = 1;
else f_mh_dep_y_yt = 0;

/* 12 month prevalence Major Depressive Disorder MTO Youth */

if f_mh_deph_evr_yt = 1 and
   (YDE14_D38 = 1 or
       ( 
         f_svy_age_iw NOT IN(.D,.R,.) and 
         (YDE6a_D22a = f_svy_age_iw or YDE6d_D22c = f_svy_age_iw or YDE13a_D37a = f_svy_age_iw or 
          YDE13b_D37b1 = f_svy_age_iw or YDE14b_D38c = f_svy_age_iw)
       )
   ) then f_mh_deph_y_yt = 1;
else f_mh_deph_y_yt = 0;

/* 12 month prevalence old Mania MTO Youth  */

if mh_man_old = 1 and
   (YMA11_M19 = 1 or
      (f_svy_age_iw ~IN(.D,.R,.) and
         (YMA2a_M3a = f_svy_age_iw or YMA2d_M3c = f_svy_age_iw or YMA6a_M6a = f_svy_age_iw or 
          YMA6d_M6c = f_svy_age_iw or YMA10a_M18a = f_svy_age_iw or YMA10b_M18b1 = f_svy_age_iw or 
          YMA13_M19d = f_svy_age_iw)
      ) 
   ) then mh_man_y_old = 1;
else mh_man_y_old = 0;

/* 12 month prevalence Mania MTO Youth  */

if f_mh_man_evr_yt = 1 and
   (YMA11_M19 = 1 or
      (f_svy_age_iw ~IN(.D,.R,.) and
         (YMA2a_M3a = f_svy_age_iw or YMA2d_M3c = f_svy_age_iw or YMA6a_M6a = f_svy_age_iw or 
          YMA6d_M6c = f_svy_age_iw or YMA10a_M18a = f_svy_age_iw or YMA10b_M18b1 = f_svy_age_iw or 
          YMA13_M19d = f_svy_age_iw)
      ) 
   ) then f_mh_man_y_yt = 1;
else f_mh_man_y_yt = 0;

/* 12 month prevalence old Hypomania MTO Youth  */

if mh_hyp_old = 1 and
   (YMA11_M19 = 1 or
      (f_svy_age_iw ~IN(.D,.R,.) and
         (YMA2a_M3a = f_svy_age_iw or YMA2d_M3c = f_svy_age_iw or YMA6a_M6a = f_svy_age_iw or 
          YMA6d_M6c = f_svy_age_iw or YMA10a_M18a = f_svy_age_iw or YMA10b_M18b1 = f_svy_age_iw or 
          YMA13_M19d = f_svy_age_iw)
      ) 
   ) then mh_hyp_y_old = 1;
else mh_hyp_y_old = 0;

/* 12 month prevalence Hypomania MTO Youth  */

if f_mh_hyp_evr_yt = 1 and
   (YMA11_M19 = 1 or
      (f_svy_age_iw ~IN(.D,.R,.) and
         (YMA2a_M3a = f_svy_age_iw or YMA2d_M3c = f_svy_age_iw or YMA6a_M6a = f_svy_age_iw or 
          YMA6d_M6c = f_svy_age_iw or YMA10a_M18a = f_svy_age_iw or YMA10b_M18b1 = f_svy_age_iw or 
          YMA13_M19d = f_svy_age_iw)
      ) 
   ) then f_mh_hyp_y_yt = 1;
else f_mh_hyp_y_yt = 0;

/* 12 month prevalence Sub Hypomania MTO Youth  */

if f_mh_hypsub_evr_yt = 1 and
   (YMA11_M19 = 1 or
      (f_svy_age_iw ~IN(.D,.R,.) and
         (YMA2a_M3a = f_svy_age_iw or YMA2d_M3c = f_svy_age_iw or YMA6a_M6a = f_svy_age_iw or 
          YMA6d_M6c = f_svy_age_iw or YMA10a_M18a = f_svy_age_iw or YMA10b_M18b1 = f_svy_age_iw or 
          YMA13_M19d = f_svy_age_iw)
      ) 
   ) then f_mh_hypsub_y_yt = 1;
else f_mh_hypsub_y_yt = 0;

/* 12 month prevalence old BipolarI MTO Youth  */

if f_mh_bipolarI_old = 1 and
   (f_mh_dep_y_yt = 1 or mh_man_y_old = 1) then f_mh_bipolarI12_old = 1;
else f_mh_bipolarI12_old = 0;

/* 12 month prevalence old BipolarII MTO Youth  */

if f_mh_bipolarII_old = 1 and
   (f_mh_dep_y_yt = 1 or mh_hyp_y_old = 1) then f_mh_bipolarII12_old = 1;
else f_mh_bipolarII12_old = 0;

/* 12 month prevalence BipolarI MTO Youth  */

if f_mh_bipolarI_evr_yt = 1 and
   (f_mh_dep_y_yt = 1 or mh_man_y_old = 1 or man_rec = f_svy_age_iw) then f_mh_bipolarI_y_yt = 1;
else f_mh_bipolarI_y_yt = 0;

/* 12 month prevalence BipolarII MTO Youth  */

if f_mh_bipolarII_evr_yt = 1 and f_mh_bipolarI_old = 1 and
   (f_mh_dep_y_yt = 1 or mh_man_y_old = 1) then f_mh_bipolarII_y_yt = 1;
else if f_mh_bipolarII_evr_yt = 1 and f_mh_bipolarII_old = 1 and
   (f_mh_dep_y_yt = 1 or mh_hyp_y_old = 1) then f_mh_bipolarII_y_yt = 1;
else f_mh_bipolarII_y_yt = 0;

/* 12 month prevalence Bipolar Sub MTO Youth  */

if f_mh_bipolarsub_evr_yt = 1 and
   (YDE14_D38 = 1 or YMA11_M19 = 1 or
       (f_svy_age_iw ~IN(.,998,999) and       
         (YMA2a_M3a = f_svy_age_iw or YMA2d_M3c = f_svy_age_iw or YMA6a_M6a = f_svy_age_iw or 
          YMA6d_M6c = f_svy_age_iw or YMA10a_M18a = f_svy_age_iw or YMA10b_M18b1 = f_svy_age_iw or 
          YMA13_M19d = f_svy_age_iw or YDE13a_D37a = f_svy_age_iw or YDE13b_D37b1 = f_svy_age_iw or 
          YDE14b_D38c = f_svy_age_iw
         )
       )
    ) then f_mh_bipolarsub_y_yt = 1;    /* Yes */
else if f_mh_bipolarsub_evr_yt ^= 1 or 
     (N(YMA2a_M3a,YMA2d_M3c,YMA6a_M6a,YMA6d_M6c,YMA10a_M18a,YMA10b_M18b1,YMA11_M19,YMA13_M19d) > 0 and
      N(YDE6a_D22a, YDE6d_D22c, YDE13a_D37a, YDE13b_D37b1, YDE14_D38, YDE14b_D38c) > 0)
      then f_mh_bipolarsub_y_yt = 0;    /* No */
else f_mh_bipolarsub_y_yt = 0;

/* Fix bipolarsub_recd for cases with 12 month bipolarsub */
if f_mh_bipolarsub_y_yt = 1 and f_mh_bipolarsub_rec_yt ^= f_svy_age_iw then f_mh_bipolarsub_rec_yt = f_svy_age_iw;

/* 12 month prevalence GAD MTO Youth  */

if f_mh_gad_evr_yt = 1 and
    (YGA12_G27 = 1 or 
       (f_svy_age_iw NOT IN(.D,.R,.) and
          (YGA11a_G26a = f_svy_age_iw or YGA11b_G26b1 = f_svy_age_iw or YGA12c_G27c = f_svy_age_iw)
       )
    ) then f_mh_gad_y_yt = 1;
else f_mh_gad_y_yt = 0;

/* 12 month prevalence GAD with hierarchy MTO Youth */

if f_mh_gadh_evr_yt = 1 and
    (YGA12_G27 = 1 or 
       (f_svy_age_iw NOT IN(.D,.R,.) and
          (YGA11a_G26a = f_svy_age_iw or YGA11b_G26b1 = f_svy_age_iw or YGA12c_G27c = f_svy_age_iw)
       )
    ) then f_mh_gadh_y_yt = 1;
else f_mh_gadh_y_yt = 0;

/* 12 month prevalence Panic Attack MTO Youth  */

if f_mh_pat_evr_yt = 1 and
    (YPD7_PD10 = 1 or
        (f_svy_age_iw NOT IN(.D,.R,.) and
            (YPD5a_PD9a = f_svy_age_iw or YPD5b_PD9b1 = f_svy_age_iw or YPD7c_PD10d = f_svy_age_iw)
        )
    ) then f_mh_pat_y_yt = 1;
else f_mh_pat_y_yt = 0;

/* 12 month prevalence Panic Disorder MTO Youth  */

if f_mh_pds_evr_yt = 1 and
    (YPD7_PD10 = 1 or 
        (f_svy_age_iw NOT IN(.D,.R,.) and
            (YPD5a_PD9a = f_svy_age_iw or YPD5b_PD9b1 = f_svy_age_iw or YPD7c_PD10d = f_svy_age_iw)
        )
    ) then f_mh_pds_y_yt = 1;
else f_mh_pds_y_yt = 0;

/* 12 month prevalence Intermittent Explosive Disorder MTO Youth */

if f_mh_ied_evr_yt = 1 and
   (YIE9_IED22 IN(1,2,3) or
       ( 
         f_svy_age_iw NOT IN(.D,.R,.) and 
         (YIE8a_IED18a = f_svy_age_iw or YIE8b_IED18b1 = f_svy_age_iw or YIE9a_IED22a = f_svy_age_iw)
       )
   ) then f_mh_ied_y_yt = 1;
else f_mh_ied_y_yt = 0;

/* 12 month prevalence Intermittent Explosive Disorder MTO Youth */

if f_mh_iedh_evr_yt = 1 and
   (YIE9_IED22 IN(1,2,3) or
       ( 
         f_svy_age_iw NOT IN(.D,.R,.) and 
         (YIE8a_IED18a = f_svy_age_iw or YIE8b_IED18b1 = f_svy_age_iw or YIE9a_IED22a = f_svy_age_iw)
       )
   ) then f_mh_iedh_y_yt = 1;
else f_mh_iedh_y_yt = 0;

/* 12 month PTSD MTO Youth */
/* Cases where HCV14b_PT64a or HCV14c = interview age or HCV22_PT261 is Yes */

if f_mh_pts_evr_yt = 1 and
   (
      (f_svy_age_iw NOT IN(.D,.R,.) and
          (YCV14b_PT64a = f_svy_age_iw or YCV14c = f_svy_age_iw)
      ) or
      YCV22_PT261 = 1 
   ) then f_mh_pts_y_yt = 1;
else f_mh_pts_y_yt = 0;

/* 12 month prevalence Oppositional Defiant Disorder MTO Youth  */

if f_mh_odd_evr_yt = 1 and
    (YOD4_OD4 = 1 or 
        (f_svy_age_iw NOT IN(.D,.R,.) and
           (YOD3a_OD3a = f_svy_age_iw or YOD3b_OD3b1 = f_svy_age_iw or YOD4a_OD4a = f_svy_age_iw)
        )
    ) then f_mh_odd_y_yt = 1;
else f_mh_odd_y_yt = 0;

/* 12 month prevalence Oppositional Defiant Disorder MTO Youth DSM-IV  */

if f_mh_oddh_evr_yt = 1 and
    (YOD4_OD4 = 1 or 
        (f_svy_age_iw NOT IN(.D,.R,.) and
           (YOD3a_OD3a = f_svy_age_iw or YOD3b_OD3b1 = f_svy_age_iw or YOD4a_OD4a = f_svy_age_iw)
        )
    ) then f_mh_oddh_y_yt = 1;
else f_mh_oddh_y_yt = 0;


%mend month12;

%month12;




