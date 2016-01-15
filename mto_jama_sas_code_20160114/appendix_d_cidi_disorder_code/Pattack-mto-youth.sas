*************************************************************************************
* PROGRAM: Pattack-mto-youth.sas                                                    *
* DATE: 4/9/10                                                                      *
*                                                                                   *
* MTO Youth                                                                         *
* Check whether Criteria are met for Panic Attack for DSM method                    *
*************************************************************************************;

*************************************************************************************
* Panic Attack -- DSM-IV criteria                                                   *
*************************************************************************************;

%macro pattack;

*************************************************************************************
* Criteria A: A discrete period of intense fear or discomfort.                      *
*                                                                                   *
*             YSC1_SC20 is Yes(1) OR YSC2_SC20a is Yes(1)                           *
*************************************************************************************;

if YSC1_SC20 = 1 or YSC2_SC20a = 1 then f_mh_pat_a = 1;         /* Yes */
else if YSC1_SC20 = 5 and YSC2_SC20a = 5 then f_mh_pat_a = 5;   /* No */
else if YSC1_SC20 = .D or YSC2_SC20a = .D then f_mh_pat_a = 9;  /* Don't Know */
else if YSC1_SC20 = .R or YSC2_SC20a = .R then f_mh_pat_a = 8;  /* Refuse */

****************************************************************************************************
* Criteria B: Four or more of the following symptoms occur:                                        *
*                                                                                                  *
*             1.  palpitations, pounding heart, or accelerated heart rate.                         *
*                                                                                                  *
*                 YPD1a_PD1a is Yes(1)                                                             *
*                                                                                                  *
*             2.  sweating.                                                                        *
*                                                                                                  *
*                 YPD1e_PD1e is Yes(1)                                                             *
*                                                                                                  *
*             3.  trembling or shaking.                                                            *
*                                                                                                  *
*                 YPD1f_PD1f is Yes(1)                                                             *
*                                                                                                  *
*             4.  sensation of shortness of breath or smothering.                                  *
*                                                                                                  * 
*                 YPD1b_PD1b is Yes(1)                                                             * 
*                                                                                                  * 
*             5.  feeling of choking.                                                              *
*                                                                                                  *
*                 YPD1f_PD1h is Yes(1)                                                             *
*                                                                                                  * 
*             6.  chest pain or discomfort.                                                        *
*                                                                                                  *
*                 YPD1i_PD1i is Yes(1)                                                             *
*                                                                                                  *
*             7.  nausea or abdominal distress.                                                    *
*                                                                                                  *
*                 YPD1c_PD1c is Yes(1)                                                             *
*                                                                                                  *
*             8.  feeling dizzy, unsteady, lightheaded, or faint.                                  *
*                                                                                                  *
*                 YPD1d_PD1d is Yes(1) OR YPD1m_PD1m is Yes(1)                                     *
*                                                                                                  *
*             9.  derealization (feelings of unreality) or                                         *
*                 depersonalization(being detached from oneself).                                  *
*                                                                                                  * 
*                 YPD1k_PD1k is Yes(1) OR YPD1l_PD1l is Yes(1)                                     *
*                                                                                                  *
*            10.  fear of losing control or going crazy.                                           *
*                                                                                                  *
*                 YPD1j_PD1j is Yes(1)                                                             *
*                                                                                                  *   
*            11.  fear of dying.                                                                   *
*                                                                                                  *
*                 YPD1n_PD1n is Yes(1)                                                             *
*                                                                                                  *
*            12.  paresthesias(numbing or tingling sensations).                                    *
*                                                                                                  *  
*                 YPD1p_PD1p is Yes(1)                                                             *
*                                                                                                  *  
*            13.  chills or hot flushes.                                                           *
*                                                                                                  *
*                 YPD1o_PD1o is Yes(1)                                                             *
****************************************************************************************************;

*1.  palpitations, pounding heart, or accelerated heart rate;

if YPD1a_PD1a = 1 then f_mh_pat_b1 = 1;       /* Yes */
else if YPD1a_PD1a = 5 then f_mh_pat_b1 = 5;  /* No */
else if YPD1a_PD1a = .D then f_mh_pat_b1 = 9; /* Don't know */
else if YPD1a_PD1a = .R then f_mh_pat_b1 = 8; /* Refuse */

*2.  sweating;

if YPD1e_PD1e = 1 then f_mh_pat_b2 = 1;       /* Yes */
else if YPD1e_PD1e = 5 then f_mh_pat_b2 = 5;  /* No */
else if YPD1e_PD1e = .D then f_mh_pat_b2 = 9; /* Don't know */
else if YPD1e_PD1e = .R then f_mh_pat_b2 = 8; /* Refuse */

*3.  trembling or shaking;

