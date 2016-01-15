***********************************************************************************************
* PROGRAM: ODD-mto-youth.sas                                                                  *
* DATE: 4/9/10                                                                                *
*                                                                                             *
* MTO Youth                                                                                   *
* Check whether criteria are met for Oppositional Defiance Disorder for DSM-IV                *
* Diagnosis with hierarchy rules are created                                                  *
* Onset, recency for ODD are calculated                                                       *
***********************************************************************************************;


%macro odd;

/* Oppositional Defiance Disorder --  DSM-IV Criteria              */

****************************************************************************************************
* Criteria A: A pattern of negativistic, hostile, and defiant behavior lasting at least 6 months,  *
*             during which four (or more) of the following are present:                            * 
*                                                                                                  *
*             1. often loses temper.                                                               *
*                                                                                                  *
*                YOD1f is (1) OR YOD2a_OD1a is Yes(1)                                              *
*                                                                                                  *
*             2. often argues with adults.                                                         *
*                                                                                                  *
*                YOD2b_OD1b is Yes(1)                                                              *
*                                                                                                  *
*             3. often actively defies or refuses to comply with adult’s requests or rules.        *    
*                                                                                                  * 
*                YOD1d is (1) OR YOD1i is Yes(1) OR YOD2c_OD1c is Yes(1)OR YOD2d_OD1d is Yes(1)    *
*                                                                                                  *
*             4. often deliberately annoys people.                                                 *
*                                                                                                  *
*                YOD2g_OD1g is Yes(1)                                                              *
*                                                                                                  *
*             5. often blames others for his or her mistakes or misbehavior.                       *
*                                                                                                  * 
*                YOD2h_OD1h is Yes(1)                                                              * 
*                                                                                                  * 
*             6. is often touchy or easily annoyed by others.                                      *
*                                                                                                  *
*                YOD2j_OD1j is Yes(1) OR YOD2k_OD1k is Yes(1)                                      *
*                                                                                                  *
*             7. is often angry and resentful.                                                     * 
*                                                                                                  *
*                YOD2e_OD1e is Yes(1)                                                              *
*                                                                                                  *
*             8. is often spiteful and vindictive.                                                 *
*                                                                                                  * 
*                YOD2i_OD1i is Yes(1)                                                              *
****************************************************************************************************;

* Symptom 1;
if YOD1f = 1 or YOD2a_OD1a = 1 then f_mh_odd_a1 = 1;        /* Yes */
else if YOD1f IN(2,3) and YOD2a_OD1a = 5 then f_mh_odd_a1 = 5;   /* No */
else if YOD1f = .D or YOD2a_OD1a = .D then f_mh_odd_a1 = 9;  /* Don't know */
else if YOD1f = .R or YOD2a_OD1a = .R then f_mh_odd_a1 = 8;  /* Refuse */

* Symptom 2;
if YOD2b_OD1b = 1 then f_mh_odd_a2 = 1;        /* Yes */
else if YOD2b_OD1b = 5 then f_mh_odd_a2 = 5;   /* No */
else if YOD2b_OD1b = .D then f_mh_odd_a2 = 9;  /* Don't know */
else if YOD2b_OD1b = .R then f_mh_odd_a2 = 8;  /* Refuse */

* Symptom 3;
if YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1 or YOD2d_OD1d = 1 then f_mh_odd_a3 = 1;           /* Yes */
else if YOD1d IN(2,3) and YOD1i IN(2,3) and YOD2c_OD1c = 5 and YOD2d_OD1d = 5 then f_mh_odd_a3 = 5;   /* No */
else if YOD1d = .D or YOD1i = .D or YOD2c_OD1c = .D or YOD2d_OD1d = .D then f_mh_odd_a3 = 9;  /* Don't know */
else if YOD1d = .R or YOD1i = .R or YOD2c_OD1c = .R or YOD2d_OD1d = .R then f_mh_odd_a3 = 8;  /* Refuse */

* Symptom 4;
if YOD2g_OD1g = 1 then f_mh_odd_a4 = 1;        /* Yes */
else if YOD2g_OD1g = 5 then f_mh_odd_a4 = 5;   /* No */
else if YOD2g_OD1g = .D then f_mh_odd_a4 = 9;  /* Don't know */
else if YOD2g_OD1g = .R then f_mh_odd_a4 = 8;  /* Refuse */

