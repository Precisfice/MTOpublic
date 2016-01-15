************************************************************************************************
* PROGRAM: GAD-mto-youth.sas                                                                   *
* DATE: 4/9/10                                                                                 *
* Check whether Criteria are met for Generalized Anxiety Disorder(GAD)                         *
*                                                                                              *
* MTO youth                                                                                    *
* Diagnosis with hierarchy rules created                                                       *
* Onset, recency of GAD are calculated                                                         * 
*                                                                                              *
************************************************************************************************;

******************************************************************************************
* Generalized Anxiety Disorder -- DSM-IV criteria                                        *
******************************************************************************************;

%macro tdy_g(newvar,part1,part2);

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
   if &part1 = 995 then do;
      &newvar = 365 * f_svy_age_iw;
   end;
   if &part1 = .R then &newvar = 99998;
   if &part1 = .D then &newvar = 99999;

%mend tdy_g;

%macro tyr_g(newvar,part1,part2);

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
   if &part1 = 995 then do;
      &newvar = f_svy_age_iw;
   end;
   if &part1 = .R then &newvar = 998;
   if &part1 = .D then &newvar = 999;

%mend tyr_g;

*****************************************************************************************
* Criteria A Part 1: Excessive anxiety and worry(apprehensive expectation)              *
*                                                                                       *
*           YSC12_SC26 is Yes(1) OR YSC13_SC26a is Yes(1) OR YSC14_SC26b is Yes(1).     *
*****************************************************************************************;

%macro gad;

if YSC12_SC26 = 1 or YSC13_SC26a = 1 or YSC14_SC26b = 1 then f_mh_gad_a1 = 1;          /* Yes */
else if YSC12_SC26 = 5 and YSC13_SC26a = 5 and YSC14_SC26b = 5 then f_mh_gad_a1 = 5;   /* No  */
else if YSC12_SC26 = .D or YSC13_SC26a = .D or YSC14_SC26b = .D then f_mh_gad_a1 = 9;  /* Don't know */
else if YSC12_SC26 = .R or YSC13_SC26a = .R or YSC14_SC26b = .R then f_mh_gad_a1 = 8;  /* Refuse */

*****************************************************************************************
* Criteria A Part 2: Anxiety occurring more days than not for at least 6 months         *
*                                                                                       *
*                    (YGA5a_G5 is at least 6 months)                                    *
*                     Note G30, G31 from NSHS Adolescent are deleted                    *
*****************************************************************************************; 

%tdy_g(G5t, YGA5a_G5, YGA5b_G5);  /* Calculate total time for variables */

if 180 <= G5t < 99998 then f_mh_gad_a2 = 1;   /* Yes */
else if 0 <= G5t < 180 then f_mh_gad_a2 = 5;  /* No  */
else if YGA5a_G5 = .D then f_mh_gad_a2 = 9;   /* Don't Know */
else if YGA5a_G5 = .R then f_mh_gad_a2 = 8;   /* Refuse */  
 
*****************************************************************************************
* Criteria A Part 3: Anxiety about a number of events or activities                     *
*                    (such as work or school performance)                               * 
*                                                                                       *
*                    At least 2 worries from YGA1_G1__S series                          *
*****************************************************************************************;

if %do i = 1 %to 27;
           YGA1_G1__S_&i = 1 or
       %end;
    YGA1_G1__S_28 = 1 then f_mh_gad_a3 = 1;                        /* Yes */
else if sum(%do i = 1 %to 27; 3 <= YGA1_G1__S_&i <= 29, %end; 
            3 <= YGA1_G1__S_28 <= 29) >= 2 then f_mh_gad_a3 = 1;   /* Yes */
else if sum(%do i = 1 %to 27; 3 <= YGA1_G1__S_&i <= 29, %end; 
            3 <= YGA1_G1__S_28 <= 29) = 1 then f_mh_gad_a3 = 5;   /* No */
else if %do i = 1 %to 27;
           YGA1_G1__S_&i = .D or
       %end;
    YGA1_G1__S_28 = .D then f_mh_gad_a3 = 9;                       /* Don't know */