if YPD1f_PD1f = 1 then f_mh_pat_b3 = 1;       /* Yes */
else if YPD1f_PD1f = 5 then f_mh_pat_b3 = 5;  /* No */
else if YPD1f_PD1f = .D then f_mh_pat_b3 = 9; /* Don't know */
else if YPD1f_PD1f = .R then f_mh_pat_b3 = 8; /* Refuse */

*4.  sensation of shortness of breath or smothering;

if YPD1b_PD1b = 1 then f_mh_pat_b4 = 1;       /* Yes */
else if YPD1b_PD1b = 5 then f_mh_pat_b4 = 5;  /* No */
else if YPD1b_PD1b = .D then f_mh_pat_b4 = 9; /* Don't know */
else if YPD1b_PD1b = .R then f_mh_pat_b4 = 8; /* Refuse */

*5.  feeling of choking;

if YPD1h_PD1h = 1 then f_mh_pat_b5 = 1;       /* Yes */
else if YPD1h_PD1h = 5 then f_mh_pat_b5 = 5;  /* No */
else if YPD1h_PD1h = .D then f_mh_pat_b5 = 9; /* Don't know */
else if YPD1h_PD1h = .R then f_mh_pat_b5 = 8; /* Refuse */

*6.  chest pain or discomfort;

if YPD1i_PD1i = 1 then f_mh_pat_b6 = 1;       /* Yes */
else if YPD1i_PD1i = 5 then f_mh_pat_b6 = 5;  /* No */
else if YPD1i_PD1i = .D then f_mh_pat_b6 = 9; /* Don't know */
else if YPD1i_PD1i = .R then f_mh_pat_b6 = 8; /* Refuse */

*7.  nausea or abdominal distress;

if YPD1c_PD1c = 1 then f_mh_pat_b7 = 1;       /* Yes */
else if YPD1c_PD1c = 5 then f_mh_pat_b7 = 5;  /* No */
else if YPD1c_PD1c = .D then f_mh_pat_b7 = 9; /* Don't know */
else if YPD1c_PD1c = .R then f_mh_pat_b7 = 8; /* Refuse */

*8.  feeling dizzy, unsteady, lightheaded, or faint;

if YPD1d_PD1d = 1 or YPD1m_PD1m = 1 then f_mh_pat_b8 = 1;
else if YPD1d_PD1d = 5 and YPD1m_PD1m = 5 then f_mh_pat_b8 = 5;
else if YPD1d_PD1d = .D or YPD1m_PD1m = .D then f_mh_pat_b8 = 9;
else if YPD1d_PD1d = .R or YPD1m_PD1m = .R then f_mh_pat_b8 = 8;

*9.  derealization (feelings of unreality) or depersonalization(being detached from oneself);

if YPD1k_PD1k = 1 or YPD1l_PD1l = 1 then f_mh_pat_b9 = 1;
else if YPD1k_PD1k = 5 and YPD1l_PD1l = 5 then f_mh_pat_b9 = 5;
else if YPD1k_PD1k = .D or YPD1l_PD1l = .D then f_mh_pat_b9 = 9;
else if YPD1k_PD1k = .R or YPD1l_PD1l = .R then f_mh_pat_b9 = 8;

*10.  fear of losing control or going crazy;

if YPD1j_PD1j = 1 then f_mh_pat_b10 = 1;       /* Yes */
else if YPD1j_PD1j = 5 then f_mh_pat_b10 = 5;  /* No */
else if YPD1j_PD1j = .D then f_mh_pat_b10 = 9; /* Don't know */
else if YPD1j_PD1j = .R then f_mh_pat_b10 = 8; /* Refuse */

*11.  fear of dying;

if YPD1n_PD1n = 1 then f_mh_pat_b11 = 1;       /* Yes */
else if YPD1n_PD1n = 5 then f_mh_pat_b11 = 5;  /* No */
else if YPD1n_PD1n = .D then f_mh_pat_b11 = 9; /* Don't know */
else if YPD1n_PD1n = .R then f_mh_pat_b11 = 8; /* Refuse */

*12.  paresthesias(numbing or tingling sensations);

if YPD1p_PD1p = 1 then f_mh_pat_b12 = 1;       /* Yes */
else if YPD1p_PD1p = 5 then f_mh_pat_b12 = 5;  /* No */
else if YPD1p_PD1p = .D then f_mh_pat_b12 = 9; /* Don't know */
else if YPD1p_PD1p = .R then f_mh_pat_b12 = 8; /* Refuse */

*13.  chills or hot flushes;

if YPD1o_PD1o = 1 then f_mh_pat_b13 = 1;       /* Yes */
else if YPD1o_PD1o = 5 then f_mh_pat_b13 = 5;  /* No */
else if YPD1o_PD1o = .D then f_mh_pat_b13 = 9; /* Don't know */
else if YPD1o_PD1o = .R then f_mh_pat_b13 = 8; /* Refuse */

