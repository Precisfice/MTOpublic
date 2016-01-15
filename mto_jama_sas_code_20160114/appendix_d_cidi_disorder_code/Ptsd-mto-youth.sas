*****************************************************************************************
* PROGRAM: Ptsd-mto-youth.sas                                                           *
* DATE: 4/9/10                                                                          *
*                                                                                       *
* MTO Youth                                                                             *
* Check whether Criteria are met for Posttraumatic Disorder                             *
*****************************************************************************************;

*************************************************************************************
* Posttraumatic Disorder -- DSM-IV criteria                                         *
*************************************************************************************;

%macro ptsd;

**************************************************************************************************
* Criteria A: Part 1.  The person has been exposed to a traumatic event in which the             *
*                      person experienced, witnessed, or was confronted with an                  *
*                      event or events that involved actual or threatened death or               *
*                      serious injury, or a threat to the physical integrity of self or others.  *
*                                                                                                *
*     Combat Experience/Relief Worker in War Zone/Civilian in War Zone/                          *
*     Civilian in region of Terror/Refugee:                                                      * 
*                                                                                                *
*     PT29,PT30,PT31,PT32,PT33 from NSHS Adolescent were removed.                                *
*                                                                                                *
*     Kidnapped:                                                                                 *
*                                                                                                *
*     PT34 from NSHS Adolescent was removed.                                                     *    
*                                                                                                * 
*     Toxic Exposure:                                                                            * 
*                                                                                                *
*     PT35 from NSHS Adolescent was removed.                                                     *
*                                                                                                *
*     Automobile Accident:                                                                       *
*                                                                                                *  
*     PT36 from NSHS Adolescent was removed.                                                     *
*                                                                                                *
*     Other Life Threatening Accident:                                                           *
*                                                                                                *
*     PT37 from NSHS Adolescent was removed.                                                     *
*                                                                                                *
*     Natural Disaster:                                                                          *
*                                                                                                *
*     PT38 from NSHS Adolescent was removed.                                                     *
*                                                                                                *
*     Man-made Disaster:                                                                         *
*                                                                                                *
*     PT39 from NSHS Adolescent was removed.                                                     *
*                                                                                                *
*     Life Threatening Illness:                                                                  *   
*                                                                                                *
*     PT40 from NSHS Adolescent was removed.                                                     * 
*                                                                                                *
*     Beaten up as Child by Caregiver:                                                           *
*                                                                                                *
*     YCV1_PT13 is Yes(1).                                                                       *
*                                                                                                *
*     Beaten by Spouse or Romantic Partner:                                                      *
*                                                                                                *
*     YCV2_PT14 is Yes(1).                                                                       * 
*                                                                                                *
*     Beaten by Other:                                                                           *
*                                                                                                *  
*     YCV3_PT15 is Yes(1).                                                                       * 
*                                                                                                *
*     Raped:                                                                                     *
*                                                                                                *
*     YCV5_PT17 is Yes(1).                                                                       *
*                                                                                                *
*     Sexually Assaulted:                                                                        *
*                                                                                                *
*     YCV6_PT18 is Yes(1).                                                                       *
*                                                                                                *
*     Mugged or Threatened with a Weapon:                                                        *
*                                                                                                *
*     YCV4_PT16 is Yes(1).                                                                       *
*                                                                                                *
*     Stalked:                                                                                   *
*                                                                                                *
*     PT47 from NSHS Adolescent was removed.                                                     *
*                                                                                                *
*     Unexpected Death of a Loved One:                                                           *  
*                                                                                                *
*     YCV7_PT20 is Yes(1)                                                                        *
*                                                                                                *
*     Child with Serious Illness:                                                                *
*                                                                                                *
*     PT49 from NSHS Adolescent was removed.                                                     * 
*                                                                                                *
*     Traumatic Event to Loved One:                                                              *
*                                                                                                *
*     YCV8_PT22 is Yes(1).                                                                       *
*                                                                                                *
*     Witnessed Physical fights at home                                                          *
*                                                                                                *
*     YCV9_PT22_1 is Yes(1).                                                                     *
*                                                                                                *
*     Witnessed Death or Dead Body, or Saw Someone Seriously Hurt:                               *
*                                                                                                * 
*     YCV10_PT23 is Yes(1).                                                                      *
*                                                                                                *
*     Accidentally Caused Serious Injury or Death                                                *
*                                                                                                *
*     PT52 from NSHS Adolescent was removed.                                                     *
*                                                                                                *
*     Purposely Injured, Tortured, or Killed Someone.                                            * 
*                                                                                                *
*     PT53 from NSHS Adolescent was removed.                                                     *
*                                                                                                *
*     Saw Atrocities:                                                                            * 
*                                                                                                *
*     PT54 from NCSR was removed.                                                                *
*                                                                                                *
*     Some Other Event:                                                                          *
*                                                                                                *
*     YCV11_PT27 is Yes(1)                                                                       *
*                                                                                                *
*     Private Event:                                                                             *
*                                                                                                *
*     PT57 from NSHS Adolescent was removed.                                                     *
**************************************************************************************************;  