else if %do i = 1 %to 27;
           YGA1_G1__S_&i = .R or
       %end;
    YGA1_G1__S_28 = .R then f_mh_gad_a3 = 8;                       /* Refused */

*****************************************************************************************
* Criteria A combine Parts 1,2,3                                                        *
*****************************************************************************************;   

if f_mh_gad_a1 = 1 and f_mh_gad_a2 = 1 and f_mh_gad_a3 = 1 then f_mh_gad_a = 1;     /* Yes */
else if f_mh_gad_a1 = 5 or f_mh_gad_a2 = 5 or f_mh_gad_a3 = 5 then f_mh_gad_a = 5;  /* No  */
else if f_mh_gad_a1 = .D or f_mh_gad_a2 = .D or f_mh_gad_a3 = .D then f_mh_gad_a = 9;   /* Don't know */
else if f_mh_gad_a1 = .R or f_mh_gad_a2 = .R or f_mh_gad_a3 = .R then f_mh_gad_a = 8;   /* Refuse */

*****************************************************************************************
* Criteria B: The person finds it difficult to control the worry                        *
*                                                                                       *  
*             YGA3_G4 is (1,2).                                                         *
*****************************************************************************************;

if YGA3_G4 IN(1,2) then f_mh_gad_b = 1;          /* Yes */
else if YGA3_G4 IN(3,4) then f_mh_gad_b = 5;     /* No  */
else if YGA3_G4 = .D then f_mh_gad_b = 9;        /* Don't know */
else if YGA3_G4 = .R then f_mh_gad_b = 8;        /* Refuse */

*******************************************************************************************
* Criteria C: The anxiety and worry are associated with three (or more) of the            *    
*             following six symptoms(1. restlessness or feeling keyed up or edge,         *
*             2. being easily fatigued, 3. difficulty concentrating or mind going blank,  *
*             4. irritability, 5. muscle tension, 6. sleep disturbance.)                  *
*                                                                                         *
*                                                                                         *
*             At least 1 of HGA7a_G9a-HGA7f_G9f are Yes(1)                                *
*             Note only 1 symptom is required for child                                   *
*******************************************************************************************;    

if sum(YGA7a_G9a = 1, YGA7b_G9b = 1, YGA7c_G9c = 1, YGA7d_G9d = 1, YGA7e_G9e = 1, YGA7f_G9f = 1) >= 1
    then f_mh_gad_c = 1;       /* Yes */
else if sum(YGA7a_G9a = 5, YGA7b_G9b = 5, YGA7c_G9c = 5, YGA7d_G9d = 5, YGA7e_G9e = 5, YGA7f_G9f = 5) >= 6
    then f_mh_gad_c = 5;  /* No  */
else if YGA7a_G9a = .D or YGA7b_G9b = .D or YGA7c_G9c = .D or YGA7d_G9d = .D or YGA7e_G9e = .D or 
        YGA7f_G9f = .D then f_mh_gad_c = 9;  /* Don't Know */
else if YGA7a_G9a = .R or YGA7b_G9b = .R or YGA7c_G9c = .R or YGA7d_G9d = .R or YGA7e_G9e = .R or 
        YGA7f_G9f = .R then f_mh_gad_c = 9;  /* Refuse */

***********************************************************************************************
* Criteria D: The focus of the anxiety and worry is not confined to features of an Axis 1     *
*             disorder:                                                                       *
*                                                                                             *
*             At least 1 value of 1-10, 13, 20-32 in YGA1_G1__s.                              *
***********************************************************************************************;

%let G1var = G1a  G1b  G1c  G1d  G1e  G1f  G1g  G1h  G1i  G1j  G1k  G1l  G1m  G1n  G1o   G1p
             G1q  G1r  G1s  G1t  G1u  G1v  G1w  G1x  G1y  G1z  G1aa G1ab G1ac G1ad G1ae G1af;
%let G1val =  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20
             21 22 23 24 25 26 27 28 29 30 31 32;

/* Generate data for variables G1a-G1af based on responses to G1 */

%do i = 1 %to 28;
    select(YGA1_G1__s_&i);
        %do j = 1 %to 32;
           when(&j) %scan(&G1var,&j) = 1;
        %end;
        otherwise;
    end;    