* Symptom 5;
if YOD2h_OD1h = 1 then f_mh_odd_a5 = 1;        /* Yes */
else if YOD2h_OD1h = 5 then f_mh_odd_a5 = 5;   /* No */
else if YOD2h_OD1h = .D then f_mh_odd_a5 = 9;  /* Don't know */
else if YOD2h_OD1h = .R then f_mh_odd_a5 = 8;  /* Refuse */

* Symptom 6;
if YOD2j_OD1j = 1 or YOD2k_OD1k = 1 then f_mh_odd_a6 = 1;         /* Yes */
else if YOD2j_OD1j = 5 and YOD2k_OD1k = 5 then f_mh_odd_a6 = 5;   /* No */
else if YOD2j_OD1j = .D or YOD2k_OD1k = .D then d_odda6 = 9;      /* Don't know */
else if YOD2j_OD1j = .R or YOD2k_OD1k = .R then d_odda6 = 8;      /* Refuse */

* Symptom 7;
if YOD2e_OD1e = 1 then f_mh_odd_a7 = 1;        /* Yes */
else if YOD2e_OD1e = 5 then f_mh_odd_a7 = 5;   /* No */
else if YOD2e_OD1e = .D then f_mh_odd_a7 = 9;  /* Don't know */
else if YOD2e_OD1e = .R then f_mh_odd_a7 = 8;  /* Refuse */

* Symptom 8;
if YOD2i_OD1i = 1 then f_mh_odd_a8 = 1;        /* Yes */
else if YOD2i_OD1i = 5 then f_mh_odd_a8 = 5;   /* No */
else if YOD2i_OD1i = .D then f_mh_odd_a8 = 9;  /* Don't know */
else if YOD2i_OD1i = .R then f_mh_odd_a8 = 8;  /* Refuse */

/* Create checkpoint variables */
if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
       YOD2d_OD1d = 1) >= 4 then YOD2d1_OD1d1_chkpt = 1; 
else YOD2d1_OD1d1_chkpt = 2;

if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1,
       YOD2d_OD1d = 1, YOD2e_OD1e = 1) >= 4 then YOD2e1_OD1e1_chkpt = 1; 
else YOD2e1_OD1e1_chkpt = 2;

if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
       YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1) >= 4 then YOD2f1_OD1f1_chkpt = 1; 
else YOD2f1_OD1f1_chkpt = 3;

if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
       YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1, YOD2g_OD1g = 1) >= 4 then YOD2g1_OD1g1_chkpt = 1; 
else YOD2g1_OD1g1_chkpt = 2;

if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
       YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1, YOD2g_OD1g = 1, YOD2h_OD1h = 1) >= 4 
   then YOD2h1_OD1h1_chkpt = 1; 
else if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
            YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1, YOD2g_OD1g = 1, YOD2h_OD1h = 1) = 0 
   then YOD2h1_OD1h1_chkpt = 2; 
else YOD2h1_OD1h1_chkpt = 3;

if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
       YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1, YOD2g_OD1g = 1, YOD2h_OD1h = 1, 
       YOD2i_OD1i = 1) >= 4 then YOD2i1_OD1i1_chkpt = 1; 
else if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
            YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1, YOD2g_OD1g = 1, YOD2h_OD1h = 1,
            YOD2i_OD1i = 1) = 0 then YOD2i1_OD1i1_chkpt = 2; 
else YOD2i1_OD1i1_chkpt = 3;

if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
       YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1, YOD2g_OD1g = 1, YOD2h_OD1h = 1, 
       YOD2i_OD1i = 1, YOD2j_OD1j = 1) >= 4 
    then YOD2i1_OD1j1_chkpt = 1; 
else if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
            YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1, YOD2g_OD1g = 1, YOD2h_OD1h = 1, 
            YOD2i_OD1i = 1, YOD2j_OD1j = 1) = 0 then YOD2j1_OD1j1_chkpt = 2; 
else YOD2j1_OD1j1_chkpt = 3;

if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1,
       YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1, YOD2g_OD1g = 1, YOD2h_OD1h = 1, YOD2i_OD1i = 1, 
       YOD2j_OD1j = 1, YOD2k_OD1k = 1) >= 4 then YOD2k1_OD1k1_chkpt = 1; 