if YCV1_PT13 = 1 or YCV2_PT14 = 1 or YCV3_PT15 = 1 or YCV4_PT16 = 1 or YCV5_PT17 = 1 or
   YCV6_PT18 = 1 or YCV7_PT20 = 1 or YCV8_PT22 = 1 or YCV9_PT22_1 = 1 or YCV10_PT23 = 1 or
   YCV11_PT27 = 1 then f_mh_pts_a1 = 1;
else if YCV1_PT13 = 5 and YCV2_PT14 = 5 and YCV3_PT15 = 5 and YCV4_PT16 = 5 and YCV5_PT17 = 5 and
        YCV6_PT18 = 5 and YCV7_PT20 = 5 and YCV8_PT22 = 5 and YCV9_PT22_1 = 5 and YCV10_PT23 = 5 and
        YCV11_PT27 = 5 then f_mh_pts_a1 = 5;
else if YCV1_PT13 = .D or YCV2_PT14 = .D or YCV3_PT15 = .D or YCV4_PT16 = .D or YCV5_PT17 = .D or
        YCV6_PT18 = .D or YCV7_PT20 = .D or YCV8_PT22 = .D or YCV9_PT22_1 = .D or YCV10_PT23 = .D or
        YCV11_PT27 = .D then f_mh_pts_a1 = 9;
else if YCV1_PT13 = .R or YCV2_PT14 = .R or YCV3_PT15 = .R or YCV4_PT16 = .R or YCV5_PT17 = .R or
        YCV6_PT18 = .R or YCV7_PT20 = .R or YCV8_PT22 = .R or YCV9_PT22_1 = .R or YCV10_PT23 = .R or
        YCV11_PT27 = .R then f_mh_pts_a1 = 8;

********************************************************************************************************
* Criteria A Part 2: The person has been exposed to a traumatic event in which the persons response    *
*                    involved intense fear, helplessness, or horror.                                   *
*                                                                                                      *
*        Worst Event: PT67 is Yes(1) OR PT67a is Yes(1) OR PT67b is Yes(1) OR PT67c is Yes(1)          *
*        Random Event: PT207 is Yes(1) OR PT207a is Yes(1) OR PT207b is Yes(1) OR PT207c is Yes(1)     *
*                                                                                                      *
*        PT67, PT67a-c, PT207, PT207a-c from NCSR survey are deleted, criteria not operationalized     *
********************************************************************************************************;

*****************************************************************************************************
* Criteria A: Combine Parts 1, 2                                                                    *
* Part 2 not operationalized                                                                        *
*****************************************************************************************************;

f_mh_pts_a = f_mh_pts_a1;

