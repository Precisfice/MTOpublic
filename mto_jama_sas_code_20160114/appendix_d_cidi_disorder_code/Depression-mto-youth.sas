*********************************************************************************************
* PROGRAM: mjdepepi.sas                                                                     *
* DATE: 4/8/10                                                                              *
*                                                                                           *
* MTO Youth                                                                                 *
* Check whether Criteria are met for Major Depressive Episode(MDE) for NSHS replication     *
* Diagnosis with hierarchy rules are created                                                *
* Onset, recency, persistence are calculated                                                *
*                                                                                           *
*********************************************************************************************;

*************************************************************************************
* Major Depressive Episode -- DSM-IV criteria                                       *
*************************************************************************************;

%macro tdy_mde(newvar,part1,part2);

*Calculate length of time in days, from # of units and unit of time; 

   if &part1 < 998 then do;
      select (&part2);
         when(1) &newvar = &part1; 
         when(2) &newvar = 7*&part1; 
         when(3) &newvar = 30*&part1; 
         when(4) &newvar = 365*&part1;
         otherwise;
      end; 
   end;
   if &newvar >= 99998 then &newvar = 99995;
   if &part1 =998 then &newvar = 99998;
   if &part1 =999 then &newvar = 99999;

%mend tdy_mde;

%macro tyr_mde(newvar,part1,part2);

*Calculate length of time in years, from # of units and unit of time; 

   if &part1 < 998 then do;
      select (&part2);
         when(1) &newvar = &part1 / 365; 
         when(2) &newvar = &part1 / 52; 
         when(3) &newvar = &part1 / 12; 
         when(4) &newvar = &part1; 
         otherwise;
      end; 
   end;
   if &part1 = 998 then &newvar = 998;
   if &part1 = 999 then &newvar = 999;

%mend tyr_mde;

%macro totmass(newvar,part1,part2);

*Calculate weight in pounds, from # of units and unit of mass; 

   if &part1 ~IN (998,999) then do;
      select (&part2);
         when(1) &newvar = &part1; 
         when(2) &newvar = 2.2 * &part1; 
         otherwise;
      end; 
   end;
   if &newvar >= 998 then &newvar = 995;
   if &part1 IN(998,999) then &newvar = &part1;

%mend totmass;


%macro mjdepepi;

*******************************************************************************************************
* Criteria A Part 1: Symptoms have been present during the same 2 week period and at                  *
*                    least one of the symptoms is either(1) depressed mood or                         *
*                    (2) loss of interest or pleasure.                                                *
*                                                                                                     *
*                    (D22b >= 2 weeks OR D22d >= 2 weeks OR D39 >= 2 weeks) AND                       *
*                       (                                                                             *
*                         (D24a is Yes(1) OR D24b is Yes(1) OR D24c is Yes(1) OR D24d is Yes(1)) OR   *
*                         (D24e is Yes(1) OR D24f is Yes(1))                                          *
*                       )                                                                             *
*                                                                                                     *
*                    (HDE6b_D22b >= 2 weeks OR HDE6e_D22d >= 2 weeks) AND                             *
*                       (                                                                             *
*                         HDE7a_D24a is Yes(1) OR HDE7b_D24c is Yes(1) OR HDE7c_D24e is Yes(1) OR     *
*                         HDE7d_D24f is Yes(1)                                                        *
*                       )                                                                             *
*                                                                                                     *
*                    Note: D24b, D24d, D39 from NSHS Adolescent are deleted                           *
*******************************************************************************************************;

%tdy_mde(D22bt, YDE6b_D22b, YDE6c_D22b);  /* Calculate total time for variables */
%tdy_mde(D22dt, YDE6e_D22d, YDE6f_D22d);

* Either YDE6b_D22b or YDE6e_D22d answered;

if (14 <= D22bt < 99998 or 14 <= D22dt < 99998) and
    (YDE7a_D24a = 1 or YDE7b_D24c = 1 or YDE7c_D24e = 1 or YDE7d_D24f = 1) then f_mh_dep_a1 = 1;        /* Yes */
else if (0 <= D22bt < 14 or 0 <= D22dt < 14) or
           (
              YDE7a_D24a = 5 and YDE7b_D24c = 5 and YDE7c_D24e = 5 and YDE7d_D24f = 5
           ) then f_mh_dep_a1 = 5;                                                     /* No  */
else if YDE6b_D22b = .D or YDE6e_D22d = .D or YDE7a_D24a = .D or YDE7b_D24c = .D or
        YDE7c_D24e = .D or YDE7d_D24f = .D then f_mh_dep_a1 = 9;                       /* Don't know */
