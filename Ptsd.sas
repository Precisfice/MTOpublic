*****************************************************************************************
* PROGRAM: Ptsd.sas                                                                     *
* DATE: 4/14/05                                                                         *
*                                                                                       *
* NSHS Replication                                                                      *
* Check whether Criteria are met for Posttraumatic Disorder                             *
* Note: 10/31/03 Added 5 new PTSD diagnoses                                             *
* Note: 2/25/04 Added worst event onset, recency calculations(Use PT64a as onset)       *
* Note: 4/30/04 DSM-IV Criteria F Add PT278a-d >= 4 and (PT268 = PT64 or PT268 = PT58b) *
* Note: 4/14/05 Reset variables used for onset and recency to missing if 998,999        *
* Note: 4/14/05 Reset onset, recency to 4 if less than 4                                *
*****************************************************************************************;

*************************************************************************************
* Posttraumatic Disorder -- DSM-IV criteria                                         *
*************************************************************************************;

%macro tdy_pts(newvar,part1,part2);

*Calculate length of time in days, from # of units and unit of time; 

   if &part1 ~IN (998,999) then do;
      select (&part2);
         when(1) &newvar = &part1; 
         when(2) &newvar = 7*&part1; 
         when(3) &newvar = 30*&part1; 
         when(4) &newvar = 365*&part1;
         otherwise;
      end; 
   end;
   if &newvar >= 99995 then &newvar = 99995;
   if &part1 = 998 then &newvar = 99998;
   if &part1 = 999 then &newvar = 99999;

%mend tdy_pts;

%macro tdy_pts2(newvar,part1,part2);

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
   if &newvar >= 99995 then &newvar = 99995;
   if &part1 = 997 then &newvar = 31;         /* At least 1 month */
   if &part1 = 998 then &newvar = 99998;
   if &part1 = 999 then &newvar = 99999;

%mend tdy_pts2;

%macro tyr_pts(newvar,part1,part2);

*Calculate length of time in days, from # of units and unit of time; 

   if &part1 < 998 then do;
      select (&part2);
         when(1) &newvar = &part1/365; 
         when(2) &newvar = &part1/52; 
         when(3) &newvar = &part1/12; 
         when(4) &newvar = &part1;
         otherwise;
      end; 
   end;
   if &part1 IN(998,999) then &newvar = .;

%mend tyr_pts;

%macro tyr_pts2(newvar,part1,part2);

*Calculate length of time in days, from # of units and unit of time; 

   if &part1 < 998 then do;
      select (&part2);
         when(1) &newvar = &part1/365; 
         when(2) &newvar = &part1/52; 
         when(3) &newvar = &part1/12; 
         when(4) &newvar = &part1;
         otherwise;
      end; 
   end;
   if &part1 = 997 then &newvar = 31/365;   /* At least 1 month */
   if &part1 IN(998,999) then &newvar = .;

%mend tyr_pts2;

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
*     PT29 is Yes(1) OR PT30 is Yes(1) OR PT31 is Yes(1) OR PT32 is Yes(1) OR PT33 is Yes(1)     *
*                                                                                                *
*     Kidnapped:                                                                                 *
*                                                                                                *
*     PT34 is Yes(1)                                                                             *    
*                                                                                                * 
*     Toxic Exposure:                                                                            * 
*                                                                                                *
*     PT35 is Yes(1)                                                                             *
*                                                                                                *
*     Automobile Accident:                                                                       *
*                                                                                                *  
*     PT36 is Yes(1)                                                                             *
*                                                                                                *
*     Other Life Threatening Accident:                                                           *
*                                                                                                *
*     PT37 is Yes(1)                                                                             *
*                                                                                                *
*     Natural Disaster:                                                                          *
*                                                                                                *
*     PT38 is Yes(1)                                                                             *
*                                                                                                *
*     Man-made Disaster:                                                                         *
*                                                                                                *
*     PT39 is Yes(1)                                                                             *
*                                                                                                *
*     Life Threatening Illness:                                                                  *   
*                                                                                                *
*     PT40 is Yes(1)                                                                             * 
*                                                                                                *
*     Beaten up as Child by Caregiver:                                                           *
*                                                                                                *
*     PT41 is Yes(1)                                                                             *
*                                                                                                *
*     Beaten by Spouse or Romantic Partner:                                                      *
*                                                                                                *
*     PT42 is Yes(1)                                                                             * 
*                                                                                                *
*     Beaten by Other:                                                                           *
*                                                                                                *  
*     PT43 is Yes(1)                                                                             *
*                                                                                                *
*     Raped:                                                                                     *
*                                                                                                *
*     PT45 is Yes(1)                                                                             *
*                                                                                                *
*     Sexually Assaulted:                                                                        *
*                                                                                                *
*     PT46 is Yes(1)                                                                             *
*                                                                                                *
*     Mugged or Threatened with a Weapon:                                                        *
*                                                                                                *
*     PT44 is Yes(1)                                                                             *
*                                                                                                *
*     Stalked:                                                                                   *
*                                                                                                *
*     PT47 is Yes(1)                                                                             *
*                                                                                                *
*     Unexpected Death of a Loved One:                                                           *  
*                                                                                                *
*     PT48 is Yes(1)                                                                             *
*                                                                                                *
*     Child with Serious Illness:                                                                *
*                                                                                                *
*     PT49 is Yes(1)                                                                             * 
*                                                                                                *
*     Traumatic Event to Loved One:                                                              *
*                                                                                                *
*     PT50 is Yes(1) OR PT50_1 is Yes(1)                                                         *
*                                                                                                *
*     Note: PT50_1 added to NSHS Replication version                                             *
*                                                                                                *
*     Witnessed Death or Dead Body, or Saw Someone Seriously Hurt:                               *
*                                                                                                * 
*     PT51 is Yes(1)                                                                             *
*                                                                                                *
*     Accidentally Caused Serious Injury or Death                                                *
*                                                                                                *
*     PT52 is Yes(1)                                                                             *
*                                                                                                *
*     Purposely Injured, Tortured, or Killed Someone.                                            * 
*                                                                                                *
*     PT53 is Yes(1)                                                                             *
*                                                                                                *
*     Saw Atrocities:                                                                            * 
*                                                                                                *
*     PT54 is Yes(1)                                                                             *
*                                                                                                *
*     Some Other Event:                                                                          *
*                                                                                                *
*     PT55 is Yes(1)                                                                             *
*                                                                                                *
*     Private Event:                                                                             *
*                                                                                                *
*     PT57 is Yes(1)                                                                             *
**************************************************************************************************;  

if %do i = 29 %to 54;
       PT&i = 1 or
   %end;
   PT50_1 = 1 or PT55 = 1 or PT57 = 1 then dsmptsa1 = 1;         /* Yes */
