********************************************************************************
* PROGRAM: Mania-mto-youth.sas                                                 *         
* DATE: 4/8/10                                                                 *
* MTO Youth                                                                    *
* Check whether Criteria are met for Manic Episode(M) for DSM                  *
* Onset, recency of Mania are calculated                                       *
*                                                                              *
********************************************************************************;

/* Manic Episode -- DSM-IV criteria               */

%macro tdy_man(newvar,part1,part2);

*Calculate length of time in days, from # of units and unit of time; 

   if 0 < &part1 < 99998 then do;
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
   if &part1 = 0 then &newvar = 0;
   if &part1 IN(.D) then &newvar = 99999;
   if &part1 IN(.R) then &newvar = 99998;

%mend tdy_man;

%macro tyr_man(newvar,part1,part2);

*Calculate length of time in years, from # of units and unit of time; 

   if 0 < &part1 < 99998 then do;
      select (&part2);
         when(1) &newvar = &part1 / (365 * 24); 
         when(2) &newvar = &part1 / 365; 
         when(3) &newvar = &part1 / 52; 
         when(4) &newvar = &part1 / 12; 
         when(5) &newvar = &part1; 
         otherwise;
      end; 
   end;
   if &part1 = 0 then &newvar = 0;
   if &part1 = .R then &newvar = 998;
   if &part1 = .D then &newvar = 999;

%mend tyr_man;

%macro mania;

************************************************************************************************
* Criteria A Part 1: A distinct period of abnormally and persistently elevated,                *
*                    expansive, or irritable mood                                              *
*                                                                                              *      
*                    YSC9_SC24 = Yes(1) OR YSC11_SC25a = Yes(1)                                *     
************************************************************************************************;      

if YSC9_SC24 = 1 or YSC11_SC25a = 1 then f_mh_man_a1 = 1;             /* Yes */
else if YSC9_SC24 = 5 and YSC11_SC25a = 5 then f_mh_man_a1 = 5;        /* No  */  
else if YSC9_SC24 = .D or YSC11_SC25a = .D then f_mh_man_a1 = 9;       /* Don't know */
else if YSC9_SC24 = .R or YSC11_SC25a = .R then f_mh_man_a1 = 8;         /* Refuse */

************************************************************************************************
* Criteria A Part 2: A distinct period of abnormally and persistently elevated,                * 
*                    expansive, or irritable mood lasting at least 1 week                      *
*                    (or any duration if hospitalization is necessary)                         *
*                                                                                              *
*                  Note: M36 is deleted                                                        *
*                  (YMA2b_M3b >= 1 week) OR (YMA2e_M3d >= 1week) OR (YMA6b_M6b >= 1 week) OR   *
*                  (YMA6e_M6d >= 1week)                                                        *
*                                                                                              *
*                  Note: M20, M22, M48 from NCSR are deleted                                   *
************************************************************************************************; 

%tdy_man(M3b_day, YMA2b_M3b, YMA2c_M3b);  /* Calculate total time for variables */
%tdy_man(M3d_day, YMA2e_M3d, YMA2f_M3d);
%tdy_man(M6b_day, YMA6b_M6b, YMA6c_M6b);
%tdy_man(M6d_day, YMA6e_M6d, YMA6f_M6d);

*Only one of M3b, M3d, M6b, M6d are answered;
if 7 <= M3b_day < 99998 or 7 <= M3d_day < 99998 or 7 <= M6b_day < 99998 or 
   7 <= M6d_day < 99998 then f_mh_man_a2 = 1;                  /* Yes */
else if 0 <= M3b_day < 7 or 0 <= M3d_day < 7 or 0 <= M6b_day < 7 or 0 <= M6d_day < 7 
    then f_mh_man_a2 = 5;    /* No */
else if YMA2b_M3b = .D or YMA2e_M3d = .D or YMA6b_M6b = .D or YMA6e_M6d = .D then f_mh_man_a2 = 9;  /* Don't know */ 
else if YMA2b_M3b = .R or YMA2e_M3d = .R or YMA6b_M6b = .R or YMA6e_M6d = .R then f_mh_man_a2 = 8;   /* Refuse */

**********************************************************************************
* Criteria A, combine Parts 1 + 2                                                *
**********************************************************************************;

if f_mh_man_a1 = 1 and f_mh_man_a2 = 1 then f_mh_man_a = 1;        /* Yes */
else if f_mh_man_a1 = 5 or f_mh_man_a2 = 5 then f_mh_man_a = 5;    /* No  */
else if f_mh_man_a1 = 9 or f_mh_man_a2 = 9 then f_mh_man_a = 9;    /* Don't know */
else if f_mh_man_a1 = 8 or f_mh_man_a2 = 8 then f_mh_man_a = 8;    /* Refuse     */