else if YDE6b_D22b = .R or YDE6e_D22d = .R or YDE7a_D24a = .R or YDE7b_D24c = .R or
        YDE7c_D24e = .R or YDE7d_D24f = .R then f_mh_dep_a1 = 8;                       /* Refuse */

******************************************************************************************************
* Criteria A Part 2: At least five of the following symptoms must be present and                     *
*                    represent a change from previous functioning:                                   *
*                                                                                                    *
*                    Note: change from previous functioning is implicit in the item corresponding to *
*                          each symptom (e.g. more than usual, less than usual)                      *
*                                                                                                    * 
*                    1. depressed mood most of the day, nearly every day, as indicated by either     *
*                       subjective report(e.g., feels sad or empty) or observation made by others.   *
*                                                                                                    *
*                       D24a is Yes(1) OR D24b is Yes(1) OR D24c is Yes(1) OR D24d is Yes(1)         * 
*                                                                                                    *
*                       YDE7a_D24a is Yes(1) OR YDE7b_D24c is Yes(1).                                * 
*                       Note: D24b, D24d from NSHS Adolescent are deleted.                           *
*                                                                                                    *
*                    2. markedly diminished interest or pleasure in all, or almost all, activities   *
*                       most of the day, nearly every day(as indicated by either subjective account  *
*                       or observation made by others)                                               *
*                                                                                                    *
*                       D24e is Yes(1) OR D24f is Yes(1)                                             *
*                                                                                                    *       
*                       YDE7c_D24e is Yes(1) OR YDE7d_D24f is Yes(1).                                *
*                                                                                                    *       
*                    3. significant weight loss when not dieting or weight gain (e.g., a change of   *
*                       more than 5% of body weight in a month), or decrease or increase in appetite *
*                       nearly every day.                                                            *
*                                                                                                    *
*                       YDE9a_D26a is Yes(1) OR OR YDE9b_D26b is Yes(1) OR YDE9c_D26c is Yes(1) OR   *
*                       YDE9d_D26e is Yes(1).                                                        *
*                       Note: D26d, D26f from NSHS Adolescent are removed.                           *
*                                                                                                    *
*                    4. insomnia or hypersomnia nearly every day.                                    *
*                                                                                                    *
*                       YDE9e_D26g is Yes(1) OR YDE9f_D26h is Yes(1).                                *
*                                                                                                    * 
*                    5. psychomotor agitation or retardation nearly every day(observable by others,  *
*                       not merely subjective feelings of restlessness or being slowed down).        *
*                                                                                                    *
*                       YDE9i_D26m is Yes(1) OR YDE9k_D26o is Yes(1).                                * 
*                                                                                                    *
*                    6. fatigue or loss of energy nearly every day.                                  *
*                                                                                                    *
*                       YDE9g_D26j is Yes(1).                                                        *
*                                                                                                    *
*                    7. feelings of worthlessness or excessive or inappropriate guilt                *
*                       (which may be delusional) nearly every day(not merely self-reproach or guilt *
*                       about being sick)                                                            *
*                                                                                                    * 
*                       YDE9o_D26u is Yes(1).                                                        *
*                                                                                                    *
*                    8. diminished ability to think or concentrate, or indecisiveness, nearly every  *
*                       day(either by subjective account or as observed by others)                   *
*                                                                                                    *
*                       YDE9l_D26p is Yes(1) OR YDE9m_D26r is Yes(1) OR YDE9n_D26s is Yes(1).        *
*                                                                                                    *
*                    9. recurrent thoughts of death (not just fear of dying), recurrent suicidal     *
*                       ideation without a specific plan, or a suicide attempt or a specific plan    *
*                       for committing suicide.                                                      *
*                                                                                                    *
*                       YDE9p_D26aa is Yes(1) OR YDE9q_D26bb is Yes(1) OR YDE9r_D26cc is Yes(1).     *
*                       Note: D26dd, D26ee from NSHS Adolescent are removed.                         *
******************************************************************************************************;

*Code responses for each of the symptoms;

*Symptom 1 depressed mood;
if YDE7a_D24a = 1 or YDE7b_D24c = 1 then mh_depa1 = 1;
else if YDE7a_D24a = 5 and YDE7b_D24c = 5 then mh_depa1 = 5;
else if YDE7a_D24a = .D or YDE7b_D24c = .D then mh_depa1 = 9;
else if YDE7a_D24a = .R or YDE7b_D24c = .R then mh_depa1 = 8;

*Symptom 2 diminished interest in hobbies/activities;

