/*-------------------------------------------------------------------------
 |                                                                         
 |             SAS SUPPLEMENTAL SYNTAX FILE FOR ICPSR 20240
 |         COLLABORATIVE PSYCHIATRIC EPIDEMIOLOGY SURVEYS (CPES),
 |                       2001-2003 [UNITED STATES]
 |         (DATASET 0005: RESTRICTED-USE VERSION OF NATIONAL COMORBIDITY SURVEY REPLICATION
 |                                   (NCS-R),2001-2003)
 |          
 |
 | This SAS program is provided for optional use with the SAS transport
 | version of this data file as distributed by ICPSR. Users need to use 
 | SAS PROC CIMPORT to import the SAS transport file to a SAS data set on
 | their system.
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions.  Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS data set. Users
 | should replace "SAS-dataset" with their name for the SAS data set copied
 | from the SAS transport file. Users can add a SAS libname statement
 | and an output SAS data set name to make a permanent SAS data set.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | To maintain the original meaning of missing codes, users may want
 | to take advantage of the SAS missing values (the letters A-Z or an
 | underscore preceded by a period).
 |
 | An example of a standard missing value recode:
 |
 |   IF (RELATION = 98 OR RELATION = 99) THEN RELATION = .;
 |
 | The same example using special missing value recodes:
 |
 |    IF RELATION = 98 THEN RELATION = .A;
 |    IF RELATION = 99 THEN RELATION = .B;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables stored in the SAS data set. Users can refer to their
 | SAS manual for information on how to permanently store formats in a
 | SAS catalog.
 |
 | NOTE:  Users should modify this file to suit their specific needs.
 | The MISSING VALUE RECODES section has been commented out (i.e., '/*').
 | To make this section active in the program, users should remove the SAS
 | comment indicators from this section.
 |
 |------------------------------------------------------------------------*/

* SAS PROC FORMAT;