**************************************************************************************************************
* Criteria B Part 1: The traumatic event is experienced in one (or more) of the following ways:              *   
*                                                                                                            *
*    1. recurrent and intrusive distressing recollections of the event, including images, thoughts, or       *
*       perceptions.                                                                                         *
*                                                                                                            * 
*       Worst Event:  PT86 is Yes(1)                                                                         *
*       Random Event: PT222 is Yes(1)                                                                        *
*                                                                                                            * 
*    2. recurrent distressing dreams of the event.                                                           * 
*                                                                                                            *
*       Worst Event:  PT87 is Yes(1)                                                                         *  
*       Random Event: PT223 is Yes(1)                                                                        *
*                                                                                                            *
*    3. acting or feeling as if the traumatic event were recurring (includes a sense of reliving             *
*       the experience, illusions,  hallucinations, and dissociative flashback episodes, including those     *
*       that occur on awakening or when intoxicated).                                                        *
*                                                                                                            * 
*       Worst Event:  PT88 is Yes(1)                                                                         *
*       Random Event: PT224 is Yes(1)                                                                        *
*                                                                                                            *
*    4. intense psychological distress at exposure to internal or external cues that symbolize or resemble   *
*       an aspect of the traumatic event.                                                                    *
*                                                                                                            * 
*       Worst Event:  PT89 is Yes(1)                                                                         *
*       Random Event: PT225 is Yes(1)                                                                        *
*                                                                                                            *
*    5. physiological reactivity on exposure to internal or external cues that symbolize or resemble an      *
*       aspect of the traumatic event.                                                                       *
*                                                                                                            *
*       Worst Event:  PT90 is Yes(1)                                                                         *
*       Random Event: PT226 is Yes(1)                                                                        *
*                                                                                                            *
*       PT86-PT90, PT222-PT226 from NSHS Adolescent survey are deleted, criteria not operationalized         *
**************************************************************************************************************;

*******************************************************************************************
* Criteria B Part 2: The traumatic event is persistently reexperienced.                   *
*                                                                                         *
*                    Worst Event:  PT113 is (2,3,4,5)                                     *
*                    Random Event: PT230 is (2,3,4,5)                                     *
*                                                                                         *
*         PT113, PT230 from NSHS Adolescent are deleted, criteria not operationalized     *
*******************************************************************************************;


*********************************************************************
* Combine B Parts 1,2 for worst and random event                    *
*                                                                   *
* Criteria not operationalized                                      *
*********************************************************************;

****************************************************************************************************************
* Criteria C Part 1: Persistent avoidance of stimuli associated with the trauma and numbing of                 *
*                    general responsiveness(not present before the trauma), as indicated by three(or more)     *
*                    of the following:                                                                         *
*                                                                                                              *  
*      1.  efforts to avoid thoughts, feelings, or conversations associated with the trauma                    *
*                                                                                                              *   
*          PT68, PT208 from NSHS Adolescent are deleted, criteria not operationalized                          *
*                                                                                                              *
*      2.  efforts to avoid activities, places, or people that arouse recollections of the trauma              *
*                                                                                                              *
*          YCV21_PT275 is Yes(1)OR YCV30_PT275 is Yes(1)                                                       *
*                                                                                                              *
*      3.  inability to recall an important aspect of the trauma                                               *
*                                                                                                              *
*          PT70, PT210 from NSHS Adolescent are deleted, criteria not operationalized                          *
*                                                                                                              *
*      4.  markedly diminished interest or participation in significant activities                             *
*                                                                                                              *
*          YCV15_PT269 is Yes(1) OR YCV24_PT269 is Yes(1)                                                      *
*                                                                                                              * 
*      5.  feeling of detachment or estrangement from others                                                   * 
*                                                                                                              *
*          YCV16_PT270 is Yes(1) OR YCV25_PT270 is Yes(1)                                                      *
*                                                                                                              *
*      6.  restricted range of affect (e.g., unable to have loving feelings)                                   * 
*                                                                                                              * 
*          YCV17_PT271 is Yes(1) OR YCV26_PT271 is Yes(1)                                                      *
*                                                                                                              *
*      7.  sense of a foreshortened future(e.g., does not expect to have a career, marriage, children,         *
*          or a normal life span)                                                                              *
*                                                                                                              *
*          YCV18_PT272 is Yes(1) OR YCV27_PT272 is Yes(1)                                                      *
****************************************************************************************************************;

***********************************************************************************************
* Check if 3 out of 7 Parts of C were met for Worst and Random Event                          *
***********************************************************************************************;

* If YCV22_PT261 IN(.D, .R, 5) or YCV23_PT264_CHKPT = 1, YCV24_PT269-YCV30_PT275 are skipped;

if sum(YCV21_PT275 = 1 or YCV30_PT275 = 1, YCV15_PT269 = 1 or YCV24_PT269 = 1,
       YCV16_PT270 = 1 or YCV25_PT270 = 1, YCV17_PT271 = 1 or YCV26_PT271 = 1, 
       YCV18_PT272 = 1 or YCV27_PT272 = 1) >= 3 then f_mh_pts_c1 = 1;              /* Yes */