if YDE7c_D24e = 1 or YDE7d_D24f = 1 then mh_depa2 = 1;
else if YDE7c_D24e = 5 and YDE7d_D24f = 5 then mh_depa2 = 5;
else if YDE7c_D24e = .D or YDE7d_D24f = .D then mh_depa2 = 9;
else if YDE7c_D24e = .R or YDE7d_D24f = .R then mh_depa2 = 8;

*Symptom 3 significant weight loss/gain or change in appetite;

if YDE9a_D26a = 1 or YDE9b_D26b = 1 or YDE9c_D26c = 1 or YDE9d_D26e = 1 then mh_depa3 = 1;
else if YDE9a_D26a = 5 and YDE9b_D26b = 5 and YDE9c_D26c = 5 and YDE9d_D26e = 5 then mh_depa3 = 5; 
else if YDE9a_D26a = .D or YDE9b_D26b = .D or YDE9c_D26c = .D or YDE9d_D26e = .R then mh_depa3 = 9; 
else if YDE9a_D26a = .R or YDE9b_D26b = .R or YDE9c_D26c = .R or YDE9d_D26e = .R then mh_depa3 = 8; 

*Symptom 4 insomnia or hypersomnia;

if YDE9e_D26g = 1 or YDE9f_D26h = 1 then mh_depa4 = 1;
else if YDE9e_D26g = 5 and YDE9f_D26h = 5 then mh_depa4 = 5;
else if YDE9e_D26g = .D or YDE9f_D26h = .D then mh_depa4 = 9;
else if YDE9e_D26g = .R or YDE9f_D26h = .R then mh_depa4 = 8;

*Symptom 5 psychomotor agitation or retardation;
*Note: if YDE9h_D26l is Not Yes(1), YDE9i_D26m is skipped;
*Note: if YDE9i_D26m is Not Yes(1), YDE9k_D26o is skipped;
*Note: if YDE9j_D26n is Not Yes(1), YDE9k_D26o is skipped;
if YDE9i_D26m = 1 or YDE9k_D26o = 1 then mh_depa5 = 1;
else if (YDE9h_D26l IN(5,.D,.R) or YDE9i_D26m = 5) and 
        (YDE9i_D26m IN(5,.D,.R) or YDE9j_D26n IN(5,.D,.R) or YDE9k_D26o = 5) then mh_depa5 = 5;
else if YDE9i_D26m = .D or YDE9k_D26o = .D then mh_depa5 = 9;
else if YDE9i_D26m = .R or YDE9k_D26o = .R then mh_depa5 = 8;

*Symptom 6 fatigue or loss of energy;
if YDE9g_D26j = 1 then mh_depa6 = 1;
else if YDE9g_D26j = 5 then mh_depa6 = 5;
else if YDE9g_D26j = .D then mh_depa6 = 9;
else if YDE9g_D26j = .R then mh_depa6 = 8;

*Symptom 7 feelings of worthlessness;
if YDE9o_D26u = 1 then mh_depa7 = 1;
else if YDE9o_D26u = 5 then mh_depa7 = 5;
else if YDE9o_D26u = .D then mh_depa7 = 9;
else if YDE9o_D26u = .R then mh_depa7 = 8;

*Symptom 8 diminshed ability to think or concentrate;
if YDE9l_D26p = 1 or YDE9m_D26r = 1 or YDE9n_D26s = 1 then mh_depa8 = 1;
else if YDE9l_D26p = 5 and YDE9m_D26r = 5 and YDE9n_D26s = 5 then mh_depa8 = 5;
else if YDE9l_D26p = .D or YDE9m_D26r = .D or YDE9n_D26s = .D then mh_depa8 = 9;
else if YDE9l_D26p = .R or YDE9m_D26r = .R or YDE9n_D26s = .R then mh_depa8 = 8;

*Symptom 9 recurrent thoughts of death;
if YDE9p_D26aa = 1 or YDE9q_D26bb = 1 or YDE9r_D26cc = 1 then mh_depa9 = 1;
else if YDE9p_D26aa = 5 and YDE9q_D26bb = 5 and YDE9r_D26cc = 5 then mh_depa9 = 5;
else if YDE9p_D26aa = .D or YDE9q_D26bb = .D or YDE9r_D26cc = .D then mh_depa9 = 9;
else if YDE9p_D26aa = .R or YDE9q_D26bb = .R or YDE9r_D26cc = .R then mh_depa9 = 8;