else if sum(YOD1f = 1 or YOD2a_OD1a = 1, YOD2b_OD1b = 1, YOD1d = 1 or YOD1i = 1 or YOD2c_OD1c = 1, 
            YOD2d_OD1d = 1, YOD2e_OD1e = 1, YOD2f_OD1f = 1, YOD2g_OD1g = 1, YOD2h_OD1h = 1, 
            YOD2i_OD1i = 1, YOD2j_OD1j = 1, YOD2k_OD1k = 1) = 0 then YOD2k1_OD1k1_chkpt = 2; 
else YOD2k1_OD1k1_chkpt = 3;  


* Check if 4 symptoms are met;

if sum(f_mh_odd_a1 = 1, f_mh_odd_a2 = 1, f_mh_odd_a3 = 1, f_mh_odd_a4 = 1, f_mh_odd_a5 = 1,
       f_mh_odd_a6 = 1, f_mh_odd_a7 = 1, f_mh_odd_a8 = 1) >= 4 or 
       YOD2d1_OD1d1_chkpt = 1 or YOD2e1_OD1e1_chkpt = 1 or YOD2f1_OD1f1_chkpt = 1 or 
       YOD2g1_OD1g1_chkpt = 1 or YOD2h1_OD1h1_chkpt = 1 or YOD2i1_OD1i1_chkpt = 1 or 
       YOD2j1_OD1j1_chkpt = 1 then f_mh_odd_a = 1;                /* Yes */
else if sum(f_mh_odd_a1 = 5, f_mh_odd_a2 = 5, f_mh_odd_a3 = 5, f_mh_odd_a4 = 5, f_mh_odd_a5 = 5,
            f_mh_odd_a6 = 5, f_mh_odd_a7 = 5, f_mh_odd_a8 = 5) >= 5 or
            YOD2h1_OD1h1_chkpt = 3 or YOD2i1_OD1i1_chkpt = 3 or YOD2j1_OD1j1_chkpt = 3 
       then f_mh_odd_a = 5;           /* No */
else if f_mh_odd_a1 = 9 or f_mh_odd_a2 = 9 or f_mh_odd_a3 = 9 or f_mh_odd_a4 = 9 or f_mh_odd_a5 = 9 or 
        f_mh_odd_a6 = 9 or f_mh_odd_a7 = 9 or f_mh_odd_a8 = 9 then f_mh_odd_a = 9;                 /* Don't know */
else if f_mh_odd_a1 = 8 or f_mh_odd_a2 = 8 or f_mh_odd_a3 = 8 or f_mh_odd_a4 = 8 or f_mh_odd_a5 = 8 or 
        f_mh_odd_a6 = 8 or f_mh_odd_a7 = 8 or f_mh_odd_a8 = 8 then f_mh_odd_a = 8;                 /* Refuse */

***************************************************************************************************
* Criteria B: The disturbance in behavior causes clinically significant impairment in social,     *
*             academic or occupational functioning.                                               *
*                                                                                                 *
*             YOD5_OD6 is (3,4,5)                                                                 *
*             Note: OD8 series, OD10,, OD12 from NSHS Adolescent are deleted                      *
***************************************************************************************************;

if YOD5_OD6 IN(3,4,5) then f_mh_odd_b = 1;         /* Yes */
else if YOD5_OD6 IN(1,2) then f_mh_odd_b = 5;      /* No */
else if YOD5_OD6 = .D then f_mh_odd_b = 9;         /* Don't know */
else if YOD5_OD6 = .R then f_mh_odd_b = 8;         /* Refuse */

