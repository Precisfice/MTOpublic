***********************************************************************************************
* PROGRAM: IED-mto-youth.sas                                                                  *
* DATE: 4/9/10                                                                                * 
*                                                                                             *
* MTO Youth                                                                                   *
* Check whether criteria are met for Intermittent Explosive Disorder for DSM-IV method        *
* Onset, recency, persistence for ODD are calculated                                          *
***********************************************************************************************;

%macro ied;

************************************************************************************************
* Criteria A: Several discrete episodes of failure to resist aggresive impulses that result    *
*             in serious assaultive acts or destruction of property                            *
*                                                                                              *
*             3 <= YIE1_IED3 <= 9997 AND YHIE4_IED6 is Yes(1)                                   *
************************************************************************************************;      

*Note: If YIE1_IED3 0-2 then YIE4_IED6 is skipped;
*Note: If YIE3a_IED5b ^= 1 then YIE4_IED6 is skipped;
if 3 <= YIE1_IED3 <= 9997 and YIE4_IED6 = 1 then f_mh_ied_a = 1;                            /* Yes */
else if 0 <= YIE1_IED3 < 3 or YIE3a_IED5b IN(5,.D,.R) or YIE4_IED6 = 5 then f_mh_ied_a = 5;  /* No */
else if YIE1_IED3 = .D or YIE4_IED6 = .D then f_mh_ied_a = 9;                               /* Don't know */
else if YIE1_IED3 = .R or YIE4_IED6 = .R then f_mh_ied_a = 8;                               /* Refuse */

************************************************************************************************
* Criteria B: The degree of aggressiveness expressed during the episodes is grossly out of     *
*             proportion to any precipitating psychosocial stressors                           *
*                                                                                              *
*             YIE2_IED5 is Yes(1) OR YIE3_IED5a is Yes(1) OR YIE3a_IED5b is Yes(1)             *
************************************************************************************************;      

if YIE2_IED5 = 1 or YIE3_IED5a = 1 or YIE3a_IED5b = 1 then f_mh_ied_b = 1;           /* Yes */
else if YIE2_IED5 = 5 and YIE3_IED5a = 5 and YIE3a_IED5b = 5 then f_mh_ied_b = 5;    /* No  */
else if YIE2_IED5 = .D or YIE3_IED5a = .D or YIE3a_IED5b = .D then f_mh_ied_b = 9;   /* Don't Know */
else if YIE2_IED5 = .R or YIE3_IED5a = .R or YIE3a_IED5b = .R then f_mh_ied_b = 8;   /* Refused */

************************************************************************************************
* Criteria C Part 1: The aggresive episodes are not better accounted for by another mental     *
*                    disorder                                                                  *
*                                                                                              *
*                    Not(Mania) AND Not(Conduct Disorder) AND Not(Attention Deficit Disorder)  *
*                                                                                              *
*                    a. IF IED9a = 5 and LT DSM-IV alcohol or drug abuse or dependence is yes  *
*                       and the ages of onset and recency of IED fall within the ages of onset *
*                       and recency of alc-drug disorders, then R should be coded as not       *
*                       having IED with diagnostic hierarchy rules. This excludes cases due to *
*                       drinking and drugs.                                                    *
*                                                                                              *
*                       Alcohol, Drug disorders not in MTO, criteria not operationalized       *
*                                                                                              *
*                    b. IF IED10b = 5, then R should be coded as not having IED with           *
*                       diagnostic hierarchy rules. This excludes cases due to physical        *
*                       illness or medication for physical illness.                            *
*                                                                                              *
*                    c. IF IED11a = 5 and lifetime MDE is yes and AOO and recency of IED falls *
*                       within the ages of onset and recency of MDE, then R should be coded as *
*                       not having IED with diagnostic hierarchy rules. This excludes cases    *
*                       due to MDE.                                                            *
*                                                                                              *
*                    d. The above three were the only ones explicitly asked about in the IED   *
*                       section. We should have also included a question about mania, but we   *
*                       did not. To make up for this, we want to impose the following          *
*                       additional requirement. We want to recode a person as not having IED   *
*                       with hierarchy if he meets all of the following requirements:          *
*                          If (i) lifetime manic episode or hypomanic episode are yes and      *
*                             (ii) the AOO and recency of IED fall within the ages of onset    *
*                                  and recency of manic or hypomanic episode and               *
*                             (iv) the number of years in M23 is greater than or equal to the  *
*                                  number of years in IED19 (i.e., lifetime # of years with    *
*                                  manic or hypomanic episodes is GTE lifetime # of years with *
*                                  IED: note that in cases where R says DK/REF for either M23  *
*                                  or IED19, we want to assume that years with mania is GTE    *
*                                  years with IED).                                            *
*                                                                                              *
*                                  Number of lifetime manic, hypomanic episodes not asked,     *
*                                  Criteria (iv)not operationalized                            *
*                                                                                              *
*                    e. We also originally excluded all people from having IED with hierarchy  *
*                       if they reported either LT ADHD or lifetime CD. This was too strict,   *
*                       as DSM-IV-TR says that both diagnoses can be made in such cases if the *
*                       anger attacks are truly due to impulsive aggression. Our assessment is *
*                       done in such a way that we clearly assess impulsive aggression, not    *
*                       merely criminal aggression in CD. Nothing is said about ADHD in        *
*                       DSM-IV-TR. Therefore, I want to delete any exclusions because of       *
*                       comorbidity with CD or ADHD in the new version of the diagnostic       *
*                       hierarchy exclusion for IED.                                           *
************************************************************************************************;      