/* # of Yes responses in D24, D26 series */
D24D26_yes = sum(YDE7a_D24a = 1, YDE7b_D24c = 1, YDE7c_D24e = 1, YDE7d_D24f = 1,
                 YDE9a_D26a = 1, YDE9b_D26b = 1, YDE9c_D26c = 1, YDE9d_D26e = 1,
                 YDE9e_D26g = 1, YDE9f_D26h = 1, YDE9g_D26j = 1, YDE9h_D26l = 1,
                 YDE9i_D26m = 1, YDE9j_D26n = 1, YDE9k_D26o = 1, YDE9l_D26p = 1,
                 YDE9m_D26r = 1, YDE9n_D26s = 1, YDE9o_D26u = 1, YDE9p_D26aa = 1,
                 YDE9q_D26bb = 1, YDE9r_D26cc = 1);

*Combine symptoms;

/* After 5 symptoms in D24, D26 series rest of questions are skipped */
/* Respondents with (D26a or D26b) and (D26c or D26e) are counted as */
/* 2 symptoms instead of 1 in data entry program                     */  

if sum(mh_depa1 = 1, mh_depa2 = 1, mh_depa3 = 1, mh_depa4 = 1, mh_depa5 = 1, mh_depa6 = 1, mh_depa7 = 1,
       mh_depa8 = 1, mh_depa9 = 1) >= 5 or
   (sum(mh_depa1 = 1, mh_depa2 = 1, mh_depa3 = 1, mh_depa4 = 1, mh_depa5 = 1, mh_depa6 = 1, mh_depa7 = 1,
       mh_depa8 = 1, mh_depa9 = 1) = 4 and 
    sum(YDE9a_D26a = 1 or YDE9b_D26b = 1,YDE9c_D26c = 1 or YDE9d_D26e = 1) = 2 and
    N(YDE9p_D26aa, YDE9q_D26bb, YDE9r_D26cc) = 0
   )  then f_mh_dep_a2 = 1;      /* Yes */
else if sum(mh_depa1 = 5, mh_depa2 = 5, mh_depa3 = 5, mh_depa4 = 5, mh_depa5 = 5,
            mh_depa6 = 5, mh_depa7 = 5, mh_depa8 = 5, mh_depa9 = 5) >= 5 then f_mh_dep_a2 = 5;     /* No  */
else if mh_depa1 = 9 or mh_depa2 = 9 or mh_depa3 = 9 or mh_depa4 = 9 or mh_depa5 = 9 or
        mh_depa6 = 9 or mh_depa7 = 9 or mh_depa8 = 9 or mh_depa9 = 9 then f_mh_dep_a2 = 9;     /* Don't know  */
else if mh_depa1 = 8 or mh_depa2 = 8 or mh_depa3 = 8 or mh_depa4 = 8 or mh_depa5 = 8 or
        mh_depa6 = 8 or mh_depa7 = 8 or mh_depa8 = 8 or mh_depa9 = 8 then f_mh_dep_a2 = 8;     /* Refuse */

***************************************************************************
* Criteria A combine parts 1,2                                            *
***************************************************************************;

if f_mh_dep_a1 = 1 and f_mh_dep_a2 = 1 then f_mh_dep_a = 1;        /* Yes */
else if f_mh_dep_a1 = 5 or f_mh_dep_a2 = 5 then f_mh_dep_a = 5;    /* No  */
else if f_mh_dep_a1 = 9 or f_mh_dep_a2 = 9 then f_mh_dep_a = 9;    /* Don't know  */
else if f_mh_dep_a1 = 8 or f_mh_dep_a2 = 8 then f_mh_dep_a = 8;    /* Refuse  */

******************************************************************************************
* Criteria C Part 1: The symptoms cause clinically significant distress                  *
*                                                                                        *
*                    YDE12_D17 is (2,3,4).                                               *
*                                                                                        *
*                    Note: D18,D19,D24b from NSHS Adolescent are deleted.                *
******************************************************************************************;

if YDE12_D17 IN(2,3,4) then f_mh_dep_c1 = 1;      /* Yes */
else if YDE12_D17 = 1 then f_mh_dep_c1 = 5;       /* No  */
else if YDE12_D17 = .D then f_mh_dep_c1 = 9;      /* Don't know  */
else if YDE12_D17 = .R then f_mh_dep_c1 = 8;      /* Refuse  */

***********************************************************************************************
* Criteria C Part 2: The symptoms cause impairment in social, occupational or other important *
*                    areas of functioning                                                     * 
*                                                                                             *
*                    YDE11_D28 is (3,4,5).                                                    *
*                                                                                             *
*                    Note: D28a, D66 series from NSHS Adolescent are deleted                  *
***********************************************************************************************;