else if %do i = 1 %to 27;
           PT&i = 5 and
       %end;
       PT22_1 = 5 and PT28 = 5 and PT55 = 5 then dsmptsa1 = 5;    /* No */
else if %do i = 1 %to 54;
           PT&i = 9 or
        %end;
       PT50_1 = 9 or PT55 = 9 then dsmptsa1 = 9;     /* Don't know */
else if %do i = 1 %to 54;
            PT&i = 8 or
        %end;
        PT50_1 = 8 or PT55 = 8 then dsmptsa1 = 8;    /* Refuse */

********************************************************************************************************
* Criteria A Part 2: The person has been exposed to a traumatic event in which the persons response    *
*                    involved intense fear, helplessness, or horror.                                   *
*                                                                                                      *
*        Worst Event: PT67 is Yes(1) OR PT67a is Yes(1) OR PT67b is Yes(1) OR PT67c is Yes(1)          *
*        Random Event: PT207 is Yes(1) OR PT207a is Yes(1) OR PT207b is Yes(1) OR PT207c is Yes(1)     *
********************************************************************************************************;

* Worst Event;
if PT67 = 1 or PT67a = 1 or PT67b = 1 or PT67c = 1 then dwptsa2 = 1;           /* Yes */
else if PT67 = 5 and PT67a = 5 and PT67b = 5 and PT67c = 5 then dwptsa2 = 5;   /* No */
else if PT67 = 9 or PT67a = 9 or PT67b = 9 or PT67c = 9 then dwptsa2 = 9;      /* Don't know */
else if PT67 = 8 or PT67a = 8 or PT67b = 8 or PT67c = 8 then dwptsa2 = 8;      /* Refuse */

* Random Event;
if PT207 = 1 or PT207a = 1 or PT207b = 1 or PT207c = 1 then drptsa2 = 1;           /* Yes */
else if PT207 = 5 and PT207a = 5 and PT207b = 5 and PT207c = 5 then drptsa2 = 5;   /* No */
else if PT207 = 9 or PT207a = 9 or PT207b = 9 or PT207c = 9 then drptsa2 = 9;      /* Don't know */
else if PT207 = 8 or PT207a = 8 or PT207b = 8 or PT207c = 8 then drptsa2 = 8;      /* Refuse */

*****************************************************************************************************
* Criteria A: Combine Parts 1, 2                                                                    *
*****************************************************************************************************;

* Worst event;

%let char = w r;
%do j = 1 %to 2;
   %let c= %scan(&char, &j);
   if dsmptsa1 = 1 and d&c.ptsa2 = 1 then d&c.ptsa = 1;      /* Yes */
   else if dsmptsa1 = 5 or d&c.ptsa2 = 5 then d&c.ptsa = 5;  /* No */
   else if dsmptsa1 = 9 or d&c.ptsa2 = 9 then d&c.ptsa = 9;  /* Don't know */
   else if dsmptsa1 = 8 or d&c.ptsa2 = 8 then d&c.ptsa = 8;  /* Refuse */
%end;

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
**************************************************************************************************************;

*Worst event;
if PT86 = 1 or PT87 = 1 or PT88 = 1 or PT89 = 1 or PT90 = 1 then dwptsb1 = 1;           /* Yes */
else if PT86 = 5 and PT87 = 5 and PT88 = 5 and PT89 = 5 and PT90 = 5 then dwptsb1 = 5;  /* No */
else if PT86 = 9 or PT87 = 9 or PT88 = 9 or PT89 = 9 or PT90 = 9 then dwptsb1 = 9;      /* Don't know */
else if PT86 = 8 or PT87 = 8 or PT88 = 8 or PT89 = 8 or PT90 = 8 then dwptsb1 = 8;      /* Refuse */

*Random event;
if PT222 = 1 or PT223 = 1 or PT224 = 1 or PT225 = 1 or PT226 = 1 then drptsb1 = 1;           /* Yes */
else if PT222 = 5 and PT223 = 5 and PT224 = 5 and PT225 = 5 and PT226 = 5 then drptsb1 = 5;  /* No */
else if PT222 = 9 or PT223 = 9 or PT224 = 9 or PT225 = 9 or PT226 = 9 then drptsb1 = 9;      /* Don't know */
else if PT222 = 8 or PT223 = 8 or PT224 = 8 or PT225 = 8 or PT226 = 8 then drptsb1 = 8;      /* Refuse */

*******************************************************************************************
* Criteria B Part 2: The traumatic event is persistently reexperienced.                   *
*                                                                                         *
*                    Worst Event:  PT113 is (2,3,4,5)                                     *
*                    Random Event: PT230 is (2,3,4,5)                                     *
*                                                                                         *
*                    Note: PT81 is deleted, use PT113 as replacement                      *
*******************************************************************************************;

if PT113 IN(2,3,4,5) then dwptsb2 = 1;
else if PT113 = 1 then dwptsb2 = 5;
else dwptsb2 = PT113; 

if PT230 IN(2,3,4,5) then drptsb2 = 1;
else if PT230 = 1 then drptsb2 = 5;
else drptsb2 = PT230; 

*********************************************************************
* Combine B Parts 1,2 for worst and random event                    *
*                                                                   *
*********************************************************************;

%let char = w r;

%do j = 1 %to 2;
   %let c = %scan(&char, &j);
   if d&c.ptsb1 = 1 and d&c.ptsb2 = 1 then d&c.ptsb = 1;                 /* Yes */
   else if d&c.ptsb1 = 5 or d&c.ptsb2 = 5 then d&c.ptsb = 5;            /* No */
   else if d&c.ptsb1 = 9 or d&c.ptsb2 = 9 then d&c.ptsb = 9;            /* Don't know */
   else if d&c.ptsb1 = 8 or d&c.ptsb2 = 8 then d&c.ptsb = 8;            /* Refuse */
%end;

****************************************************************************************************************
* Criteria C Part 1: Persistent avoidance of stimuli associated with the trauma and numbing of                 *
*                    general responsiveness(not present before the trauma), as indicated by three(or more)     *
*                    of the following:                                                                         *
*                                                                                                              *  
*      1.  efforts to avoid thoughts, feelings, or conversations associated with the trauma                    *
*                                                                                                              *   
*          Worst Event: PT68 is Yes(1)                                                                         *
*          Random Event: PT208 is Yes(1)                                                                       * 
*                                                                                                              *
*      2.  efforts to avoid activities, places, or people that arouse recollections of the trauma              *
*                                                                                                              *
*          Worst Event: PT69 is Yes(1)                                                                         *
*          Random Event: PT209 is Yes(1)                                                                       *
*                                                                                                              *
*      3.  inability to recall an important aspect of the trauma                                               *
*                                                                                                              *
*          Worst Event: PT70 is Yes(1)                                                                         *
*          Random Event: PT210 is Yes(1)                                                                       *
*                                                                                                              *
*      4.  markedly diminished interest or participation in significant activities                             *
*                                                                                                              *
*          Worst Event: PT71 is Yes(1)                                                                         *
*          Random Event: PT211 is Yes(1)                                                                       *
*                                                                                                              * 
*      5.  feeling of detachment or estrangement from others                                                   * 
*                                                                                                              *
*          Worst Event: PT72 is Yes(1)                                                                         *
*          Random Event: PT212 is Yes(1)                                                                       * 
*                                                                                                              *
*      6.  restricted range of affect (e.g., unable to have loving feelings)                                   * 
*                                                                                                              * 
*          Worst Event: PT73 is Yes(1)                                                                         * 
*          Random Event: PT213 is Yes(1)                                                                       * 
*                                                                                                              *
*      7.  sense of a foreshortened future(e.g., does not expect to have a career, marriage, children,         *
*          or a normal life span)                                                                              *
*                                                                                                              *
*          Worst Event: PT74 is Yes(1)                                                                         *
*          Random Event: PT214 is Yes(1)                                                                       *
****************************************************************************************************************;