PROC FORMAT;
  VALUE version   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE sc2fffff  .R='(.R) REFUSAL' -9.0='(-9.0) REFUSAL' .D='(.D) DONT KNOW' -8.0='(-8.0) DONT KNOW' .N='(.N) OTHER' -7.0='(-7.0) OTHER' ;
  VALUE sc2a      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sc2_1fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE sc2_2fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE sc2_3fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE sc3fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MARRIED' 2='(2) SEPARATED'
                  3='(3) DIVORCED' 4='(4) WIDOWED' 5='(5) NEVER MARRIED' ;
  VALUE sc3a      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_4a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_4b   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_4c   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_5af  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_50f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_51f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_52f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_53f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_5ef  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) PARALYSIS OF LEGS, R IS IN WHEELCHAIR'
                  2='(2) PARALYSIS OF LEGS, R USES A WALKER'
                  3='(3) PARALYSIS OF LEGS, R CAN WALK WITHOUT A WALKER'
                  4='(4) PARALYSIS OF ONE ARM' 5='(5) PARALYSIS OF ONE SIDE OF BODY'
                  6='(6) ONE MISSING FOOT' 7='(7) TWO MISSING FEET'
                  8='(8) ONE MISSING LEG' 9='(9) TWO MISSING LEGS'
                  10='(10) ONE MISSING HAND' 11='(11) TWO MISSING HANDS'
                  12='(12) ONE MISSING ARM' 13='(13) TWO MISSING ARMS'
                  14='(14) FACIAL DISFIGUREMENT' 15='(15) EXTREMELY SMALL HEIGHT'
                  16='(16) EXTREMELY LARGE HEIGHT' 17='(17) EXTREME OBESITY'
                  18='(18) OTHER BODY DISFIGUREMENT' 19='(19) STUTTERING'
                  20='(20) OTHER (SPECIFY)' ;
  VALUE sc10_54f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) PARALYSIS OF LEGS, R IS IN WHEELCHAIR'
                  2='(2) PARALYSIS OF LEGS, R USES A WALKER'
                  3='(3) PARALYSIS OF LEGS, R CAN WALK WITHOUT A WALKER'
                  4='(4) PARALYSIS OF ONE ARM' 5='(5) PARALYSIS OF ONE SIDE OF BODY'
                  6='(6) ONE MISSING FOOT' 7='(7) TWO MISSING FEET'
                  8='(8) ONE MISSING LEG' 9='(9) TWO MISSING LEGS'
                  10='(10) ONE MISSING HAND' 11='(11) TWO MISSING HANDS'
                  12='(12) ONE MISSING ARM' 13='(13) TWO MISSING ARMS'
                  14='(14) FACIAL DISFIGUREMENT' 15='(15) EXTREMELY SMALL HEIGHT'
                  16='(16) EXTREMELY LARGE HEIGHT' 17='(17) EXTREME OBESITY'
                  18='(18) OTHER BODY DISFIGUREMENT' 19='(19) STUTTERING'
                  20='(20) OTHER (SPECIFY)' ;
  VALUE sc10_55f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) PARALYSIS OF LEGS, R IS IN WHEELCHAIR'
                  2='(2) PARALYSIS OF LEGS, R USES A WALKER'
                  3='(3) PARALYSIS OF LEGS, R CAN WALK WITHOUT A WALKER'
                  4='(4) PARALYSIS OF ONE ARM' 5='(5) PARALYSIS OF ONE SIDE OF BODY'
                  6='(6) ONE MISSING FOOT' 7='(7) TWO MISSING FEET'
                  8='(8) ONE MISSING LEG' 9='(9) TWO MISSING LEGS'
                  10='(10) ONE MISSING HAND' 11='(11) TWO MISSING HANDS'
                  12='(12) ONE MISSING ARM' 13='(13) TWO MISSING ARMS'
                  14='(14) FACIAL DISFIGUREMENT' 15='(15) EXTREMELY SMALL HEIGHT'
                  16='(16) EXTREMELY LARGE HEIGHT' 17='(17) EXTREME OBESITY'
                  18='(18) OTHER BODY DISFIGUREMENT' 19='(19) STUTTERING'
                  20='(20) OTHER (SPECIFY)' ;
  VALUE sc10_5gf  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) PARALYSIS OF LEGS, R IS IN WHEELCHAIR'
                  2='(2) PARALYSIS OF LEGS, R USES A WALKER'
                  3='(3) PARALYSIS OF LEGS, R CAN WALK WITHOUT A WALKER'
                  4='(4) PARALYSIS OF ONE ARM' 5='(5) PARALYSIS OF ONE SIDE OF BODY'
                  6='(6) ONE MISSING FOOT' 7='(7) TWO MISSING FEET'
                  8='(8) ONE MISSING LEG' 9='(9) TWO MISSING LEGS'
                  10='(10) ONE MISSING HAND' 11='(11) TWO MISSING HANDS'
                  12='(12) ONE MISSING ARM' 13='(13) TWO MISSING ARMS'
                  14='(14) FACIAL DISFIGUREMENT' 15='(15) EXTREMELY SMALL HEIGHT'
                  16='(16) EXTREMELY LARGE HEIGHT' 17='(17) EXTREME OBESITY'
                  18='(18) OTHER BODY DISFIGUREMENT' 19='(19) STUTTERING'
                  20='(20) OTHER (SPECIFY)' ;
  VALUE sc10_56f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) PARALYSIS OF LEGS, R IS IN WHEELCHAIR'
                  2='(2) PARALYSIS OF LEGS, R USES A WALKER'
                  3='(3) PARALYSIS OF LEGS, R CAN WALK WITHOUT A WALKER'
                  4='(4) PARALYSIS OF ONE ARM' 5='(5) PARALYSIS OF ONE SIDE OF BODY'
                  6='(6) ONE MISSING FOOT' 7='(7) TWO MISSING FEET'
                  8='(8) ONE MISSING LEG' 9='(9) TWO MISSING LEGS'
                  10='(10) ONE MISSING HAND' 11='(11) TWO MISSING HANDS'
                  12='(12) ONE MISSING ARM' 13='(13) TWO MISSING ARMS'
                  14='(14) FACIAL DISFIGUREMENT' 15='(15) EXTREMELY SMALL HEIGHT'
                  16='(16) EXTREMELY LARGE HEIGHT' 17='(17) EXTREME OBESITY'
                  18='(18) OTHER BODY DISFIGUREMENT' 19='(19) STUTTERING'
                  20='(20) OTHER (SPECIFY)' ;
  VALUE sc10_57f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) PARALYSIS OF LEGS, R IS IN WHEELCHAIR'
                  2='(2) PARALYSIS OF LEGS, R USES A WALKER'
                  3='(3) PARALYSIS OF LEGS, R CAN WALK WITHOUT A WALKER'
                  4='(4) PARALYSIS OF ONE ARM' 5='(5) PARALYSIS OF ONE SIDE OF BODY'
                  6='(6) ONE MISSING FOOT' 7='(7) TWO MISSING FEET'
                  8='(8) ONE MISSING LEG' 9='(9) TWO MISSING LEGS'
                  10='(10) ONE MISSING HAND' 11='(11) TWO MISSING HANDS'
                  12='(12) ONE MISSING ARM' 13='(13) TWO MISSING ARMS'
                  14='(14) FACIAL DISFIGUREMENT' 15='(15) EXTREMELY SMALL HEIGHT'
                  16='(16) EXTREMELY LARGE HEIGHT' 17='(17) EXTREME OBESITY'
                  18='(18) OTHER BODY DISFIGUREMENT' 19='(19) STUTTERING'
                  20='(20) OTHER (SPECIFY)' ;
  VALUE sc10_6ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_6a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d38a_3_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE d38a_3af  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE d40fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN 14 DAYS'
                  2='(2) ALL OTHERS' ;
  VALUE d57fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) D39 EQUALS 12 MONTHS OR LONGER' 2='(2) ALL OTHERS' ;
  VALUE so3b      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE so6a      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE g26b      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE g27a_3ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE g27a_3a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt1fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt2fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt3fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt4fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt5fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt10ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt11ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt12ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt13ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt14ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt15ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt16ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt17ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt18ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt19ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt20ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt21ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt22ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt22_1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt23ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt24ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt25ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt26ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt27ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt28ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt29a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt29b1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt29b2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt29c     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt29d1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt29d2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt30ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt30a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt30b1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt30b2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt30c     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt30d1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt30d2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt31ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt31a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt31b1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt31b2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt31c     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt31d1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt31d2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt32ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt32a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt32b1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt32b2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt32c     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt32d1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt32d2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt33ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt33a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt33b1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt33b2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt33c     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt33d1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt33d2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt34ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt34a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt34b1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt34b2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt34c     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt34d1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt34d2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt35ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt35a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt35b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt36ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt36a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt36b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt37ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt37a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt37b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt38ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt38a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt38b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt39ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt39a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt39b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt40ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt40a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt40b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt41ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt41a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt41b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt42ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt42a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt42b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt43ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt43a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt43b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt44ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt44a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt44b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt45ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt45a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt45b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt46ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt46a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt46b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt47ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt47a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt47b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt48ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt48a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt48b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt49ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt49a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt49b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt50ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt50a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt50b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt50_1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt50_1a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt50_1b   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt51ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt51a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt51b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt52ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt52a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt52b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt53ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt53a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt53b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt54ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt54a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt54b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt55ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt55b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) ONE-TIME EVENT'
                  2='(2) ONGOING EVENT' ;
  VALUE pt57ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt119a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt120a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt125fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO'
                  6='(6) R VOLUNTEERED ''SAW A DEAD BODY''' ;
  VALUE pt125a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) R''S SPOUSE'
                  2='(2) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  3='(3) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) OTHER RELATIVE' 6='(6) FRIEND' 7='(7) ACQUAINTANCE' 8='(8) STRANGER' ;
  VALUE pt125a6f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt125a7f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt125a8f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt125a0f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) R''S SPOUSE'
                  2='(2) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  3='(3) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) OTHER RELATIVE' 6='(6) FRIEND' 7='(7) ACQUAINTANCE' 8='(8) STRANGER' ;
  VALUE pt126fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt126a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) R''S SPOUSE'
                  2='(2) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  3='(3) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) OTHER RELATIVE' 6='(6) FRIEND' 7='(7) ACQUAINTANCE' 8='(8) STRANGER' ;
  VALUE pt126a6f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt127fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt127a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) RESPONDENT' 2='(2) R''S SPOUSE'
                  3='(3) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  6='(6) OTHER RELATIVE' 7='(7) FRIEND' 8='(8) ACQUAINTANCE' 9='(9) STRANGER' ;
  VALUE pt127a7f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt127a8f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt127a0f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) RESPONDENT' 2='(2) R''S SPOUSE'
                  3='(3) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  6='(6) OTHER RELATIVE' 7='(7) FRIEND' 8='(8) ACQUAINTANCE' 9='(9) STRANGER' ;
  VALUE pt127a1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) RESPONDENT' 2='(2) R''S SPOUSE'
                  3='(3) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  6='(6) OTHER RELATIVE' 7='(7) FRIEND' 8='(8) ACQUAINTANCE' 9='(9) STRANGER' ;
  VALUE pt127a2f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) RESPONDENT' 2='(2) R''S SPOUSE'
                  3='(3) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  6='(6) OTHER RELATIVE' 7='(7) FRIEND' 8='(8) ACQUAINTANCE' 9='(9) STRANGER' ;
  VALUE pt128fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt129a1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt131_sf  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MILITARY'
                  2='(2) NON-MILITARY RESISTANCE FIGHTER' 3='(3) FREEDOM FIGHTER'
                  4='(4) LIBERATION ARMY' 5='(5) PARAMILITARY' 6='(6) OTHER' ;
  VALUE pt132fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt133fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt134fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt135fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt136fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt137fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt138a    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt138b    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt146fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DRIVER' 2='(2) PASSENGER'
                  3='(3) IF VOL: PEDESTRIAN' 4='(4) IF VOL: BYSTANDER'
                  5='(5) IF VOL: CYCLIST' ;
  VALUE pt147_sf  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) R''S FAULT'
                  2='(2) DRIVER OF R''S VEHICLE' 3='(3) OTHER VEHICLE'
                  4='(4) BICYCLIST, PEDESTRIAN, OR BYSTANDER'
                  5='(5) NO ONE''S FAULT / WEATHER, ROAD CONDITIONS, ETC.' ;
  VALUE pt148fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt148a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) RESPONDENT' 2='(2) R''S SPOUSE'
                  3='(3) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  6='(6) OTHER RELATIVE' 7='(7) FRIEND' 8='(8) ACQUAINTANCE' 9='(9) STRANGER' ;
  VALUE pt148a7f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt149fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt149a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) RESPONDENT' 2='(2) R''S SPOUSE'
                  3='(3) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  6='(6) OTHER RELATIVE' 7='(7) FRIEND' 8='(8) ACQUAINTANCE' 9='(9) STRANGER' ;
  VALUE pt149a3f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt149a4f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt149a5f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt149a6f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt149a7f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt149a8f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt149a0f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) RESPONDENT' 2='(2) R''S SPOUSE'
                  3='(3) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  6='(6) OTHER RELATIVE' 7='(7) FRIEND' 8='(8) ACQUAINTANCE' 9='(9) STRANGER' ;
  VALUE pt149a1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) RESPONDENT' 2='(2) R''S SPOUSE'
                  3='(3) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  6='(6) OTHER RELATIVE' 7='(7) FRIEND' 8='(8) ACQUAINTANCE' 9='(9) STRANGER' ;
  VALUE pt156fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO'
                  6='(6) (IF VOL:)''SAW A DEAD BODY''' ;
  VALUE pt156a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) R''S SPOUSE'
                  2='(2) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  3='(3) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) OTHER RELATIVE' 6='(6) FRIEND' 7='(7) ACQUAINTANCE' 8='(8) STRANGER' ;
  VALUE pt156a6f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt156a8f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt157fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt157a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) R''S SPOUSE'
                  2='(2) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  3='(3) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) OTHER RELATIVE' 6='(6) FRIEND' 7='(7) ACQUAINTANCE' 8='(8) STRANGER' ;
  VALUE pt157a6f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt157a0f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) R''S SPOUSE'
                  2='(2) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  3='(3) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) OTHER RELATIVE' 6='(6) FRIEND' 7='(7) ACQUAINTANCE' 8='(8) STRANGER' ;
  VALUE pt157a1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) R''S SPOUSE'
                  2='(2) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  3='(3) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) OTHER RELATIVE' 6='(6) FRIEND' 7='(7) ACQUAINTANCE' 8='(8) STRANGER' ;
  VALUE pt158fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt158a_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) RESPONDENT' 2='(2) R''S SPOUSE'
                  3='(3) R''S PARENT (BIOLOGICAL, ADOPTED, STEP)'
                  4='(4) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)'
                  5='(5) R''S SIBLING (BIOLOGICAL, ADOPTED, STEP)'
                  6='(6) OTHER RELATIVE' 7='(7) FRIEND' 8='(8) ACQUAINTANCE' 9='(9) STRANGER' ;
  VALUE pt158a6f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt158a7f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt158a8f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt159fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt159a    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) PERMANENTLY LEFT HOME'
                  2='(2) TEMPORARILY LEFT HOME' ;
  VALUE pt161_sf  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) FLOOD' 2='(2) HURRICANE'
                  3='(3) TORNADO' 4='(4) EARTHQUAKE' 5='(5) TIDAL WAVE' 6='(6) MONSOON'
                  7='(7) FIRE' 8='(8) MISTRAL OR OTHER WIND' 9='(9) LIGHTNING'
                  10='(10) OTHER (SPECIFY)' ;
  VALUE pt170_sf  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) SPOUSE OR ROMANTIC PARTNER'
                  2='(2) PARENT/GUARDIAN' 3='(3) STEP-RELATIVE' 4='(4) OTHER RELATIVE'
                  5='(5) SOMEONE ELSE R KNEW' 6='(6) STRANGER' ;
  VALUE pt170_0f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) SPOUSE OR ROMANTIC PARTNER'
                  2='(2) PARENT/GUARDIAN' 3='(3) STEP-RELATIVE' 4='(4) OTHER RELATIVE'
                  5='(5) SOMEONE ELSE R KNEW' 6='(6) STRANGER' ;
  VALUE pt170_1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) SPOUSE OR ROMANTIC PARTNER'
                  2='(2) PARENT/GUARDIAN' 3='(3) STEP-RELATIVE' 4='(4) OTHER RELATIVE'
                  5='(5) SOMEONE ELSE R KNEW' 6='(6) STRANGER' ;
  VALUE pt171fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) ONE-TIME' 5='(5) REPEATEDLY' ;
  VALUE pt171a1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt171a2f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt172fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt173fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) R''S SPOUSE OR ROMANTIC PARTNER' 2='(2) R''S PARENT'
                  3='(3) R''S CHILD (BIOLOGICAL, ADOPTED, STEP)' 4='(4) R''S SIBLING'
                  5='(5) GRANDPARENT' 6='(6) OTHER RELATIVE, BY BLOOD OR MARRIAGE'
                  7='(7) NOT A FAMILY MEMBER' ;
  VALUE pt174fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) HOMICIDE/MURDER' 2='(2) SUICIDE'
                  3='(3) ACCIDENT' 4='(4) ILLNESS OR HEALTH PROBLEMS'
                  5='(5) MEDICAL MISHAP' 6='(6) NATURAL DISASTER' 7='(7) OTHER' ;
  VALUE pt174a    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt174b1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt174b2f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt175fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE pt176fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt218c    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt229c    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt240c    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb3fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE tb5intrf  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE tb5int0f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE tb6fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE tb6a      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE tb21b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE tb23ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE tb26ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE su12d     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su65d     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps9fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd11ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd12ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd13ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd14_2_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) A. GUN'
                  2='(2) B. RAZOR, KNIFE OR OTHER SHARP INSTUMENT'
                  3='(3) C. OVERDOSE OF PRESCRIPTION MEDICATIONS'
                  4='(4) D. OVERDOSE OF OVER-THE-COUNTER MEDICATIONS'
                  5='(5) E. OVERDOSE OF OTHER DRUG (E.G. HEROIN, CRACK, ALCOHOL)'
                  6='(6) F. POISONING (E.G. CARBON MONOXIDE, RAT POISON)'
                  7='(7) G. HANGING, STRANGULATION, SUFFOCATION' 8='(8) H. DROWNING'
                  9='(9) I. JUMPING FROM HIGH PLACES' 10='(10) J. MOTOR VEHICLE CRASH'
                  11='(11) K. OTHER (PLEASE DESCRIBE)' ;
  VALUE sd14_20f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) A. GUN'
                  2='(2) B. RAZOR, KNIFE OR OTHER SHARP INSTUMENT'
                  3='(3) C. OVERDOSE OF PRESCRIPTION MEDICATIONS'
                  4='(4) D. OVERDOSE OF OVER-THE-COUNTER MEDICATIONS'
                  5='(5) E. OVERDOSE OF OTHER DRUG (E.G. HEROIN, CRACK, ALCOHOL)'
                  6='(6) F. POISONING (E.G. CARBON MONOXIDE, RAT POISON)'
                  7='(7) G. HANGING, STRANGULATION, SUFFOCATION' 8='(8) H. DROWNING'
                  9='(9) I. JUMPING FROM HIGH PLACES' 10='(10) J. MOTOR VEHICLE CRASH'
                  11='(11) K. OTHER (PLEASE DESCRIBE)' ;
  VALUE sd14_21f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) A. GUN'
                  2='(2) B. RAZOR, KNIFE OR OTHER SHARP INSTUMENT'
                  3='(3) C. OVERDOSE OF PRESCRIPTION MEDICATIONS'
                  4='(4) D. OVERDOSE OF OVER-THE-COUNTER MEDICATIONS'
                  5='(5) E. OVERDOSE OF OTHER DRUG (E.G. HEROIN, CRACK, ALCOHOL)'
                  6='(6) F. POISONING (E.G. CARBON MONOXIDE, RAT POISON)'
                  7='(7) G. HANGING, STRANGULATION, SUFFOCATION' 8='(8) H. DROWNING'
                  9='(9) I. JUMPING FROM HIGH PLACES' 10='(10) J. MOTOR VEHICLE CRASH'
                  11='(11) K. OTHER (PLEASE DESCRIBE)' ;
  VALUE sd24ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd25ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd26ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd29ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) A. GUN'
                  2='(2) B. RAZOR, KNIFE OR OTHER SHARP INSTUMENT'
                  3='(3) C. OVERDOSE OF PRESCRIPTION MEDICATIONS'
                  4='(4) D. OVERDOSE OF OVER-THE-COUNTER MEDICATIONS'
                  5='(5) E. OVERDOSE OF OTHER DRUG (E.G. HEROIN, CRACK, ALCOHOL)'
                  6='(6) F. POISONING (E.G. CARBON MONOXIDE, RAT POISON)'
                  7='(7) G. HANGING, STRANGULATION, SUFFOCATION' 8='(8) H. DROWNING'
                  9='(9) I. JUMPING FROM HIGH PLACES' 10='(10) J. MOTOR VEHICLE CRASH'
                  11='(11) K. OTHER (PLEASE DESCRIBE)' ;
  VALUE ph5_03a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph5_04a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph6_03a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph6_04a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph7_03a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph7_04a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph8_03a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph8_04a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph9_03a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph9_04a   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph10_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph10_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph11_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph11_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph12_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph12_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph13_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph13_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph14_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph14_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph15_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph15_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph16_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph16_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph17_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph17_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph18_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph18_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph19_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ph19_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph20_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph20_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph21_03a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE ph21_04a  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE cc50_6ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50_16f  .R='(.R) REFUSAL' -9.000000='(-9.000000) REFUSAL' .D='(.D) DONT KNOW' -8.000000='(-8.000000) DONT KNOW' .N='(.N) OTHER' -7.000000='(-7.000000) OTHER' ;
  VALUE cc50_17f  .R='(.R) REFUSAL' -9.000000='(-9.000000) REFUSAL' .D='(.D) DONT KNOW' -8.000000='(-8.000000) DONT KNOW' .N='(.N) OTHER' -7.000000='(-7.000000) OTHER' ;
  VALUE fb6j      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em8_s_1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) LOOKING FOR WORK; UNEMPLOYED' 4='(4) TEMPORARILY LAID OFF'
                  5='(5) RETIRED' 6='(6) HOMEMAKER' 7='(7) STUDENT' 8='(8) MATERNITY LEAVE'
                  9='(9) ILLNESS/SICK LEAVE' 10='(10) DISABLED' 11='(11) OTHER (SPECIFY)' ;
  VALUE em8_s_2f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) LOOKING FOR WORK; UNEMPLOYED' 4='(4) TEMPORARILY LAID OFF'
                  5='(5) RETIRED' 6='(6) HOMEMAKER' 7='(7) STUDENT' 8='(8) MATERNITY LEAVE'
                  9='(9) ILLNESS/SICK LEAVE' 10='(10) DISABLED' 11='(11) OTHER (SPECIFY)' ;
  VALUE em14a1_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER'
                  13='(13) CURRENT MONTH' ;
  VALUE em14a2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE mr21_4ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE mr25ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE mr51ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE mr52ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn11ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cn11_3ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) HETEROSEXUAL' 2='(2) HOMOSEXUAL'
                  3='(3) BISEXUAL' 4='(4) SOMETHING ELSE' ;
  VALUE da1_s_1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 0='(0) NOT SPANISH/HISPANIC'
                  1='(1) MEXICAN' 2='(2) MEXICAN AMERICAN' 3='(3) CHICANO'
                  4='(4) PUERTO RICO' 5='(5) CUBAN' 6='(6) SOUTH/CENTRAL AMERICAN'
                  7='(7) OTHER SPANISH (SPECIFY)' ;
  VALUE da1_s_2f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 0='(0) NOT SPANISH/HISPANIC'
                  1='(1) MEXICAN' 2='(2) MEXICAN AMERICAN' 3='(3) CHICANO'
                  4='(4) PUERTO RICO' 5='(5) CUBAN' 6='(6) SOUTH/CENTRAL AMERICAN'
                  7='(7) OTHER SPANISH (SPECIFY)' ;
  VALUE da1_s_3f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 0='(0) NOT SPANISH/HISPANIC'
                  1='(1) MEXICAN' 2='(2) MEXICAN AMERICAN' 3='(3) CHICANO'
                  4='(4) PUERTO RICO' 5='(5) CUBAN' 6='(6) SOUTH/CENTRAL AMERICAN'
                  7='(7) OTHER SPANISH (SPECIFY)' ;
  VALUE da2_01d   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da2_02d   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da2_03d   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da2_04d   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da4_s_1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) WHITE/ CAUCASIAN'
                  2='(2) BLACK/AFRICAN AMERICAN' 3='(3) AMERICAN INDIAN'
                  4='(4) ALASKA NATIVE' 5='(5) ASIAN' 6='(6) NATIVE HAWAIIAN'
                  7='(7) PACIFIC ISLANDER' ;
  VALUE da4_s_2f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) WHITE/ CAUCASIAN'
                  2='(2) BLACK/AFRICAN AMERICAN' 3='(3) AMERICAN INDIAN'
                  4='(4) ALASKA NATIVE' 5='(5) ASIAN' 6='(6) NATIVE HAWAIIAN'
                  7='(7) PACIFIC ISLANDER' ;
  VALUE da4_s_3f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) WHITE/ CAUCASIAN'
                  2='(2) BLACK/AFRICAN AMERICAN' 3='(3) AMERICAN INDIAN'
                  4='(4) ALASKA NATIVE' 5='(5) ASIAN' 6='(6) NATIVE HAWAIIAN'
                  7='(7) PACIFIC ISLANDER' ;
  VALUE da4b_s_f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) WHITE/ CAUCASIAN' 2='(2) BLACK'
                  3='(3) AMERICAN INDIAN' 4='(4) ASIAN OR PACIFIC ISLANDER'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE da4b_s0f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) WHITE/ CAUCASIAN' 2='(2) BLACK'
                  3='(3) AMERICAN INDIAN' 4='(4) ASIAN OR PACIFIC ISLANDER'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE da4b_s1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) WHITE/ CAUCASIAN' 2='(2) BLACK'
                  3='(3) AMERICAN INDIAN' 4='(4) ASIAN OR PACIFIC ISLANDER'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE da36_2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO'
                  6='(6) (IF VOL ''POLITICAL PRISONER'')' ;
  VALUE da36_2af  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE da36_20f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE de4a      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE dm1_1fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) NOT SPANISH/HISPANIC'
                  2='(2) MEXICAN' 3='(3) MEXICAN AMERICAN' 4='(4) CHICANO'
                  5='(5) PUERTO RICO' 6='(6) CUBAN' 7='(7) OTHER SPANISH (SPECIFY)' ;
  VALUE dm1_5fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) WHITE/ CAUCASIAN' 2='(2) BLACK'
                  3='(3) AMERICAN INDIAN' 4='(4) ASIAN OR PACIFIC ISLANDER'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE dm1_6a    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE dm11ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) R REPORTED AFTER-TAX FIGURE IN DM10' 2='(2) ALL OTHERS' ;
  VALUE dm14ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) R REPORTED AFTER-TAX FIGURE IN DM13' 2='(2) ALL OTHERS' ;
  VALUE dm14_2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) R REPORTED AFTER-TAX FIGURE IN DM14.1' 2='(2) ALL OTHERS' ;
  VALUE ch2d      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE ch2e      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE ch2f      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE ch2g      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE ch2h      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE ch65ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch95ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd16g     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd16h     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd18c     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE cd38ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd39ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd39a     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE cd39b1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE cd39b2ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE sa47b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE t4ffffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE t4b_s_1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) R WAS PRESENT IN ONE OF THE AFFECTED BUILDINGS DURING THE AT'
                  2='(2) R WAS INJURED IN ONE OF THE ATTACKS'
                  3='(3) R NARROWLY ESCAPED INJURY'
                  4='(4) R WAS IN THE NEIGHBORHOOD OF THE AFFECTED BUILDINGS DURING T'
                  5='(5) R WAS IN NYC OR DC AND COULD SEE SMOKE OR FIRE FROM THE ATTA'
                  6='(6) R WAS IN NYC OR DC, BUT COULD NOT SEE SMOKE OR FIRE'
                  7='(7) R TRAVELED TO THE SCENE WITHIN HOURS OF THE ATTACK'
                  8='(8) R TRAVELED TO THE SCENE WITHIN SEVERAL DAYS OF THE ATTACK'
                  9='(9) R SAW ONE OR MORE DEAD BODIES'
                  10='(10) R WAS A RELIEF WORKER (EITHER VOLUNTEER OR PROFESSIONAL)'
                  11='(11) OTHER' ;
  VALUE t4b_s_2f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) R WAS PRESENT IN ONE OF THE AFFECTED BUILDINGS DURING THE AT'
                  2='(2) R WAS INJURED IN ONE OF THE ATTACKS'
                  3='(3) R NARROWLY ESCAPED INJURY'
                  4='(4) R WAS IN THE NEIGHBORHOOD OF THE AFFECTED BUILDINGS DURING T'
                  5='(5) R WAS IN NYC OR DC AND COULD SEE SMOKE OR FIRE FROM THE ATTA'
                  6='(6) R WAS IN NYC OR DC, BUT COULD NOT SEE SMOKE OR FIRE'
                  7='(7) R TRAVELED TO THE SCENE WITHIN HOURS OF THE ATTACK'
                  8='(8) R TRAVELED TO THE SCENE WITHIN SEVERAL DAYS OF THE ATTACK'
                  9='(9) R SAW ONE OR MORE DEAD BODIES'
                  10='(10) R WAS A RELIEF WORKER (EITHER VOLUNTEER OR PROFESSIONAL)'
                  11='(11) OTHER' ;
  VALUE t4b_s_3f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) R WAS PRESENT IN ONE OF THE AFFECTED BUILDINGS DURING THE AT'
                  2='(2) R WAS INJURED IN ONE OF THE ATTACKS'
                  3='(3) R NARROWLY ESCAPED INJURY'
                  4='(4) R WAS IN THE NEIGHBORHOOD OF THE AFFECTED BUILDINGS DURING T'
                  5='(5) R WAS IN NYC OR DC AND COULD SEE SMOKE OR FIRE FROM THE ATTA'
                  6='(6) R WAS IN NYC OR DC, BUT COULD NOT SEE SMOKE OR FIRE'
                  7='(7) R TRAVELED TO THE SCENE WITHIN HOURS OF THE ATTACK'
                  8='(8) R TRAVELED TO THE SCENE WITHIN SEVERAL DAYS OF THE ATTACK'
                  9='(9) R SAW ONE OR MORE DEAD BODIES'
                  10='(10) R WAS A RELIEF WORKER (EITHER VOLUNTEER OR PROFESSIONAL)'
                  11='(11) OTHER' ;
  VALUE t4b_s_4f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) R WAS PRESENT IN ONE OF THE AFFECTED BUILDINGS DURING THE AT'
                  2='(2) R WAS INJURED IN ONE OF THE ATTACKS'
                  3='(3) R NARROWLY ESCAPED INJURY'
                  4='(4) R WAS IN THE NEIGHBORHOOD OF THE AFFECTED BUILDINGS DURING T'
                  5='(5) R WAS IN NYC OR DC AND COULD SEE SMOKE OR FIRE FROM THE ATTA'
                  6='(6) R WAS IN NYC OR DC, BUT COULD NOT SEE SMOKE OR FIRE'
                  7='(7) R TRAVELED TO THE SCENE WITHIN HOURS OF THE ATTACK'
                  8='(8) R TRAVELED TO THE SCENE WITHIN SEVERAL DAYS OF THE ATTACK'
                  9='(9) R SAW ONE OR MORE DEAD BODIES'
                  10='(10) R WAS A RELIEF WORKER (EITHER VOLUNTEER OR PROFESSIONAL)'
                  11='(11) OTHER' ;
  VALUE t4b_s_5f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) R WAS PRESENT IN ONE OF THE AFFECTED BUILDINGS DURING THE AT'
                  2='(2) R WAS INJURED IN ONE OF THE ATTACKS'
                  3='(3) R NARROWLY ESCAPED INJURY'
                  4='(4) R WAS IN THE NEIGHBORHOOD OF THE AFFECTED BUILDINGS DURING T'
                  5='(5) R WAS IN NYC OR DC AND COULD SEE SMOKE OR FIRE FROM THE ATTA'
                  6='(6) R WAS IN NYC OR DC, BUT COULD NOT SEE SMOKE OR FIRE'
                  7='(7) R TRAVELED TO THE SCENE WITHIN HOURS OF THE ATTACK'
                  8='(8) R TRAVELED TO THE SCENE WITHIN SEVERAL DAYS OF THE ATTACK'
                  9='(9) R SAW ONE OR MORE DEAD BODIES'
                  10='(10) R WAS A RELIEF WORKER (EITHER VOLUNTEER OR PROFESSIONAL)'
                  11='(11) OTHER' ;
  VALUE iwyear    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE cpesproj  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) NCS-R' 2='(2) NLAAS' 3='(3) NSAL' ;
  VALUE da2_01ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE da2_02ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE da2_03ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE da2_04ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE da2_05ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE dm1_06ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE da31b     .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE dm1_02ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE dm1_03ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE dm1_04ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE dm1_05ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' 1='(1) BELIZE'
                  2='(2) CANADA' 3='(3) COSTA RICA' 4='(4) EL SALVADOR' 5='(5) GUATEMALA'
                  6='(6) HONDURAS' 7='(7) MEXICO' 8='(8) NICARAGUA' 9='(9) PANAMA'
                  10='(10) UNITED STATES' 11='(11) ARGENTINA' 12='(12) BOLIVIA' 13='(13) BRAZIL'
                  14='(14) CHILE' 15='(15) COLOMBIA' 16='(16) ECUADOR' 17='(17) FALKLAND ISLAND'
                  18='(18) GUYANA' 19='(19) PARAGUAY' 20='(20) PERU' 21='(21) SURINAME'
                  22='(22) URUGUAY' 23='(23) VENEZUELA' 24='(24) ALGERIA' 25='(25) ANGOLA'
                  26='(26) BENIN' 27='(27) BOTSWANA' 28='(28) BURKINA FASO' 29='(29) CAMEROON'
                  30='(30) CENTRAL AFRICAN REPUBLIC' 31='(31) CHAD' 32='(32) CONGO'
                  33='(33) COMOROS' 34='(34) DJIBOUTI' 35='(35) IVORY COAST' 36='(36) EGYPT'
                  37='(37) EQUATORIAL GUINEA' 38='(38) ERITREA' 39='(39) ETHIOPIA'
                  40='(40) GABON' 41='(41) GHANA' 42='(42) GUINEA' 43='(43) GUINEA BISSAU'
                  44='(44) KENYA' 45='(45) LESOTHO' 46='(46) LIBERIA' 47='(47) LIBYA'
                  48='(48) MADAGASCAR' 49='(49) GAMBIA' 50='(50) MALI' 51='(51) MAURITANIA'
                  52='(52) MOROCCO' 53='(53) MOZAMBIQUE' 54='(54) NAMIBIA' 55='(55) NIGER'
                  56='(56) NIGERIA' 57='(57) DEMOCRATIC REP. OF THE CONGO' 58='(58) REUNION'
                  59='(59) RWANDA' 60='(60) SENEGAL' 61='(61) SIERRA LEONE' 62='(62) SOMALIA'
                  63='(63) SOUTH AFRICA' 64='(64) SUDAN' 65='(65) SWAZILAND' 66='(66) TANZANIA'
                  67='(67) TOGO' 68='(68) TUNISIA' 69='(69) UGANDA' 70='(70) WESTERN SAHARA'
                  71='(71) ZAMBIA' 72='(72) ZIMBABWE' 73='(73) MALAWI'
                  74='(74) SAO TOME AND PRINCIPE' 75='(75) WALLIS AND FATUNA'
                  76='(76) ALBANIA' 77='(77) AUSTRIA' 78='(78) BELGIUM'
                  79='(79) BOSNIA AND HERZEGOVINA' 80='(80) BULGARIA' 81='(81) CROATIA'
                  82='(82) CYPRUS' 83='(83) CZECH REPUBLIC' 84='(84) DENMARK' 85='(85) ESTONIA'
                  86='(86) ENGLAND' 87='(87) FINLAND' 88='(88) FRANCE' 89='(89) GERMANY'
                  90='(90) GIBRALTAR' 91='(91) GREECE' 92='(92) GREENLAND' 93='(93) HUNGARY'
                  94='(94) ICELAND' 95='(95) IRELAND' 96='(96) ITALY' 97='(97) LATVIA'
                  98='(98) LITHUANIA' 99='(99) LUXEMBOURG' 100='(100) MONACO' 101='(101) MACEDONIA'
                  102='(102) NETHERLANDS' 103='(103) NEW CALEDONIA' 104='(104) NORWAY'
                  105='(105) POLAND' 106='(106) PORTUGAL' 107='(107) ROMANIA' 108='(108) SERBIA'
                  109='(109) SCOTLAND' 110='(110) SLOVAKIA' 111='(111) SLOVENIA' 112='(112) SPAIN'
                  113='(113) SWEDEN' 114='(114) SWITZERLAND' 115='(115) TURKEY'
                  116='(116) MONTENEGRO' 117='(117) MALTA' 118='(118) ISLE OF MAN'
                  119='(119) ANDORRA' 120='(120) FAROE ISLAND' 121='(121) LIECHTENSTEIN'
                  122='(122) AFGHANISTAN' 123='(123) BANGLADESH' 124='(124) BHUTAN'
                  125='(125) BRUNEI' 126='(126) BURMA/MYANMAI' 127='(127) CAMBODIA' 128='(128) CHINA'
                  129='(129) FEDERATED STATES OF MICRONESIA' 130='(130) GUAM'
                  131='(131) HONG KONG' 132='(132) INDIA' 133='(133) INDONESIA' 134='(134) JAPAN'
                  135='(135) LAOS' 136='(136) MALAYSIA' 137='(137) MONGOLIA' 138='(138) NEPAL'
                  139='(139) NORTH KOREA' 140='(140) PAKISTAN' 141='(141) PHILIPPINES'
                  142='(142) SINGAPORE' 143='(143) SOUTH KOREA' 144='(144) SRI LANKA'
                  145='(145) TAIWAN' 146='(146) THAILAND' 147='(147) VIETNAM' 148='(148) ARMENIA'
                  149='(149) AZERBAIJAN' 150='(150) BELARUS' 151='(151) GEORGIA'
                  152='(152) KAZAKHSTAN' 153='(153) KYRGYZSTAN' 154='(154) MOLDOVA'
                  155='(155) RUSSIA' 156='(156) TAJIKISTAN' 157='(157) TURKMENISTAN'
                  158='(158) UKRAINE' 159='(159) UZBEKISTAN' 160='(160) GAZA STRIP' 161='(161) IRAN'
                  162='(162) IRAQ' 163='(163) ISRAEL' 164='(164) JORDAN' 165='(165) KUWAIT'
                  166='(166) LEBANON' 167='(167) OMAN' 168='(168) QATAR' 169='(169) SAUDI ARABIA'
                  170='(170) SYRIA' 171='(171) UNITED ARAB EMIRATES' 172='(172) WEST BANK'
                  173='(173) YEMEN' 174='(174) BAHRAIN' 175='(175) ANGUILLA'
                  176='(176) ANTIGUA AND BARBUDA' 177='(177) ARUBA' 178='(178) BARBADOS'
                  179='(179) CAYMAN ISLANDS' 180='(180) CUBA' 181='(181) DOMINICA'
                  182='(182) DOMINICAN REPUBLIC' 183='(183) GRENADA' 184='(184) HAITI'
                  185='(185) JAMAICA' 186='(186) MARIE GALANTE' 187='(187) MARTINQUE'
                  188='(188) MONSERRAT' 189='(189) NETHERLAND ANTILLES' 190='(190) PUERTO RICO'
                  191='(191) ST. BARTHELEMY' 192='(192) ST. KITTS AND NEVIS'
                  193='(193) ST. LUCIA' 194='(194) ST. MARTIN'
                  195='(195) ST. VICENT AND THE GRENADINES' 196='(196) THE BAHAMAS'
                  197='(197) TRINIDAD' 198='(198) VIRGIN ISLANDS (BRITISH)'
                  199='(199) VIRGIN ISLANDS (U.S.)' 200='(200) AMERICAN SAMOA ISLANDS'
                  201='(201) AUSTRALIA' 202='(202) CAPE VERDE' 203='(203) COOK ISLAND'
                  204='(204) FIJI' 205='(205) FRENCH POLYNESIA' 206='(206) JERSEY'
                  207='(207) KIRIBATI' 208='(208) MALDIVES' 209='(209) MARSHALL ISLANDS'
                  210='(210) MAYOTTE' 211='(211) MICRONESIA' 212='(212) NEW ZEALAND'
                  213='(213) PALAU' 214='(214) PAPUA NEW GUINEA' 215='(215) SAMOA ISLANDS'
                  216='(216) SAN MARINO' 217='(217) SEYCHELLES' 218='(218) SOLOMON ISLANDS'
                  219='(219) TONGA' 220='(220) TUVALU' 221='(221) VANUATU' 222='(222) USA' 996='(996) NONE' ;
  VALUE fn2intrf  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE fn2int0f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE fn5fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE fn7fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE fn9fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE fn10ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE fn11ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE fn13ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE dm14_3ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE dm14_4ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE dm14_5ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE dm14_7ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE dm13ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE dm14_1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) LESS THAN $0 (LOSS)'
                  2='(2) $0 (NONE)' 3='(3) $1 - $999' 4='(4) $1,000 - $1,999'
                  5='(5) $2,000 - $2,999' 6='(6) $3,000 - $3,999' 7='(7) $4,000 - $4,999'
                  8='(8) $5,000 - $5,999' 9='(9) $6,000 - $6,999'
                  10='(10) $7,000 - $7,999' 11='(11) $8,000 - $8,999'
                  12='(12) $9,000 - $9,999' 13='(13) $10,000 - $10,999'
                  14='(14) $11,000 - $11,999' 15='(15) $12,000 - $12,999'
                  16='(16) $13,000 - $13,999' 17='(17) $14,000 - $14,999'
                  18='(18) $15,000 - $15,999' 19='(19) $16,000 - $16,999'
                  20='(20) $17,000 - $17,999' 21='(21) $18,000 - $18,999'
                  22='(22) $19,000 - $19,999' 23='(23) $20,000 - $24,999'
                  24='(24) $25,000 - $29,999' 25='(25) $30,000 - $34,999'
                  26='(26) $35,000 - $39,999' 27='(27) $40,000 - $44,999'
                  28='(28) $45,000 - $49,999' 29='(29) $50,000 - $74,999'
                  30='(30) $75,000 - $99,999' 31='(31) $100,000 - $149,999'
                  32='(32) $150,000 - $199,999' 33='(33) $200,000 - $299,999'
                  34='(34) $300,000 - $499,999' 35='(35) $500,000 - $999,999'
                  36='(36) $1,000,000 OR MORE' ;
  VALUE em14a1ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE pt59ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  2='(2) AUTOMOBILE ACCIDENT' 3='(3) BEATEN BY SOMEBODY ELSE'
                  4='(4) BEATEN UP AS A CHILD BY CAREGIVER'
                  5='(5) BEATEN UP BY A SPOUSE OR ROMANTIC PARTNER'
                  6='(6) CHILD''S SERIOUS ILLNESS'
                  7='(7) CIVILIAN IN REGION OF TERROR' 8='(8) CIVILIAN IN WAR ZONE'
                  9='(9) COMBAT EXPERIENCE' 10='(10) KIDNAPPED'
                  11='(11) LIFE-THREATENING ACCIDENT'
                  12='(12) LIFE-THREATENING ILLNESS' 13='(13) MAN-MADE DISASTER'
                  14='(14) MUGGED OR THREATENED WITH A WEAPON'
                  15='(15) NATURAL DISASTER' 16='(16) PRIVATE EVENT'
                  17='(17) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  18='(18) RAPED' 19='(19) REFUGEE' 20='(20) RELIEF WORKER IN WAR ZONE'
                  21='(21) SAW ATROCITIES' 22='(22) SEXUALLY ASSAULTED'
                  23='(23) SOME OTHER EVENT' 24='(24) STALKED'
                  25='(25) TOXIC CHEMICAL EXPOSURE'
                  26='(26) TRAUMATIC EVENT TO LOVE ONE'
                  27='(27) UNEXPECTED DEATH OF A LOVED ONE'
                  28='(28) WITNESSED DEATH OR DEAD BODY OR SAW SOMEONE SERIOUSLY HURT'
                  29='(29) WITNESSED PHYSICAL FIGHT AT HOME' ;
  VALUE pt59a     1='(1) FIRST TIME' 2='(2) MOST RECENT TIME' 3='(3) ONGOING TIME'
                  4='(4) ONLY TIME' 5='(5) SECOND TIME' 6='(6) THIRD TIME' ;
  VALUE pt129a    .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 2='(2) CANADA' 3='(3) COSTA RICA'
                  4='(4) CUBA' 6='(6) EL SALVADOR' 8='(8) GUATEMALA' 9='(9) HAITI'
                  10='(10) HONDURAS' 11='(11) JAMAICA' 13='(13) MEXICO' 16='(16) PUERTO RICO'
                  18='(18) ST VINCENT' 20='(20) UNITED STATES'
                  21='(21) CENTRAL AMERICA/CARIBBEAN - NO SPECIFIC' 24='(24) BOLIVA'
                  27='(27) COLOMBIA' 30='(30) SURINAME' 32='(32) SOUTH AFRICA' 35='(35) ENGLAND'
                  36='(36) FRANCE' 38='(38) GREECE' 42='(42) NETHERLANDS' 44='(44) POLAND'
                  46='(46) RUSSIA OR FORMER SOVIET UNION' 48='(48) SPAIN'
                  50='(50) FORMER YUGOSLAVIA (CROATIA - SLOVENIA - ETC)'
                  52='(52) WESTERN EUROPE - NO SPECIFIC COUNTRY' 54='(54) CHINA'
                  55='(55) INDIA' 56='(56) JAPAN' 57='(57) KOREA' 58='(58) PHILIPPINES'
                  60='(60) TAIWAN' 61='(61) THAILAND' 62='(62) ASIA - NO SPECIFIC COUNTRY'
                  63='(63) ASIA - OTHER (SPECIFY)' 64='(64) ALGERIA'
                  73='(73) AFRICA - OTHER (SPECIFY)' 74='(74) IRAN' 75='(75) IRAQ'
                  77='(77) LEBANON' 78='(78) PAKISTAN' 79='(79) SAUDI ARABIA'
                  85='(85) OTHER COUNTRY (SPECIFY)' 89='(89) USA' ;
  VALUE sc10_58f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW'
                  1='(1) PARALYSIS OF LEGS, R IS IN WHEELCHAIR'
                  2='(2) PARALYSIS OF LEGS, R USES A WALKER'
                  3='(3) PARALYSIS OF LEGS, R CAN WALK WITHOUT A WALKER'
                  4='(4) PARALYSIS OF ONE ARM' 5='(5) PARALYSIS OF ONE SIDE OF BODY'
                  6='(6) ONE MISSING FOOT' 7='(7) TWO MISSING FEET'
                  8='(8) ONE MISSING LEG' 9='(9) TWO MISSING LEGS'
                  10='(10) ONE MISSING HAND' 11='(11) TWO MISSING HANDS'
                  12='(12) ONE MISSING ARM' 13='(13) TWO MISSING ARMS'
                  14='(14) FACIAL DISFIGUREMENT' 15='(15) EXTREMELY SMALL HEIGHT'
                  16='(16) EXTREMELY LARGE HEIGHT' 17='(17) EXTREME OBESITY'
                  18='(18) OTHER BODY DISFIGUREMENT' 19='(19) STUTTERING'
                  20='(20) OTHER (SPECIFY)' ;
  VALUE pt6fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt7fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt8fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt9fffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt64ffff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a0f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a1f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a2f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a3f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a4f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a5f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a6f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a7f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a8f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt121a9f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt122fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE pt1311ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MILITARY'
                  2='(2) NON-MILITARY RESISTANCE FIGHTER' 3='(3) FREEDOM FIGHTER'
                  4='(4) LIBERATION ARMY' 5='(5) PARAMILITARY' 6='(6) OTHER' ;
  VALUE pt16101f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) FLOOD' 2='(2) HURRICANE'
                  3='(3) TORNADO' 4='(4) EARTHQUAKE' 5='(5) TIDAL WAVE' 6='(6) MONSOON'
                  7='(7) FIRE' 8='(8) MISTRAL OR OTHER WIND' 9='(9) LIGHTNING'
                  10='(10) OTHER (SPECIFY)' ;
  VALUE pt1701ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) SPOUSE OR ROMANTIC PARTNER'
                  2='(2) PARENT/GUARDIAN' 3='(3) STEP-RELATIVE' 4='(4) OTHER RELATIVE'
                  5='(5) SOMEONE ELSE R KNEW' 6='(6) STRANGER' ;
  VALUE pt268fff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) COMBAT EXPERIENCE'
                  2='(2) RELIEF WORKER IN WAR ZONE' 3='(3) CIVILIAN IN WAR ZONE'
                  4='(4) CIVILIAN IN REGION OF TERROR' 5='(5) REFUGEE' 6='(6) KIDNAPPED'
                  7='(7) TOXIC CHEMICAL EXPOSURE' 8='(8) AUTOMOBILE ACCIDENT'
                  9='(9) OTHER LIFE-THREATENING ACCIDENT' 10='(10) NATURAL DISASTER'
                  11='(11) MAN-MADE DISASTER' 12='(12) LIFE-THREATENING ILLNESS'
                  13='(13) BEATEN UP BY CAREGIVER'
                  14='(14) BEATEN UP BY SPOUSE OR ROMANTIC PARTNER'
                  15='(15) BEATEN UP BY SOMEONE ELSE'
                  16='(16) MUGGED OR THREATENED WITH A WEAPON' 17='(17) RAPED'
                  18='(18) SEXUALLY ASSAULTED' 19='(19) STALKED'
                  20='(20) UNEXPECTED DEATH OF LOVED ONE'
                  21='(21) CHILD WITH SERIOUS ILLNESS'
                  22='(22) TRAUMATIC EVENT TO LOVED ONE'
                  23='(23) WITNESSED DEATH OR DEAD BODY, OR SAW SOMEONE SERIOUSLY HURT'
                  24='(24) ACCIDENTALLY CAUSED SERIOUS INJURY OR DEATH'
                  25='(25) PURPOSELY INJURED, TORTURED OR KILLED SOMEONE'
                  26='(26) SAW ATROCITIES' 27='(27) SOME OTHER EVENT'
                  28='(28) PRIVATE EVENT' 29='(29) WITNESSED PHYSICAL FIGHT AT HOME'
                  30='(30) NO LINKED EVENTS/NO PLAUSIBLE COMBINATIONS' ;
  VALUE sd14_22f  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) A. GUN'
                  2='(2) B. RAZOR, KNIFE OR OTHER SHARP INSTUMENT'
                  3='(3) C. OVERDOSE OF PRESCRIPTION MEDICATIONS'
                  4='(4) D. OVERDOSE OF OVER-THE-COUNTER MEDICATIONS'
                  5='(5) E. OVERDOSE OF OTHER DRUG (E.G. HEROIN, CRACK, ALCOHOL)'
                  6='(6) F. POISONING (E.G. CARBON MONOXIDE, RAT POISON)'
                  7='(7) G. HANGING, STRANGULATION, SUFFOCATION' 8='(8) H. DROWNING'
                  9='(9) I. JUMPING FROM HIGH PLACES' 10='(10) J. MOTOR VEHICLE CRASH'
                  11='(11) K. OTHER (PLEASE DESCRIBE)' ;
  VALUE fb6a11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a13ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a14ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a15ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a16ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6b11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6b12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6b13ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6b14ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c13ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c14ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c15ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c16ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6d11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6d12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6e11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6e12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6f11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6f12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6f13ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6f14ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6g11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6g12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6g13ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6g14ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h13ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h14ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h15ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i13ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i14ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i15ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6j11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6k11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6k12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6k13ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6l11ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE fb6l12ff  .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) MOTHER' 2='(2) FATHER'
                  3='(3) BROTHER' 4='(4) SISTER' 5='(5) SON' 6='(6) DAUGHTER'
                  7='(7) SPOUSE/PARTNER' ;
  VALUE hhid      .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' .N='(.N) OTHER' -7='(-7) OTHER' ;
  VALUE iwmonth   .R='(.R) REFUSAL' -9='(-9) REFUSAL' .D='(.D) DONT KNOW' -8='(-8) DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