************************************************************************************************************
* Criteria C: The behaviors do not occur exclusively during the course of a Psychotic or Mood Disorder.    *
*                                                                                                          *
*             Note: Psychotic Disorder not operationalized                                                 *
*                                                                                                          *
*   (Major Depression = No(5) AND Minor Depression = No(5) AND Dysthymia = No(5) AND Mania = No(5)) OR     *
*  ((Major Depression = Yes(1) OR Minor Depression = Yes(1) OR Dysthymia = Yes(1) OR Mania = Yes(1)) AND   *
*                      ( (Oppositional Defiance onset < Mood onset) OR                                     *
*                        (Oppositional Defiance recency > Mood recency) OR                                 * 
*                        (Oppositional Defiance persistence > Mood persistence)))                          *
*                                                                                                          * 
*           Note: Mood onset = earliest onset of mood disorder                                             * 
*                 Mood recency = most recent mood disorder                                                 *
*                 Mood persistence = sum (persistence of mood disorders)                                   *
*                                                                                                          *
*    Major Depression onset = D37a OR D37b OR D22c                                                         *
*    Depression recency = (Age if D38 is Yes(1)) OR D38c                                                   *
*    Minor Depression onset = D37a OR D37b                                                                 *
*    Depression persistence = D22b OR D22d                                                                 *
*    Mania onset = M18a OR M18b OR M36a OR M48a                                                            *
*    Mania recency = M3a OR M6a OR M3c OR M6c                                                              *
*    Mania persistence = M3b OR M3d OR M6b OR M6d OR M22                                                   *
*    DYS onset = DY5a OR DY5b OR (DY0 = 1: D47 OR D59a)                                                    *
*    DYS recency = (Age if DY6 is Yes(1)) OR DY6b OR (DY0 = 1: Depression recency)                         *
*    DYS persistence = D39 OR D50 OR D61                                                                   *
*    Oppositional Defiance onset = OD3a OR OD3b                                                            *
*    Oppositional Defiance recency = (Age if OD4 is Yes(1)) OR OD4a                                        *
*    Oppositional Defiance persistence = OD5                                                               *
************************************************************************************************************;

/* Create onset, recency, persistence variables */

odd_on = min(YOD3a_OD3a, YOD3b_OD3b1);               /* ODD onset */

if odd_on IN(.D,.R) then odd_on = .;

if YOD4_OD4 = 1 then odd_rec = f_svy_age_iw;               /* ODD recency */
else if YOD4_OD4 IN(5,.D,.R) then odd_rec = YOD4a_OD4a;

if odd_rec IN(.D,.R) then odd_rec = .;

mood_on = min(f_mh_dep_aoo_yt, f_mh_man_aoo_yt);
mood_rec = max(f_mh_dep_rec_yt, f_mh_man_rec_yt);

* Check if criteria are met;

if (f_mh_dep_evr_yt ^= 1 and f_mh_man_evr_yt ^= 1) or 
   (
    (f_mh_dep_evr_yt = 1 or f_mh_man_evr_yt = 1) and
      (
       (odd_on < mood_on and n(odd_on,mood_on) = 2) or
       (odd_rec > mood_rec and n(odd_rec,mood_rec) = 2)
      )
    ) then f_mh_odd_c = 1;
else f_mh_odd_c = 5;

***********************************************************************************************************
* Criteria D: Criteria are not met for Conduct Disorder, and if the individual is age 18 years or older,  *
*             criteria are not met for Antisocial Personality Disorder.                                   *
*                                                                                                         * 
*             Note: Antisocial Personality Disorder not operationalized                                   *
*                                                                                                         * 
*             (Conduct Disorder = No(5)) OR                                                               *
*             ( (Oppositional Defiance onset < Conduct Disorder onset) OR                                 *
*               (Oppositional Defiance recency > Conduct Disorder recency) OR                             *
*               (Oppositional Defiance persistence > Conduct Disorder persistence))                       *
*                                                                                                         *
*             Conduct disorder not in MTO survey, criteria not operationalized                            *
***********************************************************************************************************;

*******************************************************************************************
* New ODD diagnosis                                                                       *
* Because of skips new adolescent diagnosis can not be used                               *
*******************************************************************************************;

********************************************************************************************
* Combine Criteria A,B,C,D                                                                 * 
********************************************************************************************;

if f_mh_odd_a = 1 and f_mh_odd_b = 1 then f_mh_odd_evr_yt = 1;    /* Criteria are met */
else f_mh_odd_evr_yt = 0;                                           /* Criteria are not met */ 

if f_mh_odd_a = 1 and f_mh_odd_b = 1 and f_mh_odd_c = 1 then f_mh_oddh_evr_yt = 1;    /* Criteria are met */
else f_mh_oddh_evr_yt = 0;                                                            /* Criteria are not met */ 

******************************************************************************************
* Calculate Onset, Recency of Oppositional Defiance for DSM                              *
******************************************************************************************;

if f_mh_odd_evr_yt = 1 then do;          /* Oppositional Defiance Disorder onset, recency, persistence for DSM */
   f_mh_odd_aoo_yt = odd_on;             /* assigned only if Oppositional Defiance Disorder criteria are met */
   f_mh_odd_rec_yt = odd_rec;
end;

%mend odd;

%odd;