***********************************************************************************************
* Check if 3 out of 7 Parts of C were met for Worst and Random Event                          *
***********************************************************************************************;

if sum(PT68 = 1, PT69 = 1, PT70 = 1, PT71 = 1, PT72 = 1, PT73 = 1, PT74 = 1) >= 3 then dwptsc1 = 1;       /* Yes */
else if sum(PT68 = 5, PT69 = 5, PT70 = 5, PT71 = 5, PT72 = 5, PT73 = 5, PT74 = 5) >= 5 then dwptsc1 = 5;  /* No */
else if PT68 = 9 or PT69 = 9 or PT70 = 9 or PT71 = 9 or PT72 = 9 or PT73 = 9 or PT74 = 9 then dwptsc1 = 9; /* Don't know */
else if PT68 = 8 or PT69 = 8 or PT70 = 8 or PT71 = 8 or PT72 = 8 or PT73 = 8 or PT74 = 8 then dwptsc1 = 8; /* Refuse */

if sum(PT208 = 1, PT209 = 1, PT210 = 1, PT211 = 1, PT212 = 1, PT213 = 1, PT214 = 1) >= 3 
   then drptsc1 = 1;       /* Yes */
else if sum(PT208 = 5, PT209 = 5, PT210 = 5, PT211 = 5, PT212 = 5, PT213 = 5, PT214 = 5) >= 5
   then drptsc1 = 5;       /* No */
else if PT208 = 9 or PT209 = 9 or PT210 = 9 or PT211 = 9 or PT212 = 9 or PT213 = 9 or PT214 = 9 
   then drptsc1 = 9;       /* Don't know */
else if PT208 = 8 or PT209 = 8 or PT210 = 8 or PT211 = 8 or PT212 = 8 or PT213 = 8 or PT214 = 8 
   then drptsc1 = 8;       /* Refuse */

****************************************************************************************************
* Criteria C Part 2: Persistence avoidance of stimuli associated with the trauma and numbing of    *
*                    general responsiveness (not present before the trauma).                       *
*                                                                                                  *
*                    Worst Event:  PT113 is (2,3,4,5)                                              *
*                    Random Event: PT219 is (2,3,4,5)                                              *
*                                                                                                  *
*                    Note: PT97 is deleted, replaced with PT113                                    *
****************************************************************************************************;

if PT113 IN(2,3,4,5) then dwptsc2 = 1;
else if PT113 = 1 then dwptsc2 = 5;
else dwptsc2 = PT113; 

if PT219 IN(2,3,4,5) then drptsc2 = 1;
else if PT219 = 1 then drptsc2 = 5;
else drptsc2 = PT219; 

***************************************************************************************************
* Combine Criteria C Parts 1 and 2                                                                *
*                                                                                                 *
* Note: For Worst Event Criteria C Part 2 Not Operationalized                                     *
***************************************************************************************************;

%let char = w r;
%do j = 1 %to 2;
    %let c = %scan(&char, &j);
    if d&c.ptsc1 = 1 and d&c.ptsc2 = 1 then d&c.ptsc = 1;                   /* Yes */
    else if d&c.ptsc1 = 5 or d&c.ptsc2 = 5 then d&c.ptsc = 5;               /* No */
    else if d&c.ptsc1 = 9 or d&c.ptsc2 = 9 then d&c.ptsc = 9;               /* Don't know */
    else if d&c.ptsc1 = 8 or d&c.ptsc2 = 8 then d&c.ptsc = 8;               /* Refuse */
%end;

****************************************************************************************************
* Criteria D Part 1:  Persistent symptoms of increased arousal (not present before the trauma),    *
*                     as indicated by two (or more) of the following:                              * 
*                                                                                                  *
*                     1. difficulty falling or staying asleep.                                     *
*                                                                                                  *
*                        Worst Event: PT102 is Yes(1)                                              *
*                        Random Event: PT233 is Yes(1)                                             *
*                                                                                                  * 
*                     2. irritability or outbursts of anger.                                       *
*                                                                                                  *
*                        Worst Event: PT103 is Yes(1)                                              *
*                        Random Event: PT234 is Yes(1)                                             *
*                                                                                                  * 
*                     3. difficulty concentrating.                                                 *
*                                                                                                  *
*                        Worst Event: PT104 is Yes(1)                                              *
*                        Random Event: PT235 is Yes(1)                                             *
*                                                                                                  *
*                     4. hypervigilance.                                                           *
*                                                                                                  * 
*                        Worst Event: PT105 is Yes(1)                                              *
*                        Random Event: PT236 is Yes(1)                                             *
*                                                                                                  *
*                     5. exaggerated startle response.                                             *
*                                                                                                  *
*                        Worst Event: PT106 is Yes(1)                                              * 
*                        Random Event: PT237 is Yes(1)                                             * 
****************************************************************************************************;

* Check if 2 out of 5 Parts of D were met for Worst and Random Event;
if sum(PT102 = 1, PT103 = 1, PT104 = 1, PT105 = 1, PT106 = 1) > = 2 then dwptsd1 = 1;        /* Yes */
else if sum(PT102 = 5, PT103 = 5, PT104 = 5, PT105 = 5, PT106 = 5) > = 4 then dwptsd1 = 5;   /* No */
else if PT102 = 9 or PT103 = 9 or PT104 = 9 or PT105 = 9 or PT106 = 9 then dwptsd1 = 9;      /* Don't know */
else if PT102 = 8 or PT103 = 8 or PT104 = 8 or PT105 = 8 or PT106 = 8 then dwptsd1 = 8;      /* Refuse */