QUIT ;


* SAS DATA STEP;

DATA da20240p5_format;
SET da20240p5 ;


* SAS MISSING DATA VALUE RECODE STATEMENTS;

array numeric_vars{*} _NUMERIC_ ;
do i = 1 to dim(numeric_vars) ;
   if (numeric_vars[i] EQ -7) then numeric_vars[i] = .N ;
   if (numeric_vars[i] EQ -8) then numeric_vars[i] = .D ;
   if (numeric_vars[i] EQ -9) then numeric_vars[i] = .R ;
end ; 
drop i ;


* SAS FORMAT STATEMENT;

FORMAT 
         VERSION version. SC2 sc2fffff. SC2A sc2a.
         SC2_1 sc2_1fff. SC2_2 sc2_2fff. SC2_3 sc2_3fff.
         SC3 sc3fffff. SC3A sc3a. SC10_4A sc10_4a.
         SC10_4B sc10_4b. SC10_4C sc10_4c. SC10_5A1 sc10_5af.
         SC10_5A2 sc10_50f. SC10_5A3 sc10_51f. SC10_5A4 sc10_52f.
         SC10_5A5 sc10_53f. SC10_5EB_S_2 sc10_5ef. SC10_5EB_S_3 sc10_54f.
         SC10_5EB_S_4 sc10_55f. SC10_5G_S_1 sc10_5gf. SC10_5G_S_2 sc10_56f.
         SC10_5G_S_3 sc10_57f. SC10_6 sc10_6ff. SC10_6A sc10_6a.
         D38A_3_5 d38a_3_f. D38A_3A_5 d38a_3af. D40 d40fffff.
         D57 d57fffff. SO3B so3b. SO6A so6a.
         G26B g26b. G27A_3 g27a_3ff. G27A_3A g27a_3a.
         PT1 pt1fffff. PT2 pt2fffff. PT3 pt3fffff.
         PT4 pt4fffff. PT5 pt5fffff. PT10 pt10ffff.
         PT11 pt11ffff. PT12 pt12ffff. PT13 pt13ffff.
         PT14 pt14ffff. PT15 pt15ffff. PT16 pt16ffff.
         PT17 pt17ffff. PT18 pt18ffff. PT19 pt19ffff.
         PT20 pt20ffff. PT21 pt21ffff. PT22 pt22ffff.
         PT22_1 pt22_1ff. PT23 pt23ffff. PT24 pt24ffff.
         PT25 pt25ffff. PT26 pt26ffff. PT27 pt27ffff.
         PT28 pt28ffff. PT29A pt29a. PT29B1 pt29b1ff.
         PT29B2 pt29b2ff. PT29C pt29c. PT29D1 pt29d1ff.
         PT29D2 pt29d2ff. PT30 pt30ffff. PT30A pt30a.
         PT30B1 pt30b1ff. PT30B2 pt30b2ff. PT30C pt30c.
         PT30D1 pt30d1ff. PT30D2 pt30d2ff. PT31 pt31ffff.
         PT31A pt31a. PT31B1 pt31b1ff. PT31B2 pt31b2ff.
         PT31C pt31c. PT31D1 pt31d1ff. PT31D2 pt31d2ff.
         PT32 pt32ffff. PT32A pt32a. PT32B1 pt32b1ff.
         PT32B2 pt32b2ff. PT32C pt32c. PT32D1 pt32d1ff.
         PT32D2 pt32d2ff. PT33 pt33ffff. PT33A pt33a.
         PT33B1 pt33b1ff. PT33B2 pt33b2ff. PT33C pt33c.
         PT33D1 pt33d1ff. PT33D2 pt33d2ff. PT34 pt34ffff.
         PT34A pt34a. PT34B1 pt34b1ff. PT34B2 pt34b2ff.
         PT34C pt34c. PT34D1 pt34d1ff. PT34D2 pt34d2ff.
         PT35 pt35ffff. PT35A pt35a. PT35B pt35b.
         PT36 pt36ffff. PT36A pt36a. PT36B pt36b.
         PT37 pt37ffff. PT37A pt37a. PT37B pt37b.
         PT38 pt38ffff. PT38A pt38a. PT38B pt38b.
         PT39 pt39ffff. PT39A pt39a. PT39B pt39b.
         PT40 pt40ffff. PT40A pt40a. PT40B pt40b.
         PT41 pt41ffff. PT41A pt41a. PT41B pt41b.
         PT42 pt42ffff. PT42A pt42a. PT42B pt42b.
         PT43 pt43ffff. PT43A pt43a. PT43B pt43b.
         PT44 pt44ffff. PT44A pt44a. PT44B pt44b.
         PT45 pt45ffff. PT45A pt45a. PT45B pt45b.
         PT46 pt46ffff. PT46A pt46a. PT46B pt46b.
         PT47 pt47ffff. PT47A pt47a. PT47B pt47b.
         PT48 pt48ffff. PT48A pt48a. PT48B pt48b.
         PT49 pt49ffff. PT49A pt49a. PT49B pt49b.
         PT50 pt50ffff. PT50A pt50a. PT50B pt50b.
         PT50_1 pt50_1ff. PT50_1A pt50_1a. PT50_1B pt50_1b.
         PT51 pt51ffff. PT51A pt51a. PT51B pt51b.
         PT52 pt52ffff. PT52A pt52a. PT52B pt52b.
         PT53 pt53ffff. PT53A pt53a. PT53B pt53b.
         PT54 pt54ffff. PT54A pt54a. PT54B pt54b.
         PT55 pt55ffff. PT55B pt55b. PT57 pt57ffff.
         PT119A_1 pt119a_f. PT120A_1 pt120a_f. PT125 pt125fff.
         PT125A_S_1 pt125a_f. PT125A6 pt125a6f. PT125A7 pt125a7f.
         PT125A8 pt125a8f. PT125A_S_2 pt125a0f. PT126 pt126fff.
         PT126A_S_1 pt126a_f. PT126A6 pt126a6f. PT127 pt127fff.
         PT127A_S_1 pt127a_f. PT127A7 pt127a7f. PT127A8 pt127a8f.
         PT127A_S_2 pt127a0f. PT127A_S_3 pt127a1f. PT127A_S_4 pt127a2f.
         PT128 pt128fff. PT129A1 pt129a1f. PT131_S_1 pt131_sf.
         PT132 pt132fff. PT133 pt133fff. PT134 pt134fff.
         PT135 pt135fff. PT136 pt136fff. PT137 pt137fff.
         PT138A pt138a. PT138B pt138b. PT146 pt146fff.
         PT147_S_1 pt147_sf. PT148 pt148fff. PT148A_S_1 pt148a_f.
         PT148A7 pt148a7f. PT149 pt149fff. PT149A_S_1 pt149a_f.
         PT149A3 pt149a3f. PT149A4 pt149a4f. PT149A5 pt149a5f.
         PT149A6 pt149a6f. PT149A7 pt149a7f. PT149A8 pt149a8f.
         PT149A_S_2 pt149a0f. PT149A_S_3 pt149a1f. PT156 pt156fff.
         PT156A_S_1 pt156a_f. PT156A6 pt156a6f. PT156A8 pt156a8f.
         PT157 pt157fff. PT157A_S_1 pt157a_f. PT157A6 pt157a6f.
         PT157A_S_2 pt157a0f. PT157A_S_3 pt157a1f. PT158 pt158fff.
         PT158A_S_1 pt158a_f. PT158A6 pt158a6f. PT158A7 pt158a7f.
         PT158A8 pt158a8f. PT159 pt159fff. PT159A pt159a.
         PT161_S_1 pt161_sf. PT170_S_1 pt170_sf. PT170_S_2 pt170_0f.
         PT170_S_3 pt170_1f. PT171 pt171fff. PT171A1 pt171a1f.
         PT171A2 pt171a2f. PT172 pt172fff. PT173 pt173fff.
         PT174 pt174fff. PT174A pt174a. PT174B1 pt174b1f.
         PT174B2 pt174b2f. PT175 pt175fff. PT176 pt176fff.
         PT218C pt218c. PT229C pt229c. PT240C pt240c.
         TB3 tb3fffff. TB5INTR1 tb5intrf. TB5INTR2 tb5int0f.
         TB6 tb6fffff. TB6A tb6a. TB21B tb21b.
         TB23 tb23ffff. TB26 tb26ffff. SU12D su12d.
         SU65D su65d. PS9 ps9fffff. SD11 sd11ffff.
         SD12 sd12ffff. SD13 sd13ffff. SD14_2_S_1 sd14_2_f.
         SD14_2_S_2 sd14_20f. SD14_2_S_3 sd14_21f. SD24 sd24ffff.
         SD25 sd25ffff. SD26 sd26ffff. SD29 sd29ffff.
         PH5_03A ph5_03a. PH5_04A ph5_04a. PH6_03A ph6_03a.
         PH6_04A ph6_04a. PH7_03A ph7_03a. PH7_04A ph7_04a.
         PH8_03A ph8_03a. PH8_04A ph8_04a. PH9_03A ph9_03a.
         PH9_04A ph9_04a. PH10_03A ph10_03a. PH10_04A ph10_04a.
         PH11_03A ph11_03a. PH11_04A ph11_04a. PH12_03A ph12_03a.
         PH12_04A ph12_04a. PH13_03A ph13_03a. PH13_04A ph13_04a.
         PH14_03A ph14_03a. PH14_04A ph14_04a. PH15_03A ph15_03a.
         PH15_04A ph15_04a. PH16_03A ph16_03a. PH16_04A ph16_04a.
         PH17_03A ph17_03a. PH17_04A ph17_04a. PH18_03A ph18_03a.
         PH18_04A ph18_04a. PH19_03A ph19_03a. PH19_04A ph19_04a.
         PH20_03A ph20_03a. PH20_04A ph20_04a. PH21_03A ph21_03a.
         PH21_04A ph21_04a. CC50_6 cc50_6ff. CC50_16 cc50_16f.
         CC50_17 cc50_17f. FB6J fb6j. EM8_S_1 em8_s_1f.
         EM8_S_2 em8_s_2f. EM14A1_5 em14a1_f. EM14A2 em14a2ff.
         MR21_4 mr21_4ff. MR25 mr25ffff. MR51 mr51ffff.
         MR52 mr52ffff. CN11 cn11ffff. CN11_3 cn11_3ff.
         DA1_S_1 da1_s_1f. DA1_S_2 da1_s_2f. DA1_S_3 da1_s_3f.
         DA2_01D da2_01d. DA2_02D da2_02d. DA2_03D da2_03d.
         DA2_04D da2_04d. DA4_S_1 da4_s_1f. DA4_S_2 da4_s_2f.
         DA4_S_3 da4_s_3f. DA4B_S_1 da4b_s_f. DA4B_S_2 da4b_s0f.
         DA4B_S_3 da4b_s1f. DA36_2 da36_2ff. DA36_2A1 da36_2af.
         DA36_2A2 da36_20f. DE4A de4a. DM1_1 dm1_1fff.
         DM1_5 dm1_5fff. DM1_6A dm1_6a. DM11 dm11ffff.
         DM14 dm14ffff. DM14_2 dm14_2ff. CH2D ch2d.
         CH2E ch2e. CH2F ch2f. CH2G ch2g.
         CH2H ch2h. CH65 ch65ffff. CH95 ch95ffff.
         CD16G cd16g. CD16H cd16h. CD18C cd18c.
         CD38 cd38ffff. CD39 cd39ffff. CD39A cd39a.
         CD39B1 cd39b1ff. CD39B2 cd39b2ff. SA47B sa47b.
         T4 t4ffffff. T4B_S_1 t4b_s_1f. T4B_S_2 t4b_s_2f.
         T4B_S_3 t4b_s_3f. T4B_S_4 t4b_s_4f. T4B_S_5 t4b_s_5f.
         IWYEAR iwyear. CPESPROJ cpesproj. DA2_01 da2_01ff.
         DA2_02 da2_02ff. DA2_03 da2_03ff. DA2_04 da2_04ff.
         DA2_05 da2_05ff. DM1_06 dm1_06ff. DA31B da31b.
         DM1_02 dm1_02ff. DM1_03 dm1_03ff. DM1_04 dm1_04ff.
         DM1_05 dm1_05ff. FN2INTR1 fn2intrf. FN2INTR2 fn2int0f.
         FN5 fn5fffff. FN7 fn7fffff. FN9 fn9fffff.
         FN10 fn10ffff. FN11 fn11ffff. FN13 fn13ffff.
         DM14_3 dm14_3ff. DM14_4 dm14_4ff. DM14_5 dm14_5ff.
         DM14_7 dm14_7ff. DM13 dm13ffff. DM14_1 dm14_1ff.
         EM14A1 em14a1ff. PT59 pt59ffff. PT59A pt59a.
         PT129A pt129a. SC10_5EB_S_1 sc10_58f. PT6 pt6fffff.
         PT7 pt7fffff. PT8 pt8fffff. PT9 pt9fffff.
         PT64 pt64ffff. PT121A01 pt121a0f. PT121A02 pt121a1f.
         PT121A03 pt121a2f. PT121A04 pt121a3f. PT121A05 pt121a4f.
         PT121A06 pt121a5f. PT121A07 pt121a6f. PT121A08 pt121a7f.
         PT121A09 pt121a8f. PT121A10 pt121a9f. PT122 pt122fff.
         PT1311 pt1311ff. PT16101 pt16101f. PT1701 pt1701ff.
         PT268 pt268fff. SD14_201 sd14_22f. FB6A11 fb6a11ff.
         FB6A12 fb6a12ff. FB6A13 fb6a13ff. FB6A14 fb6a14ff.
         FB6A15 fb6a15ff. FB6A16 fb6a16ff. FB6B11 fb6b11ff.
         FB6B12 fb6b12ff. FB6B13 fb6b13ff. FB6B14 fb6b14ff.
         FB6C11 fb6c11ff. FB6C12 fb6c12ff. FB6C13 fb6c13ff.
         FB6C14 fb6c14ff. FB6C15 fb6c15ff. FB6C16 fb6c16ff.
         FB6D11 fb6d11ff. FB6D12 fb6d12ff. FB6E11 fb6e11ff.
         FB6E12 fb6e12ff. FB6F11 fb6f11ff. FB6F12 fb6f12ff.
         FB6F13 fb6f13ff. FB6F14 fb6f14ff. FB6G11 fb6g11ff.
         FB6G12 fb6g12ff. FB6G13 fb6g13ff. FB6G14 fb6g14ff.
         FB6H11 fb6h11ff. FB6H12 fb6h12ff. FB6H13 fb6h13ff.
         FB6H14 fb6h14ff. FB6H15 fb6h15ff. FB6I11 fb6i11ff.
         FB6I12 fb6i12ff. FB6I13 fb6i13ff. FB6I14 fb6i14ff.
         FB6I15 fb6i15ff. FB6J11 fb6j11ff. FB6K11 fb6k11ff.
         FB6K12 fb6k12ff. FB6K13 fb6k13ff. FB6L11 fb6l11ff.
         FB6L12 fb6l12ff. HHID hhid. IWMONTH iwmonth.
;

RUN ;