else if sum(YCV21_PT275 = 5 and (YCV22_PT261 IN(.D,.R,5) or YCV23_PT264_CHKPT = 1 or YCV30_PT275 = 5), 
            YCV15_PT269 = 5 and (YCV22_PT261 IN(.D,.R,5) or YCV23_PT264_CHKPT = 1 or YCV24_PT269 = 5),
            YCV16_PT270 = 5 and (YCV22_PT261 IN(.D,.R,5) or YCV23_PT264_CHKPT = 1 or YCV25_PT270 = 5), 
            YCV17_PT271 = 5 and (YCV22_PT261 IN(.D,.R,5) or YCV23_PT264_CHKPT = 1 or YCV26_PT271 = 5), 
            YCV18_PT272 = 5 and (YCV22_PT261 IN(.D,.R,5) or YCV23_PT264_CHKPT = 1 or YCV27_PT272 = 5)) >= 3 
        then f_mh_pts_c1 = 5;                                                      /* No */
else if YCV21_PT275 = .D or YCV30_PT275 = .D or YCV15_PT269 = .D or YCV24_PT269 = .D or
        YCV16_PT270 = .D or YCV25_PT270 = .D or YCV17_PT271 = .D or YCV26_PT271 = .D or 
        YCV18_PT272 = .D or YCV27_PT272 = .D then f_mh_pts_c1 = 9;       /* Don't know */
else if YCV21_PT275 = .R or YCV30_PT275 = .R or YCV15_PT269 = .R or YCV24_PT269 = .R or
        YCV16_PT270 = .R or YCV25_PT270 = .R or YCV17_PT271 = .R or YCV26_PT271 = .R or 
        YCV18_PT272 = .R or YCV27_PT272 = .R then f_mh_pts_c1 = 8;       /* Refuse */

****************************************************************************************************
* Criteria C Part 2: Persistence avoidance of stimuli associated with the trauma and numbing of    *
*                    general responsiveness (not present before the trauma).                       *
*                                                                                                  *
*                    Worst Event:  PT113 is (2,3,4,5)                                              *
*                    Random Event: PT219 is (2,3,4,5)                                              *
*                                                                                                  *
*                    PT113, PT219 from NSHS Adolescent are deleted, criteria not operationalized   *
****************************************************************************************************;

***************************************************************************************************
* Combine Criteria C Parts 1 and 2                                                                *
*                                                                                                 *
* C Part 2 Not Operationalized                                                                    *
***************************************************************************************************;

f_mh_pts_c = f_mh_pts_c1;

******************************************************************************************************
* Criteria D Part 1:  Persistent symptoms of increased arousal (not present before the trauma),      *
*                     as indicated by two (or more) of the following:                                * 
*                                                                                                    *
*                     1. difficulty falling or staying asleep.                                       *
*                                                                                                    *
*                        YCV19_PT273 is Yes(1) OR YCV28_PT273 is Yes(1)                              *
*                                                                                                    *  
*                     2. irritability or outbursts of anger.                                         *
*                                                                                                    *
*                        Worst Event: PT103 is Yes(1)                                                *
*                        Random Event: PT234 is Yes(1)                                               *
*                        PT103, PT234 from NSHS Adolescent are deleted, criteria not operationalized *
*                                                                                                    * 
*                     3. difficulty concentrating.                                                   *
*                                                                                                    *
*                        Worst Event: PT104 is Yes(1)                                                *
*                        Random Event: PT235 is Yes(1)                                               *
*                        PT104, PT235 from NSHS Adolescent are deleted, criteria not operationalized *
*                                                                                                    *
*                     4. hypervigilance.                                                             *
*                                                                                                    * 
*                        Worst Event: PT105 is Yes(1)                                                *
*                        Random Event: PT236 is Yes(1)                                               *
*                        PT105, PT236 from NCSR are deleted, criteria not operationalized            *
*                                                                                                    *
*                     5. exaggerated startle response.                                               *
*                                                                                                    *
*                        YCV20_PT274 is Yes(1) OR YCV29_PT274 is Yes(1)                              *
******************************************************************************************************;

* Check if 2 out of 5 Parts of D were met for Worst and Random Event;
* If YCV22_PT261 IN(.D, .R, 5) or YCV23_PT264_CHKPT = 1, YCV24_PT269-YCV30_PT275 are skipped;