if sum(PT233 = 1, PT234 = 1, PT235 = 1, PT236 = 1, PT237 = 1) > = 2 then drptsd1 = 1;        /* Yes */
else if sum(PT233 = 5, PT234 = 5, PT235 = 5, PT236 = 5, PT237 = 5) > = 4 then drptsd1 = 5;   /* No */
else if PT233 = 9 or PT234 = 9 or PT235 = 9 or PT236 = 9 or PT237 = 9 then drptsd1 = 9;      /* Don't know */
else if PT233 = 8 or PT234 = 8 or PT235 = 8 or PT236 = 8 or PT237 = 8 then drptsd1 = 8;      /* Refuse */

*************************************************************************************************
* Criteria D Part 2: Persistent symptoms of increased arousal (not present before the trauma)   *
*                                                                                               *
*                    Worst Event: PT113 is (2,3,4,5)                                            *
*                    Random Event: PT241 is (2,3,4,5)                                           *
*************************************************************************************************;

if PT113 IN(2,3,4,5) then dwptsd2 = 1;
else if PT113 = 1 then dwptsd2 = 5;
else dwptsd2 = PT113; 

if PT241 IN(2,3,4,5) then drptsd2 = 1;
else if PT241 = 1 then drptsd2 = 5;
else drptsd2 = PT241; 

***********************************************************************************************
* Combine Criteria D Parts 1 and 2                                                            *
***********************************************************************************************;

%let char = w r;
%do j = 1 %to 2;
    %let c = %scan(&char, &j);
    if d&c.ptsd1 = 1 and d&c.ptsd2 = 1 then d&c.ptsd = 1;       /* Yes */
    else if d&c.ptsd1 = 5 or d&c.ptsd2 = 5 then d&c.ptsd = 5;   /* No */
    else if d&c.ptsd1 = 9 or d&c.ptsd2 = 9 then d&c.ptsd = 9;   /* Don't know */
    else if d&c.ptsd1 = 8 or d&c.ptsd2 = 8 then d&c.ptsd = 8;   /* Refuse */
%end;

*****************************************************************************************************
* Criteria E: Duration of the disturbance (symptoms in Criteria B, C, and D) is more than 1 month.  *
*                                                                                                   *
*             Worst Event: (PT78 > 1 month) AND (PT94 > 1 month) AND (PT110 > 1 month)              *
*             Random Event: (PT218 > 1 month) AND (PT229 > 1 month) AND (PT240 > 1 month)           *
*                                                                                                   *
*             Note: PT78, PT94 are deleted                                                          *
*****************************************************************************************************;

%let sfxstr = 110 218 229 240;

%let j = 1;
%do %while(%length(%scan(&sfxstr,&j)));

   %let sfx = %scan(&sfxstr,&j); 
   %tdy_pts2(PT&sfx,PT&sfx.a,PT&sfx.b);                                          /* Calc duration */
   if PT&sfx.c = 1 and (PT&sfx <= 30 or PT&sfx.a IN(998,999)) then PT&sfx = 31;  /* Check if duration 30 days */
   %let j = %eval(&j+1);

%end; 

if 30 < PT110 < 99998 then dwptse = 1;      /* Yes */
else if 0 <= PT110 <= 30 then dwptse = 5;   /* No */
else if PT110 = 99999 then dwptse = 9;      /* Don't know */
else if PT110 = 99998 then dwptse = 8;      /* Refuse */

if 30 < PT218 < 99998 and 30 < PT229 < 99998 and 30 < PT240 < 99998 then drptse = 1;      /* Yes */
else if 0 <= PT218 <= 30 or 0 <= PT229 <= 30 or 0 <= PT240 <= 30 then drptse = 5;         /* No */
else if PT218 = 99999 or PT229 = 99999 or PT240 = 99999 then drptse = 9;                  /* Don't know */
else if PT218 = 99998 or PT229 = 99998 or PT240 = 99998 then drptse = 8;                  /* Refuse */

*******************************************************************************************************
* Criteria F: The disturbance causes clinically significant distress or impairment in social,         *
*             occupational, or other important areas of functioning.                                  *
*                                                                                                     *
*             Worst Event Group 1: PT82 is (3,4,5) OR PT83 is (3,4,5)                                 *
*             Worst Event Group 2: PT98 is (3,4,5) OR PT99 is (3,4,5)                                 *
*             Worst Event Group 3: PT114 is (3,4,5) OR PT115 is (3,4,5)                               *
*             Worst Event Groups 1,2,3: PT64 = PT268 and at least one of PT278a-d >= 4                *
*             Random Event Group 1: PT220 is (3,4,5) OR PT221 is (3,4,5)                              *
*             Random Event Group 2: PT231 is (3,4,5) OR PT232 is (3,4,5)                              * 
*             Random Event Group 3: PT242 is (3,4,5) OR PT243 is (3,4,5)                              *
*             Random Event: PT246 is Yes(1) OR PT249 is Yes(1) OR PT253 is Yes(1) OR PT254 is Yes(1)  * 
*             Worst Event Groups 1,2,3: PT58b = PT268 and at least one of PT278a-d >= 4               *
*                                                                                                     *
*             Note: PT82, PT83, PT98, PT99, PT249, PT253, PT254 are deleted                           * 
*             Note 4/30/04: Add condition PT64 = PT268 and PT278a-d >= 4 for worst event              * 
*             Note 4/30/04: Add condition PT58b = PT268 and PT278a-d >= 4 for random event            * 
*******************************************************************************************************;

* Check if there are responses in PT278 series in acceptable range;

if (4 <= PT278a <= 10) or (4 <= PT278b <= 10) or (4 <= PT278c <= 10) or
   (4 <= PT278d <= 10) then PT278NUM = 1;                                                    /* Yes */
else if ((0 <= PT278a <= 3) or PT278a = 97) and ((0 <= PT278b <= 3) or PT278b = 97) and 
        ((0 <= PT278c <= 3) or PT278c = 97) and ((0 <= PT278d <= 3) or PT278d = 97)
    then PT278NUM = 5;                                                                       /* No  */
else if PT278a = 99 or PT278b = 99 or PT278c = 99 or PT278d = 99 then PT278NUM = 9;          /* Don't know */
else if PT278a = 98 or PT278b = 98 or PT278c = 98 or PT278d = 98 then PT278NUM = 8;          /* Refuse */

* Worst event;
* If PT75 = 1 or PT91 = 1 or PT107 = 1 or PT111 = 1 or PT113 = 1 then PT114, PT115 skipped;

if PT114 IN(3,4,5) or PT115 IN(3,4,5) or 
   (PT64 = PT268 and N(PT64,PT268) > 0 and PT278NUM = 1) then dwptsf = 1;           /* Yes */
else if (PT75 = 1 or PT91 = 1 or PT107 = 1 or PT111 = 1 or
         PT113 = 1 or (PT114 IN(1,2) and PT115 IN(1,2))) and
         (PT64 = . or PT64 ^= PT268 or PT278NUM IN(.,5)) then dwptsf = 5;            /* No */ 