************************************************************************************************************
* Criteria B: During the mood disturbance, three(or more) of the following symptoms have                   * 
*             persisted(four if the mood is only irritable) and have been present to a significant degree  *
*                                                                                                          *
*             Mood is only irritable: SC25a is Yes(1) and (SC24 is NOT Yes(1))                             *
*                                                                                                          *
*             1. inflated self-esteem or grandiosity                                                       *
*                                                                                                          *
*                YMA7n_M7n is Yes(1) OR YMA7o_M7o is Yes(1)                                                *
*                                                                                                          *
*             2. decreased need for sleep(e.g., feels rested after only 3 hours of sleep)                  *
*                                                                                                          *
*                YMA7j_M7j is Yes(1)                                                                       *
*                                                                                                          *
*             3. more talkative than usual or pressure to keep talking                                     *
*                                                                                                          *
*                YMA7f_M7f is Yes(1)                                                                       *
*                                                                                                          *
*             4. flight of ideas or subjective experience that thoughts are racing                         *
*                                                                                                          *
*                YMA7i_M7i is Yes(1)                                                                       *
*                                                                                                          *
*             5. distractibility (i.e., attention too easily drawn to unimportant or irrelevant external   *
*                                 stimuli)                                                                 *
*                                                                                                          *
*                YMA7g_M7g is Yes(1) OR YMA7h_M7h is Yes(1)                                                *
*                                                                                                          *
*             6. increase in goal-oriented activity(either socially, at work or school, or sexually) or    *
*                psychomotor agitation.                                                                    *
*                                                                                                          *
*                YMA7a_M7a is Yes(1) OR YMA7b_M7b is Yes(1) OR YMA7c_M7c is Yes(1) OR YMA7e_M7e is Yes(1)  *
*                                                                                                          *
*             7. excessive involvement in pleasurable activities that have a high potential for painful    *
*                consequences(e.g., engaging in unrestrained buying sprees, sexual indiscretions, or       *
*                foolish business investments)                                                             *
*                                                                                                          * 
*                YMA7k_M7k is Yes(1) OR YMA7l_M7l is Yes(1) OR YMA7m_M7m is Yes(1)                         *
************************************************************************************************************;

* Mood is only irritable: SC25a is Yes(1) and (SC24 is NOT Yes(1));

*Symptom 1. inflated self-esteem or grandiosity;

if YMA7n_M7n = 1 or YMA7o_M7o = 1 then mh_manb1 = 1;           /* Yes */
else if YMA7n_M7n = 5 and YMA7o_M7o = 5 then mh_manb1 = 5;     /* No */
else if YMA7n_M7n = .D or YMA7o_M7o = .D then mh_manb1 = 9;    /* Don't know */
else if YMA7n_M7n = .R or YMa7o_M7o = .R then mh_manb1 = 8;     /* Refuse */

*Symptom 2. decreased need for sleep;

if YMA7j_M7j = 1 then mh_manb2 = 1;         /* Yes */
else if YMA7j_M7j = 5 then mh_manb2 = 5;    /* No  */
else if YMA7j_M7j = .D then mh_manb2 = 9;   /* Don't know */
else if YMA7j_M7j = .R then mh_manb2 = 8;   /* Refuse */

*Symptom 3. more talkative than usual or pressure to keep talking;

if YMA7f_M7f = 1 then mh_manb3 = 1;         /* Yes */
else if YMA7f_M7f = 5 then mh_manb3 = 5;    /* No  */
else if YMA7f_M7f = .D then mh_manb3 = 9;   /* Don't know */
else if YMA7f_M7f = .R then mh_manb3 = 8;   /* Refuse */

*Symptom 4. flight of ideas or subjective experience that thoughts are racing;

if YMA7i_M7i = 1 then mh_manb4 = 1;         /* Yes */
else if YMA7i_M7i = 5 then mh_manb4 = 5;    /* No */
else if YMA7i_M7i = .D then mh_manb4 = 9;   /* Don't know */
else if YMA7i_M7i = .R then mh_manb4 = 8;   /* Refuse */

*Symptom 5. distractibility (i.e., attention too easily drawn to unimportant or irrelevant external stimuli);

if YMA7g_M7g = 1 or YMA7h_M7h = 1 then mh_manb5 = 1;        /* Yes */
else if YMA7g_M7g = 5 and YMA7h_M7h = 5 then mh_manb5 = 5;  /* No */
else if YMA7g_M7g = .D or YMA7h_M7h = .D then mh_manb5 = 9;   /* Don't Know */
else if YMA7g_M7g = .R or YMA7h_M7h = .R then mh_manb5 = 8;   /* Refuse */

