*************************************************************************************
* PROGRAM: Pdis-mto-youth.sas                                                       *
* DATE: 4/9/10                                                                      *
*                                                                                   *
* MTO youth                                                                         *
*************************************************************************************;

*************************************************************************************
* Panic Disorder -- DSM-IV criteria                                                 *
*************************************************************************************;

%macro pdis;

*********************************************************************************************
* Criteria A Part 1: Recurrent unexpected Panic Attacks                                     *
*                                                                                           *
*                    (Panic Attack is Yes(1)) AND (1 < YPD3_PD4 < 998) AND                  *
*                    (1 < YPD4a_PD17a < 998)                                                *
*********************************************************************************************;

if f_mh_pat_evr_yt = 1 and 1 < YPD3_PD4 < 998 and 4 <= YPD4a_PD17a < 998 then f_mh_pds_a1 = 1;       /* Yes */
else if f_mh_pat_evr_yt = 0 or 0 <= YPD3_PD4 <= 1 or 0 <= YPD4a_PD17a <= 3 then f_mh_pds_a1 = 5;    /* No  */
else if YPD3_PD4 = .D or YPD4a_PD17a = .D then f_mh_pds_a1 = 9;                           /* Don't know  */
else if YPD3_PD4 = .R or YPD4a_PD17a = .R then f_mh_pds_a1 = 8;                           /* Refuse  */

************************************************************************************************
* Criteria A Part 2: At least one of the attacks has been followed by 1 month (or more) of     *
*                    one (or more) of the following:                                           *
*                                                                                              *  
*                    1. persistent concern about having additional attacks.                    *
*                                                                                              *
*                    YPD8a_PD13a is Yes(1)                                                     * 
*                                                                                              * 
*                    2. worry about the implications of the attack or its consequences         * 
*                       (e.g., losing control, having a heart attack, going crazy)             * 
*                                                                                              *
*                    YPD8b_PD13b is Yes(1)                                                     *
*                                                                                              *
*                    3. a significant change in behavior related to the attacks.               * 
*                                                                                              *
*                    YPD8c_PD13c is Yes(1) OR YPD8d_PD13d is Yes(1)                            *
*                                                                                              *
*                    Note PD42 from NSHS Adolescent is deleted                                 *
************************************************************************************************;


*1. persistent concern about having additional attacks;
if YPD8a_PD13a = 1 then f_mh_pds_a21 = 1;        /* Yes */
else if YPD8a_PD13a = 5 then f_mh_pds_a21 = 5;   /* No */
else if YPD8a_PD13a = .D then f_mh_pds_a21 = 9;  /* Don't know */
else if YPD8a_PD13a = .R then f_mh_pds_a21 = 8;  /* Refuse */

*2. worry about the implications of the attack or its consequences
    (e.g., losing control, having a heart attack, going crazy);
if YPD8b_PD13b = 1 then f_mh_pds_a22 = 1;        /* Yes */
else if YPD8b_PD13b = 5 then f_mh_pds_a22 = 5;   /* No */
else if YPD8b_PD13b = .D then f_mh_pds_a22 = 9;  /* Don't know */
else if YPD8b_PD13b = .R then f_mh_pds_a22 = 8;  /* Refuse */

*3. a significant change in behavior related to the attacks;
if YPD8c_PD13c = 1 or YPD8d_PD13d = 1 then f_mh_pds_a23 = 1;         /* Yes */
else if YPD8c_PD13c = 5 and YPD8d_PD13d = 5 then f_mh_pds_a23 = 5;   /* No */
else if YPD8c_PD13c = .D or YPD8d_PD13d = .D then f_mh_pds_a23 = 9;  /* Don't know */
else if YPD8c_PD13c = .R or YPD8d_PD13d = .R then f_mh_pds_a23 = 8;  /* Refuse */

*Combine 3 parts of Criteria A Part 2;

if f_mh_pds_a21 = 1 or f_mh_pds_a22 = 1 or f_mh_pds_a23 = 1 then f_mh_pds_a2 = 1;           /* Yes */
else if f_mh_pds_a21 = 5 and f_mh_pds_a22 = 5 and f_mh_pds_a23 = 5 then f_mh_pds_a2 = 5;    /* No */
else if f_mh_pds_a21 = 9 or f_mh_pds_a22 = 9 or f_mh_pds_a23 = 9 then f_mh_pds_a2 = 9;      /* Don't know */
else if f_mh_pds_a21 = 8 or f_mh_pds_a22 = 8 or f_mh_pds_a23 = 8 then f_mh_pds_a2 = 8;      /* Refuse */

*********************************************************************************
* Criteria A: Combine Parts 1,2                                                 *
*********************************************************************************;

if f_mh_pds_a1 = 1 and f_mh_pds_a2 = 1 then f_mh_pds_a = 1;       /* Yes */
else if f_mh_pds_a1 = 5 or f_mh_pds_a2 = 5 then f_mh_pds_a = 5;   /* No */
else if f_mh_pds_a1 = 9 or f_mh_pds_a2 = 9 then f_mh_pds_a = 9;   /* Don't know */
else if f_mh_pds_a1 = 8 or f_mh_pds_a2 = 8 then f_mh_pds_a = 8;   /* Refuse */

*********************************************************************************************************
* Criteria C: The Panic Attacks are not due to the direct physiological effects of a                    *
*             substance(e.g., a drug of abuse, a medication) or a                                       *
*             general medical condition(e.g., hyperthyroidism)                                          *
*                                                                                                       *
*     (PD25 is No(5) AND (PD25a is No(5) OR PD25b is No(5))) OR                                         *
*     (At least 1 value of 1-5,10-12 in PD26) OR                                                        *
*     ((PD28 is No(5) AND (PD30 is skipped OR PD30 is No(5))) OR PD32 is No(5)) OR                      *
*     ((At least 1 value of 81-99 in PD26) AND (No values of 20-28,30-32 in PD26) AND (PD31 is (5,6)))  *
*                                                                                                       *
*     Note: PD25a, PD25b from NSHS Adolescent were deleted, criteria not operationalized                *
*********************************************************************************************************;

********************************************************************************************
* Combine Criteria A,B,C                                                                   *
* Criteria C not operationalized                                                           * 
********************************************************************************************;

if f_mh_pds_a = 1 then f_mh_pds_evr_yt = 1;    /* All Criteria are met */
else f_mh_pds_evr_yt = 0;                      /* Criteria are not met */

******************************************************************************************
* Calculate Onset, Recency, Persistence of Panic Disorder for DSM                        *
******************************************************************************************;

pd_on = min(YPD5a_PD9a, YPD5b_PD9b1);
if pd_on IN(.D, .R) then pd_on = .;

if YPD7_PD10 = 1 then pd_rec = f_svy_age_iw;
else pd_rec = YPD7c_PD10d;

if pd_rec IN(.D, .R) then pd_rec = .;

pd_per = pd_rec - pd_on;                    /* PD persistence */

if f_mh_pds_evr_yt = 1 then do;         /* Panic Disorder onset, recency, persistence for DSM */
   f_mh_pds_aoo_yt = pd_on;             /* assigned only if Panic Disorder criteria are met */
   f_mh_pds_rec_yt = pd_rec;
end;

%mend pdis;

%pdis;