else if PT114 = 9 or PT115 = 9 or PT278NUM = 9 then dwptsf = 9;                      /* Don't know */ 
else if PT114 = 8 or PT115 = 8 or PT278NUM = 8 then dwptsf = 8;                      /* Refuse */ 

* Random event;
* If PT215 = 1 then PT220, PT221 skipped;
* If PT216 = 1 then PT220,PT221,PT231,PT232, PT242,PT243,PT246,PT249,PT253,PT254 skipped;
* If PT227 = 1 then PT231, PT232 skipped;
* If PT238 = 1 then PT242, PT243 skipped;
* If PT244 = 2 then PT246,PT249,PT253, PT254 skipped;
* Either PT246 or PT249,PT253,PT254 answered;

if PT220 IN(3,4,5) or PT221 IN(3,4,5) or PT231 IN(3,4,5) or PT232 IN(3,4,5) or PT242 IN(3,4,5) or
   PT243 IN(3,4,5) or PT246 = 1 or (PT58b = PT268 and N(PT58b,PT268) > 0 and PT278NUM = 1)
    then drptsf = 1;                                                                     /* Yes */
else if (PT215 = 1 or PT216 = 1 or (PT220 IN(1,2) and PT221 IN(1,2))) and 
        (PT216 = 1 or PT227 = 1 or (PT231 IN(1,2) and PT232 IN(1,2))) and 
        (PT216 = 1 or PT238 = 1 or (PT242 IN(1,2) and PT243 IN(1,2))) and
        (PT216 = 1 or PT244 = 2 or PT246 = 5) and
        (PT58b = . or PT58b ^= PT268 or PT278NUM IN(.,5)) then drptsf = 5;               /* No */ 
else if PT220 = 9 or PT221 = 9 or PT231 = 9 or PT232 = 9 or PT242 = 9 or 
        PT243 = 9 or PT246 = 9 or PT278NUM = 9 then drptsf = 9;                          /* Don't know */ 
else if PT220 = 8 or PT221 = 8 or PT231 = 8 or PT232 = 8 or PT242 = 8 or
        PT243 = 8 or PT246 = 8 or PT278NUM = 8 then drptsf = 8;                          /* Refuse */ 

************************************************************************************
* Combine Criteria A,B,C,D,E,F for Worst Event and Random Event                    *
************************************************************************************;

%let char = w r;
%do j = 1 %to 2;
    %let c = %scan(&char, &j);
    if d&c.ptsa = 1 and d&c.ptsb = 1 and d&c.ptsc = 1 and d&c.ptsd = 1 and d&c.ptse = 1 and
       d&c.ptsf = 1 then d&c.pts = 1;        *All criteria are met;
    else d&c.pts = 5;                        *Criteria are not met;
%end;

if dwpts = 1 or drpts = 1 then dsm_pts = 1;
else dsm_pts = 5;

****************************************************************************************
* Create 5 new definitions of PTSD                                                     *
* 1. ignore criterion A Part 2                                                         *
* 2. reduce the number of symptoms needed in Criterion C Part 1 from 3 to 2            *
* 3. reduce the number of symptoms needed in Criterion C Part 1 from 3 to 1            *
* 4. do both 1 and 2                                                                   *
* 5. do both 1 and 3                                                                   *
****************************************************************************************;

%do j = 1 %to 2;
    %let c = %scan(&char, &j);
    if dsmptsa1 = 1 and d&c.ptsb = 1 and d&c.ptsc = 1 and d&c.ptsd = 1 and d&c.ptse = 1 and
       d&c.ptsf = 1 then d&c.pts1 = 1;        *All criteria are met for definition 1;
    else d&c.pts1 = 5;                        *Criteria are not met for definition 1;
%end;

if dwptsa = 1 and dwptsb = 1 and              /* Yes for worst event event 2  */
   sum(PT68 = 1, PT69 = 1, PT70 = 1, PT71 = 1, PT72 = 1, PT73 = 1, PT74 = 1) >= 2 and
   dwptsc2 = 1 and dwptsd = 1 and dwptse = 1 and dwptsf = 1 then dwpts2 = 1;   
else dwpts2 = 5;

if drptsa = 1 and drptsb = 1 and              /* Yes for random event event 2 */
   sum(PT208 = 1, PT209 = 1, PT210 = 1, PT211 = 1, PT212 = 1, PT213 = 1, PT214 = 1) >= 2 and
   drptsc2 = 1 and drptsd = 1 and drptse = 1 and drptsf = 1 then drpts2 = 1;   
else drpts2 = 5;

if dwptsa = 1 and dwptsb = 1 and              /* Yes for worst event event 3 */
   sum(PT68 = 1, PT69 = 1, PT70 = 1, PT71 = 1, PT72 = 1, PT73 = 1, PT74 = 1) >= 1 and
   dwptsc2 = 1 and dwptsd = 1 and dwptse = 1 and dwptsf = 1 then dwpts3 = 1;   
else dwpts3 = 5;

if drptsa = 1 and drptsb = 1 and              /* Yes for random event event 3 */ 
   sum(PT208 = 1, PT209 = 1, PT210 = 1, PT211 = 1, PT212 = 1, PT213 = 1, PT214 = 1) >= 1 and
   drptsc2 = 1 and drptsd = 1 and drptse = 1 and drptsf = 1 then drpts3 = 1;   
else drpts3 = 5;

if dsmptsa1 = 1 and dwptsb = 1 and             /* Yes for worst event event 4 */
   sum(PT68 = 1, PT69 = 1, PT70 = 1, PT71 = 1, PT72 = 1, PT73 = 1, PT74 = 1) >= 2 and
   dwptsc2 = 1 and dwptsd = 1 and dwptse = 1 and dwptsf = 1 then dwpts4 = 1;   
else dwpts4 = 5;

if dsmptsa1 = 1 and drptsb = 1 and             /* Yes for random event event 4 */
   sum(PT208 = 1, PT209 = 1, PT210 = 1, PT211 = 1, PT212 = 1, PT213 = 1, PT214 = 1) >= 2 and
   drptsc2 = 1 and drptsd = 1 and drptse = 1 and drptsf = 1 then drpts4 = 1;   
else drpts4 = 5;

if dsmptsa1 = 1 and dwptsb = 1 and             /* Yes for worst event event 5 */
   sum(PT68 = 1, PT69 = 1, PT70 = 1, PT71 = 1, PT72 = 1, PT73 = 1, PT74 = 1) >= 1 and
   dwptsc2 = 1 and dwptsd = 1 and dwptse = 1 and dwptsf = 1 then dwpts5 = 1;   
else dwpts5 = 5;

if dsmptsa1 = 1 and drptsb = 1 and             /* Yes for random event event 5 */
   sum(PT208 = 1, PT209 = 1, PT210 = 1, PT211 = 1, PT212 = 1, PT213 = 1, PT214 = 1) >= 1 and
   drptsc2 = 1 and drptsd = 1 and drptse = 1 and drptsf = 1 then drpts5 = 1;   
