**************************************************************************************
* PROGRAM: Mjdepdis-mto-youth.sas                                                    *
* DATE: 6/7/10                                                                       * 
*                                                                                    *
* MTO Youth diagnosis                                                                *
* Major Depressive Disorder, hierarchy rules are included                            *
*                                                                                    *
* Onset, Recency, persistence added                                                  *
* Note 6/7/10: Revise f_mh_deph_aoo_yt, f_mh_deph_rec_yt                             *
**************************************************************************************;

%macro mdd;

**************************************************************************************
* Criteria A: Presence of a Major Depressive Episode.                                * 
*                                                                                    *
*             Major Depressive Episode is Yes(1)                                     *
**************************************************************************************;

f_mh_deph_a = f_mh_dep_evr_yt;

****************************************************************************************************
* Criteria C: There has never been a Manic Episode, a Mixed Episode, or a Hypomanic Episode.       *
*                                                                                                  * 
*             Note: This exclusion does not apply if all of the manic-like, mixed-like, or         *
*                   hypomanic-like episodes are substance or treatment induced or are due to the   *
*                   direct physiological effects of a general medical condition.                   * 
*                                                                                                  *
*             Note: Mixed Episode not operationalized.                                             * 
*                                                                                                  *
*             NOT(Mania OR Hypomania)                                                              *
****************************************************************************************************;

if f_mh_man_evr_yt ^=1 and f_mh_hyp_evr_yt ^= 1 then f_mh_deph_c = 1;   /* Yes */ 
else f_mh_deph_c = 5;                                             /* No  */

*****************************************************************************************************
* Combine Criteria A,C                                                                              *
*****************************************************************************************************;

if f_mh_deph_a = 1 and f_mh_deph_c = 1 then f_mh_deph_evr_yt = 1;     * All Criteria are met;                        
else f_mh_deph_evr_yt = 0;                                            * Criteria not met;

******************************************************************************************
* Calculate Onset, Recency of Major Depressive Disorder for DSM                          *
******************************************************************************************;

if YDE6_D22 = 1 then deph_on = min(YDE6a_D22a, YDE13a_D37a, YDE13b_D37b1);      /* Major Depressive Disorder onset */
else if YDE6_D22 IN(5,.D,.R) then deph_on = min(YDE6d_D22c, YDE13a_D37a, YDE13b_D37b1);  

if deph_on IN(.D,.R) then deph_on = .;

if YDE14_D38 = 1 then deph_rec = f_svy_age_iw;                 /* Major Depressive Disorder recency */
else if YDE14_D38 IN(5,.D,.R) then deph_rec = YDE14b_D38c;

if deph_rec IN(.D,.R) then deph_rec = .;

if f_mh_deph_evr_yt = 1 then do;          /* Major Depressive Disorder onset, recency for DSM            */
   f_mh_deph_aoo_yt = deph_on;             /* assigned only if Major Depressive Disorder criteria are met */
   f_mh_deph_rec_yt = deph_rec;
end;

%mend mdd;

%mdd;
  