*Symptom 6. increase in goal-oriented activity(either socially, at work or school, or sexually)
*           or psychomotor agitation;

if YMA7a_M7a = 1 or YMA7b_M7b = 1 or YMA7c_M7c = 1 or YMA7e_M7e = 1 then mh_manb6 = 1;           /* Yes */
else if YMA7a_M7a = 5 and YMA7b_M7b = 5 and YMA7c_M7c = 5 and YMA7e_M7e = 5 then mh_manb6 = 5;   /* No */
else if YMA7a_M7a = .D or YMA7b_M7b = .D or YMA7c_M7c = .D or YMA7e_M7e = .D then mh_manb6 = 9;   /* Don't know */
else if YMA7a_M7a = .R or YMA7b_M7b = .R or YMA7c_M7c = .R or YMA7e_M7e = .R then mh_manb6 = 8;   /* Refuse */

*Symptom 7. excessive involvement in pleasurable activities that have a high potential
*           for painful consequences(e.g., engaging in unrestrained buying sprees, 
*           sexual indiscretions, or foolish business investments);

if YMA7k_M7k = 1 or YMA7l_M7l = 1 or YMA7m_M7m = 1 then mh_manb7 = 1;          /* Yes */
else if YMA7k_M7k = 5 and YMA7l_M7l = 5 and YMA7m_M7m = 5 then mh_manb7 = 5;   /* No */
else if YMA7k_M7k = .D or YMA7l_M7l = .D or YMA7m_M7m = .D then mh_manb7 = 9;  /* Don't know */
else if YMA7k_M7k = .R or YMA7l_M7l = .R or YMA7m_M7m = .R then mh_manb7 = 8;   /* Refuse */

*Check if mood is merely irritable;

if YSC11_SC25a = 1 and YSC9_SC24 ^= 1 then IRRMOOD = 1;
else IRRMOOD = 5;

*Combine symptoms 1-7;

if IRRMOOD = 1 then do;
    if sum(mh_manb1 = 1, mh_manb2 = 1, mh_manb3 = 1, mh_manb4 = 1, mh_manb5 = 1,
           mh_manb6 = 1, mh_manb7 = 1) >= 4 then f_mh_man_b = 1;                              /* Yes */
    else if sum(mh_manb1 = 5, mh_manb2 = 5, mh_manb3 = 5, mh_manb4 = 5, mh_manb5 = 5,
           mh_manb6 = 5, mh_manb7 = 5) >= 4 then f_mh_man_b = 5;                              /* No */  
    else if mh_manb1 = 9 or mh_manb2 = 9 or mh_manb3 = 9 or mh_manb4 = 9 or
            mh_manb5 = 9 or mh_manb6 = 9 or mh_manb7 = 9 then f_mh_man_b = 9;                  /* Don't know */
    else if mh_manb1 = 8 or mh_manb2 = 8 or mh_manb3 = 8 or mh_manb4 = 8 or
            mh_manb5 = 8 or mh_manb6 = 8 or mh_manb7 = 8 then f_mh_man_b = 8;                  /* Refuse */
end;
else if IRRMOOD = 5 then do;
    if sum(mh_manb1 = 1, mh_manb2 = 1, mh_manb3 = 1, mh_manb4 = 1, mh_manb5 = 1,
           mh_manb6 = 1, mh_manb7 = 1) >= 3 then f_mh_man_b = 1;                            /* Yes */
    else if sum(mh_manb1 = 5, mh_manb2 = 5, mh_manb3 = 5, mh_manb4 = 5, mh_manb5 = 5,
                mh_manb6 = 5, mh_manb7 = 5) >= 5 then f_mh_man_b = 5;                       /* No */
    else if mh_manb1 = 9 or mh_manb2 = 9 or mh_manb3 = 9 or mh_manb4 = 9 or
            mh_manb5 = 9 or mh_manb6 = 9 or mh_manb7 = 9 then f_mh_man_b = 9;               /* Don't know */
    else if mh_manb1 = 8 or mh_manb2 = 8 or mh_manb3 = 8 or mh_manb4 = 8 or
            mh_manb5 = 8 or mh_manb6 = 8 or mh_manb7 = 8 then f_mh_man_b = 8;               /* Refuse */
end;

*************************************************************************************************************
* Criteria D Part 1: The mood disturbance is sufficiently severe to cause marked impairment in occupational *
*                    functioning or in usual social activities or relationships with others                 *
*                                                                                                           *
*                    HMA9_M9 is (4,5)                                                                       *
*                                                                                                           *
*                    Note: M9a, M27 series, M29, M33 from NSHS Adolescent are deleted                       * 
*************************************************************************************************************;