else drpts5 = 5;

%do j = 1 %to 5;       *Combine worst and random event diagnosis;
  if dwpts&j = 1 or drpts&j = 1 then dsm_pts&j = 1;
  else dsm_pts&j = 5;
%end;

*************************************************************************************
* Posttraumatic Disorder -- ICD criteria                                            *
*************************************************************************************;

********************************************************************************************************************
* Criteria A: The patient must have been exposed to a stressful event or situation (either short- or long-lasting) *
*             of exceptionally threatening or catastrophic nurture, which would be likely to cause pervasive       *
*             distress in almost everyone.                                                                         *
*                                                                                                                  * 
*     Combat Experience/Relief Worker in War Zone/Civilian in War Zone/                                            *
*     Civilian in region of Terror/Refugee:                                                                        * 
*                                                                                                                  *
*     PT29 is Yes(1) OR PT30 is Yes(1) OR PT31 is Yes(1) OR PT32 is Yes(1) OR PT33 is Yes(1)                       *
*                                                                                                                  *
*     Kidnapped:                                                                                                   *
*                                                                                                                  *
*     PT34 is Yes(1)                                                                                               *    
*                                                                                                                  * 
*     Toxic Exposure:                                                                                              * 
*                                                                                                                  *
*     PT35 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Automobile Accident:                                                                                         *
*                                                                                                                  *
*     PT36 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Other Life Threatening Accident:                                                                             *
*                                                                                                                  *
*     PT37 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Natural Disaster:                                                                                            *
*                                                                                                                  *
*     PT38 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Man-made Disaster:                                                                                           *
*                                                                                                                  *
*     PT39 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Life Threatening Illness:                                                                                    * 
*                                                                                                                  *
*     PT40 is Yes(1)                                                                                               * 
*                                                                                                                  *
*     Beaten up as Child by Caregiver:                                                                             *
*                                                                                                                  *
*     PT41 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Beaten by Spouse or Romantic Partner:                                                                        *
*                                                                                                                  *
*     PT42 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Beaten by Other:                                                                                             *
*                                                                                                                  *  
*     PT43 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Raped:                                                                                                       *
*                                                                                                                  *
*     PT45 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Sexually Assaulted:                                                                                          *
*                                                                                                                  *
*     PT46 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Mugged or Threatened with a Weapon:                                                                          *
*                                                                                                                  *
*     PT44 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Stalked:                                                                                                     *
*                                                                                                                  *
*     PT47 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Unexpected Death of a Loved One:                                                                             * 
*                                                                                                                  *
*     PT48 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Child with Serious Illness:                                                                                  *
*                                                                                                                  *
*     PT49 is Yes(1)                                                                                               * 
*                                                                                                                  *
*     Traumatic Event to Loved One:                                                                                *
*                                                                                                                  *
*     PT50 is Yes(1) OR PT50_1 is Yes(1)                                                                           *
*                                                                                                                  *
*     Note: PT50_1 added to NSHS Replication version                                                               *
*                                                                                                                  *
*     Witnessed Death or Dead Body, or Saw Someone Seriously Hurt:                                                 *
*                                                                                                                  * 
*     PT51 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Accidentally Caused Serious Injury or Death                                                                  *
*                                                                                                                  *
*     PT52 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Purposely Injured, Tortured, or Killed Someone.                                                              *
*                                                                                                                  *
*     PT53 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Saw Atrocities:                                                                                              *
*                                                                                                                  *
*     PT54 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Some Other Event:                                                                                            *
*                                                                                                                  *
*     PT55 is Yes(1)                                                                                               *
*                                                                                                                  *
*     Private Event:                                                                                               *
*                                                                                                                  *
*     PT57 is Yes(1)                                                                                               *
********************************************************************************************************************;  

* Use DSM-IV Criteria A Part 1;

icdptsa = dsmptsa1;     /* Worst event */

*****************************************************************************************************************
* Criteria B Part 1: There must be persistent remembering or reliving of the stressor in intrusive flashbacks,  *
*                    vivid memories, or recurring dreams.                                                       *
*                                                                                                               *
*                    Worst Event: PT86 is Yes(1) OR PT87 is Yes(1) OR PT88 is Yes(1)                            *
*                    Random Event: PT222 is Yes(1) OR PT223 is Yes(1) OR PT224 is Yes(1)                        *
*****************************************************************************************************************;

*Worst event;
if PT86 = 1 or PT87 = 1 or PT88 = 1 then iwptsb1 = 1;          /* Yes */
else if PT86 = 5 and PT87 = 5 and PT88 = 5 then iwptsb1 = 5;   /* No */
else if PT86 = 9 or PT87 = 9 or PT88 = 9 then iwptsb1 = 9;     /* Don't know */
else if PT86 = 8 or PT87 = 8 or PT88 = 8 then iwptsb1 = 8;     /* Refuse */

*Random event;
if PT222 = 1 or PT223 = 1 or PT224 = 1 then irptsb1 = 1;          /* Yes */
else if PT222 = 5 and PT223 = 5 and PT224 = 5 then irptsb1 = 5;   /* No */
else if PT222 = 9 or PT223 = 9 or PT224 = 9 then irptsb1 = 9;     /* Don't know */
else if PT222 = 8 or PT223 = 8 or PT224 = 8 then irptsb1 = 8;     /* Refuse */

******************************************************************************************************************
* Criteria B Part 2: There must be distress experienced when exposed to circumstances resembling or associated   *
*                    with the stressor                                                                           *
*                                                                                                                *
*                    Worst Event: PT89 is Yes(1) OR PT90 is Yes(1) OR PT98 is (3,4,5) OR PT99 is (3,4,5) OR      *
*                                 PT114 is (3,4,5) OR PT115 is (3,4,5)                                           * 
*                    Random Event: PT225 is Yes(1) OR PT226 is Yes(1) OR PT231 is (3,4,5) OR PT232 is (3,4,5)    *
*                                                                                                                *
*                    Note: PT98, PT99 are deleted, use PT114, PT115 as replacement                               *
******************************************************************************************************************;

*Worst event;
* If PT91= 1 or PT107 = 1 or PT111 = 1 or PT113 = 1 then PT114,PT115 are skipped;
if PT89 = 1 or PT90 = 1 or PT114 IN(3,4,5) or PT115 IN (3,4,5) then iwptsb2 = 1;         /* Yes */
else if PT89 = 5 and PT90 = 5 and ((PT91 = 1 or PT107 = 1 or PT111 = 1 or PT113 = 1) or
     (PT114 IN(1,2) and PT115 IN (1,2))) then iwptsb2 = 5;                               /* No */