%end;

if G1a = 1 or G1b = 1 or G1c = 1 or G1d = 1 or G1e = 1 or G1f = 1 or G1g = 1 or G1h = 1 or
   G1i = 1 or G1j = 1 or G1m = 1 or G1t = 1 or G1u = 1 or G1v = 1 or G1w = 1 or G1x = 1 or
   G1y = 1 or G1z = 1 or G1aa = 1 or G1ab = 1 or G1ac = 1 or G1ad = 1 or G1ae = 1 or
   G1af = 1 then f_mh_gad_d = 1;    /* Yes */
else f_mh_gad_d = 5;                /* No  */

***********************************************************************************************
* Criteria E Part 1: The anxiety, worry, or physical symptoms                                 *
*                    cause clinically significant distress.                                   *
*                                                                                             *
*                    YGA9_G15 is (3,4,5) OR YGA4_G4a is (1,2).                                *  
***********************************************************************************************;
 
if YGA9_G15 IN(3,4,5) or YGA4_G4a IN(1,2) then f_mh_gad_e1 = 1;     /* Yes */
else if YGA9_G15 IN(1,2) or YGA4_G4a IN(3,4) then f_mh_gad_e1 = 5;   /* No  */
else if YGA9_G15 = .D or YGA4_G4a = .D then f_mh_gad_e1 = 9;         /* Don't know */
else if YGA9_G15 = .R or YGA4_G4a = .R then f_mh_gad_e1 = 8;         /* Refuse */ 

****************************************************************************************************
* Criteria E Part 2: The anxiety, worry, or physical symptoms cause clinically significant         *
*                    impairment in social, occupational, or other important areas of functioning   *
*                                                                                                  *
*                    YGA10_G17 is (3,4,5))                                                         *
*                                                                                                  *
*                    Note: G17a, G38 series, G40, G44 from NSHS Adolescent are deleted             *
****************************************************************************************************;

if YGA10_G17 IN(3,4,5) then f_mh_gad_e2 = 1;       /* Yes */                                                  
else if YGA10_G17 IN(1,2) then f_mh_gad_e2 = 5;    /* No */                   
else if YGA10_G17 = .D then f_mh_gad_e2 = .D;      /* Don't know */
else if YGA10_G17 = .R then f_mh_gad_e2 = .R;      /* Refuse */

***********************************************************************************************
* Criteria E combine Parts 1,2                                                                *
***********************************************************************************************;

if f_mh_gad_e1 = 1 or f_mh_gad_e2 = 1 then f_mh_gad_e = 1;        /* Yes */
else if f_mh_gad_e1 = 5 and f_mh_gad_e2 = 5 then f_mh_gad_e = 5;  /* No  */
else if f_mh_gad_e1 = .D or f_mh_gad_e2 = .D then f_mh_gad_e = 9;    /* Don't know */
else if f_mh_gad_e1 = .R or f_mh_gad_e2 = .R then f_mh_gad_e = 8;    /* Refuse */

*****************************************************************************************************
* Criteria F Part 1: The disturbance is not due to the direct physiological effects                 * 
*                    of a substance(e.g. a drug of abuse, a medication) or due to a                 *
*                    general medical condition(e.g., hyperthyroidism)                               * 
*                    Either G18,G18a,G18b series answered or G19,G21,G23,G24,G25 answered           *
*                                                                                                   *
*    (G18 is No(5) AND (G18a is No(5) OR G18b is No(5))) OR                                         *
*    (At least 1 value of 1-5,10-12 in G19) OR                                                      * 
*    (G21 is No(5) AND (G23 is No(5) OR G23 is Skipped) OR G25 is No(5)) OR                         *
*    ((At least 1 value of 81-99 in G19) AND (No values of 20-28,30-32 in G19) AND (G24 is (5,6)))  *
*                                                                                                   *
*    Note: G18, G19, G21, G23, G24, G25 are deleted                                                 *
*    Note: 5/22/03 Revised Criteria G18b = Yes fails criterion                                      *
*                                                                                                   *
*    Note: G18a, G18b from NSHS Adolescent are deleted, criteria not operationalized                *
*****************************************************************************************************;