*Combine symptoms to see if there are 4;

if sum(f_mh_pat_b1 = 1, f_mh_pat_b2 = 1, f_mh_pat_b3 = 1, f_mh_pat_b4 = 1, f_mh_pat_b5 = 1,
       f_mh_pat_b6 = 1, f_mh_pat_b7 = 1, f_mh_pat_b8 = 1, f_mh_pat_b9 = 1, f_mh_pat_b10 = 1,
       f_mh_pat_b11 = 1, f_mh_pat_b12 = 1, f_mh_pat_b13 = 1) >= 4 
   or 
   (sum(f_mh_pat_b1 = 1, f_mh_pat_b2 = 1, f_mh_pat_b3 = 1, f_mh_pat_b4 = 1, f_mh_pat_b5 = 1, 
        f_mh_pat_b6 = 1, f_mh_pat_b7 = 1, f_mh_pat_b8 = 1, f_mh_pat_b9 = 1, f_mh_pat_b10 = 1,
        f_mh_pat_b11 = 1, f_mh_pat_b12 = 1, f_mh_pat_b13 = 1) = 3
   and YPD1g_PD1g = 1)  
   then f_mh_pat_b = 1;                                                                    /* Yes */
else if sum(f_mh_pat_b1 = 5, f_mh_pat_b2 = 5, f_mh_pat_b3 = 5, f_mh_pat_b4 = 5, f_mh_pat_b5 = 5,
            f_mh_pat_b6 = 5, f_mh_pat_b7 = 5, f_mh_pat_b8 = 5, f_mh_pat_b9 = 5, f_mh_pat_b10 = 5, 
            f_mh_pat_b11 = 5, f_mh_pat_b12 = 5, f_mh_pat_b13 = 5) >= 10 
   then f_mh_pat_b = 5;                                                                    /* No */ 
else if f_mh_pat_b1 = .D or f_mh_pat_b2 = .D or f_mh_pat_b3 = .D or f_mh_pat_b4 = .D or
        f_mh_pat_b5 = .D or f_mh_pat_b6 = .D or f_mh_pat_b7 = .D or f_mh_pat_b8 = .D or
        f_mh_pat_b9 = .D or f_mh_pat_b10 = .D or f_mh_pat_b11 = .D or f_mh_pat_b12 = .D or 
        f_mh_pat_b13 = .D then f_mh_pat_b = 9;                  /* Don't know */
else if f_mh_pat_b1 = .R or f_mh_pat_b2 = .R or f_mh_pat_b3 = .R or f_mh_pat_b4 = .R or
        f_mh_pat_b5 = .R or f_mh_pat_b6 = .R or f_mh_pat_b7 = .R or f_mh_pat_b8 = .R or
        f_mh_pat_b9 = .R or f_mh_pat_b10 = .R or f_mh_pat_b11 = .R or f_mh_pat_b12 = .R or 
        f_mh_pat_b13 = .R then f_mh_pat_b = 8;                  /* Refuse */

********************************************************************************************
* Criteria C: The symptoms developed abruptly and reached a peak within 10 minutes         *
*                                                                                          *
*             YPD2_PD3 is (1,2,3)                                                          *
********************************************************************************************;

if YPD2_PD3 IN(1,2,3) then f_mh_pat_c = 1;    /* Yes */
else if YPD2_PD3 = 4 then f_mh_pat_c = 5;     /* No */
else if YPD2_PD3 = .D then f_mh_pat_c = 9;    /* Don't know */
else if YPD2_PD3 = .R  then f_mh_pat_c = 8;   /* Refuse */

********************************************************************************************
* Combine Criteria A,B,C,                                                                  * 
********************************************************************************************;

if f_mh_pat_a = 1 and f_mh_pat_b = 1 and f_mh_pat_c = 1 then f_mh_pat_evr_yt = 1;   /* All criteria are met */
else f_mh_pat_evr_yt = 0;                                                           /* criteria are not met */

***************************************************************************************
* Calculate Onset, Recency, Persistence of Panic Attack                               *
*                                                                                     *
***************************************************************************************;

pat_on = min(YPD5a_PD9a, YPD5b_PD9b1);
if pat_on IN(.D, .R) then pat_on = .;

if YPD7_PD10 = 1 then pat_rec = f_svy_age_iw;
else pat_rec = YPD7c_PD10d;

if pat_rec IN(.D, .R) then pat_rec = .;

pat_per = pat_rec - pat_on;                    /* Panic Attack persistence */

if f_mh_pat_evr_yt = 1 then do;          /* Panic Attack onset, recency, persistence for DSM */
   f_mh_pat_aoo_yt = pat_on;             /* assigned only if Panic Attack criteria are met */
   f_mh_pat_rec_yt = pat_rec;
end;

%mend pattack;

%pattack;