else if PT89 = 9 or PT90 = 9 or PT114 = 9 or PT115 = 9 then iwptsb2 = 9;                 /* Don't know */
else if PT89 = 8 or PT90 = 8 or PT114 = 8 or PT115 = 8 then iwptsb2 = 8;                 /* Refuse */

*Random event;
* If PT227 = 1 then PT231,PT232 skipped;
if PT225 = 1 or PT226 = 1 or PT231 IN(3,4,5) or PT232 IN (3,4,5) then irptsb2 = 1;       /* Yes */
else if PT225 = 5 and PT226 = 5 and 
    (PT227 = 1 or (PT231 IN(1,2) and PT232 IN (1,2))) then irptsb2 = 5;                  /* No */
else if PT225 = 9 or PT226 = 9 or PT231 = 9 or PT232 = 9 then irptsb2 = 9;               /* Don't know */
else if PT225 = 8 or PT226 = 8 or PT231 = 8 or PT232 = 8 then irptsb2 = 8;               /* Refuse */

******************************************************************************************
* Combine ICD Criteria B Parts 1 and 2 for Random and Worst event                        *
******************************************************************************************;

%let char = w r;
%do j = 1 %to 2;
   %let c= %scan(&char, &j);                                              
   if i&c.ptsb1 = 1 or i&c.ptsb2 = 1 then i&c.ptsb = 1;           /* Yes */
   else if i&c.ptsb1 = 5 and i&c.ptsb2 = 5 then i&c.ptsb = 5;     /* No */
   else if i&c.ptsb1 = 9 or i&c.ptsb2 = 9 then i&c.ptsb = 9;      /* Don't know */
   else if i&c.ptsb1 = 8 or i&c.ptsb2 = 8 then i&c.ptsb = 8;      /* Refuse */
%end;

********************************************************************************************
* Criteria C: The patient must exhibit an actual or preferred avoidance of circumstances   *
*             resembling or associated with the stressor, which was not present before     *
*             exposure to the stressor                                                     *
*                                                                                          *
*             Worst Event: PT68 is Yes(1) OR PT69 is Yes(1)                                *
*             Random Event: PT209 is Yes(1)                                                *
********************************************************************************************;

*Worst event;
if PT68 = 1 or PT69 = 1 then iwptsc = 1;   
else if PT68 = 5 and PT69 = 5 then iwptsc = 5;
else if PT68 = 9 or PT69 = 9 then iwptsc = 9;
else if PT68 = 8 or PT69 = 8 then iwptsc = 8;

irptsc = PT209;  *Random event;

***************************************************************************************************
* Criteria D Part 1: inability to recall, either partially or completely, some important aspects  *
*                    of the period of exposure to the stressor                                    *
*                                                                                                 *
*                    Worst Event: PT70 is Yes(1)                                                  *
*                    Random Event: PT210 is Yes(1)                                                *
***************************************************************************************************;

iwptsd1 = PT70;   *Worst event;
irptsd1 = PT210;  *Random event;
 
*********************************************************************************************************
* Criteria D Part 2: Persistent symptoms of increased psychological sensitivity and arousal             *
*                    (not present before exposure to the stressor), shown by any two of the following:  *
*                                                                                                       *
*                    (a) difficulty in falling or staying asleep                                        *
*                                                                                                       *
*                        Worst Event: PT102 is Yes(1)                                                   *  
*                        Random Event: PT233 is Yes(1)                                                  *
*                                                                                                       *
*                    (b) irritability or outbursts of anger                                             *
*                                                                                                       *
*                        Worst Event: PT103 is Yes(1)                                                   *
*                        Random Event: PT234 is Yes(1)                                                  *
*                                                                                                       *
*                    (c) difficulty in concentrating                                                    *
*                                                                                                       * 
*                        Worst Event: PT104 is Yes(1)                                                   * 
*                        Random Event: PT235 is Yes(1)                                                  *
*                                                                                                       *
*                    (d) hypervigilance                                                                 * 
*                                                                                                       *
*                        Worst Event: PT105 is Yes(1)                                                   *
*                        Random Event: PT236 is Yes(1)                                                  *
*                                                                                                       * 
*                    (e) exaggerated startle response                                                   * 
*                                                                                                       *
*                        Worst Event: PT106 is Yes(1)                                                   *
*                        Random Event: PT237 is Yes(1)                                                  *
*********************************************************************************************************;

if sum(PT102 = 1, PT103 = 1, PT104 = 1, PT105 = 1, PT106 = 1) >= 2 then iwptsd2 = 1;        /* Yes */
else if sum(PT102 = 5, PT103 = 5, PT104 = 5, PT105 = 5, PT106 = 5) >= 4 then iwptsd2 = 5;   /* No */
else if PT102 = 9 or PT103 = 9 or PT104 = 9 or PT105 = 9 or PT106 = 9 then iwptsd2 = 9;     /* Don't know */
else if PT102 = 8 or PT103 = 8 or PT104 = 8 or PT105 = 8 or PT106 = 8 then iwptsd2 = 8;     /* Refuse */

if sum(PT233 = 1, PT234 = 1, PT235 = 1, PT236 = 1, PT237 = 1) >= 2 then irptsd2 = 1;        /* Yes */
else if sum(PT233 = 5, PT234 = 5, PT235 = 5, PT236 = 5, PT237 = 5) >= 4 then irptsd2 = 5;   /* No */
else if PT233 = 9 or PT234 = 9 or PT235 = 9 or PT236 = 9 or PT237 = 9 then irptsd2 = 9;     /* Don't know */
else if PT233 = 8 or PT234 = 8 or PT235 = 8 or PT236 = 8 or PT237 = 8 then irptsd2 = 8;     /* Refuse */

******************************************************************************************
* Combine ICD Criteria D Parts 1 and 2 for Random and Worst event                        *
******************************************************************************************;

%let char = w r;
%do j = 1 %to 2;
   %let c= %scan(&char, &j);                                              
   if i&c.ptsd1 = 1 or i&c.ptsd2 = 1 then i&c.ptsd = 1;           /* Yes */
   else if i&c.ptsd1 = 5 and i&c.ptsd2 = 5 then i&c.ptsd = 5;     /* No */
   else if i&c.ptsd1 = 9 or i&c.ptsd2 = 9 then i&c.ptsd = 9;      /* Don't know */
   else if i&c.ptsd1 = 8 or i&c.ptsd2 = 8 then i&c.ptsd = 8;      /* Refuse */
%end;