**********************************************************************************************************
* Criteria F Part 2: The disturbance does not occur exclusively during a Mood Disorder,                  *
*                    a Psychotic Disorder, or a Pervasive Developmental Disorder                         *
*                    Note: Psychotic Disorder and Pervasive Developmental Disorder                       *  
*                          hierarchies are not operationalized                                           *
*                                                                                                        *
* (Major Depression = No(5) AND Mania = No(5)) OR                                                        *
* ((Major Depression = Yes(1) OR Mania = Yes(1)) AND                                                     *
*   ((GAD onset < Mood onset) OR                                                                         * 
*    (GAD recency > Mood recency))) OR                                                                   *
*                                                                                                        *
* (Major Depression = No(5) AND Mania = No(5)) OR                                                        *
* ((Major Depression = Yes(1) OR Mania = Yes(1)) AND                                                     *
*   ((GAD onset < Mood onset) OR                                                                         * 
*    (GAD recency > Mood recency))) OR                                                                   *
*                                                                                                        *
*    GAD onset = HGA11a_G26a OR HGA11b_G26b1                                                             *
*    GAD recency = (Age if HGA12_G27 is Yes(1)) OR HGA12c_G27c                                           *
*    GAD persistence = G27b OR G28 OR G30 OR G31                                                         *
*    Note: GAD persistence not operationalized                                                           *
*    Note: Minor Depression, Dysthymia not operationalized                                               *
**********************************************************************************************************;

/* Create onset, recency, persistence variables */

gad_on = min(YGA11a_G26a, YGA11b_G26b1);  /* GAD onset */
if gad_on IN(.D,.R) then gad_on = .;

if YGA12_G27 = 1 then gad_rec = f_svy_age_iw;   /* GAD recency */
else if YGA12_G27 IN(5,.D,.R) then gad_rec = YGA12c_G27c;

if gad_rec IN(.D,.R) then gad_rec = .;

mood_on = min(f_mh_dep_aoo_yt, f_mh_man_aoo_yt);
mood_rec = max(f_mh_dep_rec_yt, f_mh_man_rec_yt);

/* Calculate Criteria F Part 2 */

if f_mh_dep_evr_yt ^= 1 and f_mh_man_evr_yt ^= 1 then f_mh_gad_f2 = 1;
else if (f_mh_dep_evr_yt = 1 or f_mh_man_evr_yt = 1) and
       ((gad_on < mood_on and N(gad_on,mood_on) = 2) or
        (gad_rec > mood_rec and n(gad_rec,mood_rec) = 2)
       ) then f_mh_gad_f2 = 1;
else f_mh_gad_f2 = 5; 

***********************************************************************************************
* Criteria F combine Parts 1,2                                                                *
* Criteria F Part 1 not operationalized                                                       *
***********************************************************************************************;

f_mh_gad_f = f_mh_gad_f2;

***************************************************************************************************
* Check if all criteria are met for DSM-IV GAD(Generalized Anxiety Disorder)                      *
***************************************************************************************************;
 
if f_mh_gad_a = 1 and f_mh_gad_b = 1 and f_mh_gad_c = 1 and f_mh_gad_d = 1 and f_mh_gad_e = 1 
    then f_mh_gad_evr_yt = 1;        * All criteria except for hierarchy criteria F part 2 met; 
else f_mh_gad_evr_yt = 0;            * Criteria are not met;

if f_mh_gad_a = 1 and f_mh_gad_b = 1 and f_mh_gad_c = 1 and f_mh_gad_d = 1 and f_mh_gad_e = 1 and
   f_mh_gad_f = 1 then f_mh_gadh_evr_yt = 1;                            *Criteria are met;
else f_mh_gadh_evr_yt = 0;                                              *Criteria are not met;

******************************************************************************************
* Calculate Onset, Recency of GAD for DSM                                                *
******************************************************************************************;

if f_mh_gad_evr_yt = 1 then do;          /* GAD onset, recency, persistence for DSM */
   f_mh_gad_aoo_yt = gad_on;             /* assigned only if GAD criteria are met */
   f_mh_gad_rec_yt = gad_rec;
end;

%mend gad;

%gad;