if (YCV19_PT273 = 1 or YCV28_PT273 = 1) and (YCV20_PT274 = 1 or YCV29_PT274 = 1) then f_mh_pts_d1 = 1;  /* Yes */
else if (YCV19_PT273 = 5 and (YCV22_PT261 IN(.D,.R,5) or YCV23_PT264_CHKPT = 1 or YCV28_PT273 = 5)) or 
        (YCV20_PT274 = 5 and (YCV22_PT261 IN(.D,.R,5) or YCV23_PT264_CHKPT = 1 or YCV29_PT274 = 5)) 
    then f_mh_pts_d1 = 5;  /* No */
else if YCV19_PT273 = .D or YCV28_PT273 = .D or YCV20_PT274 = .D or YCV29_PT274 = .D 
    then f_mh_pts_d1 = 9;  /* Don't know */
else if YCV19_PT273 = .R or YCV28_PT273 = .R or YCV20_PT274 = .R or YCV29_PT274 = .R 
    then f_mh_pts_d1 = 8;  /* Refuse */

**************************************************************************************************
* Criteria D Part 2: Persistent symptoms of increased arousal (not present before the trauma)    *
*                                                                                                *
*                    Worst Event: PT113 is (2,3,4,5)                                             *
*                    Random Event: PT241 is (2,3,4,5)                                            *
*                                                                                                * 
*                    PT113, PT241 from NSHS Adolescent are deleted, criteria not operationalized *
**************************************************************************************************;

***********************************************************************************************
* Combine Criteria D Parts 1 and 2                                                            *
* D Part 2 Not Operationalized                                                                *
***********************************************************************************************;

f_mh_pts_d = f_mh_pts_d1;

*********************************************************************************************************
* Criteria E: Duration of the disturbance (symptoms in Criteria B, C, and D) is more than 1 month.      *
*                                                                                                       *
*             Worst Event:  (PT110 > 1 month)                                                           *
*             Random Event: (PT218 > 1 month) AND (PT229 > 1 month) AND (PT240 > 1 month)               *
*                                                                                                       *
*             PT110, PT218, PT229, PT240 from NSHS Adolescent are deleted, criteria not operationalized *
*********************************************************************************************************;

*******************************************************************************************************
* Criteria F: The disturbance causes clinically significant distress or impairment in social,         *
*             occupational, or other important areas of functioning.                                  *
*                                                                                                     *
*             Worst Event Group : PT114 is (3,4,5) OR PT115 is (3,4,5)                                *
*             Worst Event Groups 1,2,3: PT64 = PT268 and at least one of PT278a-d >= 4                *
*             Random Event Group 1: PT220 is (3,4,5) OR PT221 is (3,4,5)                              *
*             Random Event Group 2: PT231 is (3,4,5) OR PT232 is (3,4,5)                              * 
*             Random Event Group 3: PT242 is (3,4,5) OR PT243 is (3,4,5)                              *
*             Random Event: PT246 is Yes(1)                                                           * 
*             Worst Event Groups 1,2,3: PT58b = PT268 and at least one of PT278a-d >= 4               *
*                                                                                                     *
*             PT114, PT115, PT220, PT221, PT231, PT232, PT242, PT243, PT246, PT278 from NSHS          *
*             Adolescent are deleted, Criteria not operationalized                                    *
*******************************************************************************************************;

************************************************************************************
* Combine Criteria A,C,D                                                           *
************************************************************************************;

if f_mh_pts_a = 1 and f_mh_pts_c = 1 and f_mh_pts_d = 1 
    then f_mh_pts_evr = 1;     * All criteria met;
else f_mh_pts_evr = 5;         * Criteria not met;  

******************************************************************************************
* Calculate Recency of PTSD for DSM                                                      *
******************************************************************************************;

if YCV14b_PT64a <= f_svy_age_iw then pts_ons = YCV14b_PT64a;
else pts_ons = YCV14c;

if pts_ons IN(.D, .R) then pts_ons = .;
if pts_ons > f_svy_age_iw then pts_ons = .;

if YCV22_PT261 = 1 or pts_ons = f_svy_age_iw then pts_rec = f_svy_age_iw;

if pts_rec IN(.D, .R) then pts_rec = .;

if f_mh_pts_evr = 1 then do;
    f_mh_pts_aoo = pts_ons;            
    f_mh_pts_rec = pts_rec;            
end;

%mend ptsd;

%ptsd;