******************************************************************************************************
* Criteria E: Criteria B, C, And D must all be met within 6 months of the stressful event or         *
*             the end of a period of stress. (For some purposes, onset delayed more than 6 months    *
*             may be included, but this should be clearly specified)                                 *
*                                                                                                    *
*             1.  Criteria B                                                                         *
*                                                                                                    *
*                 Worst Event: PT93 <= 6 months                                                      *  
*                 Random Event: PT228 <= 6 months                                                    *
*                                                                                                    *
*             2.  Criteria C                                                                         *
*                                                                                                    *
*                 Worst Event: PT77 <= 6 months                                                      *
*                 Random Event: PT217 <= 6 months                                                    *
*                                                                                                    *  
*             3.  Criteria D                                                                         *
*                                                                                                    * 
*                 Worst Event: PT77 <= 6 months OR PT109 <= 6 months                                 *
*                 Random Event: PT217 <= 6 months OR PT239 <= 6 months                               *  
*                                                                                                    *
*                 Note: PT77, PT93, PT109 are deleted. Criteria Not Operationalized for worst event  * 
******************************************************************************************************;

%tdy_pts(PT217,PT217a,PT217b);
%tdy_pts(PT228,PT228a,PT228b);
%tdy_pts(PT239,PT239a,PT239b);

* Random event;
if 0 <= PT228 <= 180 and 0 <= PT217 <= 180 and (0 <= PT217 <= 180 or 0 <= PT239 <= 180)
   then irptse = 1;                                                                       /* Yes */
else if 180 < PT228 < 99998 or 180 < PT217 < 99998 or
   (180 < PT217 < 99998 and 180 < PT239 < 99998) then irptse = 5;                         /* No */
else if PT217 = 99999 or PT228 = 99999 or PT239 = 99999 then irptse = 9;                  /* Don't know */
else if PT217 = 99998 or PT228 = 99998 or PT239 = 99998 then irptse = 8;                  /* Refuse */

************************************************************************************
* Combine Criteria A,B,C,D,E for Worst Event and Random Event                      *
*                                                                                  *
* Criteria E Not Operationalized for Worst Event                                   * 
************************************************************************************;

*Worst Event;
if icdptsa = 1 and iwptsb = 1 and iwptsc = 1 and iwptsd = 1 then iwpts = 1;           *All criteria are met;
else iwpts = 5;                                                                       *Criteria are not met;

*Random Event;
if icdptsa = 1 and irptsb = 1 and irptsc = 1 and irptsd = 1 and irptse = 1 then irpts = 1;  *All criteria are met;
else irpts = 5;                                                                             *Criteria are not met;

if iwpts = 1 or irpts = 1 then icd_pts = 1;
else icd_pts = 5;

******************************************************************************************
* Calculate Onset, Recency, Persistence of PTSD for DSM and ICD                          *
******************************************************************************************;

length PT59by 8;

if PT59b_5 ~IN(998,999) then PT59by = PT59b_5;
else if PT59b_5 IN(998,999) OR PT59b_5 > 999 then PT59by = .;

%tyr_pts(PT217y,PT217a,PT217b);      /* Calculate total years for PT217 from 2 parts */
%tyr_pts(PT228y,PT228a,PT228b);      /* Calculate total years for PT228 from 2 parts */
%tyr_pts(PT239y,PT239a,PT239b);      /* Calculate total years for PT239 from 2 parts */

%let sfxstr = 110 218 229 240;

%let j = 1;
%do %while(%length(%scan(&sfxstr,&j)));

   %let sfx = %scan(&sfxstr,&j); 
   %tyr_pts2(PT&sfx.y,PT&sfx.a,PT&sfx.b);        /* Calc duration */
   if PT&sfx.y IN(998,999) then PT&sfx.y = .;
   %let j = %eval(&j+1);

%end; 

/* Set duration variables with values of 998,999 to missing for calculations */
array PTyvar PT59by PT110y PT217y PT218y PT228y PT229y PT239y PT240y;
do over PTyvar;
   if PTyvar IN(998,999) then PTyvar = .;
end;

if PT64a ~IN(998,999) then pts_onw = PT64a;     /* Worst event onset, use age of worst event */

pts_recw = pts_onw + PT110y;
if pts_recw >= SC1 + 1 then pts_recw = .;    /* Reset receny to missing when > SC1 */

pts_onr = min(PT59by + PT217y, PT59by + PT228y, PT59by + PT239y); *PTSD onset random event;

pts_recr = max(PT59by + PT217y + PT218y, PT59by + PT228y + PT229y, PT59by + PT239y + PT240y);  *PTSD recency random event;

if 0 <= pts_onw < 4 then pts_onw = 4;  /* Set onset, recency ages < 4 to 4 */
if 0 <= pts_onr < 4 then pts_onr = 4;
if 0 <= pts_recw < 4 then pts_recw = 4;
if 0 <= pts_recr < 4 then pts_recr = 4;

if pts_onr >= SC1 + 1 then pts_onr = .;      /* Reset receny to missing when > SC1 */
if pts_recr >= SC1 + 1 then pts_recr = .;    /* Reset receny to missing when > SC1 */

pts_perw = PT110y;                        *PTSD persistence worst event;
pts_perr = max(PT218y, PT229y, PT240y);   *PTSD persistence random event;

if drpts = 1 and dwpts = 1 then do;         /* Onset, recency, persistence for DSM when random event and */
   pts_ond = min(pts_onr,pts_onw);          /* worst event are true                                      */
   if PT261 = 1 then pts_recd = SC1;
   else pts_recd = max(pts_recr, pts_recw);
   pts_perd = max(pts_perw, pts_perr);
end;
else if drpts = 1 and dwpts ^= 1 then do;  /* Onset, recency, persistence for DSM when random event  */
   pts_ond = pts_onr;                      /* is true and worst event is not true                    */
   if PT261 = 1 then pts_recd = SC1;
   else pts_recd = pts_recr;
   pts_perd = pts_perr;
end;
else if drpts ^= 1 and dwpts = 1 then do;  /* Onset, recency, persistence for DSM when random event  */
   pts_ond = pts_onw;                      /* is not true and worst event is true                    */
   if PT261 = 1 then pts_recd = SC1;
   else pts_recd = pts_recw;
   pts_perd = pts_perw;
end;

if irpts = 1 and iwpts = 1 then do;         /* Onset, recency, persistence for ICD when random event and */
   pts_oni = min(pts_onr, pts_onw);         /* worst event are true                                      */
   if PT261 = 1 then pts_reci = SC1;
   else pts_reci = max(pts_recr, pts_recw);
   pts_peri = max(pts_perw, pts_perr);
end;
else if irpts = 1 and iwpts ^= 1 then do;  /* Onset, recency, persistence for ICD when random event  */
   pts_oni = pts_onr;                      /* is true and worst event is not true                    */
   if PT261 = 1 then pts_reci = SC1;
   else pts_reci = pts_recr;
   pts_peri = pts_perr;
end;
else if irpts ^= 1 and iwpts = 1 then do;  /* Onset, recency, persistence for ICD when random event  */
   pts_oni = pts_onw;                            /* is not true and worst event is not true                */
   if PT261 = 1 then pts_reci = SC1;
   else pts_reci = pts_recw;
   pts_peri = pts_perw;
end;

%mend ptsd;

%ptsd;