if YDE11_D28 IN(3,4,5) then f_mh_dep_c2 = 1;      /* Yes */
else if YDE11_D28 IN(1,2) then f_mh_dep_c2 = 5;   /* No */
else if YDE11_D28 = .D then f_mh_dep_c2 = 9;      /* Don't know */
else if YDE11_D28 = .R then f_mh_dep_c2 = 8;      /* Refuse */

*****************************************************************************************
* Criteria C, combine Parts 1,2                                                         *
*****************************************************************************************;

if f_mh_dep_c1 = 1 or f_mh_dep_c2 = 1 then f_mh_dep_c = 1;         /* Yes */
else if f_mh_dep_c1 = 5 and f_mh_dep_c2 = 5 then f_mh_dep_c = 5;   /* No  */
else if f_mh_dep_c1 = 9 or f_mh_dep_c2 = 9 then f_mh_dep_c = 9;    /* Don't know  */
else if f_mh_dep_c1 = 8 or f_mh_dep_c2 = 8 then f_mh_dep_c = 8;    /* Refused  */

*********************************************************************************************
* Criteria D: The symptoms are not due to the direct physiological effects                  *
*             of a substance (e.g., a drug of abuse, a medication),                         *
*             or are not due to a general medical condition                                 *
*                                                                                           *
*                                                                                           *
*             Note: D29a, D29b questions from NSHS Adolescent are deleted, criteria not     *
*                   operationalized                                                         *
*********************************************************************************************;

*****************************************************************************************
* Criteria E part 1: The symptoms are not better accounted for by Bereavement,          *
*                    i.e. after the loss of a loved one                                 *
*                                                                                       *
*                    NOT(value of 3 in D23a OR value of 12 in D30)                      *
*                                                                                       *
*                    Note: D23a, D30 deleted. Criteria Not Operationalized              *
*****************************************************************************************;

*********************************************************************************************** 
* Criteria E part 2: The symptoms last more than 2 months                                     *
*                                                                                             *
*                    (D22bt > 2 months) OR (D22dt > 2 months)                                 *
*                                                                                             *
*                    Note: Since Bereavement questions deleted, Criteria Not Operationalized  *
***********************************************************************************************;

***********************************************************************************************
* Criteria E part 3: The symptoms are characterized by (a) marked functional impairment,      *
*                    (b) morbid preoccupation with worthlessness, (c) suicidal ideation,      *
*                    (d) psychotic symptoms, or (e) psychomotor retardation                   *     
*                    psychotic symptoms(d) not used                                           *
*                                                                                             *
*                    a. D19 is (1) OR D28 is (4,5) OR D28a is (1,2) OR                        *
*                       (At least 1 of D66a-D66d is between 7 and 10) OR (10 <= D68 <= 365)   *
*                    b. D26v is Yes(1)                                                        *
*                    c. D26cc is Yes(1) OR D26dd is Yes(1) OR D26ee is Yes(1)                 *
*                    d. Not operationalized                                                   *
*                    e. D26l is Yes(1) OR D26m is Yes(1)                                      *
*                                                                                             *
*                    Note: Since Bereavement questions deleted, Criteria Not Operationalized  *
**********************************************************************************************;

******************************************************************************************
* Criteria E, combine parts 1,2,3                                                        *
*             Note Criteria E Not Operationalized                                        *
******************************************************************************************;         

********************************************************************************************
* Combine Criteria A,C,D,E                                                                 * 
*                                                                                          *
* Note: Criteria D,E Not Operationalized                                                   *
********************************************************************************************;

if f_mh_dep_a = 1 and f_mh_dep_c = 1 then f_mh_dep_evr_yt = 1; 
else f_mh_dep_evr_yt = 0;

******************************************************************************************
* Calculate Onset, Recency of Major Depression for DSM                                   *
******************************************************************************************;

if YDE6_D22 = 1 then dep_on = min(YDE6a_D22a,YDE13a_D37a, YDE13b_D37b1);      /* Major Depression onset */
else if YDE6_D22 IN(5,.D,.R) then dep_on = min(YDE6d_D22c, YDE13a_D37a, YDE13b_D37b1);  

if dep_on IN(.D,.R) then dep_on = .;

if YDE14_D38 = 1 then dep_rec = f_svy_age_iw;                 /* Major Depression recency */
else if YDE14_D38 IN(5,.D,.R) then dep_rec = YDE14b_D38c;

if dep_rec IN(.D,.R) then dep_rec = .;

if f_mh_dep_evr_yt = 1 then do;          /* Major Depression onset, recency for DSM */
   f_mh_dep_aoo_yt = dep_on;             /* assigned only if Major Depression criteria are met */
   f_mh_dep_rec_yt = dep_rec;
end;
 
%mend mjdepepi;

%mjdepepi;