if YMA9_M9 IN(4,5) then f_mh_man_d1 = 1;           /* Yes */
else if YMA9_M9 IN(1,2,3) then f_mh_man_d1 = 5;    /* No */
else if YMA9_M9 = .D then f_mh_man_d1 = 9;         /* Don't know */
else if YMA9_M9 = .R then f_mh_man_d1 = 8;         /* Refuse */

****************************************************************************************
* Criteria D Part 2: The mood disturbance is sufficiently severe to necessitate        *
*                    hospitalization to prevent harm to self                           *
*                                                                                      *
*                    M36 is Yes(1) OR M48 is Yes(1).                                   *
*                                                                                      *
*                    Note: M48 from NSHS adolescent is deleted, criteria not           *
*                          operationalized                                             *
****************************************************************************************;

****************************************************************************************
* Criteria D Part 3: There are psychotic features                                      *
*                                                                                      *
*                    YMA7o_M7o is Yes(1)                                               *
****************************************************************************************;  

if YMA7o_M7o = 1 then f_mh_man_d3 = 1;        /* Yes */
else if YMA7o_M7o = 5 then f_mh_man_d3 = 5;   /* No */
else if YMA7o_M7o = .D then f_mh_man_d3 = 9;  /* Don't know */
else if YMA7o_M7o = .R then f_mh_man_d3 = 8;  /* Refuse */

****************************************************************************************
* Criteria D, combine Parts 1, 2, 3                                                    *
****************************************************************************************;

if f_mh_man_d1 = 1 or f_mh_man_d3 = 1 then f_mh_man_d = 1;           /* Yes */
else if f_mh_man_d1 = 5 and f_mh_man_d3 = 5 then f_mh_man_d = 5;     /* No */
else if f_mh_man_d1 = .D or f_mh_man_d3 = .D then f_mh_man_d = 9;    /* Don't know */
else if f_mh_man_d1 = .R or f_mh_man_d3 = .R then f_mh_man_d = 8;    /* Refuse */

******************************************************************************************************
* Criteria E: The symptoms are not due to the direct physiological effects of a                      *
*            substance(e.g., a drug of abuse, a medication, or other treatment) or                   *
*            a general medical condition (e.g. hyperthyroidism)                                      *
*                                                                                                    *
*     (M10 is No(5) AND (M10a is No(5) or M10b is No(5))) OR                                         *
*     (At least 1 value of 1-6,10-13 in M11) OR                                                      *   
*     ((M13 is No(5) AND (M15 is skipped OR M15 is No(5))) OR M17 is No(5)) OR                       *
*     ((At least 1 value of 81-99 in M11) AND (No values of 20-28,30-32 in M11) AND (M16 is (5,6)))  *
*                                                                                                    *
*     Note: M10a, M10b from NSHS are deleted, criteria not operationalized                           *
******************************************************************************************************;

********************************************************************************
* Check if all criteria are met for DSM-IV Manic Episode                       *
********************************************************************************;

if f_mh_man_a = 1 and f_mh_man_b = 1 and f_mh_man_d = 1 then mh_man_old = 1;    * All criteria are met;
else mh_man_old = 0;                                                            * criteria are not met;

*********************************************************************************
* Calculate Onset, Recency of Mania for DSM                                     *                             
*********************************************************************************;

%tyr_man(M3by,YMA2b_M3b,YMA2c_M3b);   /* Calculate total years for 2 parts from question M3b  */
%tyr_man(M3dy,YMA2e_M3d,YMA2f_M3d);   /* Calculate total years for 2 parts from question M3d  */
%tyr_man(M6by,YMA6b_M6b,YMA6c_M6b);   /* Calculate total years for 2 parts from question M6b  */
%tyr_man(M6dy,YMA6e_M6d,YMA6f_M6d);   /* Calculate total years for 2 parts from question M6d  */

man_on = min(YMA10a_M18a, YMA10b_M18b1);   /* Mania onset */
if man_on IN(.D, .R) then man_on = .;

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

if YMA11_M19 = 1 then man_rec3 = f_svy_age_iw;
else man_rec3 = YMA13_M19d;
if man_rec3 IN(.D,.R) then man_rec3 = .;

man_rec = max(man_rec1, man_rec2, man_rec3);

if man_per1 IN(.D,.R) then man_per1 = .;

man_per = man_per1;           /* Mania persistence  */

if mh_man_old = 1 then do;          /* Mania onset, recency, persistence for DSM */
   man_ond_old = man_on;      /* assigned only if Mania criteria are met */
   man_recd_old = man_rec;
end;

%mend mania;

%mania;