ied_on = min(YIE8a_IED18a, YIE8b_IED18b1);                  /* IED onset */
if ied_on IN(.D,.R) then ied_on = .;

if YIE9_IED22 IN(1,2,3) then ied_rec = f_svy_age_iw;        /* IED recency */
else if YIE9_IED22 IN(4,8,9) then ied_rec = YIE9a_IED22a;

if ied_rec IN(.D,.R) then ied_rec = .;

/* Criteria C Part 1a  */
/* Not operationalized */

/* Criteria C Part 1b */
if YIE6a_IED10b = 5 then f_mh_ied_c1b = 5;
else f_mh_ied_c1b = 1;

/* Criteria C Part 1c */
if YIE7a_IED11a = 5 and f_mh_dep_evr_yt = 1 and 
   ied_on ^= . and ied_rec ^= . and f_mh_dep_aoo_yt ^= . and
   (f_mh_dep_aoo_yt <= ied_on <= f_mh_dep_rec_yt) and (f_mh_dep_aoo_yt <= ied_rec <= f_mh_dep_rec_yt) 
   then f_mh_ied_c1c = 5;
else f_mh_ied_c1c = 1;                                                                       /* Yes */

/* Criteria C Part 1d(i) */
if f_mh_man_evr_yt = 1 or f_mh_hyp_evr_yt = 1 then f_mh_ied_c1d1 = 5;
else f_mh_ied_c1d1 = 1;

/* Criteria C Part 1d(ii) */
if ied_on ^= . and ied_rec ^= . and N(f_mh_man_aoo_yt, f_mh_hyp_aoo_yt) >= 1 and 
   min(f_mh_man_aoo_yt,f_mh_hyp_aoo_yt) <= ied_on <= max(f_mh_man_rec_yt, f_mh_hyp_rec_yt) and
   min(f_mh_man_aoo_yt,f_mh_hyp_aoo_yt) <= ied_rec <= max(f_mh_man_rec_yt, f_mh_hyp_rec_yt) then f_mh_ied_c1d2 = 5;
else f_mh_ied_c1d2 = 1;
   
/* Criteria C Part 1d(iv)       */
/* Criteria not operationalized */

/* Combine parts i,ii,iv for IED Criteria C Part 1d */
if f_mh_ied_c1d1 = 1 or f_mh_ied_c1d2 = 1 then f_mh_ied_c1d = 1;
else f_mh_ied_c1d = 5;

/* Combine parts a,b,c,d for IED Criteria C Part 1 */
if f_mh_ied_c1b = 1 and f_mh_ied_c1c = 1 and f_mh_ied_c1d = 1 then f_mh_ied_c1 = 1;
else f_mh_ied_c1 = 5;

**************************************************************************************************
* Criteria C Part 2: The aggresive episodes are not due to the direct physiological effects of   *
*                    a substance or a general medical condition                                  *
*                                                                                                *
*                    (YIE5_IED9 is No(5) or YIE5a_IED9a is Yes(1)) AND                           *
*                    (YIE6_IED10 is No(5) or YIE6a_IED10b is Yes(1))                             *
**************************************************************************************************;      

if (YIE5_IED9 = 5 or YIE5a_IED9a = 1) and (YIE6_IED10 = 5 or YIE6a_IED10b = 1) then f_mh_ied_c2 = 1;        /* Yes */                  
else if (YIE5_IED9 = 1 and YIE5a_IED9a = 5) or (YIE6_IED10 = 1 and YIE6a_IED10b = 5) then f_mh_ied_c2 = 5;  /* No */
else if YIE5_IED9 = .D or YIE5a_IED9a = .D or YIE6_IED10 = .D or YIE6a_IED10b = .D then f_mh_ied_c2 = 9;    /* Don't know */
else if YIE5_IED9 = .R or YIE5a_IED9a = .R or YIE6_IED10 = .R or YIE6a_IED10b = .R then f_mh_ied_c2 = 8;    /* Refuse */

********************************************************************************************
* Combine Criteria C Part1 and Part 2                                                      * 
********************************************************************************************;

if f_mh_ied_c1 = 1 and f_mh_ied_c2 = 1 then f_mh_ied_c = 1;       /* Yes */
else if f_mh_ied_c1 = 5 or f_mh_ied_c2 = 5 then f_mh_ied_c = 5;   /* No */
else if f_mh_ied_c2 = 9 then f_mh_ied_c = 9;                      /* Don't know */
else if f_mh_ied_c2 = 8 then f_mh_ied_c = 8;                      /* Refuse     */

********************************************************************************************
* Combine Criteria A,B,C                                                                   * 
********************************************************************************************;

if f_mh_ied_a = 1 and f_mh_ied_b = 1 and f_mh_ied_c2 = 1 
   then f_mh_ied_evr_yt = 1;                                * All criteria except for hierarchy criteria C Part 1 met;
else f_mh_ied_evr_yt = 0;                                   * Criteria are not met;  

if f_mh_ied_a = 1 and f_mh_ied_b = 1 and f_mh_ied_c = 1 then f_mh_iedh_evr_yt = 1;   /* Criteria are met */
else f_mh_iedh_evr_yt = 0;                                                           /* Criteria are not met */

******************************************************************************************
* Calculate Onset, Recency, Persistence of Intermittent Explosive Disorder for DSM       *
******************************************************************************************;

if f_mh_ied_evr_yt = 1 then do;          /* Intermittent Explosive Disorder onset, recencye for DSM           */
   f_mh_ied_aoo_yt = ied_on;             /* assigned only if Intermittent Explosive Disorder criteria are met */
   f_mh_ied_rec_yt = ied_rec;
end;

%mend ied;

%ied;