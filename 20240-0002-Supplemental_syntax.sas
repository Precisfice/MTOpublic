/*-------------------------------------------------------------------------
 |                                                                         
 |             SAS SUPPLEMENTAL SYNTAX FILE FOR ICPSR 20240
 |         COLLABORATIVE PSYCHIATRIC EPIDEMIOLOGY SURVEYS (CPES),
 |                       2001-2003 [UNITED STATES]
 |         (DATASET 0002: NATIONAL COMORBIDITY SURVEY REPLICATION
 |                          (NCS-R), 2001-2003)
 |
 | This SAS program is provided to document the preparation of the SAS
 | transport version of this data file as distributed by ICPSR. The
 | commands provided below are those that were used in the preparation of
 | the SAS transport version of this dataset.  Users need to use SAS' 
 | PROC CIMPORT to import the SAS transport file into a SAS dataset on
 | their system.
 |
 | PROC FORMAT:  creates user-defined formats for the variables. Formats
 | replace original value codes with value code descriptions.  Only
 | variables with user-defined formats are included in this section.
 |
 | DATA:  begins a SAS data step and names an output SAS dataset. Users
 | should replace "SAS-dataset" with their name for the SAS dataset copied
 | from the SAS transport file. Users can add a SAS libname statement
 | and an output SAS dataset name to make a permanent SAS dataset.
 |
 | MISSING VALUE RECODES:  sets user-defined numeric missing values to
 | missing as interpreted by the SAS system. Only variables with
 | user-defined missing values are included in this section.
 |
 | An example of a standard missing value recode:
 |
 |    IF RELATION = -8 THEN RELATION = .D;
 |    IF RELATION = -9 THEN RELATION = .R;
 |
 | FORMAT:  associates the formats created by the PROC FORMAT step with
 | the variables stored in the SAS dataset. Users can refer to their
 | SAS manual for information on how to permanently store formats in a
 | SAS catalog.
 |
 | NOTE:  Users should modify this file to suit their specific needs.
 |
 |------------------------------------------------------------------------*/

PROC FORMAT;
  VALUE children  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR MORE' ;
  VALUE adol      .R='REFUSED' .D='DONT KNOW' 3='(3) 3 OR MORE' ;
  VALUE adult     .R='REFUSED' .D='DONT KNOW' 5='(5) 5 OR MORE' ;
  VALUE hhsize    .R='REFUSED' .D='DONT KNOW' 7='(7) 7 OR MORE' ;
  VALUE sc7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) CURRENT' 2='(2) EX-SMOKER'
                  3='(3) NEVER' 4='(4) (IF VOL) ONLY SMOKED A FEW TIMES' ;
  VALUE sc8_1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EXCELLENT' 2='(2) VERY GOOD'
                  3='(3) GOOD' 4='(4) FAIR' 5='(5) POOR' ;
  VALUE sc8_2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EXCELLENT' 2='(2) VERY GOOD'
                  3='(3) GOOD' 4='(4) FAIR' 5='(5) POOR' ;
  VALUE sc9a      .R='REFUSED' .D='DONT KNOW' 1='(1) BETTER' 2='(2) WORSE' 3='(3) SAME' ;
  VALUE sc9b      .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE' ;
  VALUE sc9c      .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY ALL THE TIME'
                  2='(2) PRETTY OFTEN' 3='(3) NOT VERY MUCH' 4='(4) NEVER' ;
  VALUE sc9d      .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY ALL THE TIME'
                  2='(2) PRETTY OFTEN' 3='(3) NOT VERY MUCH' 4='(4) NEVER' ;
  VALUE sc9e      .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY ALL THE TIME'
                  2='(2) PRETTY OFTEN' 3='(3) NOT VERY MUCH' 4='(4) NEVER' ;
  VALUE sc9f      .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY ALL THE TIME'
                  2='(2) PRETTY OFTEN' 3='(3) NOT VERY MUCH' 4='(4) NEVER' ;
  VALUE sc9g      .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY ALL THE TIME'
                  2='(2) PRETTY OFTEN' 3='(3) NOT VERY MUCH' 4='(4) NEVER' ;
  VALUE sc9h      .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) A LITTLE' 3='(3) SOME'
                  4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE sc9_01ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) SEVERAL TIMES A WEEK OR MORE' 2='(2) ABOUT ONCE A WEEK'
                  3='(3) SEVERAL TIMES A MONTH' 4='(4) ABOUT ONCE A MONTH'
                  5='(5) LESS THAN ONCE A MONTH' 6='(6) NEVER' ;
  VALUE sc9_02ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) SEVERAL TIMES A WEEK OR MORE' 2='(2) ABOUT ONCE A WEEK'
                  3='(3) SEVERAL TIMES A MONTH' 4='(4) ABOUT ONCE A MONTH'
                  5='(5) LESS THAN ONCE A MONTH' 6='(6) NEVER' ;
  VALUE sc9_03ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) SEVERAL TIMES A WEEK OR MORE' 2='(2) ABOUT ONCE A WEEK'
                  3='(3) SEVERAL TIMES A MONTH' 4='(4) ABOUT ONCE A MONTH'
                  5='(5) LESS THAN ONCE A MONTH' 6='(6) NEVER' ;
  VALUE sc9_04ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) SEVERAL TIMES A WEEK OR MORE' 2='(2) ABOUT ONCE A WEEK'
                  3='(3) SEVERAL TIMES A MONTH' 4='(4) ABOUT ONCE A MONTH'
                  5='(5) LESS THAN ONCE A MONTH' 6='(6) NEVER' ;
  VALUE sc10_1a   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_1b   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_1c   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_1d   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_1e   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_1f   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_1h   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_4d   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_4e   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_4f   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_4g   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_5cf  .R='REFUSED' .D='DONT KNOW'
                  2='(2) ATTENTION DEFICIT DISORDER (ADD)' 3='(3) AUTISM'
                  5='(5) RETT S DISORDER' 6='(6) SLOW AT LEARNING'
                  8='(8) OTHER (SPECIFY)' ;
  VALUE sc10_50f  .R='REFUSED' .D='DONT KNOW'
                  2='(2) ATTENTION DEFICIT DISORDER (ADD)' 3='(3) AUTISM'
                  5='(5) RETT S DISORDER' 6='(6) SLOW AT LEARNING'
                  8='(8) OTHER (SPECIFY)' ;
  VALUE sc10_5ef  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_51f  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_52f  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_53f  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_54f  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_55f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) ATTENTION DEFICIT DISORDER (ADD)' 2='(2) MENTAL RETARDATION'
                  3='(3) AUTISM' 4='(4) STUTTERING' 5='(5) OTHER (SPECIFY)' ;
  VALUE sc10_56f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_57f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_58f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_59f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_10f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_11f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_5if  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_13f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_14f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_15f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_16f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_17f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_18f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_19f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_20f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_21f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_22f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_7af  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_70f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_71f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_8bf  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sc10_80f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_8cf  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sc10_8df  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sc10_81f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc10_8ff  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_82f  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_83f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) ATTENTION DEFICIT DISORDER (ADD)' 2='(2) MENTAL RETARDATION'
                  3='(3) AUTISM' 4='(4) STUTTERING' 5='(5) OTHER (SPECIFY)' ;
  VALUE sc10_84f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_85f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_86f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_87f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_88f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_89f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_23f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_8gf  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_24f  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_25f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_26f  .R='REFUSED' .D='DONT KNOW' 1='(1) ALCOHOLISM' 2='(2) ANOREXIA'
                  3='(3) ANXIETY' 4='(4) ATTENTION DEFICIT DISORDER (ADD)' 5='(5) AUTISM'
                  6='(6) BIPOLAR DISORDER' 7='(7) BULIMIA' 8='(8) DEPRESSION'
                  9='(9) DRUG ADDICTION' 10='(10) EATING DISORDER'
                  11='(11) MANIC-DEPRESSION' 12='(12) MEMORY DISORDER' 13='(13) NARCOLEPSY'
                  14='(14) OBSESSIVE-COMPULSIVE DISORDER' 15='(15) PANIC'
                  16='(16) PMS (PREMENSTRUAL DISORDER)' 17='(17) PSYCHOSIS'
                  18='(18) PTSD (POST-TRAUMATIC STRESS DISORDER)'
                  19='(19) SCHIZOPHRENIA' 20='(20) SLEEP DISORDER' 21='(21) OTHER (SPECIFY)' ;
  VALUE sc10_8hf  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL HANDICAP'
                  2='(2) LEARNING' 3='(3) PHYSICAL ILLNESS' 4='(4) MENTAL ILLNESS'
                  5='(5) (IF VOL) NOT DUE TO A CONDITION' 6='(6) OTHER (SPECIFY)' ;
  VALUE sc10_12b  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sc10_12c  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc20a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc20_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc20_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc20_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc21ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc22ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc23ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc24ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc25ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc25a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc26ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc26a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc26b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc26_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc26_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc26_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc26_4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc27a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc27b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc27c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc27d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc27e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc27f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc27_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc27_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc27_4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc29ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc29a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc29_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc29_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc29_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc30ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc30_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc30_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc30_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc31ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc32ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc33ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc33_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc33_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc33_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc34ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sc35ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d1ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d1a       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d1b       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d2ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d9ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d9a1ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE d9a2ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d12fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d14fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d15fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN 1 HOUR'
                  2='(2) BETWEEN 1 AND 3 HOURS' 3='(3) BETWEEN 3 AND 5 HOURS'
                  4='(4) MORE THAN 5 HOURS' ;
  VALUE d16fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN 1 HOUR'
                  2='(2) BETWEEN 1 AND 3 HOURS' 3='(3) BETWEEN 3 AND 5 HOURS'
                  4='(4) MORE THAN 5 HOURS' ;
  VALUE d17fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) MILD' 2='(2) MODERATE'
                  3='(3) SEVERE' 4='(4) VERY SEVERE' ;
  VALUE d18fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE d19fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE d21fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d22fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d22b1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE d22d1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE d24a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d24b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d24c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d24d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d24e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d24f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) PREGNANT OR GROWING' ;
  VALUE d26e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26l      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26m      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26n      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26o      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26p      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26q      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26r      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26s      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26t      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26u      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26v      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26w      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26x      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26y      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26z      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26aa     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26bb     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26cc     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26dd     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26ee     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26ff     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26gg     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26hh     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d26ii     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d28fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE d28a      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE d29a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d29b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d37fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d38fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d38a      .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS AGO' ;
  VALUE d38a_6ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDED' 5='(5) STILL GOING ON' ;
  VALUE d38a_7b   .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE d38a_9ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDED' 5='(5) STILL GOING ON' ;
  VALUE d39a      .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE d41fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d42_1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) NONE' ;
  VALUE d46fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d58fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d72fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d86fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d87fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d37b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d37b3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d38a_4a   .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE m1ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m3ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m3b2ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) HOURS' 2='(2) DAYS' 3='(3) WEEKS'
                  4='(4) MONTHS' 5='(5) YEARS' ;
  VALUE m3d2ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) HOURS' 2='(2) DAYS' 3='(3) WEEKS'
                  4='(4) MONTHS' 5='(5) YEARS' ;
  VALUE m4ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m5ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m6ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m6b2ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) HOURS' 2='(2) DAYS' 3='(3) WEEKS'
                  4='(4) MONTHS' 5='(5) YEARS' ;
  VALUE m6d2ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) HOURS' 2='(2) DAYS' 3='(3) WEEKS'
                  4='(4) MONTHS' 5='(5) YEARS' ;
  VALUE m7a       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7b       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7c       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7d       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7e       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7f       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7g       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7h       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7i       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7j       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7k       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7l       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7m       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7n       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m7o       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m9ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE m9a       .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE m9b       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m10a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m10b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m18fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m18b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m18b3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m18c      .R='REFUSED' .D='DONT KNOW' 1='(1) BROUGHT ON BY STRESS'
                  2='(2) OUT OF THE BLUE' 5='(5) DONT REMEMBER' ;
  VALUE m18d2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) HOURS' 2='(2) DAYS' 3='(3) WEEKS'
                  4='(4) MONTHS' 5='(5) YEARS' ;
  VALUE m19fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m19a      .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS AGO' ;
  VALUE m22b      .R='REFUSED' .D='DONT KNOW' 1='(1) HOURS' 2='(2) DAYS' 3='(3) WEEKS'
                  4='(4) MONTHS' 5='(5) YEARS' ;
  VALUE m30a      .R='REFUSED' .D='DONT KNOW'
                  1='(1) MOOD NO MORE HIGH USUAL: HAPPY/SELF-CONFIDENT/OPTIMISTIC'
                  2='(2) MOOD WAS A LITTLE MORE HIGHT THAN USUAL'
                  3='(3) MOOD MORE HIGH USUAL, NEVER OVER THE EDGE/INAPPROPRIATE'
                  4='(4) MOOD EDGE: UNREALISTIC SELF-CONFIDENT/OPT/HAPPY'
                  5='(5) UNCONTROL HIGH: LAUGH OUT LOUD NO CAUSE/SING LOUD IN PUBLIC' ;
  VALUE m30b      .R='REFUSED' .D='DONT KNOW'
                  1='(1) NO INC PHYS AROUSAL: ENERGY/RESTLESSNESS/DIFF SIT STILL'
                  2='(2) SOME INC IN AROUSAL, NOT ENOUGH FOR MOST PEOPLE TO NOTICE'
                  3='(3) BIG ENOUGH INC IN AROUSAL FOR MOST PEOPLE TO NOTICE'
                  4='(4) HIGHLY AROUSED AGITATED/RESTLESS/HYPER, NOT OUT OF CONTROL'
                  5='(5) UNCONTROLLABLY AGITATED OR RESLESS OR HYPER' ;
  VALUE m30c      .R='REFUSED' .D='DONT KNOW'
                  1='(1) NO INCREASE IN SEXUAL INTEREST'
                  2='(2) MILD INCREASE IN SEXUAL INTEREST'
                  3='(3) STRONG INC SEXUAL THOUGHTS W/OUT TALK ABOUT IT/DO ANYTHING'
                  4='(4) TALKED MORE ABOUT SEX USUAL W/OUT DO ANYTHING ABOUT IT'
                  5='(5) INAPP PROP/TOUCH PEOP SEX/ENGAGE OTHER SEX BEHAV NOT NORM DO' ;
  VALUE m30d      .R='REFUSED' .D='DONT KNOW'
                  1='(1) EXPERIENCED NO DECREASE IN SLEEP'
                  2='(2) SLEPT LESS THAN NORMAL BY UP TO ONE HOUR'
                  3='(3) SLEPT LESS THAN NORMAL BY MORE THAN ONE HOUR'
                  4='(4) SLEPT LESS THAN USUAL AND NOT FEEL THE NEED FOR MORE SLEEP'
                  5='(5) NOT FEEL THE NEED FOR ANY SLEEP AT ALL' ;
  VALUE m30e      .R='REFUSED' .D='DONT KNOW'
                  1='(1) EXP NO INC IRRITABILITY: FEEL GRUMPY/ACTING ANNOYED/ANGRY'
                  2='(2) EXP SOME INC IRRITABILITY, NOT ENOUGH MOST PEOPLE TO NOTICE'
                  3='(3) EXP BIG ENOUGH INC IRRITABILITY FOR MOST PEOPLE TO NOTICE'
                  4='(4) VERY IRRITABLE MOST OF THE TIME'
                  5='(5) SO HOSTILE/UNCOOPERATIVE IMPOSSIBLE FOR PEOPLE BE AROUND YOU' ;
  VALUE m30f      .R='REFUSED' .D='DONT KNOW'
                  1='(1) EXPERIENCED NO INCREASE IN TALKATIVENESS'
                  2='(2) WANTED TO BE MORE TALKATIVE BUT NOT TALK MORE THAN USUAL'
                  3='(3) AT TIMES TALKED MORE USUAL/MORE THAN THE SITUATION REQ'
                  4='(4) OFTEN TALKED MORE SIT REQ/TALKED SO MUCH HARD TO INTERRUPT'
                  5='(5) TALKED NONSTOP/SO MUCH NOT INTERRUPT EVEN WHEN TRIED' ;
  VALUE m30g      .R='REFUSED' .D='DONT KNOW'
                  1='(1) THOUGHTS NOT COME MORE QUICK/SEEM MORE CONFUSED THAN USUAL'
                  2='(2) THOUGHTS SOMEWHAT MORE QUICK/MORE CONFUSED THAN USUAL'
                  3='(3) THOUGHTS RACED/EASILY LOST TRAIN THOUGHT/JUMP TOPIC'
                  4='(4) THOUGHTS JUMP SO MUCH DIFF FOLLOW'
                  5='(5) THOUGHTS SO FAST/CONFUSE IMPOSSIBLE TO FOLLOW' ;
  VALUE m30h      .R='REFUSED' .D='DONT KNOW'
                  1='(1) NOT THINK/TALK ANYTHING DIFFERENT THAN USUAL'
                  2='(2) THOUGHT A LOT NEW INTERESTS/PLANS NOT PRACTICAL OR REALISTIC'
                  3='(3) THOUGHT STRANGE/UNREALISTIC: HYPER-RELIG IDEAS/UNREAL PLANS'
                  4='(4) GRAND IDEAS ABLE DO THINGS CANT/PARANOID/CENTER OF THINGS'
                  5='(5) MIND SO CONFUSED HAVE DELUSIONS/HEARING VOICES/SEEING THINGS' ;
  VALUE m30i      .R='REFUSED' .D='DONT KNOW'
                  1='(1) NO MORE DISRUPTIVE/AGGRESSIVE IN BEHAVIOR THAN USUAL'
                  2='(2) OFTEN LOUD/SARCASTIC W/PEOPLE BUT NO THREAT/PHYSICAL'
                  3='(3) SOMETIMES THREAT PEOPLE/HOSTILE DEMANDS/NEVER PHYSICAL'
                  4='(4) FREQ THREAT/SHOUT PEOPLE BUT NO PHYSICAL'
                  5='(5) PHYSICALLY ASSAULTED SOMEONE OR DESTROYED PROPERTY' ;
  VALUE m30j      .R='REFUSED' .D='DONT KNOW' 1='(1) DRESSED THE SAME AS ALWAYS'
                  2='(2) BIG REDUCTION NEAT DRESS/GROOM BUT PEOPLE NOT WORRIED'
                  3='(3) BIG CHANGE DRESS/GROOM DUE TO LOOK MESS OR OVERDRESS'
                  4='(4) EXTRM CHG DRSS/GROOM, PARTLY CLOTHED/WILD MAKE-UP/TOTAL MESS'
                  5='(5) COMPLETELY UN-GROOM/DISORGANIZED CLOTHING/BIZARRE CLOTHES' ;
  VALUE m30k      .R='REFUSED' .D='DONT KNOW' 1='(1) RECOG SICK/NEED HELP'
                  2='(2) REALIZED MIGHT HAVE A PROBLEM'
                  3='(3) RECOGNIZED BEHAVIOR CHANGED A LOT, NOT A PROBLEM'
                  4='(4) REALIZED SOME CHANGE BEHAVIOR, DIDNT APPRECIATE HOW GREAT'
                  5='(5) HAD X WHEN TOTALLY UNAWARE BEHAVIOR DIFFERENT FROM NORMAL' ;
  VALUE m33fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m45fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m47fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE m48fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir2fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir7b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE ir7c      .R='REFUSED' .D='DONT KNOW' 1='(1) CONTINUE' ;
  VALUE ir8a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8l      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir8m      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE ir10a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ir11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN 1 HOUR'
                  2='(2) BETWEEN 1 AND 3 HOURS' 3='(3) BETWEEN 3 AND 5 HOURS'
                  4='(4) MORE THAN 5 HOURS' ;
  VALUE ir11_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) MILD' 2='(2) MODERATE'
                  3='(3) SEVERE' 4='(4) VERY SEVERE' ;
  VALUE ir11_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ir12a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir12b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir20b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir20b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir20c     .R='REFUSED' .D='DONT KNOW' 1='(1) BROUGHT ON BY STRESS'
                  2='(2) OUT OF THE BLUE' 3='(3) DONT REMEMBER' 5='(5) DONT REMEMBER' ;
  VALUE ir20d2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE ir21ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir21a     .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS AGO' ;
  VALUE ir21a_3a  .R='REFUSED' .D='DONT KNOW' 1='(1) JANUARY' 2='(2) FEBRUARY'
                  3='(3) MARCH' 4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUGUST'
                  9='(9) SEPTEMBER' 10='(10) OCTOBER' 11='(11) NOVEMBER' 12='(12) DECEMBER' ;
  VALUE ir21a_4b  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE ir21a_6f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDED' 2='(2) STILL GOING ON' ;
  VALUE ir21a_7b  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE ir21a_9f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDED' 2='(2) STILL GOING ON' ;
  VALUE ir38b     .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE ir48a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE ir48b     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE ir48c     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE ir49ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) AS MUCH AS ALWAYS'
                  2='(2) NOT QUITE AS MUCH' 3='(3) A LITTLE' 4='(4) NOT AT ALL' ;
  VALUE ir49a     .R='REFUSED' .D='DONT KNOW' 1='(1) AS MUCH AS ALWAYS'
                  2='(2) NOT QUITE AS MUCH' 3='(3) A LITTLE' 4='(4) NOT AT ALL' ;
  VALUE ir49b     .R='REFUSED' .D='DONT KNOW' 1='(1) AS MUCH AS ALWAYS'
                  2='(2) NOT QUITE AS MUCH' 3='(3) A LITTLE' 4='(4) NOT AT ALL' ;
  VALUE ir49c     .R='REFUSED' .D='DONT KNOW' 1='(1) AS MUCH AS ALWAYS'
                  2='(2) NOT QUITE AS MUCH' 3='(3) A LITTLE' 4='(4) NOT AT ALL' ;
  VALUE ir56ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir68ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir70ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir71ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1l      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1m      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1n      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1o      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd1p      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 3='(3) (IF VOL) SOMETIMES'
                  5='(5) NO' ;
  VALUE pd6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO TO SIX MONTHS' 3='(3) SEVEN TO TWELVE MONTHS'
                  4='(4) MORE THAN TWELVE MONTHS' ;
  VALUE pd7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd7b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd7b3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OUT OF THE BLUE'
                  2='(2) STRONG FEAR' 3='(3) REAL DANGER' ;
  VALUE pd9fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd9b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd9b3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd10a     .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) BETWEEN TWO AND SIX MONTHS AGO'
                  3='(3) MORE THAN SIX MONTHS AGO' ;
  VALUE pd13a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd13b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd13c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd13d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd16a     .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) BETWEEN TWO AND SIX MONTHS' 3='(3) MORE THAN SIX MONTHS' ;
  VALUE pd16c     .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY ALL THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) OFTEN' 4='(4) SOMETIMES'
                  5='(5) ONLY RARELY' ;
  VALUE pd16d     .R='REFUSED' .D='DONT KNOW' 1='(1) MILD' 2='(2) MODERATE'
                  3='(3) SEVERE' 4='(4) SO SEVERE' ;
  VALUE pd17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd21b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd21b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd22ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE pd24ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd25a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd25b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd38ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) BETWEEN TWO AND SIX MONTHS' 3='(3) MORE THAN SIX MONTHS' ;
  VALUE pd40ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) SO SEVERE' ;
  VALUE pd41ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd41a     .R='REFUSED' .D='DONT KNOW' 1='(1) MILD' 2='(2) MODERATE'
                  3='(3) SEVERE' 4='(4) SO SEVERE' ;
  VALUE pd42ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE pd43ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE pd50ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd62ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd64ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pd65ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp1_11ff  .R='REFUSED' .D='DONT KNOW' 1='(1) GROUP 1: ANIMALS'
                  2='(2) GROUP 2: STILL WATER OR WEATHER EVENTS'
                  3='(3) GROUP 3: BLOOD, INJURIES, OR MEDICAL EXPERIENCES'
                  4='(4) GROUP 4: CLOSED SPACES' 5='(5) GROUP 5: HIGH PLACES'
                  6='(6) GROUP 6: FLYING' ;
  VALUE sp3a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp3a2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp3a3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp3b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp3c2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp3c3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp5a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp5a2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp5a3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp5b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp5c2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp5c3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp7a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp7a2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp7a3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp7b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp7c2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp7c3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp7f      .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE sp9a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp9a2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp9a3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp9b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp9c2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp9c3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp9f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp9g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp9h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp9i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11a3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11c2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11c3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp11i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13a3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13c2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13c3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp13j     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE sp17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) READ LIST ONLY IF R PREFERS TO HAVE QUESTIONS READ' ;
  VALUE sp18a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18j     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18k     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18l     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18m     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18n     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp18o     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) WITHIN PAST MONTH'
                  2='(2) 2 AND 6 MONTHS AGO' 3='(3) 7 AND 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE sp21ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) MILD'
                  3='(3) MODERATE' 4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE sp22ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE sp27ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp38ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp40ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sp41ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1l      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1m      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so1n      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE so3intrf  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so3int0f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aso3b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aso3b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aso6b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aso6b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so8a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so8b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so8c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) R PREFERS TO HAVE LIST READ' ;
  VALUE so9a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9l      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9m      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9n      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so9o      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so10a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so12ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so12a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so14a     .R='REFUSED' .D='DONT KNOW' 1='(1) REAL DANGER (SPECIFY)'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE so15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so15a1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) MENTAL HEALTH PROBLEM'
                  2='(2) ALCOHOL OR DRUG PROBLEM'
                  3='(3) SPEECH, VISION, OR HEARING PROBLEM'
                  4='(4) MOVEMENT OR COORDINATION PROBLEM'
                  5='(5) FACIAL/BODY DISFIGUREMENT OR WEIGHT/BODY IMAGE PROBLEM'
                  6='(6) BAD ODOR OR SWEATING' 8='(8) OTHER PHYSICAL HEALTH PROBLEM' ;
  VALUE so15a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) MENTAL HEALTH PROBLEM'
                  2='(2) ALCOHOL OR DRUG PROBLEM'
                  3='(3) SPEECH, VISION, OR HEARING PROBLEM'
                  4='(4) MOVEMENT OR COORDINATION PROBLEM'
                  5='(5) FACIAL/BODY DISFIGUREMENT OR WEIGHT/BODY IMAGE PROBLEM'
                  6='(6) BAD ODOR OR SWEATING' 8='(8) OTHER PHYSICAL HEALTH PROBLEM' ;
  VALUE so15a3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) MENTAL HEALTH PROBLEM'
                  2='(2) ALCOHOL OR DRUG PROBLEM'
                  3='(3) SPEECH, VISION, OR HEARING PROBLEM'
                  4='(4) MOVEMENT OR COORDINATION PROBLEM'
                  5='(5) FACIAL/BODY DISFIGUREMENT OR WEIGHT/BODY IMAGE PROBLEM'
                  6='(6) BAD ODOR OR SWEATING' 8='(8) OTHER PHYSICAL HEALTH PROBLEM' ;
  VALUE so15a4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) MENTAL HEALTH PROBLEM'
                  2='(2) ALCOHOL OR DRUG PROBLEM'
                  3='(3) SPEECH, VISION, OR HEARING PROBLEM'
                  4='(4) MOVEMENT OR COORDINATION PROBLEM'
                  5='(5) FACIAL/BODY DISFIGUREMENT OR WEIGHT/BODY IMAGE PROBLEM'
                  6='(6) BAD ODOR OR SWEATING' 8='(8) OTHER PHYSICAL HEALTH PROBLEM' ;
  VALUE so15a5ff  .R='REFUSED' .D='DONT KNOW' 1='(1) MENTAL HEALTH PROBLEM'
                  2='(2) ALCOHOL OR DRUG PROBLEM'
                  3='(3) SPEECH, VISION, OR HEARING PROBLEM'
                  4='(4) MOVEMENT OR COORDINATION PROBLEM'
                  5='(5) FACIAL/BODY DISFIGUREMENT OR WEIGHT/BODY IMAGE PROBLEM'
                  6='(6) BAD ODOR OR SWEATING' 8='(8) OTHER PHYSICAL HEALTH PROBLEM' ;
  VALUE so16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE so17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so18ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) WITHIN PAST MONTH'
                  2='(2) 2 AND 6 MONTHS' 3='(3) 7 AND 12 MONTHS'
                  4='(4) MORE THAN 12 MONTHS' ;
  VALUE so19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) MILD'
                  3='(3) MODERATE' 4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE so20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE so25ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so36ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so38ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE so39ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag1fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag1k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' 7='(7) N/A' ;
  VALUE ag3intrf  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag3int0f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aag3b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aag3b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aag3b4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag4a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag4b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag4c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag4d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag4e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag4f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag4g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag4h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aag6a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aag6a3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag8a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag9a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag9b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag9c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag9d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) R PREFERS TO HAVE LIST READ' ;
  VALUE ag11a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11j     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag11k     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag13a1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE ag14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE ag16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag17a     .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS AGO' ;
  VALUE ag18ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) MILD'
                  3='(3) MODERATE' 4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE ag19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE ag24ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag35ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag37ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag38ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g101ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g102ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g103ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g104ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g105ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g106ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g107ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g108ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g109ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g110ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g111ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g112ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g113ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g114ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g115ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g116ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g117ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g118ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g119ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g120ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g121ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g122ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g123ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g124ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g125ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g126ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIFFUSE WORRIES: EVERYTHING'
                  2='(2) NOTHING IN PARTICULAR'
                  3='(3) PERSONAL PROBLEMS: R S FINANCES'
                  4='(4) R S SUCCESS AT SCHOOL OR WORK' 5='(5) R S SOCIAL LIFE'
                  6='(6) R S LOVE LIFE' 7='(7) RELATIONSHIPS AT SCHOOL OR WORK'
                  8='(8) RELATIONSHIPS WITH FAMILY' 9='(9) R S PHYSICAL APPEARANCE'
                  10='(10) R S PHYSICAL HEALTH' 11='(11) R S MENTAL HEALTH'
                  12='(12) R S SUBSTANCE USE'
                  13='(13) OTHER PERSONAL PROBLEMS (SPECIFY)'
                  14='(14) PHOBIC AND OBSESSIVE-COMPULSIVE SITUATIONS: SOCIAL PHOBIAS'
                  15='(15) AGORAPHOBIA (E.G., LEAVING HOME ALONE AFTER A DIVORCE)'
                  16='(16) SPECIFIC PHOBIAS (E.G., ELEVATORS AFTER MOVING TO A CITY)'
                  17='(17) OBSESSIONS (E.G., GERMS AFTER MAD COW DISEASE SCARE)'
                  18='(18) COMPULSIONS (E.G., REPETITIVE HANDWASHING)'
                  19='(19) NETWORK PROBLEMS: BEING AWAY FROM HOME OR APART FROM LOVED O'
                  20='(20) THE HEALTH OR WELFARE OF LOVED ONES - FIRST MENTION'
                  21='(21) THE HEALTH OR WELFARE OF LOVED ONES - SECOND MENTION'
                  22='(22) THE HEALTH OR WELFARE OF LOVED ONES - THIRD MENTION'
                  23='(23) OTHER NETWORK PROBLEMS (SPECIFY)'
                  24='(24) SOCIETAL PROBLEMS: CRIME/VIOLENCE' 25='(25) THE ECONOMY'
                  26='(26) THE ENVIRONMENT (E.G., GLOBAL WARMING, POLLUTION)'
                  27='(27) MORAL DECLINE OF SOCIETY (E.G., COMMERCIALISM, DECLINE OF TH'
                  28='(28) WAR/REVOLUTION' 29='(29) OTHER SOCIETAL PROBLEMS (SPECIFY)'
                  30='(30) OTHER PROBLEMS(SPECIFY): FIRST(SPECIFY)'
                  31='(31) SECOND(SPECIFY)' 32='(32) THIRD(SPECIFY)' ;
  VALUE g3ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g4ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE g4a       .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE g5a       .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE g9a       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g9b       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g9c       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g9d       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g9e       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g9f       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g10a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g10b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g10c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g10d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g10e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13l      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13m      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13n      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g13o      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g15fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NO' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE g17fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE g17a      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE g18a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g18b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g26fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g26c      .R='REFUSED' .D='DONT KNOW' 1='(1) BROUGHT ON BY STRESS'
                  2='(2) OUT OF THE BLUE' 3='(3) DONT REMEMBER' 5='(5) DONT REMEMBER' ;
  VALUE g27fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g27a      .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS' ;
  VALUE g27a_4a   .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE g27a_6ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDED' 2='(2) STILL GOING ON' ;
  VALUE g27a_7a   .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE g27a_9ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDED' 2='(2) STILL GOING ON' ;
  VALUE g30fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE g36a      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE g36b      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE g36c      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE g36d      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE g36e      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE g36f      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE g36g      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) OCCASIONALLY' 4='(4) NEVER' ;
  VALUE g37fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) BADLY' 2='(2) NOT BADLY'
                  3='(3) NOT AT ALL' ;
  VALUE g44fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g56fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g58fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE g59fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied5ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied5a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied5b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied6ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied7ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE ied9ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied9a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied10fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied10b    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied11fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied11a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied16fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE ied16a    .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ied17fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE ied18fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied18c    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied18d    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied22fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) 7-12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE ied29fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied30fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied32fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ied33fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd2fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd9fffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) I MADE A SERIOUS ATTEMPT TO KILL MYSELF AND IT WAS ONLY LUCK'
                  2='(2) I TRIED TO KILL MYSELF, BUT KNEW THAT THE METHOD WAS NOT FOO'
                  3='(3) MY ATTEMPT WAS A CRY FOR HELP. I DID NOT INTEND TO DIE' ;
  VALUE sd10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd14ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) I MADE A SERIOUS ATTEMPT TO KILL MYSELF AND IT WAS ONLY LUCK'
                  2='(2) I TRIED TO KILL MYSELF, BUT KNEW THAT THE METHOD WAS NOT FOO'
                  3='(3) MY ATTEMPT WAS A CRY FOR HELP. I DID NOT INTEND TO DIE' ;
  VALUE sd15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd18ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd19a     .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE OR MORE' ;
  VALUE sd22ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) I MADE A SERIOUS ATTEMPT TO KILL MYSELF AND IT WAS ONLY LUCK'
                  2='(2) I TRIED TO KILL MYSELF, BUT KNEW THAT THE METHOD WAS NOT FOO'
                  3='(3) MY ATTEMPT WAS A CRY FOR HELP. I DID NOT INTEND TO DIE' ;
  VALUE sd23ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sd27ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) I MADE A SERIOUS ATTEMPT TO KILL MYSELF AND IT WAS ONLY LUCK'
                  2='(2) I TRIED TO KILL MYSELF, BUT KNEW THAT THE METHOD WAS NOT FOO'
                  3='(3) MY ATTEMPT WAS A CRY FOR HELP. I DID NOT INTEND TO DIE' ;
  VALUE sr2fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr3fffff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE OR MORE' ;
  VALUE sr5a      .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) PAST SIX MONTH' 3='(3) PAST YEAR' 4='(4) MORE THAN A YEAR AGO' ;
  VALUE sr5d      .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sr6b      .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sr8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr9b      .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sr9_1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr9_1a    .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) PAST SIX MONTHS' 3='(3) PAST YEAR' 4='(4) MORE THAN A YEAR AGO' ;
  VALUE sr10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr10b     .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) PAST SIX MONTH' 3='(3) PAST YEAR' 4='(4) MORE THAN A YEAR AGO' ;
  VALUE sr11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr11b     .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) PAST SIX MONTH' 3='(3) PAST YEAR' 4='(4) MORE THAN A YEAR AGO' ;
  VALUE sr12ffff  .R='REFUSED' .D='DONT KNOW' 0='(0) NO' 1='(1) YES' 7='(7) R IS WHITE' ;
  VALUE sr13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr1701ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr1702ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr1703ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr1704ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr1705ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr1706ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr1707ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr1708ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr1709ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr1710ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A. PSYCHIATRIST'
                  2='(2) B. GENERAL PRACTITIONER OR FAMILY DOCTOR'
                  3='(3) C. ANY OTHER MEDICAL DOCTOR, LIKE A CARDIOLOGIST OR (WOMEN:'
                  4='(4) D. PSYCHOLOGIST' 5='(5) E. SOCIAL WORKER' 6='(6) F. COUNSELOR'
                  7='(7) G. ANY OTHER MENTAL HEALTH PROFESSIONAL, SUCH AS A PSYCHOTHE'
                  8='(8) H. A NURSE, OCCUPATIONAL THERAPIST, OR OTHER HEALTH PROFESSI'
                  9='(9) I. A RELIGIOUS OR SPIRITUAL ADVISOR LIKE A MINISTER, PRIEST,'
                  10='(10) J. ANY OTHER HEALER, LIKE AN HERBALIST, CHIROPRACTOR, OR SPI' ;
  VALUE sr20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO - SIX MONTHS AGO' 3='(3) SEVEN - 12 MONTHS AGO'
                  4='(4) MORE THAN A YEAR AGO' ;
  VALUE sr23ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY SATISFIED'
                  2='(2) SATISFIED' 3='(3) NEITHER SATISFIED OR DISSATISFIED'
                  4='(4) DISSATISFIED' 5='(5) VERY DISSATISFIED' ;
  VALUE sr24ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sr25ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) STOPPED'
                  2='(2) (IF VOL) STOPPED SEEING ONE PSYCHIATRIST AND IN TREATMENT WI'
                  3='(3) STILL IN TREATMENT' ;
  VALUE sr25a     .R='REFUSED' .D='DONT KNOW' 1='(1) COMPLETED TREATMENT'
                  5='(5) QUIT' ;
  VALUE sr28ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO - SIX SIX MONTH' 3='(3) SEVEN - 12 MONTHS AGO'
                  4='(4) MORE THAN A YEAR AGO' ;
  VALUE sr30ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr33ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr36ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY SATISFIED'
                  2='(2) SATISFIED' 3='(3) NEITHER SATISFIED OR DISSATISFIED'
                  4='(4) DISSATISFIED' 5='(5) VERY DISSATISFIED' ;
  VALUE sr37ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sr38ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) STOPPED'
                  2='(2) (IF VOL) STOPPED SEEING ONE DOCTOR AND IN TREATMENT WITH ANO'
                  3='(3) STILL IN TREATMENT' ;
  VALUE sr38a     .R='REFUSED' .D='DONT KNOW' 1='(1) COMPLETED TREATMENT'
                  5='(5) QUIT' ;
  VALUE sr41ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO - SIX MONTHS AGO' 3='(3) SEVEN - 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE sr44ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY SATISFIED'
                  2='(2) SATISFIED' 3='(3) NEITHER SATISFIED OR DISSATISFIED'
                  4='(4) DISSATISFIED' 5='(5) VERY DISSATISFIED' ;
  VALUE sr45ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sr46a     .R='REFUSED' .D='DONT KNOW' 1='(1) STOPPED'
                  2='(2) (IF VOL) STOPPED SEEING ONE PSYCHOLOGIST'
                  3='(3) STILL IN TREATMENT' ;
  VALUE sr46b     .R='REFUSED' .D='DONT KNOW' 1='(1) COMPLETED TREATMENT'
                  5='(5) QUIT' ;
  VALUE sr49ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO - SIX MONTHS AGO' 3='(3) SEVEN - 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE sr521fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A. HOSPITAL EMERGENCY DEPARTMENT'
                  2='(2) B. PSYCHIATRIC OUTPATIENT CLINIC'
                  3='(3) C. DRUG OR ALCOHOL OUTPATIENT CLINIC'
                  4='(4) D. PRIVATE OFFICE'
                  5='(5) E. SOCIAL SERVICE AGENCY OR DEPARTMENT'
                  6='(6) F. PROGRAM IN JAIL OR PRISON'
                  7='(7) G. DROP-IN CENTER OR PROGRAM FOR PEOPLE WITH EMOTIONAL PROBL'
                  8='(8) H. CHURCH OR OTHER RELIGIOUS BUILDING'
                  9='(9) I. OTHER (SPECIFY)' ;
  VALUE sr522fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A. HOSPITAL EMERGENCY DEPARTMENT'
                  2='(2) B. PSYCHIATRIC OUTPATIENT CLINIC'
                  3='(3) C. DRUG OR ALCOHOL OUTPATIENT CLINIC'
                  4='(4) D. PRIVATE OFFICE'
                  5='(5) E. SOCIAL SERVICE AGENCY OR DEPARTMENT'
                  6='(6) F. PROGRAM IN JAIL OR PRISON'
                  7='(7) G. DROP-IN CENTER OR PROGRAM FOR PEOPLE WITH EMOTIONAL PROBL'
                  8='(8) H. CHURCH OR OTHER RELIGIOUS BUILDING'
                  9='(9) I. OTHER (SPECIFY)' ;
  VALUE sr523fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A. HOSPITAL EMERGENCY DEPARTMENT'
                  2='(2) B. PSYCHIATRIC OUTPATIENT CLINIC'
                  3='(3) C. DRUG OR ALCOHOL OUTPATIENT CLINIC'
                  4='(4) D. PRIVATE OFFICE'
                  5='(5) E. SOCIAL SERVICE AGENCY OR DEPARTMENT'
                  6='(6) F. PROGRAM IN JAIL OR PRISON'
                  7='(7) G. DROP-IN CENTER OR PROGRAM FOR PEOPLE WITH EMOTIONAL PROBL'
                  8='(8) H. CHURCH OR OTHER RELIGIOUS BUILDING'
                  9='(9) I. OTHER (SPECIFY)' ;
  VALUE sr524fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A. HOSPITAL EMERGENCY DEPARTMENT'
                  2='(2) B. PSYCHIATRIC OUTPATIENT CLINIC'
                  3='(3) C. DRUG OR ALCOHOL OUTPATIENT CLINIC'
                  4='(4) D. PRIVATE OFFICE'
                  5='(5) E. SOCIAL SERVICE AGENCY OR DEPARTMENT'
                  6='(6) F. PROGRAM IN JAIL OR PRISON'
                  7='(7) G. DROP-IN CENTER OR PROGRAM FOR PEOPLE WITH EMOTIONAL PROBL'
                  8='(8) H. CHURCH OR OTHER RELIGIOUS BUILDING'
                  9='(9) I. OTHER (SPECIFY)' ;
  VALUE sr525fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A. HOSPITAL EMERGENCY DEPARTMENT'
                  2='(2) B. PSYCHIATRIC OUTPATIENT CLINIC'
                  3='(3) C. DRUG OR ALCOHOL OUTPATIENT CLINIC'
                  4='(4) D. PRIVATE OFFICE'
                  5='(5) E. SOCIAL SERVICE AGENCY OR DEPARTMENT'
                  6='(6) F. PROGRAM IN JAIL OR PRISON'
                  7='(7) G. DROP-IN CENTER OR PROGRAM FOR PEOPLE WITH EMOTIONAL PROBL'
                  8='(8) H. CHURCH OR OTHER RELIGIOUS BUILDING'
                  9='(9) I. OTHER (SPECIFY)' ;
  VALUE sr53ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY SATISFIED'
                  2='(2) SATISFIED' 3='(3) NEITHER SATISFIED OR DISSATISFIED'
                  4='(4) DISSATISFIED' 5='(5) VERY DISSATISFIED' ;
  VALUE sr54ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sr55ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) STOPPED'
                  2='(2) (IF VOL) STOPPED SEEING ONE MENTAL HEALTH PROFESSIONAL AND I'
                  3='(3) STILL IN TREATMENT' ;
  VALUE sr55a     .R='REFUSED' .D='DONT KNOW' 1='(1) COMPLETED TREATMENT'
                  5='(5) QUIT' ;
  VALUE sr58ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO - SIX MONTH AGO' 3='(3) SEVEN - 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE sr62ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY SATISFIED'
                  2='(2) SATISFIED' 3='(3) NEITHER SATISFIED OR DISSATISFIED'
                  4='(4) DISSATISFIED' 5='(5) VERY DISSATISFIED' ;
  VALUE sr63ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sr64ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) STOPPED'
                  2='(2) (IF VOL) STOPPED SEEING ONE MENTAL HEALTH PROFESSIONAL AND I'
                  3='(3) STILL IN TREATMENT' ;
  VALUE sr64a     .R='REFUSED' .D='DONT KNOW' 1='(1) COMPLETED TREATMENT'
                  5='(5) QUIT' ;
  VALUE sr67ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO - SIX MONTH AGO' 3='(3) SEVEN - 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE sr70ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY SATISFIED'
                  2='(2) SATISFIED' 3='(3) NEITHER SATISFIED OR DISSATISFIED'
                  4='(4) DISSATISFIED' 5='(5) VERY DISSATISFIED' ;
  VALUE sr71ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sr72ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) STOPPED'
                  2='(2) (IF VOL) STOPPED SEEING ONE MENTAL HEALTH PROFESSIONAL AND I'
                  3='(3) STILL IN TREATMENT' ;
  VALUE sr72a     .R='REFUSED' .D='DONT KNOW' 1='(1) COMPLETED TREATMENT'
                  5='(5) QUIT' ;
  VALUE sr75ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO - SIX MONTH AGO' 3='(3) SEVEN - 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE sr77ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr80ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr83ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY SATISFIED'
                  2='(2) SATISFIED' 3='(3) NEITHER SATISFIED OR DISSATISFIED'
                  4='(4) DISSATISFIED' 5='(5) VERY DISSATISFIED' ;
  VALUE sr84ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sr85ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) STOPPED'
                  2='(2) (IF VOL) STOPPED SEEING ONE PSYCHIATRIST AND IN TREATMENT WI'
                  3='(3) STILL IN TREATMENT' ;
  VALUE sr85a     .R='REFUSED' .D='DONT KNOW' 1='(1) COMPLETED TREATMENT'
                  5='(5) QUIT' ;
  VALUE sr88ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO - SIX MONTHS AGO' 3='(3) SEVEN - 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE sr90ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr93ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr96ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY SATISFIED'
                  2='(2) SATISFIED' 3='(3) NEITHER SATISFIED OR DISSATISFIED'
                  4='(4) DISSATISFIED' 5='(5) VERY DISSATISFIED' ;
  VALUE sr97ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sr98ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) STOPPED'
                  2='(2) (IF VOL) STOPPED SEEING ONE PSYCHIATRIST AND IN TREATMENT WI'
                  3='(3) STILL IN TREATMENT' ;
  VALUE sr98a     .R='REFUSED' .D='DONT KNOW' 1='(1) COMPLETED TREATMENT'
                  5='(5) QUIT' ;
  VALUE sr101fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO - SIX MONTHS AGO' 3='(3) SEVEN - 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE sr10501f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST' 6='(6) HERBALIST'
                  7='(7) HOMEOPATH' 8='(8) HYPNOTIST' 9='(9) GUIDED IMAGERY SPECIALIST'
                  10='(10) MASSEUSE' 11='(11) SPIRITUALIST/PSYCHIC'
                  12='(12) YOGA, RELAXATION OR MEDITATION EXPERT' 13='(13) DIETICIAN'
                  14='(14) OTHER (SPECIFY)' ;
  VALUE sr10502f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST' 6='(6) HERBALIST'
                  7='(7) HOMEOPATH' 8='(8) HYPNOTIST' 9='(9) GUIDED IMAGERY SPECIALIST'
                  10='(10) MASSEUSE' 11='(11) SPIRITUALIST/PSYCHIC'
                  12='(12) YOGA, RELAXATION OR MEDITATION EXPERT' 13='(13) DIETICIAN'
                  14='(14) OTHER (SPECIFY)' ;
  VALUE sr10503f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST' 6='(6) HERBALIST'
                  7='(7) HOMEOPATH' 8='(8) HYPNOTIST' 9='(9) GUIDED IMAGERY SPECIALIST'
                  10='(10) MASSEUSE' 11='(11) SPIRITUALIST/PSYCHIC'
                  12='(12) YOGA, RELAXATION OR MEDITATION EXPERT' 13='(13) DIETICIAN'
                  14='(14) OTHER (SPECIFY)' ;
  VALUE sr10504f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST' 6='(6) HERBALIST'
                  7='(7) HOMEOPATH' 8='(8) HYPNOTIST' 9='(9) GUIDED IMAGERY SPECIALIST'
                  10='(10) MASSEUSE' 11='(11) SPIRITUALIST/PSYCHIC'
                  12='(12) YOGA, RELAXATION OR MEDITATION EXPERT' 13='(13) DIETICIAN'
                  14='(14) OTHER (SPECIFY)' ;
  VALUE sr10505f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST' 6='(6) HERBALIST'
                  7='(7) HOMEOPATH' 8='(8) HYPNOTIST' 9='(9) GUIDED IMAGERY SPECIALIST'
                  10='(10) MASSEUSE' 11='(11) SPIRITUALIST/PSYCHIC'
                  12='(12) YOGA, RELAXATION OR MEDITATION EXPERT' 13='(13) DIETICIAN'
                  14='(14) OTHER (SPECIFY)' ;
  VALUE sr10506f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST' 6='(6) HERBALIST'
                  7='(7) HOMEOPATH' 8='(8) HYPNOTIST' 9='(9) GUIDED IMAGERY SPECIALIST'
                  10='(10) MASSEUSE' 11='(11) SPIRITUALIST/PSYCHIC'
                  12='(12) YOGA, RELAXATION OR MEDITATION EXPERT' 13='(13) DIETICIAN'
                  14='(14) OTHER (SPECIFY)' ;
  VALUE sr10507f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST' 6='(6) HERBALIST'
                  7='(7) HOMEOPATH' 8='(8) HYPNOTIST' 9='(9) GUIDED IMAGERY SPECIALIST'
                  10='(10) MASSEUSE' 11='(11) SPIRITUALIST/PSYCHIC'
                  12='(12) YOGA, RELAXATION OR MEDITATION EXPERT' 13='(13) DIETICIAN'
                  14='(14) OTHER (SPECIFY)' ;
  VALUE sr106fff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY SATISFIED'
                  2='(2) SATISFIED' 3='(3) NEITHER SATISFIED OR DISSATISFIED'
                  4='(4) DISSATISFIED' 5='(5) VERY DISSATISFIED' ;
  VALUE sr107fff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sr108fff  .R='REFUSED' .D='DONT KNOW' 1='(1) STOPPED'
                  2='(2) (IF VOL) STOPPED SEEING ONE HEALER AND IN TREATMENT WITH ANO'
                  3='(3) STILL IN TREATMENT' ;
  VALUE sr108a    .R='REFUSED' .D='DONT KNOW' 1='(1) COMPLETED TREATMENT'
                  5='(5) QUIT' ;
  VALUE sr111fff  .R='REFUSED' .D='DONT KNOW' 1='(1) R WANTED TO DO IT'
                  2='(2) SOMEONE ELSE PUTTING PRESSURE ON R' 3='(3) (IF VOL) BOTH' ;
  VALUE sr112fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) R DIDN T THINK HE/SHE HAD A PROBLEM'
                  2='(2) R HAD A PROBLEM, BUT THOUGHT HE/SHE COULD HANDLE IT ON HIS/H'
                  3='(3) R THOUGHT THAT HE/SHE NEEDED HELP BUT DIDN T BELIEVE PROFESS'
                  4='(4) OTHER (SPECIFY)' ;
  VALUE sr113fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr114a    .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sr116a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116b    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116c    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116d    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116e    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116f    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116g    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116h    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116i    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116j    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116k    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116l    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116m    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr116n    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr117fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr1181ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' ;
  VALUE sr1182ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' ;
  VALUE sr1183ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' ;
  VALUE sr1184ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' ;
  VALUE sr1185ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' ;
  VALUE sr1186ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' ;
  VALUE sr1187ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' ;
  VALUE sr1188ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' ;
  VALUE sr120a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120b    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120c    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120d    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120e    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120f    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120g    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120h    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120i    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120j    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120k    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120l    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120m    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120n    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr120o    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr121fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr122fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr122b    .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE sr123fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) R DIDN T THINK HE/SHE HAD A PROBLEM'
                  2='(2) R HAD A PROBLEM, BUT THOUGHT HE/SHE COULD HANDLE IT ON HIS/H'
                  3='(3) R THOUGHT THAT HE/SHE NEEDED HELP BUT DIDN T BELIEVE PROFESS'
                  4='(4) OTHER (SPECIFY)' ;
  VALUE sr124fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126b    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126c    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126d    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126e    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126f    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126g    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126h    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126i    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126j    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126k    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126l    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126m    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126n    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr126o    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr127fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr128fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr128a0f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr128a1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr128a2f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr128a3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr128a4f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr128a5f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr128a6f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr128a7f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr128a8f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr128a9f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr12810f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr12811f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACUPUNCTURIST'
                  2='(2) BIOFEEDBACK SPECIALIST' 3='(3) CHIROPRACTOR'
                  4='(4) ENERGY HEALING SPECIALIST'
                  5='(5) EXERCISE OR MOVEMENT THERAPIST'
                  6='(6) HERBAL THEREAPY (E.G., ST. JOHN S WORT, CHAMOMILE)'
                  7='(7) HIGH DOSE MEGA-VITAMINS' 8='(8) HOMEOPATH' 9='(9) HYPNOTIST'
                  10='(10) GUIDED IMAGERY SPECIALIST' 11='(11) MASSEUSE'
                  12='(12) PRAYER OF OTHER SPIRITUAL PRACTICES'
                  13='(13) RELAXATION OR MEDITATION TECHNIQUES' 14='(14) SPECIAL DIETS'
                  15='(15) SPIRITUAL HEALING BY OTHERS'
                  16='(16) ANY OTHER NON-TRADITIONAL REMEDY OR THERAPY (SPECIFY)' ;
  VALUE sr1301ff  .R='REFUSED' .D='DONT KNOW' 1='(1) CHAMOMILE' 2='(2) KAVA'
                  3='(3) LAVENDER' 4='(4) ST. JOHN S WORT' 5='(5) VALERIAN'
                  6='(6) CHASTEBERRY' 7='(7) BLACK COHOSH' 8='(8) OTHER (SPECIFY)' ;
  VALUE sr1302ff  .R='REFUSED' .D='DONT KNOW' 1='(1) CHAMOMILE' 2='(2) KAVA'
                  3='(3) LAVENDER' 4='(4) ST. JOHN S WORT' 5='(5) VALERIAN'
                  6='(6) CHASTEBERRY' 7='(7) BLACK COHOSH' 8='(8) OTHER (SPECIFY)' ;
  VALUE sr1303ff  .R='REFUSED' .D='DONT KNOW' 1='(1) CHAMOMILE' 2='(2) KAVA'
                  3='(3) LAVENDER' 4='(4) ST. JOHN S WORT' 5='(5) VALERIAN'
                  6='(6) CHASTEBERRY' 7='(7) BLACK COHOSH' 8='(8) OTHER (SPECIFY)' ;
  VALUE sr1304ff  .R='REFUSED' .D='DONT KNOW' 1='(1) CHAMOMILE' 2='(2) KAVA'
                  3='(3) LAVENDER' 4='(4) ST. JOHN S WORT' 5='(5) VALERIAN'
                  6='(6) CHASTEBERRY' 7='(7) BLACK COHOSH' 8='(8) OTHER (SPECIFY)' ;
  VALUE sr1305ff  .R='REFUSED' .D='DONT KNOW' 1='(1) CHAMOMILE' 2='(2) KAVA'
                  3='(3) LAVENDER' 4='(4) ST. JOHN S WORT' 5='(5) VALERIAN'
                  6='(6) CHASTEBERRY' 7='(7) BLACK COHOSH' 8='(8) OTHER (SPECIFY)' ;
  VALUE sr1306ff  .R='REFUSED' .D='DONT KNOW' 1='(1) CHAMOMILE' 2='(2) KAVA'
                  3='(3) LAVENDER' 4='(4) ST. JOHN S WORT' 5='(5) VALERIAN'
                  6='(6) CHASTEBERRY' 7='(7) BLACK COHOSH' 8='(8) OTHER (SPECIFY)' ;
  VALUE sr1307ff  .R='REFUSED' .D='DONT KNOW' 1='(1) CHAMOMILE' 2='(2) KAVA'
                  3='(3) LAVENDER' 4='(4) ST. JOHN S WORT' 5='(5) VALERIAN'
                  6='(6) CHASTEBERRY' 7='(7) BLACK COHOSH' 8='(8) OTHER (SPECIFY)' ;
  VALUE sr130b    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr130c0f  .R='REFUSED' .D='DONT KNOW' 1='(1) PSYCHIATRIST'
                  2='(2) FAMILY DOCTOR'
                  3='(3) OTHER MEDICAL DOCTOR (E.G., CARDIOLOGIST, GYNECOLOGIST)'
                  4='(4) PSYCHOLOGIST' 5='(5) SOCIAL WORKER' 6='(6) COUNSELOR'
                  7='(7) OTHER MENTAL HEALTH PROFESSIONAL (E.G., PSYCHIATRIC NURSE, P'
                  8='(8) OTHER HEALTH PROFESSIONAL (E.G., PHYSICIAN ASSISTANT)'
                  9='(9) RELIGIOUS OR SPIRITUAL ADVISOR (E.G., MINISTER, PRIEST, RABB'
                  10='(10) OTHER ALTERNATIVE PROVIDER (E.G., SPIRITUALIST, NATIVE HEALE'
                  11='(11) OTHER (SPECIFY)' ;
  VALUE sr130c1f  .R='REFUSED' .D='DONT KNOW' 1='(1) PSYCHIATRIST'
                  2='(2) FAMILY DOCTOR'
                  3='(3) OTHER MEDICAL DOCTOR (E.G., CARDIOLOGIST, GYNECOLOGIST)'
                  4='(4) PSYCHOLOGIST' 5='(5) SOCIAL WORKER' 6='(6) COUNSELOR'
                  7='(7) OTHER MENTAL HEALTH PROFESSIONAL (E.G., PSYCHIATRIC NURSE, P'
                  8='(8) OTHER HEALTH PROFESSIONAL (E.G., PHYSICIAN ASSISTANT)'
                  9='(9) RELIGIOUS OR SPIRITUAL ADVISOR (E.G., MINISTER, PRIEST, RABB'
                  10='(10) OTHER ALTERNATIVE PROVIDER (E.G., SPIRITUALIST, NATIVE HEALE'
                  11='(11) OTHER (SPECIFY)' ;
  VALUE sr130c2f  .R='REFUSED' .D='DONT KNOW' 1='(1) PSYCHIATRIST'
                  2='(2) FAMILY DOCTOR'
                  3='(3) OTHER MEDICAL DOCTOR (E.G., CARDIOLOGIST, GYNECOLOGIST)'
                  4='(4) PSYCHOLOGIST' 5='(5) SOCIAL WORKER' 6='(6) COUNSELOR'
                  7='(7) OTHER MENTAL HEALTH PROFESSIONAL (E.G., PSYCHIATRIC NURSE, P'
                  8='(8) OTHER HEALTH PROFESSIONAL (E.G., PHYSICIAN ASSISTANT)'
                  9='(9) RELIGIOUS OR SPIRITUAL ADVISOR (E.G., MINISTER, PRIEST, RABB'
                  10='(10) OTHER ALTERNATIVE PROVIDER (E.G., SPIRITUALIST, NATIVE HEALE'
                  11='(11) OTHER (SPECIFY)' ;
  VALUE sr131fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sr131c1f  .R='REFUSED' .D='DONT KNOW' 1='(1) LOVE LIFE' 2='(2) FINANCES'
                  3='(3) R S HEALTH' 4='(4) WELL-BEING OF A LOVED ONE'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE sr131c2f  .R='REFUSED' .D='DONT KNOW' 1='(1) LOVE LIFE' 2='(2) FINANCES'
                  3='(3) R S HEALTH' 4='(4) WELL-BEING OF A LOVED ONE'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE sr131c3f  .R='REFUSED' .D='DONT KNOW' 1='(1) LOVE LIFE' 2='(2) FINANCES'
                  3='(3) R S HEALTH' 4='(4) WELL-BEING OF A LOVED ONE'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE sr131c4f  .R='REFUSED' .D='DONT KNOW' 1='(1) LOVE LIFE' 2='(2) FINANCES'
                  3='(3) R S HEALTH' 4='(4) WELL-BEING OF A LOVED ONE'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE sr131c5f  .R='REFUSED' .D='DONT KNOW' 1='(1) LOVE LIFE' 2='(2) FINANCES'
                  3='(3) R S HEALTH' 4='(4) WELL-BEING OF A LOVED ONE'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE sr13301f  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' 9='(9) I' 10='(10) J' 11='(11) K' ;
  VALUE sr13302f  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' 9='(9) I' 10='(10) J' 11='(11) K' ;
  VALUE sr13303f  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' 9='(9) I' 10='(10) J' 11='(11) K' ;
  VALUE sr13304f  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' 9='(9) I' 10='(10) J' 11='(11) K' ;
  VALUE sr13305f  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' 9='(9) I' 10='(10) J' 11='(11) K' ;
  VALUE sr13306f  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E'
                  6='(6) F' 7='(7) G' 8='(8) H' 9='(9) I' 10='(10) J' 11='(11) K' ;
  VALUE sr135fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A PROFESSIONAL RAN THE GROUP'
                  2='(2) A PROFESSIONAL ASKED YOU TO ATTEND THE GROUP AS PART OF YOUR'
                  3='(3) YOU ATTENDED THE SELF-HELP GROUP AT THE SAME TIME YOU SAW A'
                  4='(4) YOU ATTENDED THE SELF-HELP GROUP AT A DIFFERENT TIME THAN WH'
                  5='(5) OTHER (SPECIFY)' ;
  VALUE pea40fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea41fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea42fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea43fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea44fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea45fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea46fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea47fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea48fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea49fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea50fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea51fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea52fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea53fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea54fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea55fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea56fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea57fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea58fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea59fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea60fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea61fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea62fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea63fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea64fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea65fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea66fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea67fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea68fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea69fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea70fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea71fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea72fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea73fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea74fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea75fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea76fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea77fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea78fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea79fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea80fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea81fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea82fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE pea83fff  .R='REFUSED' .D='DONT KNOW' 1='(1) TRUE' 5='(5) FALSE' ;
  VALUE su2b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su2c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY EVERY DAY'
                  2='(2) 3-4 DAYS PER WEEK' 3='(3) 1-2 DAYS PER WEEK'
                  4='(4) 1-3 DAYS PER MONTH' 5='(5) LESS THAN ONCE A MONTH'
                  6='(6) (IF VOL) DID NOT DRINK IN PAST 12 MONTHS' ;
  VALUE su5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY EVERY DAY'
                  2='(2) 3-4 DAYS PER WEEK' 3='(3) 1-2 DAYS PER WEEK'
                  4='(4) 1-3 DAYS PER MONTH' 5='(5) LESS THAN ONCE A MONTH' ;
  VALUE su12ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su12a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su12b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su12c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su15intf  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su15in0f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su15b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su15b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2 TO 6 MONTHS AGO' 3='(3) 7 TO 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE su19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su19j     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su26ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2 TO 6 MONTHS AGO' 3='(3) 7 TO 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE su29ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su30b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su30c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su34b     .R='REFUSED' .D='DONT KNOW' 1='(1) DAY' 2='(2) MONTH' 3='(3) YEAR' ;
  VALUE su38a     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su38b     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su38c     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su38d     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su38e     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su41ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su42ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su43ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su44ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su45a1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su45a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su45b1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su45b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su45c1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su45c2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su45d1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su45d2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su47a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su47b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su47c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su47d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su48a     .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY EVERY DAY'
                  2='(2) 3-4 DAYS PER WEEK' 3='(3) 1-2 DAYS PER WEEK'
                  4='(4) 1-3 DAYS PER MONTH' 5='(5) LESS THAN ONCE A MONTH' ;
  VALUE su48b     .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY EVERY DAY'
                  2='(2) 3-4 DAYS PER WEEK' 3='(3) 1-2 DAYS PER WEEK'
                  4='(4) 1-3 DAYS PER MONTH' 5='(5) LESS THAN ONCE A MONTH' ;
  VALUE su48c     .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY EVERY DAY'
                  2='(2) 3-4 DAYS PER WEEK' 3='(3) 1-2 DAYS PER WEEK'
                  4='(4) 1-3 DAYS PER MONTH' 5='(5) LESS THAN ONCE A MONTH' ;
  VALUE su48d     .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY EVERY DAY'
                  2='(2) 3-4 DAYS PER WEEK' 3='(3) 1-2 DAYS PER WEEK'
                  4='(4) 1-3 DAYS PER MONTH' 5='(5) LESS THAN ONCE A MONTH' ;
  VALUE su68b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su68b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su83b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su83c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su65ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su65a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su65b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su65c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su68intf  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su68in0f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su69ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2 TO 6 MONTHS AGO' 3='(3) 7 TO 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE su72ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su72a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su72b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su72c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su72d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su72e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su72f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su72g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su72h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su72i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su79ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2 TO 6 MONTHS AGO' 3='(3) 7 TO 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE su82ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su86a     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su86b     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su86c     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su86d     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su86e     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE su87a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su87a3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su87b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su87b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su95ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su102fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su103fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su119fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE su119_2f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1l      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1n      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1o      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1s      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc1t      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc4b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc4c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc4d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc4e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc4i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc4n      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc4o      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) TREATMENT' 2='(2) REMISSION'
                  3='(3) CURED' ;
  VALUE cc6a01ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BREAST CANCER'
                  5='(5) PROSTATE CANCER' 6='(6) SKIN CANCER (MELANOMA)'
                  8='(8) UTERINE/OVARIAN CANCER' 9='(9) CERVICAL CANCER' 10='(10) OTHER' ;
  VALUE cc6a02ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BREAST CANCER'
                  5='(5) PROSTATE CANCER' 6='(6) SKIN CANCER (MELANOMA)'
                  8='(8) UTERINE/OVARIAN CANCER' 9='(9) CERVICAL CANCER' 10='(10) OTHER' ;
  VALUE cc6a03ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BREAST CANCER'
                  5='(5) PROSTATE CANCER' 6='(6) SKIN CANCER (MELANOMA)'
                  8='(8) UTERINE/OVARIAN CANCER' 9='(9) CERVICAL CANCER' 10='(10) OTHER' ;
  VALUE cc6a04ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BREAST CANCER'
                  5='(5) PROSTATE CANCER' 6='(6) SKIN CANCER (MELANOMA)'
                  8='(8) UTERINE/OVARIAN CANCER' 9='(9) CERVICAL CANCER' 10='(10) OTHER' ;
  VALUE cc6_1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc6_1b    .R='REFUSED' .D='DONT KNOW' 1='(1) ACCIDENT'
                  2='(2) DID TO SELF ON PURPOSE' 3='(3) DURING FIGHT OR ATTACK'
                  4='(4) OTHER (SPECIFY)' ;
  VALUE cc6_1c    .R='REFUSED' .D='DONT KNOW' 1='(1) WORK'
                  2='(2) WORK-RELATED TRAVEL' 3='(3) SOME PLACE ELSE' ;
  VALUE cc6_21ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BROKEN OR DISLOCATED BONES'
                  2='(2) SPRAIN, STRAIN, OR PULLED MUSCLE'
                  3='(3) CUTS, SCRAPES, OR PUNCTURE WOUNDS'
                  5='(5) BRUISE, CONTUSION, OR INTERNAL BLEEDING'
                  96='(96) OTHER (SPECIFY)' ;
  VALUE cc6_22ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BROKEN OR DISLOCATED BONES'
                  2='(2) SPRAIN, STRAIN, OR PULLED MUSCLE'
                  3='(3) CUTS, SCRAPES, OR PUNCTURE WOUNDS'
                  5='(5) BRUISE, CONTUSION, OR INTERNAL BLEEDING'
                  96='(96) OTHER (SPECIFY)' ;
  VALUE cc6_23ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BROKEN OR DISLOCATED BONES'
                  2='(2) SPRAIN, STRAIN, OR PULLED MUSCLE'
                  3='(3) CUTS, SCRAPES, OR PUNCTURE WOUNDS'
                  5='(5) BRUISE, CONTUSION, OR INTERNAL BLEEDING'
                  96='(96) OTHER (SPECIFY)' ;
  VALUE cc6_24ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BROKEN OR DISLOCATED BONES'
                  2='(2) SPRAIN, STRAIN, OR PULLED MUSCLE'
                  3='(3) CUTS, SCRAPES, OR PUNCTURE WOUNDS'
                  5='(5) BRUISE, CONTUSION, OR INTERNAL BLEEDING'
                  96='(96) OTHER (SPECIFY)' ;
  VALUE cc6_25ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BROKEN OR DISLOCATED BONES'
                  2='(2) SPRAIN, STRAIN, OR PULLED MUSCLE'
                  3='(3) CUTS, SCRAPES, OR PUNCTURE WOUNDS'
                  5='(5) BRUISE, CONTUSION, OR INTERNAL BLEEDING'
                  96='(96) OTHER (SPECIFY)' ;
  VALUE cc6_26ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BROKEN OR DISLOCATED BONES'
                  2='(2) SPRAIN, STRAIN, OR PULLED MUSCLE'
                  3='(3) CUTS, SCRAPES, OR PUNCTURE WOUNDS'
                  5='(5) BRUISE, CONTUSION, OR INTERNAL BLEEDING'
                  96='(96) OTHER (SPECIFY)' ;
  VALUE cc6_301f  .R='REFUSED' .D='DONT KNOW' 1='(1) HOME OR YARD'
                  2='(2) SOMEONE ELSE S HOME OR YARD' 4='(4) WORKPLACE'
                  5='(5) TRAVELING TO OR FROM WORK OR AS PART OF WORK'
                  6='(6) STREET OR HIGHWAY (NOT TRAVELING FOR WORK)'
                  7='(7) PUBLIC SPACE (E.G., SIDEWALK) OR BUILDING'
                  8='(8) FARM OR AGRICULTURAL AREA'
                  9='(9) PLACE OF RECREATION OR SPORTS (INCLUDING SCHOOL)'
                  96='(96) OTHER (SPECIFY)' ;
  VALUE cc6_302f  .R='REFUSED' .D='DONT KNOW' 1='(1) HOME OR YARD'
                  2='(2) SOMEONE ELSE S HOME OR YARD' 4='(4) WORKPLACE'
                  5='(5) TRAVELING TO OR FROM WORK OR AS PART OF WORK'
                  6='(6) STREET OR HIGHWAY (NOT TRAVELING FOR WORK)'
                  7='(7) PUBLIC SPACE (E.G., SIDEWALK) OR BUILDING'
                  8='(8) FARM OR AGRICULTURAL AREA'
                  9='(9) PLACE OF RECREATION OR SPORTS (INCLUDING SCHOOL)'
                  96='(96) OTHER (SPECIFY)' ;
  VALUE cc6_303f  .R='REFUSED' .D='DONT KNOW' 1='(1) HOME OR YARD'
                  2='(2) SOMEONE ELSE S HOME OR YARD' 4='(4) WORKPLACE'
                  5='(5) TRAVELING TO OR FROM WORK OR AS PART OF WORK'
                  6='(6) STREET OR HIGHWAY (NOT TRAVELING FOR WORK)'
                  7='(7) PUBLIC SPACE (E.G., SIDEWALK) OR BUILDING'
                  8='(8) FARM OR AGRICULTURAL AREA'
                  9='(9) PLACE OF RECREATION OR SPORTS (INCLUDING SCHOOL)'
                  96='(96) OTHER (SPECIFY)' ;
  VALUE cc15b     .R='REFUSED' .D='DONT KNOW' 1='(1) MINUTES' 2='(2) HOURS' ;
  VALUE cc19a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc19b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc19c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc19d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc19e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc19f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc19g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc20a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc20b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc20c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc20d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc24a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc24b     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc24c     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc24d     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc24e     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc24f     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc24g     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc24h     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc24j     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc26a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc26b     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc26c     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc26d     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc26e     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc28_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc28_1af  .R='REFUSED' .D='DONT KNOW' 1='(1) NECK OR BACK'
                  2='(2) STOMACH OR ABDOMEN'
                  3='(3) JOINTS LIKE ARMS, HANDS, LEGS, OR FEET'
                  4='(4) FACE OR JAW OF THE JOING JUST BELOW THE EAR' 5='(5) CHEST'
                  6='(6) ANY OTHER TYPE OF CHRONIC PAIN (SPECIFY)' ;
  VALUE cc28_10f  .R='REFUSED' .D='DONT KNOW' 1='(1) NECK OR BACK'
                  2='(2) STOMACH OR ABDOMEN'
                  3='(3) JOINTS LIKE ARMS, HANDS, LEGS, OR FEET'
                  4='(4) FACE OR JAW OF THE JOING JUST BELOW THE EAR' 5='(5) CHEST'
                  6='(6) ANY OTHER TYPE OF CHRONIC PAIN (SPECIFY)' ;
  VALUE cc28_11f  .R='REFUSED' .D='DONT KNOW' 1='(1) NECK OR BACK'
                  2='(2) STOMACH OR ABDOMEN'
                  3='(3) JOINTS LIKE ARMS, HANDS, LEGS, OR FEET'
                  4='(4) FACE OR JAW OF THE JOING JUST BELOW THE EAR' 5='(5) CHEST'
                  6='(6) ANY OTHER TYPE OF CHRONIC PAIN (SPECIFY)' ;
  VALUE cc28_12f  .R='REFUSED' .D='DONT KNOW' 1='(1) NECK OR BACK'
                  2='(2) STOMACH OR ABDOMEN'
                  3='(3) JOINTS LIKE ARMS, HANDS, LEGS, OR FEET'
                  4='(4) FACE OR JAW OF THE JOING JUST BELOW THE EAR' 5='(5) CHEST'
                  6='(6) ANY OTHER TYPE OF CHRONIC PAIN (SPECIFY)' ;
  VALUE cc28_13f  .R='REFUSED' .D='DONT KNOW' 1='(1) NECK OR BACK'
                  2='(2) STOMACH OR ABDOMEN'
                  3='(3) JOINTS LIKE ARMS, HANDS, LEGS, OR FEET'
                  4='(4) FACE OR JAW OF THE JOING JUST BELOW THE EAR' 5='(5) CHEST'
                  6='(6) ANY OTHER TYPE OF CHRONIC PAIN (SPECIFY)' ;
  VALUE cc28_14f  .R='REFUSED' .D='DONT KNOW' 1='(1) NECK OR BACK'
                  2='(2) STOMACH OR ABDOMEN'
                  3='(3) JOINTS LIKE ARMS, HANDS, LEGS, OR FEET'
                  4='(4) FACE OR JAW OF THE JOING JUST BELOW THE EAR' 5='(5) CHEST'
                  6='(6) ANY OTHER TYPE OF CHRONIC PAIN (SPECIFY)' ;
  VALUE cc28_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE cc28_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE cc28_3a   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc29_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc31b     .R='REFUSED' .D='DONT KNOW' 1='(1) MINUTES' 2='(2) HOURS' 3='(3) DAYS' ;
  VALUE cc34_2a   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc34_2b   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc34_30f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY BELOW)'
                  10='(10) STRESS OVERWORK' 11='(11) TENSION'
                  12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY BELOW)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY BELOW)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY BELOW)'
                  31='(31) DRUGS (SPECIFY BELOW)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS'
                  82='(82) OTHER (SPECIFY BELOW)' ;
  VALUE cc34_31f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY BELOW)'
                  10='(10) STRESS OVERWORK' 11='(11) TENSION'
                  12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY BELOW)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY BELOW)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY BELOW)'
                  31='(31) DRUGS (SPECIFY BELOW)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS'
                  82='(82) OTHER (SPECIFY BELOW)' ;
  VALUE cc34_32f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY BELOW)'
                  10='(10) STRESS OVERWORK' 11='(11) TENSION'
                  12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY BELOW)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY BELOW)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY BELOW)'
                  31='(31) DRUGS (SPECIFY BELOW)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS'
                  82='(82) OTHER (SPECIFY BELOW)' ;
  VALUE cc34_33f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY BELOW)'
                  10='(10) STRESS OVERWORK' 11='(11) TENSION'
                  12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY BELOW)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY BELOW)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY BELOW)'
                  31='(31) DRUGS (SPECIFY BELOW)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS'
                  82='(82) OTHER (SPECIFY BELOW)' ;
  VALUE cc34_5ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc34_8ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 2='(2) NO'
                  3='(3) NO EXAMINATION PERFORMED' ;
  VALUE cc34_9ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc36ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc38intf  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc38in0f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc39ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc40ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc41ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc42ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc43ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc44_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc45ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NO' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE cc46ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE cc46a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cc48ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc48a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc49_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc49_2a   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc49_2b   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc49_2d   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc49_2e   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc49_2f   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50_3a   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50_4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50_5ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50_7ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc50_9ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES'
                  2='(2) (IF VOL: R HAS MULTIPLE PLANS AND IT VARIES)' 3='(3) NO' ;
  VALUE cc50_11f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES'
                  2='(2) (IF VOL: R HAS MULTIPLE PLANS AND IT VARIES)' 3='(3) NO' ;
  VALUE cc50_12f  .R='REFUSED' .D='DONT KNOW' 1='(1) CAN GO TO ANY DOCTOR'
                  2='(2) (IF VOL: R HAS MULTIPLE PLANS AND IT VARIES)'
                  3='(3) MUST CHOOSE FROM LIST'
                  4='(4) (IF VOL) HAS TO SEE A SPECIFIC DOCTOR' ;
  VALUE cc50_13f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES'
                  2='(2) (IF VOL: R HAS MULTIPLE PLANS AND IT VARIES)' 3='(3) NO' ;
  VALUE cc50_14f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES'
                  2='(2) (IF VOL: R HAS MULTIPLE PLANS AND IT VARIES)' 3='(3) NO' ;
  VALUE cc50_15f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES'
                  2='(2) (IF VOL: R HAS MULTIPLE PLANS AND IT VARIES)' 3='(3) NO' ;
  VALUE cc50_16a  .R='REFUSED' .D='DONT KNOW' 1='(1) DOLLARS' 2='(2) PERCENTAGE' ;
  VALUE cc50_17a  .R='REFUSED' .D='DONT KNOW' 1='(1) DOLLARS' 2='(2) PERCENTAGE' ;
  VALUE cc51ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) WOULD DEFINITELY GO'
                  2='(2) WOULD PROBABLY GO' 3='(3) WOULD PROBABLY NOT GO'
                  4='(4) WOULD DEFINITELY NOT GO' ;
  VALUE cc52ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY COMFORTABLE'
                  2='(2) SOMEWHAT COMFORTABLE' 3='(3) NOT VERY COMFORTABLE'
                  4='(4) NOT AT ALL COMFORTABLE' ;
  VALUE cc53ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY EMBARRASSED'
                  2='(2) SOMEWHAT EMBARRASSED' 3='(3) NOT VERY EMBARRASSED'
                  4='(4) NOT AT ALL EMBARRASSED' ;
  VALUE cc62ffff  .R='REFUSED' .D='DONT KNOW' 0='(0) NONE' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX' 7='(7) SEVEN' 8='(8) EIGHT'
                  9='(9) NINE' 10='(10) TEN OR MORE' ;
  VALUE cc64ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc66ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) COULD GET IT'
                  2='(2) COULD NOT GET IT'
                  3='(3) (IF VOL) COULD MAYBE GET IT WITH GREAT EFFORT' ;
  VALUE cc67ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc70ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc74ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc77ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc81ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cc34_10f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL FACTORS IMPORTANT'
                  2='(2) PSYCHOLOGICAL FACTORS NOT IMPORTANT' ;
  VALUE n1ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n2ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) FULLY REGAIN'
                  2='(2) STILL FEEL TIRED/WEAK' ;
  VALUE n3ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NEARLY EVERY DAY'
                  2='(2) MOST DAYS' 3='(3) ABOUT HALF THE DAYS'
                  4='(4) LESS THAN HALF THE DAYS' ;
  VALUE n4ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE n4a       .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE n5a       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n5b       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n5c       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n5d       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n5e       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n5f       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n5g       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n5h       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n7ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n7a       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n7b       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n801ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n802ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n803ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n804ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n805ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n806ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n807ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n808ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n809ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n810ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL PROBLEMS PANIC' 2='(2) ANXIETY' 3='(3) DEPRESSION'
                  4='(4) NERVES/EMOTIONS/MENTAL HEALTH'
                  5='(5) OTHER PSYCHOLOGICAL (SPECIFY)' 10='(10) STRESS OVERWORK'
                  11='(11) TENSION' 12='(12) OTHER STRESSFUL EXPERIENCE (SPECIFY)'
                  20='(20) PHYSICAL ILLNESS/INJURY/CONDITION CHRONIC FATIGUE SYNDROME'
                  21='(21) EXHAUSTION' 22='(22) HYPERVENTILATION' 23='(23) HYPOCHONDRIASIS'
                  24='(24) MENSTRUAL CYCLE' 25='(25) PREGNANCY/POSTPARTUM'
                  26='(26) HEART DISEASE' 27='(27) HIGH BLOOD PRESSURE' 28='(28) OVERWEIGHT'
                  29='(29) OTHER PHYSICAL ILLNESS (SPECIFY)'
                  30='(30) MEDICATION/DRUGS/ALCOHOL MEDICATION (SPECIFY)'
                  31='(31) DRUGS (SPECIFY)' 32='(32) ALCOHOL'
                  81='(81) OTHER NO DEFINITIVE DIAGNOSIS' 82='(82) OTHER (SPECIFY)' ;
  VALUE n10fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n13fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  6='(6) NO EXAMINATION PERFORMED' ;
  VALUE n14fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n15fffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PSYCHOLOGICAL FACTORS IMPORTANT'
                  2='(2) PSYCHOLOGICAL FACTORS NOT IMPORTANT' ;
  VALUE n16fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n17fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n17a      .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS AGO' ;
  VALUE n20b      .R='REFUSED' .D='DONT KNOW' 1='(1) MONTHS' 2='(2) YEARS' ;
  VALUE n21b      .R='REFUSED' .D='DONT KNOW' 1='(1) MONTHS' 2='(2) YEARS' ;
  VALUE n32fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n44fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n46fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE n47fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd1fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) BETTER' 2='(2) WORSE'
                  3='(3) ABOUT THE SAME' ;
  VALUE fd1a      .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOMEWHAT'
                  3='(3) A LITTLE' ;
  VALUE fd2fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE fd2a      .R='REFUSED' .D='DONT KNOW' 1='(1) MILD' 2='(2) MODERATE'
                  3='(3) SEVERE' 4='(4) VERY SEVERE' ;
  VALUE fd3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) BETTER' 2='(2) WORSE'
                  3='(3) ABOUT THE SAME' ;
  VALUE fd3a      .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOMEWHAT'
                  3='(3) A LITTLE' ;
  VALUE fd4a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd7a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd9a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd11a     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd11b     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd11c     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd11d     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd12ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd13a     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd13b     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd13c     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd15a     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd15b     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd15c     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd17a     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd17b     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd17c     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd17d     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd17e     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd18a     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd18b     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd18c     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd18d     .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) (IF VOL) CANNOT DO' ;
  VALUE fd20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) A LITTLE' 3='(3) SOME'
                  4='(4) A LOT' 5='(5) EXTREME' ;
  VALUE fd21ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) A LITTLE' 3='(3) SOME'
                  4='(4) A LOT' 5='(5) EXTREME' ;
  VALUE fd22ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) A LITTLE' 3='(3) SOME'
                  4='(4) A LOT' 5='(5) EXTREME' ;
  VALUE fd24_1b   .R='REFUSED' .D='DONT KNOW' 1='(1) MONTHS' 2='(2) YEARS' ;
  VALUE fd25ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd25a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd25b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd26ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd26a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd26b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fd26c2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) HOURS' 2='(2) DAYS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE nsd1ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1b     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1c     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1d     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1e     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1f     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1g     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1h     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1i     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1j     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1k     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1l     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1m     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd1n     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd2k     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2l     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2m     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2n     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2o     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2p     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2q     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2r     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2s     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2t     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2u     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2v     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2w     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd2x     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd3ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) MORE OFTEN' 2='(2) LESS OFTEN'
                  3='(3) ABOUT THE SAME' 4='(4) (IF VOL) NEVER HAD ANY' ;
  VALUE nsd3a     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT MORE'
                  2='(2) SOMEWHAT MORE' 3='(3) A LITTLE MORE' ;
  VALUE nsd3b     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT LESS'
                  2='(2) SOMEWHAT LESS' 3='(3) A LITTLE LESS' ;
  VALUE nsd3_1a   .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd3_1b   .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd3_1c   .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd3_1d   .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd4a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd4b     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd4c     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd4d     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd4e     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd4f     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd4g     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE nsd5a     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd5b     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd5c     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd5d     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd5e     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd5f     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd5g     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd5h     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd5i     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE nsd5j     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) LITTLE' 5='(5) NONE' ;
  VALUE tb2fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15j     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15k     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15l     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb15m     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb16_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb21ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb22ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2 TO 6 MONTHS AGO' 3='(3) 7 TO 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE tb25ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb31ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) WITHIN 5 MINUTES'
                  2='(2) WITHIN 6 - 30 MINUTES' 3='(3) WITHIN 31 - 60 MINUTES'
                  4='(4) MORE THAN 1 HOUR' 5='(5) (IF VOL) I DON T SMOKE ANYMORE' ;
  VALUE tb32ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL) I DON T SMOKE ANYMORE' ;
  VALUE tb33ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) FIRST ONE IN THE MORNING'
                  2='(2) WHILE WATCHING TV' 3='(3) SOME OTHER SMOKE'
                  4='(4) (IF VOL) I DON T SMOKE ANYMORE' ;
  VALUE tb34ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL) I DON T SMOKE ANYMORE' ;
  VALUE tb35ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  6='(6) (IF VOL) NEVER THAT SICK'
                  7='(7) (IF VOL) I DON T SMOKE ANYMORE' ;
  VALUE tb38a     .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE tb41a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb41b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb41c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE tb41d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) EARLIER' 2='(2) LATER'
                  3='(3) ABOUT THE SAME TIME' ;
  VALUE pr3a      .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOMEWHAT'
                  3='(3) A LITTLE' ;
  VALUE pr4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr4b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) STILL HAVE PERIODS'
                  2='(2) STOPPED TEMPORARILY' 3='(3) STOPPED PERMANENTLY' ;
  VALUE pr8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr121fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PREGNANCY' 2='(2) DIETING'
                  3='(3) HEAVY EXERCISE' 4='(4) BIRTH CONTROL PILLS'
                  5='(5) POSSIBLE BEGINNING OF MENAPAUSE' 6='(6) OTHER (SPECIFY)' ;
  VALUE pr122fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PREGNANCY' 2='(2) DIETING'
                  3='(3) HEAVY EXERCISE' 4='(4) BIRTH CONTROL PILLS'
                  5='(5) POSSIBLE BEGINNING OF MENAPAUSE' 6='(6) OTHER (SPECIFY)' ;
  VALUE pr13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOME OF THE TIME'
                  4='(4) A LITTLE OF THE TIME' ;
  VALUE pr16a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE pr19a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE pr20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr21ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr21a     .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS AGO' ;
  VALUE pr27ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr30ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o1a       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o1b       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o1c       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o1d       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o1e       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o1f       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o1g       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o1h       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o1i       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o3b       .R='REFUSED' .D='DONT KNOW' 1='(1) MINUTES' 2='(2) HOURS' ;
  VALUE o3c       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o5b       .R='REFUSED' .D='DONT KNOW' 1='(1) MINUTES' 2='(2) HOURS' ;
  VALUE o5c       .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o7ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE o8ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE o10fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) RARELY' 5='(5) NEVER' ;
  VALUE o10a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o11fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o12fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE o13fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE o14fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o16fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o16a      .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS AGO' ;
  VALUE o17b      .R='REFUSED' .D='DONT KNOW' 1='(1) MINUTES' 2='(2) HOURS' ;
  VALUE o18fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE o19fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) A LITTLE' 3='(3) SOME'
                  4='(4) A LOT' 5='(5) EXTREME' ;
  VALUE o20fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) A LITTLE' 3='(3) SOME'
                  4='(4) A LOT' 5='(5) TOTAL' ;
  VALUE o22fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o22a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o23fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o24fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE o24a      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE o25fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o25a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o26fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o28fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o28a      .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS AGO' ;
  VALUE o29b      .R='REFUSED' .D='DONT KNOW' 1='(1) MINUTES' 2='(2) HOURS' ;
  VALUE o30fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE o30a      .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE o31fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) A LITTLE' 3='(3) SOME'
                  4='(4) A LOT' 5='(5) EXTREME' ;
  VALUE o32fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) A LITTLE' 3='(3) SOME'
                  4='(4) A LOT' 5='(5) TOTAL' ;
  VALUE o37a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o37b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o37c01ff  .R='REFUSED' .D='DONT KNOW' 1='(1) EXHAUSTION'
                  2='(2) MENSTRUAL CYCLE' 3='(3) PREGNANCY/POSTPARTUM'
                  4='(4) HEART DISEASE' 5='(5) THYROID DISEASE' 6='(6) CANCER'
                  7='(7) OVERWEIGHT' 8='(8) INFECTION'
                  9='(9) OTHER PHYSICAL ILLNESS OR INJURY (SPECIFY)'
                  10='(10) MEDICATION (SPECIFY BELOW)' 11='(11) DRUGS (SPECIFY BELOW)'
                  12='(12) ALCOHOL' 13='(13) NO DEFINITIVE DIAGNOSIS'
                  14='(14) OTHER (SPECIFY BELOW)' ;
  VALUE o37c02ff  .R='REFUSED' .D='DONT KNOW' 1='(1) EXHAUSTION'
                  2='(2) MENSTRUAL CYCLE' 3='(3) PREGNANCY/POSTPARTUM'
                  4='(4) HEART DISEASE' 5='(5) THYROID DISEASE' 6='(6) CANCER'
                  7='(7) OVERWEIGHT' 8='(8) INFECTION'
                  9='(9) OTHER PHYSICAL ILLNESS OR INJURY (SPECIFY)'
                  10='(10) MEDICATION (SPECIFY BELOW)' 11='(11) DRUGS (SPECIFY BELOW)'
                  12='(12) ALCOHOL' 13='(13) NO DEFINITIVE DIAGNOSIS'
                  14='(14) OTHER (SPECIFY BELOW)' ;
  VALUE o45fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o45b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o45b3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o47b      .R='REFUSED' .D='DONT KNOW' 1='(1) WEEKS' 2='(2) MONTHS' 3='(3) YEARS' ;
  VALUE o53a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o67fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o69fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o70fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1a1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1b1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1c1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1d1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1e1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps1f1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps81ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) SCHIZOPHRENIA/PSYCHOSIS'
                  2='(2) MANIC-DEPRESSION/MANIA'
                  3='(3) EMOTIONS/NERVES/MENTAL HEALTH'
                  4='(4) PHYSICAL ILLNESS/INJURY' 5='(5) MEDICATION/DRUGS/ALCOHOL'
                  6='(6) OTHER (SPECIFY)' ;
  VALUE ps82ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) SCHIZOPHRENIA/PSYCHOSIS'
                  2='(2) MANIC-DEPRESSION/MANIA'
                  3='(3) EMOTIONS/NERVES/MENTAL HEALTH'
                  4='(4) PHYSICAL ILLNESS/INJURY' 5='(5) MEDICATION/DRUGS/ALCOHOL'
                  6='(6) OTHER (SPECIFY)' ;
  VALUE ps83ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) SCHIZOPHRENIA/PSYCHOSIS'
                  2='(2) MANIC-DEPRESSION/MANIA'
                  3='(3) EMOTIONS/NERVES/MENTAL HEALTH'
                  4='(4) PHYSICAL ILLNESS/INJURY' 5='(5) MEDICATION/DRUGS/ALCOHOL'
                  6='(6) OTHER (SPECIFY)' ;
  VALUE ps84ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) SCHIZOPHRENIA/PSYCHOSIS'
                  2='(2) MANIC-DEPRESSION/MANIA'
                  3='(3) EMOTIONS/NERVES/MENTAL HEALTH'
                  4='(4) PHYSICAL ILLNESS/INJURY' 5='(5) MEDICATION/DRUGS/ALCOHOL'
                  6='(6) OTHER (SPECIFY)' ;
  VALUE ps10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ps10a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm1fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-50 TIMES' 4='(4) 51-100 TIMES' 5='(5) 101-500 TIMES'
                  6='(6) 501-1000 TIMES' 7='(7) MORE THAN 1000' ;
  VALUE gm1_1a    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1b    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1c    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1d    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1e    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1f    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1g    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1h    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1i    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1j    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm1_1k    .R='REFUSED' .D='DONT KNOW' 1='(1) NEVER' 2='(2) 1-10 TIMES'
                  3='(3) 11-100 TIMES' 4='(4) 101-500 TIMES' 5='(5) MORE THAN 500 TIMES' ;
  VALUE gm4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm29ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) AHEAD' 2='(2) BEHIND'
                  3='(3) (IF VOL) BROKE EVEN' ;
  VALUE gm30ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm31ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALONE' 2='(2) WITH FRIENDS'
                  3='(3) (IF VOL) WITH SPOUSE/PARTNER' ;
  VALUE gm32ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) INSTANT SCRATCH-OFF'
                  2='(2) WAIT TO LEARN IF WON' 3='(3) (IF VOL) NO PREFERENCE'
                  4='(4) (IF VOL) WOULDN T BUY EITHER' ;
  VALUE gm35ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALONE' 2='(2) WITH FRIENDS'
                  3='(3) (IF VOL) WITH SPOUSE/PARTNER' ;
  VALUE gm36ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) INSTANT SCRATCH-OFF'
                  2='(2) WAIT TO LEARN IF WON' 3='(3) (IF VOL) NO PREFERENCE'
                  4='(4) (IF VOL) WOULDN T BUY EITHER' ;
  VALUE gm37a     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE gm37b     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE gm37c     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE gm37d     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE gm38a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE gm38b     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE gm38c     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE gm8a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm8b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm8c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm8d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10j     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm10k     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm14b     .R='REFUSED' .D='DONT KNOW' 1='(1) DAY' 2='(2) MONTH' 3='(3) YEAR' ;
  VALUE gm16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm16a1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm16a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2 TO 6 MONTHS AGO' 3='(3) 7 TO 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE gm20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm20b1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm20b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm21ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2 TO 6 MONTHS AGO' 3='(3) 7 TO 12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE gm22a1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm22a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm24ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm25a1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm25a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm40ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm41ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE gm43ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE wu101fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu102fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu103fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu104fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu105fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu106fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu107fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu108fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu109fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu110fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu111fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu2fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) NOT VERY MUCH'
                  3='(3) (IF VOL) HARDLY AT ALL' ;
  VALUE wu301fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu302fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu303fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu304fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu305fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu306fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu307fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu308fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu309fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu310fff  .R='REFUSED' .D='DONT KNOW' 1='(1) ECONOMIC AND MATERIAL'
                  2='(2) CHILDREN' 3='(3) MARRIAGE' 4='(4) OTHER INTERPERSONAL' 5='(5) JOB'
                  6='(6) R S HEALTH' 7='(7) FAMILY S HEALTH' 8='(8) INDEPENDENCE'
                  9='(9) PERSONAL CHARACTERISTICS'
                  10='(10) COMMUNITY, NATIONAL, OR WORLD PROBLEMS'
                  11='(11) OTHERS (SPECIFY)' 97='(97) (IF VOL) NOTHING' ;
  VALUE wu4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY HAPPY' 2='(2) PRETTY HAPPY'
                  3='(3) NOT TOO HAPPY' ;
  VALUE wu5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) NOT MUCH'
                  4='(4) HARDLY EVER' 5='(5) (IF VOL) NEVER' ;
  VALUE wu6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE wu6a      .R='REFUSED' .D='DONT KNOW' 1='(1) MANY TIMES' 2='(2) SOMETIMES'
                  3='(3) JUST ONCE IN A WHILE' ;
  VALUE wu6c      .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' 997='(997) IT S HAPPENING RIGHT NOW' ;
  VALUE em4b      .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE em601fff  .R='REFUSED' .D='DONT KNOW' 1='(1) COULD NOT FIND WORK'
                  2='(2) PHYSICAL INJURY OR ILLNESS'
                  3='(3) MENTAL OR EMOTIONAL PROBLEMS'
                  4='(4) ALCOHOL OR SUBSTANCE ABUSE'
                  5='(5) FAMILY RESPONSIBILITIES; CARING FOR CHILDREN, SPOUSE, OR PAR'
                  6='(6) ATTENDING SCHOOL' 7='(7) CHOSE NOT TO WORK' 8='(8) FIRED'
                  9='(9) LAID OFF' 10='(10) BREAK BETWEEN JOBS' 11='(11) OTHER (SPECIFY)' ;
  VALUE em602fff  .R='REFUSED' .D='DONT KNOW' 1='(1) COULD NOT FIND WORK'
                  2='(2) PHYSICAL INJURY OR ILLNESS'
                  3='(3) MENTAL OR EMOTIONAL PROBLEMS'
                  4='(4) ALCOHOL OR SUBSTANCE ABUSE'
                  5='(5) FAMILY RESPONSIBILITIES; CARING FOR CHILDREN, SPOUSE, OR PAR'
                  6='(6) ATTENDING SCHOOL' 7='(7) CHOSE NOT TO WORK' 8='(8) FIRED'
                  9='(9) LAID OFF' 10='(10) BREAK BETWEEN JOBS' 11='(11) OTHER (SPECIFY)' ;
  VALUE em603fff  .R='REFUSED' .D='DONT KNOW' 1='(1) COULD NOT FIND WORK'
                  2='(2) PHYSICAL INJURY OR ILLNESS'
                  3='(3) MENTAL OR EMOTIONAL PROBLEMS'
                  4='(4) ALCOHOL OR SUBSTANCE ABUSE'
                  5='(5) FAMILY RESPONSIBILITIES; CARING FOR CHILDREN, SPOUSE, OR PAR'
                  6='(6) ATTENDING SCHOOL' 7='(7) CHOSE NOT TO WORK' 8='(8) FIRED'
                  9='(9) LAID OFF' 10='(10) BREAK BETWEEN JOBS' 11='(11) OTHER (SPECIFY)' ;
  VALUE em604fff  .R='REFUSED' .D='DONT KNOW' 1='(1) COULD NOT FIND WORK'
                  2='(2) PHYSICAL INJURY OR ILLNESS'
                  3='(3) MENTAL OR EMOTIONAL PROBLEMS'
                  4='(4) ALCOHOL OR SUBSTANCE ABUSE'
                  5='(5) FAMILY RESPONSIBILITIES; CARING FOR CHILDREN, SPOUSE, OR PAR'
                  6='(6) ATTENDING SCHOOL' 7='(7) CHOSE NOT TO WORK' 8='(8) FIRED'
                  9='(9) LAID OFF' 10='(10) BREAK BETWEEN JOBS' 11='(11) OTHER (SPECIFY)' ;
  VALUE em605fff  .R='REFUSED' .D='DONT KNOW' 1='(1) COULD NOT FIND WORK'
                  2='(2) PHYSICAL INJURY OR ILLNESS'
                  3='(3) MENTAL OR EMOTIONAL PROBLEMS'
                  4='(4) ALCOHOL OR SUBSTANCE ABUSE'
                  5='(5) FAMILY RESPONSIBILITIES; CARING FOR CHILDREN, SPOUSE, OR PAR'
                  6='(6) ATTENDING SCHOOL' 7='(7) CHOSE NOT TO WORK' 8='(8) FIRED'
                  9='(9) LAID OFF' 10='(10) BREAK BETWEEN JOBS' 11='(11) OTHER (SPECIFY)' ;
  VALUE em7e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  6='(6) (IF VOL) RETIRED' 7='(7) (IF VOL) DISABLED'
                  8='(8) (IF VOL) UNABLE TO WORK' ;
  VALUE em7f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em7h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  6='(6) (IF VOL) RETIRED' 7='(7) (IF VOL) DISABLED'
                  8='(8) (IF VOL) UNABLE TO WORK' ;
  VALUE em7i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em7j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em7k      .R='REFUSED' .D='DONT KNOW'
                  1='(1) ON LAYOFF (TEMPORARY OR INDEFINITE)'
                  2='(2) SLACK WORK/BUSINESS CONDITIONS'
                  3='(3) WAITING FOR A NEW JOB TO BEGIN'
                  4='(4) VACATION/PERSONAL DAYS'
                  5='(5) OWN ILLNESS/INJURY/MEDICAL PROBLEMS'
                  6='(6) CHILD CARE PROBLEMS'
                  7='(7) OTHER FAMILY/PERSONAL OBLIGATIONS'
                  8='(8) MATERNITY/PATERNITY LEAVE' 9='(9) LABOR DISPUTE'
                  10='(10) WEATHER AFFECTED JOB' 11='(11) SCHOOL TRAINING'
                  12='(12) CIVIC/MILITARY DUTY' 13='(13) DOES NOT WORK IN THE BUSINESS'
                  14='(14) OTHER (PLEASE SPECIFY)' ;
  VALUE em10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL' 2='(2) EMOTIONAL'
                  3='(3) COMBINATION' 4='(4) (IF VOL: MATERNITY)' 5='(5) OTHER (SPECIFY)' ;
  VALUE em10_1b   .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE em11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em12b     .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE em141fff  .R='REFUSED' .D='DONT KNOW' 1='(1) FIRED' 2='(2) LAID OFF'
                  3='(3) PLANT/COMPANY CLOSED' 4='(4) QUIT' 5='(5) RETIRED'
                  6='(6) (IF VOL: WORK FORCE REDUCTION)'
                  7='(7) (IF VOL: RETURN TO SCHOOL)' 8='(8) OTHER (SPECIFY)' ;
  VALUE em142fff  .R='REFUSED' .D='DONT KNOW' 1='(1) FIRED' 2='(2) LAID OFF'
                  3='(3) PLANT/COMPANY CLOSED' 4='(4) QUIT' 5='(5) RETIRED'
                  6='(6) (IF VOL: WORK FORCE REDUCTION)'
                  7='(7) (IF VOL: RETURN TO SCHOOL)' 8='(8) OTHER (SPECIFY)' ;
  VALUE em18ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) SELF-EMPLOYED'
                  2='(2) NOT SELF-EMPLOYED' ;
  VALUE em22ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em22a     .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL' 2='(2) EMOTIONAL'
                  3='(3) COMBINATION' 4='(4) (IF VOL:) MATERNITY' 5='(5) OTHER (SPECIFY)' ;
  VALUE em23ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em23a     .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL' 2='(2) EMOTIONAL'
                  3='(3) COMBINATION' 4='(4) (IF VOL: MATERNITY)' 5='(5) OTHER (SPECIFY)' ;
  VALUE em251fff  .R='REFUSED' .D='DONT KNOW' 1='(1) R S OWN HEALTH'
                  2='(2) HEALTH OF SOMEONE ELSE' 3='(3) SOME OTHER REASON' ;
  VALUE em252fff  .R='REFUSED' .D='DONT KNOW' 1='(1) R S OWN HEALTH'
                  2='(2) HEALTH OF SOMEONE ELSE' 3='(3) SOME OTHER REASON' ;
  VALUE em291fff  .R='REFUSED' .D='DONT KNOW' 1='(1) R S OWN HEALTH'
                  2='(2) HEALTH OF SOMEONE ELSE' 3='(3) SOME OTHER REASON' ;
  VALUE em292fff  .R='REFUSED' .D='DONT KNOW' 1='(1) R S OWN HEALTH'
                  2='(2) HEALTH OF SOMEONE ELSE' 3='(3) SOME OTHER REASON' ;
  VALUE em36a     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em36b     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em36c     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em36d     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em36e     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em36f     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em36g     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em36h     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em36i     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em36j     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NONE' ;
  VALUE em40ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em41ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em42ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE em43ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE se2fffff  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE se5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE se6b      .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE fn12ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) WOULD HAVE MONEY LEFT OVER'
                  2='(2) WOULD STILL OWE MONEY'
                  3='(3) DEBTS WOULD JUST ABOUT EQUAL ASSESTS' ;
  VALUE fn14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) MORE THAN NEED'
                  2='(2) JUST ENOUGH' 3='(3) NOT ENOUGH' ;
  VALUE fn14a     .R='REFUSED' .D='DONT KNOW' 1='(1) VERY DIFFICULT'
                  2='(2) SOMEWHAT DIFFICULT' 3='(3) NOT VERY DIFFICULT'
                  4='(4) NOT AT ALL DIFFICULT' ;
  VALUE fn15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fn16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fn18ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) (IF VOL) NEVER' ;
  VALUE fn19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) (IF VOL) NEVER' ;
  VALUE mr1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE mr10_0ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YOUNGER' 2='(2) OLDER'
                  3='(3) SAME AGE' ;
  VALUE mr10_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE mr11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE mr12ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE mr13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE mr15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) RESPONDENT' 2='(2) PARTNER'
                  3='(3) (IF VOL) IT VARIED' ;
  VALUE mr20a     .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE mr23ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) DIVORCED' 2='(2) WIDOWED' ;
  VALUE mr25_4b   .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE mr35a     .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE mr36a     .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE mr40a     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE mr40b     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE mr40c     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE mr40d     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE mr40e     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE mr40f     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE mr40g     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE mr40h     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE mr40i     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL OF THE TIME'
                  2='(2) MOST OF THE TIME' 3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE mr41ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) RESPONDENT'
                  2='(2) (IF VOL) BOTH/IT VARIES' 3='(3) SPOUSE/PARTNER' ;
  VALUE mr41a     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOMEWHAT'
                  3='(3) A LITTLE' ;
  VALUE mr41b     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOMEWHAT'
                  3='(3) A LITTLE' ;
  VALUE mr41_1a   .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE mr41_1b   .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE mr41_1c   .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE mr41_1d   .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE mr41_2a   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr41_2b   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr41_2c   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr41_2d   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr42ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr43ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr44ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr45ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr47ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) RESPONDENT'
                  2='(2) SPOUSE OR PARTNER' 3='(3) IT VARIES' ;
  VALUE mr49a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr49b     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr49c     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr49d     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr49e     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr49f     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr49g     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr49h     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr50ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE mr53a     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr53b     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr53c     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr53d     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE mr53e     .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cn1aa     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn1bb     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn1cc     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn2aa     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn2bb     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn2cc     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn5a      .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE OR MORE' ;
  VALUE cn6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn6a      .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE'
                  2='(2) TWO OR MORE' ;
  VALUE cn7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn7a      .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE'
                  2='(2) TWO OR MORE' ;
  VALUE cn7d      .R='REFUSED' .D='DONT KNOW' 1='(1) SUICIDE' 2='(2) MURDER'
                  3='(3) ACCIDENT' 4='(4) ILLNESS' 5='(5) OTHER' ;
  VALUE cn7d_10f  .R='REFUSED' .D='DONT KNOW' 3='(3) ACCIDENT' 4='(4) ILLNESS'
                  5='(5) OTHER' ;
  VALUE cn7d_11f  .R='REFUSED' .D='DONT KNOW' 3='(3) ACCIDENT' 4='(4) ILLNESS'
                  5='(5) OTHER' ;
  VALUE cn7d_12f  .R='REFUSED' .D='DONT KNOW' 1='(1) SUICIDE' 2='(2) MURDER'
                  3='(3) ACCIDENT' 4='(4) ILLNESS' 5='(5) OTHER' ;
  VALUE cn7d_13f  .R='REFUSED' .D='DONT KNOW' 1='(1) SUICIDE' 2='(2) MURDER'
                  3='(3) ACCIDENT' 4='(4) ILLNESS' 5='(5) OTHER' ;
  VALUE cn7d_14f  .R='REFUSED' .D='DONT KNOW' 1='(1) SUICIDE' 2='(2) MURDER'
                  3='(3) ACCIDENT' 4='(4) ILLNESS' 5='(5) OTHER' ;
  VALUE cn7d_15f  .R='REFUSED' .D='DONT KNOW' 1='(1) SUICIDE' 2='(2) MURDER'
                  3='(3) ACCIDENT' 4='(4) ILLNESS' 5='(5) OTHER' ;
  VALUE cn7d_16f  .R='REFUSED' .D='DONT KNOW' 1='(1) SUICIDE' 2='(2) MURDER'
                  3='(3) ACCIDENT' 4='(4) ILLNESS' 5='(5) OTHER' ;
  VALUE cn7d_17f  .R='REFUSED' .D='DONT KNOW' 1='(1) SUICIDE' 2='(2) MURDER'
                  3='(3) ACCIDENT' 4='(4) ILLNESS' 5='(5) OTHER' ;
  VALUE cn7d_18f  .R='REFUSED' .D='DONT KNOW' 1='(1) SUICIDE' 2='(2) MURDER'
                  3='(3) ACCIDENT' 4='(4) ILLNESS' 5='(5) OTHER' ;
  VALUE cn7d_19f  .R='REFUSED' .D='DONT KNOW' 1='(1) SUICIDE' 2='(2) MURDER'
                  3='(3) ACCIDENT' 4='(4) ILLNESS' 5='(5) OTHER' ;
  VALUE cn7_2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cn10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE cn11_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) A' 2='(2) B' 3='(3) C' 4='(4) D' 5='(5) E' ;
  VALUE cn11_5ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALWAYS' 2='(2) MOST OF THE TIME'
                  3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' 6='(6) DOES NOT APPLY' ;
  VALUE sn1fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) MOST EVERY DAY'
                  2='(2) A FEW TIMES A WEEK' 3='(3) A FEW TIMES A MONTH'
                  4='(4) ONCE A MONTH' 5='(5) LESS THAN ONCE A MONTH' ;
  VALUE sn2fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sn3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sn4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOME' 3='(3) RARELY'
                  4='(4) NEVER' ;
  VALUE sn5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOME' 3='(3) RARELY'
                  4='(4) NEVER' ;
  VALUE sn6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) MOST EVERY DAY'
                  2='(2) A FEW TIMES A WEEK' 3='(3) A FEW TIMES A MONTH'
                  4='(4) ONCE A MONTH' 5='(5) LESS THAN ONCE A MONTH' ;
  VALUE sn7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sn8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sn9fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOME' 3='(3) RARELY'
                  4='(4) NEVER' ;
  VALUE sn10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOME' 3='(3) RARELY'
                  4='(4) NEVER' ;
  VALUE sn12ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALWAYS' 2='(2) MOST OF THE TIME'
                  3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE sn13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALWAYS' 2='(2) MOST OF THE TIME'
                  3='(3) SOMETIMES' 4='(4) RARELY' 5='(5) NEVER' ;
  VALUE sn14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sn15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE sn16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE da27ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY CLOSELY'
                  2='(2) SOMEWHAT CLOSELY' 3='(3) NOT VERY CLOSELY' 4='(4) NOT AT ALL' ;
  VALUE da28ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY CLOSE'
                  2='(2) SOMEWHAT CLOSE' 3='(3) NOT VERY CLOSE' 4='(4) NOT AT ALL' ;
  VALUE da29ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NONE' ;
  VALUE da30ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY IMPORTANT'
                  2='(2) SOMEWHAT IMPORTANT' 3='(3) NOT VERY IMPORTANT'
                  4='(4) NOT AT ALL IMPORTANT' ;
  VALUE da31ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da31a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da33ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) MORE THAN ONCE A WEEK'
                  2='(2) ABOUT ONCE A WEEK' 3='(3) ONE TO THREE TIMES A MONTH'
                  4='(4) LESS THAN ONCE A MONTH' 5='(5) NEVER' ;
  VALUE da34ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY IMPORTANT'
                  2='(2) SOMEWHAT IMPORTANT' 3='(3) NOT VERY IMPORTANT'
                  4='(4) NOT AT ALL IMPORTANT' ;
  VALUE da35ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE da36ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE da36_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da36_1af  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE da36_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da39ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da39c     .R='REFUSED' .D='DONT KNOW' 1='(1) ILLNESS' 2='(2) ACCIDENT/INJURY'
                  3='(3) HOMICIDE' 4='(4) SUICIDE' 5='(5) OTHER' ;
  VALUE da48ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE da41c     .R='REFUSED' .D='DONT KNOW' 1='(1) ILLNESS' 2='(2) ACCIDENT/INJURY'
                  3='(3) HOMICIDE' 4='(4) SUICIDE' 5='(5) OTHER' ;
  VALUE dm_de4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) UNITED STATES' 2='(2) OTHER' ;
  VALUE de5_1fff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE'
                  2='(2) TWO OR MORE' ;
  VALUE de7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE de8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES'
                  2='(2) (IF VOL) NOT VERY WELL' 3='(3) NO' ;
  VALUE de9_3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE de9_7fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE de20_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE de20_2a   .R='REFUSED' .D='DONT KNOW' 0='(0) NONE' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX' 7='(7) SEVEN' 8='(8) EIGHT'
                  9='(9) NINE' 10='(10) TEN OR MORE' ;
  VALUE de20_40f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_41f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_42f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_43f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_44f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_45f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_46f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_47f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_48f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_49f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_10f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_11f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_12f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_13f  .R='REFUSED' .D='DONT KNOW' 1='(1) KINDERGARTEN'
                  2='(2) FIRST GRADE' 3='(3) SECOND GRADE' 4='(4) THIRD GRADE'
                  5='(5) FOURTH GRADE' 6='(6) FIFTH GRADE' 7='(7) SIXTH GRADE'
                  8='(8) SEVENTH GRADE' 9='(9) EIGHTH GRADE'
                  10='(10) HIGH SCHOOL FRESHMAN' 11='(11) HIGH SCHOOL SOPHOMORE'
                  12='(12) HIGH SCHOOL JUNIOR' 13='(13) HIGH SCHOOL SENIOR'
                  14='(14) ANY COLLEGE' ;
  VALUE de20_5ff  .R='REFUSED' .D='DONT KNOW' 0='(0) NONE' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX' 7='(7) SEVEN' 8='(8) EIGHT'
                  9='(9) NINE' 10='(10) TEN OR MORE' ;
  VALUE de20_7ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE de20_81f  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN FIFTH GRADE'
                  2='(2) FIFTH GRADE' 3='(3) SIXTH GRADE' 4='(4) SEVENTH GRADE'
                  5='(5) EIGHTH GRADE' 6='(6) NINTH GRADE'
                  7='(7) GREATER THAN NINTH GRADE' ;
  VALUE de20_82f  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN FIFTH GRADE'
                  2='(2) FIFTH GRADE' 3='(3) SIXTH GRADE' 4='(4) SEVENTH GRADE'
                  5='(5) EIGHTH GRADE' 6='(6) NINTH GRADE'
                  7='(7) GREATER THAN NINTH GRADE' ;
  VALUE de20_83f  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN FIFTH GRADE'
                  2='(2) FIFTH GRADE' 3='(3) SIXTH GRADE' 4='(4) SEVENTH GRADE'
                  5='(5) EIGHTH GRADE' 6='(6) NINTH GRADE'
                  7='(7) GREATER THAN NINTH GRADE' ;
  VALUE de20_84f  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN FIFTH GRADE'
                  2='(2) FIFTH GRADE' 3='(3) SIXTH GRADE' 4='(4) SEVENTH GRADE'
                  5='(5) EIGHTH GRADE' 6='(6) NINTH GRADE'
                  7='(7) GREATER THAN NINTH GRADE' ;
  VALUE de20_85f  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN FIFTH GRADE'
                  2='(2) FIFTH GRADE' 3='(3) SIXTH GRADE' 4='(4) SEVENTH GRADE'
                  5='(5) EIGHTH GRADE' 6='(6) NINTH GRADE'
                  7='(7) GREATER THAN NINTH GRADE' ;
  VALUE de20_86f  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN FIFTH GRADE'
                  2='(2) FIFTH GRADE' 3='(3) SIXTH GRADE' 4='(4) SEVENTH GRADE'
                  5='(5) EIGHTH GRADE' 6='(6) NINTH GRADE'
                  7='(7) GREATER THAN NINTH GRADE' ;
  VALUE de20_8a   .R='REFUSED' .D='DONT KNOW' 1='(1) YOUNGER' 2='(2) OLDER'
                  3='(3) AVERAGE' 4='(4) (IF VOL) IT VARIED' ;
  VALUE de20_14f  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY IMPORTANT'
                  2='(2) SOMEWHAT IMPORTANT' 3='(3) NOT VERY IMPORTANT'
                  4='(4) NOT AT ALL IMPORTANT' ;
  VALUE de20_15f  .R='REFUSED' .D='DONT KNOW' 1='(1) LARGE CITY' 2='(2) SUBURBS'
                  3='(3) SMALL CITY' 4='(4) TOWN/VILLAGE' 5='(5) RURAL AREA'
                  6='(6) (IF VOL) MOVED AROUND' ;
  VALUE de20_16f  .R='REFUSED' .D='DONT KNOW' 0='(0) NONE' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX' 7='(7) SEVEN' 8='(8) EIGHT'
                  9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN' 12='(12) TWELVE' 13='(13) THIRTEEN'
                  14='(14) FOURTEEN' 15='(15) FIFTEEN OR MORE' ;
  VALUE ch1fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch2_11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER DIED'
                  4='(4) PARENTS SEPARATED/DIVORCED/NEVER LIVED TOGETHER'
                  7='(7) FOSTER CARE' 8='(8) LEFT HOME BEFORE AGE SIXTEEN' 9='(9) OTHER' ;
  VALUE ch2_12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER DIED'
                  4='(4) PARENTS SEPARATED/DIVORCED/NEVER LIVED TOGETHER'
                  7='(7) FOSTER CARE' 8='(8) LEFT HOME BEFORE AGE SIXTEEN' 9='(9) OTHER' ;
  VALUE ch2_13ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER DIED'
                  4='(4) PARENTS SEPARATED/DIVORCED/NEVER LIVED TOGETHER'
                  7='(7) FOSTER CARE' 8='(8) LEFT HOME BEFORE AGE SIXTEEN' 9='(9) OTHER' ;
  VALUE ch2_14ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER DIED'
                  4='(4) PARENTS SEPARATED/DIVORCED/NEVER LIVED TOGETHER'
                  7='(7) FOSTER CARE' 8='(8) LEFT HOME BEFORE AGE SIXTEEN' 9='(9) OTHER' ;
  VALUE ch3_1fff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE OR MORE' ;
  VALUE ch3_2fff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE OR MORE' ;
  VALUE ch6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch6a1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) LIVING WITH OTHER RELATIVES'
                  6='(6) OTHER (SPECIFY)' ;
  VALUE ch6a2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) LIVING WITH OTHER RELATIVES'
                  6='(6) OTHER (SPECIFY)' ;
  VALUE ch6a3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) LIVING WITH OTHER RELATIVES'
                  6='(6) OTHER (SPECIFY)' ;
  VALUE ch6ca     .R='REFUSED' .D='DONT KNOW' 1='(1) MONTHS' 2='(2) YEARS' ;
  VALUE ch8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL FATHER'
                  2='(2) ADOPTIVE FATHER/STEP FATHER (SPOUSE/PARTNER OF MOTHER)'
                  4='(4) OTHER MALE (SPECIFY)' 5='(5) NO MALE IN HOUSEHOLD'
                  6='(6) LIVED WITH DIFFERENT MALE FIGURES' ;
  VALUE ch8a      .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE ch9fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NOT AT ALL' ;
  VALUE ch13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL MOTHER'
                  2='(2) ADOPTIVE MOTHER/STEP MOTHER (SPOUSE/PARTNER OF FATHER)'
                  4='(4) OTHER FEMALE (SPECIFY)' 5='(5) NO FEMALE IN HOUSEHOLD'
                  6='(6) LIVED WITH DIFFERENT FEMALE FIGURES' ;
  VALUE ch13a     .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE ch14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' 5='(5) NOT AT ALL' ;
  VALUE ch19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch28ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ch28a1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL FATHER'
                  3='(3) ADOPTIVE/STEP FATHER' 4='(4) BIOLOGICAL MOTHER'
                  6='(6) ADOPTIVE/STEP MOTHER' 7='(7) BROTHER/SISTER'
                  8='(8) OTHER PERSON' ;
  VALUE ch28a2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL FATHER'
                  3='(3) ADOPTIVE/STEP FATHER' 4='(4) BIOLOGICAL MOTHER'
                  6='(6) ADOPTIVE/STEP MOTHER' 7='(7) BROTHER/SISTER'
                  8='(8) OTHER PERSON' ;
  VALUE ch28a3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL FATHER'
                  3='(3) ADOPTIVE/STEP FATHER' 4='(4) BIOLOGICAL MOTHER'
                  6='(6) ADOPTIVE/STEP MOTHER' 7='(7) BROTHER/SISTER'
                  8='(8) OTHER PERSON' ;
  VALUE ch28a4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL FATHER'
                  3='(3) ADOPTIVE/STEP FATHER' 4='(4) BIOLOGICAL MOTHER'
                  6='(6) ADOPTIVE/STEP MOTHER' 7='(7) BROTHER/SISTER'
                  8='(8) OTHER PERSON' ;
  VALUE ch29ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ch30_1a   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ch30_1b   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ch30_1c   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ch30_1d   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ch30_1e   .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE ch38ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL MOTHER'
                  2='(2) ADOPTIVE MOTHER/STEPMOTHER/FOSTER MOTHER'
                  5='(5) OTHER FEMALE RELATIVE' 7='(7) NO WOMAN' 8='(8) OTHER (SPECIFY)' ;
  VALUE ch39_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY' 2='(2) SOMEWHAT'
                  3='(3) NOT VERY' 4='(4) NOT AT ALL' ;
  VALUE ch40a     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch40f     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch40h     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch40i     .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch41ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch41a     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' ;
  VALUE ch42ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch44ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch44a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch45ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch46ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch46a     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' ;
  VALUE ch47ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch49ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch49a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch50ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch51ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch51a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch52ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch56ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' ;
  VALUE ch59ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch59a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch60ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch61ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch62ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch63ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch64ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch66ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch67ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch68ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL FATHER'
                  2='(2) ADOPTIVE FATHER/STEPFATHER/FOSTER FATHER'
                  5='(5) OTHER MALE RELATIVE' 6='(6) BABYSITTER' 7='(7) NO MAN'
                  8='(8) OTHER (SPECIFY)' ;
  VALUE ch69_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY' 2='(2) SOMEWHAT'
                  3='(3) NOT VERY' 4='(4) NOT AT ALL' ;
  VALUE ch69_2a   .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch69_2b   .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch69_2c   .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch69_2d   .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch71ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch71a     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' ;
  VALUE ch72ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch74ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch74a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch75ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch76ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch76a     .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' ;
  VALUE ch77ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch79ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch79a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch80ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch81ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch81a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch82ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch86ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) SOME'
                  4='(4) A LITTLE' ;
  VALUE ch89ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch89a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch90ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE ch91ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch92ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch93ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch94ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch96ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ch97ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad1c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad1d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad1e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad1f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad1g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad1h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad1i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad3b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad3b3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad3b4fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad6a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad6b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad6c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad6d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad25ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad27ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad28ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30j     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad30k     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad32ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad33ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad35a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad35b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad35c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad35d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad43_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad43_1b   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad43_1f   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad43_1g   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od1k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od3b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od3b3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE od12ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od23ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od25ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE od26ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd1k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd7b1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd7b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd9fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) IF VOL: NOT AT ALL'
                  2='(2) A LITTLE' 3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE cd16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd16a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd16b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd16c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd16d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd16e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd16f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd18ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd22ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) IF VOL: NOT AT ALL'
                  2='(2) A LITTLE' 3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE cd32ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd33ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE cd37ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1j      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa1k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) JUST ABOUT EVERY DAY'
                  2='(2) MOST DAYS' 3='(3) ABOUT HALF THE DAYS' 4='(4) LESS THAN HALF' ;
  VALUE sa5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) MILD' 2='(2) MODERATE'
                  3='(3) SEVERE' 4='(4) VERY SEVERE' ;
  VALUE sa6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE sa7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE sa7a      .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE sa8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa8b2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa8b3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11i     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11j     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11k     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11l     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11m     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa11n     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) JUST ABOUT EVERY DAY'
                  2='(2) MOST DAYS' 3='(3) ABOUT HALF THE DAYS'
                  4='(4) LESS THAN HALF THE DAYS' ;
  VALUE sa15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) MILD' 2='(2) MODERATE'
                  3='(3) SEVERE' 4='(4) VERY SEVERE' ;
  VALUE sa16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE sa17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE sa18ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) OFTEN' 2='(2) SOMETIMES'
                  3='(3) RARELY' 4='(4) NEVER' ;
  VALUE sa19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa19b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa19b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa20a     .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) MORE THAN 6 MONTHS AGO' ;
  VALUE sa43ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa44ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa46ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE sa47ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6a11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a13ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a14ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a15ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6a16ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6b11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6b12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6b13ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6b14ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6c11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c13ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c14ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c15ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6c16ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6d      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6d11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6d12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6e      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6e11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6e12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6f      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6f11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6f12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6f13ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6f14ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6g      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6g11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6g12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6g13ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6g14ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6h11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h13ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h14ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6h15ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6i11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i13ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i14ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6i15ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6j11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6k      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb6k11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6k12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6k13ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6l11ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb6l12ff  .R='REFUSED' .D='DONT KNOW' 2='(2) MOTHER/FATHER'
                  4='(4) BROTHER/SISTER' 6='(6) SON/DAUGHTER' 7='(7) SPOUSE/PARTNER' ;
  VALUE fb8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE fb9a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb9b      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb9c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE fb13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE fb14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NOT AT ALL' ;
  VALUE fb15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pp1fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pp1aa     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE t1ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE t2ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE t3ffffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE t3a01fff  .R='REFUSED' .D='DONT KNOW' 4='(4) FAMILY MEMBER'
                  6='(6) OTHER RELATIVE'
                  8='(8) FRIEND/NEIGHBOR/COWORKER/ACQUAINTANCE' 12='(12) OTHER' ;
  VALUE t3a02fff  .R='REFUSED' .D='DONT KNOW' 4='(4) FAMILY MEMBER'
                  6='(6) OTHER RELATIVE'
                  8='(8) FRIEND/NEIGHBOR/COWORKER/ACQUAINTANCE' 12='(12) OTHER' ;
  VALUE t3a03fff  .R='REFUSED' .D='DONT KNOW' 4='(4) FAMILY MEMBER'
                  6='(6) OTHER RELATIVE'
                  8='(8) FRIEND/NEIGHBOR/COWORKER/ACQUAINTANCE' 12='(12) OTHER' ;
  VALUE id4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id8fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id9fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id12ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id13ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id14ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE ph5_05b   .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph6_05b   .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph7_05b   .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph8_05b   .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph9_05b   .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph10_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph11_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph12_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph13_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph14_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph15_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph16_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph17_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph18_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph19_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph20_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph21_05b  .R='REFUSED' .D='DONT KNOW' 1='(1) PILL' 2='(2) INJECTION'
                  3='(3) TEASPOON' 4='(4) TABLESPOON' 5='(5) DROPS' 6='(6) DOSES BY SYRINGE' ;
  VALUE ph14_10f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_11f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_12f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_13f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_14f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_15f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_16f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_17f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_18f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_19f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_20f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_21f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_22f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_23f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_24f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_25f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph14_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY EFFECTIVE'
                  2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT VERY EFFECTIVE'
                  4='(4) NOT AT ALL EFFECTIVE' ;
  VALUE ph15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) WITH SUPERVISION'
                  2='(2) ON OWN/WITHOUT SUPERVISION' ;
  VALUE ph15_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) PSYCHIATRIST'
                  2='(2) GENERAL OR FAMILY DOCTOR' 3='(3) SOME OTHER DOCTOR'
                  4='(4) SOME OTHER HEALTH PROFESSIONAL'
                  5='(5) (IF VOL) NO ONE PRESCRIBED THE MEDICATION'
                  6='(6) (IF VOL) OTHER (SPECIFY)' ;
  VALUE ph17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ph19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL)I DECIDED AND PROFESSIONAL AGREED' ;
  VALUE ph19a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL)I NEVER WENT BACK TO THE PROFESSIONAL' ;
  VALUE ph20ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) FELT BETTER'
                  2='(2) OTHER REASON' ;
  VALUE ph20a1ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) OTHER REASON FOR STOPPING' ;
  VALUE ph20a2ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) OTHER REASON FOR STOPPING' ;
  VALUE ph20a3ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) OTHER REASON FOR STOPPING' ;
  VALUE ph20a4ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) OTHER REASON FOR STOPPING' ;
  VALUE ph20a5ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) OTHER REASON FOR STOPPING' ;
  VALUE ph20b01f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b02f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b03f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b04f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b05f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b06f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b07f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b08f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b09f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b10f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b11f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph20b12f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph21_10f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_11f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_12f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_13f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_14f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_15f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_16f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_17f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_18f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_19f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_20f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_21f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_22f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_23f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_24f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_25f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph21_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY EFFECTIVE'
                  2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT VERY EFFECTIVE'
                  4='(4) NOT AT ALL EFFECTIVE' ;
  VALUE ph22ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) WITH SUPERVISION'
                  2='(2) ON OWN/WITHOUT SUPERVISION' ;
  VALUE ph22_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) PSYCHIATRIST'
                  2='(2) GENERAL OR FAMILY DOCTOR' 3='(3) SOME OTHER DOCTOR'
                  4='(4) SOME OTHER HEALTH PROFESSIONAL'
                  5='(5) (IF VOL) NO ONE PRESCRIBED THE MEDICATION'
                  6='(6) (IF VOL) OTHER (SPECIFY)' ;
  VALUE ph24ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ph26ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL)I DECIDED AND PROFESSIONAL AGREED' ;
  VALUE ph26a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL)I NEVER WENT BACK TO THE PROFESSIONAL' ;
  VALUE ph27ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) FELT BETTER'
                  2='(2) OTHER REASON' ;
  VALUE ph27a1ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) OTHER REASON FOR STOPPING' ;
  VALUE ph27a2ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) OTHER REASON FOR STOPPING' ;
  VALUE ph27a3ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) OTHER REASON FOR STOPPING' ;
  VALUE ph27a4ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) ANY OTHER REASON FOR STOPPING (SPECIFY)' ;
  VALUE ph27a5ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) ANY OTHER REASON FOR STOPPING (SPECIFY)' ;
  VALUE ph27b01f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph27b02f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph27b03f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph27b04f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph27b05f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER SIDE EFFECT FOR STOPPING (SPECIFY)' ;
  VALUE ph28_10f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_11f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_12f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_13f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_14f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_15f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_16f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_17f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_18f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_19f  .R='REFUSED' .D='DONT KNOW' 1='(1) SADNESS/DEPRESSION/CRYING'
                  2='(2) NERVES/ANXIETY' 3='(3) PANIC' 4='(4) SUICIDAL THOUGHTS'
                  5='(5) LOW ENERGY' 6='(6) POOR APPETITE' 7='(7) POOR SLEEP'
                  8='(8) PHYSICAL PAIN' 9='(9) POOR CONCENTRATION' 10='(10) POOR MEMORY'
                  11='(11) LITTLE OR NO SEXUAL FUNCTIONING' 12='(12) MARITAL PROBLEMS'
                  13='(13) NOT GETTING ALONG WITH OTHERS'
                  14='(14) POOR WORK PERFORMANCE' 15='(15) ALCOHOL/DRUGS PROBLEMS'
                  16='(16) OTHER (SPECIFY)' 17='(17) MANIC MOOD'
                  18='(18) ANGER OR IRRITABILITY' ;
  VALUE ph28_2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) VERY EFFECTIVE'
                  2='(2) SOMEWHAT EFFECTIVE' 3='(3) NOT VERY EFFECTIVE'
                  4='(4) NOT AT ALL EFFECTIVE' ;
  VALUE ph29ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) WITH SUPERVISION'
                  2='(2) ON OWN/WITHOUT SUPERVISION' ;
  VALUE ph29_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) PSYCHIATRIST'
                  2='(2) GENERAL OR FAMILY DOCTOR' 3='(3) SOME OTHER DOCTOR'
                  4='(4) SOME OTHER HEALTH PROFESSIONAL'
                  5='(5) (IF VOL) NO ONE PRESCRIBED THE MEDICATION'
                  6='(6) (IF VOL) OTHER (SPECIFY)' ;
  VALUE ph31ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ph33ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL)I DECIDED AND PROFESSIONAL AGREED' ;
  VALUE ph33a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL)I NEVER WENT BACK TO THE PROFESSIONAL' ;
  VALUE ph34ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) FELT BETTER'
                  2='(2) OTHER REASON' ;
  VALUE ph34a1ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) ANY OTHER SIDE EFFECT (SPECIFY)' ;
  VALUE ph34a2ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) OTHER REASON FOR STOPPING' ;
  VALUE ph34a3ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) ANY OTHER SIDE EFFECT (SPECIFY)' ;
  VALUE ph34a4ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) ANY OTHER SIDE EFFECT (SPECIFY)' ;
  VALUE ph34a5ff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) THE MEDICINE WAS NOT HELPING'
                  2='(2) YOU THOUGHT THE PROBLEM WOULD GET BETTER WITHOUT MORE MEDICI'
                  3='(3) YOU COULDN T AFFORD TO PAY FOR THE MEDICINE'
                  4='(4) YOU WERE TOO EMBARRASSED TO CONTINUE TAKING THE MEDICINE'
                  5='(5) YOU WANTED TO SOLVE THE PROBLEM WITHOUT MEDICATIONS'
                  6='(6) THE MEDICINE CAUSED SIDE-EFFECTS THAT MADE YOU STOP'
                  7='(7) YOU WERE AFRAID THAT YOU WOULD GET DEPENDENT ON THE MEDICATI'
                  8='(8) SOMEONE IN YOUR PERSONAL LIFE PRESSURED YOU TO STOP'
                  9='(9) ANY OTHER SIDE EFFECT (SPECIFY)' ;
  VALUE ph34b01f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER REASON FOR STOPPING (SPECIFY)' ;
  VALUE ph34b02f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER REASON FOR STOPPING (SPECIFY)' ;
  VALUE ph34b03f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER REASON FOR STOPPING (SPECIFY)' ;
  VALUE ph34b04f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER REASON FOR STOPPING (SPECIFY)' ;
  VALUE ph34b05f  .R='REFUSED' .D='DONT KNOW' 1='(1) SLEEP DISTURBANCES'
                  2='(2) VISION DISTURBANCES' 3='(3) NAUSEA' 4='(4) VOMITING'
                  5='(5) DRY MOUTH' 6='(6) ANXIETY AND IRRITABILITY' 7='(7) AGITATION'
                  8='(8) LOSS OF SEXUAL DRIVE' 9='(9) PROBLEMS IN SEXUAL PERFORMANCE'
                  10='(10) LOSS OF CONCENTRATION' 11='(11) NOT FEELING WELL'
                  12='(12) TREMORS' 13='(13) LOSS OF CONTROL OVER MYSELF'
                  14='(14) FATIGUE AND LOW ENERGY'
                  15='(15) ANY OTHER REASON FOR STOPPING (SPECIFY)' ;
  VALUE ph2_1a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL) FOR PHYS' ;
  VALUE ph2_1b    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL) FOR PHYS' ;
  VALUE ph2_1c    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL) FOR PHYS' ;
  VALUE ph2_1d    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL) FOR PHYS' ;
  VALUE ph2_1e    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO'
                  7='(7) (IF VOL) FOR PHYS' ;
  VALUE ph2_3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE dm1_7fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) ONE' 3='(3) TWO' ;
  VALUE dm1_12ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL FATHER'
                  2='(2) ADOPTIVE FATHER/STEP FATHER (SPOUSE/PARTNER OF MOTHER)'
                  4='(4) OTHER MALE (SPECIFY)' 5='(5) NO MALE IN HOUSEHOLD'
                  6='(6) LIVED WITH DIFFERENT MALE FIGURES' ;
  VALUE dm1_12a   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE dm1_13ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL MOTHER'
                  2='(2) ADOPTIVE MOTHER/STEP MOTHER (SPOUSE/PARTNER OF FATHER)'
                  4='(4) OTHER FEMALE (SPECIFY)' 5='(5) NO FEMALE IN HOUSEHOLD'
                  6='(6) LIVED WITH DIFFERENT FEMALE FIGURES' ;
  VALUE dm1_13a   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE dm4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL' 2='(2) EMOTIONAL'
                  3='(3) COMBINATION' 4='(4) (IF VOL: MATERNITY)' 5='(5) OTHER (SPECIFY)' ;
  VALUE dm6fffff  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE dm7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE dm14_6ff  .R='REFUSED' .D='DONT KNOW' 1='(1) WOULD HAVE MONEY LEFT OVER'
                  2='(2) WOULD STILL OWE MONEY'
                  3='(3) DEBTS WOULD JUST ABOUT EQUAL ASSESTS' ;
  VALUE dm21b     .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE dm21_3b   .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE dm21_4b   .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt57a3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt58b     .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt58d     .R='REFUSED' .D='DONT KNOW' 0='(0) ONGOING TIME' 1='(1) ONLY TIME'
                  2='(2) FIRST TIME' 3='(3) SECOND TIME' 4='(4) THIRD TIME'
                  5='(5) MOST RECENT TIME' ;
  VALUE pt62_inf  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt62_i0f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt62_i1f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt62_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt64ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt67ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt67a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt67b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt67c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt68ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt69ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt70ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt71ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt72ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt73ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt74ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt86ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt87ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt88ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt89ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt90ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt102fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt103fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt104fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt105fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt106fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt110b    .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt110c    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt113fff  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN ONCE A MONTH'
                  2='(2) ONE TO TWO TIMES A MONTH'
                  3='(3) THREE TO FIVE TIMES A MONTH'
                  4='(4) SIX TO TEN TIMES A MONTH'
                  5='(5) MORE THAN TEN TIMES A MONTH' ;
  VALUE pt114fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE pt115fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE pt118fff  .R='REFUSED' .D='DONT KNOW' 1='(1) CONTINUE' ;
  VALUE pt119a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt122fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt207fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt207a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt207b    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt207c    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt207_1f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt207_2f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt208fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt209fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt210fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt211fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt212fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt213fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt214fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt217b    .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt218b    .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt219fff  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN ONCE A MONTH'
                  2='(2) ONE TO TWO TIMES A MONTH'
                  3='(3) THREE TO FIVE TIMES A MONTH'
                  4='(4) SIX TO TEN TIMES A MONTH'
                  5='(5) MORE THAN TEN TIMES A MONTH' ;
  VALUE pt220fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE pt221fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE pt222fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt223fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt224fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt225fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt226fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt228b    .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt229b    .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt230fff  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN ONCE A MONTH'
                  2='(2) ONE TO TWO TIMES A MONTH'
                  3='(3) THREE TO FIVE TIMES A MONTH'
                  4='(4) SIX TO TEN TIMES A MONTH'
                  5='(5) MORE THAN TEN TIMES A MONTH' ;
  VALUE pt231fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE pt232fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE pt233fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt234fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt235fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt236fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt237fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt239b    .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt240b    .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt241fff  .R='REFUSED' .D='DONT KNOW' 1='(1) LESS THAN ONCE A MONTH'
                  2='(2) ONE TO TWO TIMES A MONTH'
                  3='(3) THREE TO FIVE TIMES A MONTH'
                  4='(4) SIX TO TEN TIMES A MONTH'
                  5='(5) MORE THAN TEN TIMES A MONTH' ;
  VALUE pt242fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) MILD' 3='(3) MODERATE'
                  4='(4) SEVERE' 5='(5) VERY SEVERE' ;
  VALUE pt243fff  .R='REFUSED' .D='DONT KNOW' 1='(1) NOT AT ALL' 2='(2) A LITTLE'
                  3='(3) SOME' 4='(4) A LOT' 5='(5) EXTREMELY' ;
  VALUE pt246fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt256fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt261fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt262fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) TWO TO SIX MONTHS AGO' 3='(3) MORE THAN SIX MONTHS AGO' ;
  VALUE pt267fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt268fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt269fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt270fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt271fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt272fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt273fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt274fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt275fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt281fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt121a0f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt121a1f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt121a2f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt121a3f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt121a4f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt121a5f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt121a6f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt121a7f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt121a8f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt121a9f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt12110f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt12111f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt12112f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt12113f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt12114f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt12115f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt12116f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26501f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26502f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26503f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26504f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26505f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26506f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26507f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26508f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26509f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26510f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26511f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26512f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26513f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26514f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26515f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE pt26516f  .R='REFUSED' .D='DONT KNOW' 1='(1) EVENT SELECTED' ;
  VALUE dsm_add   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_ago   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_agp   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_ala   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_alah  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_ald   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_asa   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_bipf  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_bi0f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_bi1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_cd    .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_dra   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_drd   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_dys   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_dysh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_gad   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_gadh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_hyp   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_ied   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_iedh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_man   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_mddh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_mde   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_odd   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_oddh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_pat   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_pds   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_pts   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_sad   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_so    .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_sp    .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_tbd   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_add12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_ago12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_agp12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_ala12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_alah1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_ald12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_asa12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bipolf  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bipo0f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bipo1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_cd12ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_dra12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_drah1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_drd12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_dys12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_dysh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_gad12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_gadh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_hyp12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_ied12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_iedh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_man12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_mddh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_mde12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_odd12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_oddh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_pat12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_pds12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_pts12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_so12ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_sp12ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_tbd12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_ala30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_alah3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_ald30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_asa30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_dra30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_drah3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_drd30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_dys30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_dysh3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_gad30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_gadh3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_hyp30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_ied30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_iedh3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_man30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_mddh3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_mde30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_pat30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_pds30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_so30ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_sp30ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_add   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_agp   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_ala   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_alah  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_ald   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_cd    .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_cdh   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_dra   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_drd   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_dys   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_dysh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_hyp   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_man   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_mde   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_mdeh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_odd   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_pat   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_pds   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_so    .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_sp    .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_tbd   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_add12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_agp12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_ala12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_alah1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_ald12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_cd12ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_cdh12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_dra12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_drd12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_dys12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_dysh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_hyp12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_man12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_mde12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_mdeh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_odd12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_pat12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_pds12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_so12ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_sp12ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_tbd12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_agp30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_ala30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_alah3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_ald30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_dra30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_drd30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_dys30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_dysh3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_hyp30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_man30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_mde30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_mdeh3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_pat30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_pds30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_so30ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_sp30ff  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_tbd30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE add_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE add_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ago_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ago_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE agp_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE agp_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ala_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ala_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ald_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ald_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE asa_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE asa_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bipolarf  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bipola0f  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bipola1f  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bipola2f  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bipola3f  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bipola4f  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE cd_ond    .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE cd_recd   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE dra_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE dra_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE drd_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE drd_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE dys_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE dys_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE gad_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE gad_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ied_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ied_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE mddh_ond  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE mddh_ref  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE mde_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE mde_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE odd_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE odd_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pat_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pat_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pd_ond    .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pd_recd   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE sad_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE sad_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE so_ond    .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE so_recd   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE sp_ond    .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE sp_recd   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE tbd_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE tbd_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE add_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE add_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE agp_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE agp_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ala_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ala_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ald_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ald_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE asa_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE asa_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE cd_oni    .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE cd_reci   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE dra_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE dra_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE drd_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE drd_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE dys_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE dys_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE mde_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE mde_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE odd_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE odd_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pat_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pat_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pd_oni    .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pd_reci   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE sad_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE sad_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE so_oni    .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE so_reci   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE sponi     .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE spreci    .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE tbd_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE tbd_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pts_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pts_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pts_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE pts_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bulh_ond  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bulh_ref  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE d_ago30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_agp30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_tbd30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE age       .R='REFUSED' .D='DONT KNOW' 18='(18) BOTTOM CODED AT 18' ;
  VALUE region    .R='REFUSED' .D='DONT KNOW' 1='(1) 1. NORTHEAST' 2='(2) 2. MIDWEST'
                  3='(3) 3. SOUTH' 4='(4) 4. WEST' ;
  VALUE mar3cat   .R='REFUSED' .D='DONT KNOW' 1='(1) MARRIED/COHABITING'
                  2='(2) DIVORCED/SEPARATED/WIDOWED' 3='(3) NEVER MARRIED' ;
  VALUE ed4cat    .R='REFUSED' .D='DONT KNOW' 1='(1) 0-11 YEARS' 2='(2) 12 YEARS'
                  3='(3) 13-15 YEARS' 4='(4) GREATER THAN OR EQUAL TO 16 YEARS' ;
  VALUE obese6cf  .R='REFUSED' .D='DONT KNOW'
                  1='(1) UNDERWEIGHT (BMI LESS THAN 18.5)'
                  2='(2) HEALTHY WEIGHT (18.5-24.9)' 3='(3) OVERWEIGHT (25.0-29.9)'
                  4='(4) OBESITY CLASS I (30.0-34.9)'
                  5='(5) OBESITY CLASS II (35.0-39.9)'
                  6='(6) OBESITY CLASS III (GREATER THAN 40.0)' ;
  VALUE post911f  .R='REFUSED' .D='DONT KNOW' 0='(0) INTERVIEWED PRIOR TO 9/11'
                  1='(1) INTERVIEWED ON OR AFTER 9/11' ;
  VALUE cpesproj  .R='REFUSED' .D='DONT KNOW' 1='(1) NCS-R' 2='(2) NLAAS' 3='(3) NSAL' ;
  VALUE sex       .R='REFUSED' .D='DONT KNOW' 1='(1) MALE' 2='(2) FEMALE' ;
  VALUE dsm_ano   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_binf  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_bi2f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_bul   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE dsm_bulh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_ano12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bingef  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bing0f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bul12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bulh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_ano30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bing1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bing2f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bul30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bulh3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_ano   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_anoh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_bul   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_ano12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_anoh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_bul12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_ano30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_anoh3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_bul30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE ano_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ano_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bingeh_f  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bingeh0f  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bingeanf  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bingea0f  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bul_ond   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bul_recd  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ano_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ano_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bul_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE bul_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ea1fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea9fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea10ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea10b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea10c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea10d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea12ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) 7-12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE ea16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea17ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea17a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea17b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea17c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea17d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea17e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea17f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea17g     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea17h     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea19b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea22ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) 7-12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE ea23a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea23b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea23c     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea23d     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea23e     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea23f     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea25ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea26ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea29ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) PAST MONTH'
                  2='(2) 2-6 MONTHS AGO' 3='(3) 7-12 MONTHS AGO'
                  4='(4) MORE THAN 12 MONTHS AGO' ;
  VALUE ea35ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea37ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ea38ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE aag6a4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag26b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ag26b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb3a     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb3b     .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb5i1a   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb5i1b   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb5i2a   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb5i2b   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb6aa    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb6ab    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb6aaa   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb6aab   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb211a   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb211b   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb23a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb23b    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb26a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE atb26b    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE acd18c2f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE acd18c3f  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE medicatf  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica0f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica2f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica4f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica5f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica6f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica7f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica8f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medica9f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medic10f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medic11f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medic12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medic13f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medic14f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE medic15f  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE em15ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) CORP/GENERAL MANAGERS'
                  2='(2) PROFESSIONAL (UNIVDEGREE)'
                  3='(3) ASSOC PROFESSIONAL (SOMEFML TRAIN)' 4='(4) OFFICE CLERKS'
                  5='(5) CUST SERV CLERKS' 6='(6) PERS/PROT SERV WORKER'
                  7='(7) TRADES WORKERS' 8='(8) OPERATORS' 9='(9) PERF ROUTINE TASKS'
                  10='(10) OTHER' ;
  VALUE em19ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) CORP/GENERAL MANAGERS'
                  2='(2) PROFESSIONAL (UNIVDEGREE)'
                  3='(3) ASSOC PROFESSIONAL (SOMEFML TRAIN)' 4='(4) OFFICE CLERKS'
                  5='(5) CUST SERV CLERKS' 6='(6) PERS/PROT SERV WORKER'
                  7='(7) TRADES WORKERS' 8='(8) OPERATORS' 9='(9) PERF ROUTINE TASKS'
                  10='(10) OTHER' ;
  VALUE se9fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) CORP/GENERAL MANAGERS'
                  2='(2) PROFESSIONAL (UNIVDEGREE)'
                  3='(3) ASSOC PROFESSIONAL (SOMEFML TRAIN)' 4='(4) OFFICE CLERKS'
                  5='(5) CUST SERV CLERKS' 6='(6) PERS/PROT SERV WORKER'
                  7='(7) TRADES WORKERS' 8='(8) OPERATORS' 9='(9) PERF ROUTINE TASKS'
                  10='(10) OTHER' ;
  VALUE se7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) CORP/GENERAL MANAGERS'
                  2='(2) PROFESSIONAL (UNIVDEGREE)'
                  3='(3) ASSOC PROFESSIONAL (SOMEFML TRAIN)' 4='(4) OFFICE CLERKS'
                  5='(5) CUST SERV CLERKS' 6='(6) PERS/PROT SERV WORKER'
                  7='(7) TRADES WORKERS' 8='(8) OPERATORS' 9='(9) PERF ROUTINE TASKS'
                  10='(10) OTHER' ;
  VALUE ch11ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) CORP/GENERAL MANAGERS'
                  2='(2) PROFESSIONAL (UNIVDEGREE)'
                  3='(3) ASSOC PROFESSIONAL (SOMEFML TRAIN)' 4='(4) OFFICE CLERKS'
                  5='(5) CUST SERV CLERKS' 6='(6) PERS/PROT SERV WORKER'
                  7='(7) TRADES WORKERS' 8='(8) OPERATORS' 9='(9) PERF ROUTINE TASKS'
                  10='(10) OTHER' ;
  VALUE ch16ffff  .R='REFUSED' .D='DONT KNOW' 1='(1) CORP/GENERAL MANAGERS'
                  2='(2) PROFESSIONAL (UNIVDEGREE)'
                  3='(3) ASSOC PROFESSIONAL (SOMEFML TRAIN)' 4='(4) OFFICE CLERKS'
                  5='(5) CUST SERV CLERKS' 6='(6) PERS/PROT SERV WORKER'
                  7='(7) TRADES WORKERS' 8='(8) OPERATORS' 9='(9) PERF ROUTINE TASKS'
                  10='(10) OTHER' ;
  VALUE occ28mog  .R='REFUSED' .D='DONT KNOW' 1='(1) CORP/GENERAL MANAGERS'
                  2='(2) PROFESSIONAL (UNIVDEGREE)'
                  3='(3) ASSOC PROFESSIONAL (SOMEFML TRAIN)' 4='(4) OFFICE CLERKS'
                  5='(5) CUST SERV CLERKS' 6='(6) PERS/PROT SERV WORKER'
                  7='(7) TRADES WORKERS' 8='(8) OPERATORS' 9='(9) PERF ROUTINE TASKS'
                  10='(10) OTHER' ;
  VALUE d38a_3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) JAN' 2='(2) FEB' 3='(3) MARCH'
                  4='(4) APRIL' 5='(5) MAY' 6='(6) JUNE' 7='(7) JULY' 8='(8) AUG' 9='(9) SEPT'
                  10='(10) OCT' 11='(11) NOV' 12='(12) DEC' ;
  VALUE dm17ffff  .R='REFUSED' .D='DONT KNOW' 3='(3) 3 OR MORE' ;
  VALUE mr16a     .R='REFUSED' .D='DONT KNOW' 3='(3) 3 OR MORE' ;
  VALUE dm19ffff  .R='REFUSED' .D='DONT KNOW' 3='(3) 3 OR MORE' ;
  VALUE mr18ffff  .R='REFUSED' .D='DONT KNOW' 3='(3) 3 OR MORE' ;
  VALUE dm20ffff  .R='REFUSED' .D='DONT KNOW' 14='(14) 14 OR LESS' 42='(42) 42 OR MORE' ;
  VALUE mr19ffff  .R='REFUSED' .D='DONT KNOW' 14='(14) 14 OR LESS' 42='(42) 42 OR MORE' ;
  VALUE dm22ffff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX OR MORE' ;
  VALUE cn1fffff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX OR MORE' ;
  VALUE dm23ffff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX OR MORE' ;
  VALUE cn2fffff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX OR MORE' ;
  VALUE dm1_10ff  .R='REFUSED' .D='DONT KNOW' 8='(8) 8 OR MORE' ;
  VALUE dm1_11ff  .R='REFUSED' .D='DONT KNOW' 8='(8) 8 OR MORE' ;
  VALUE de9_1fff  .R='REFUSED' .D='DONT KNOW' 8='(8) 8 OR MORE' ;
  VALUE de9_4fff  .R='REFUSED' .D='DONT KNOW' 8='(8) 8 OR MORE' ;
  VALUE de9_5fff  .R='REFUSED' .D='DONT KNOW' 9='(9) 9 OR MORE' ;
  VALUE de9_8fff  .R='REFUSED' .D='DONT KNOW' 9='(9) 9 OR MORE' ;
  VALUE dm_de20f  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE sc10_72f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) ONE PHYSICAL HANDICAP MENTIONED'
                  2='(2) TWO PHYSICAL HANDICAPS MENTIONED'
                  3='(3) THREE PHYSICAL HANDICAPS MENTIONED'
                  4='(4) FOUR PHYSICAL HANDICAPS MENTIONED' ;
  VALUE sc10_27f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) ONE PHYSICAL HANDICAP MENTIONED'
                  2='(2) TWO PHYSICAL HANDICAPS MENTIONED'
                  3='(3) THREE PHYSICAL HANDICAPS MENTIONED'
                  4='(4) FOUR PHYSICAL HANDICAPS MENTIONED' ;
  VALUE sc10_28f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) ONE PHYSICAL HANDICAP MENTIONED'
                  2='(2) TWO PHYSICAL HANDICAPS MENTIONED'
                  3='(3) THREE PHYSICAL HANDICAPS MENTIONED'
                  4='(4) FOUR PHYSICAL HANDICAPS MENTIONED' ;
  VALUE sc10_29f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_31f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_32f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_33f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_34f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_35f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_36f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_73f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_74f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_37f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_38f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_39f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_40f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_41f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_42f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_43f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_44f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE sc10_45f  .R='REFUSED' .D='DONT KNOW' 1='(1) ARTHRITIS' 2='(2) ASTHMA'
                  3='(3) BACK PROBLEMS' 4='(4) CANCER' 5='(5) CHRONIC FATIGUE SYNDROME'
                  6='(6) CHRONIC LUNG DISEASE' 7='(7) (ANY OTHER) CHRONIC PAIN'
                  8='(8) DIABETES OR HIGH BLOOD SUGAR'
                  9='(9) EPILEPSY OR SEIZURE DISORDER' 10='(10) HEADACHES'
                  11='(11) HEART ATTACK' 12='(12) HEART DISEASE'
                  13='(13) HIGH BLOOD PRESSURE' 15='(15) MIGRANES' 16='(16) NECK PROBLEMS'
                  17='(17) RHEUMATISM' 18='(18) SEASONAL ALLERGIES' 19='(19) STROKE'
                  21='(21) ULCER' 22='(22) OTHER (SPECIFY)' ;
  VALUE dm201fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm202fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm203fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE em7_101f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE em7_102f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE em7_103f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE em7_104f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm801fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm802fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm803fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm804fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE se401fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE se402fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE se403fff  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE sr611fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A. HOSPITAL EMERGENCY DEPARTMENT'
                  2='(2) B. PSYCHIATRIC OUTPATIENT CLINIC'
                  3='(3) C. DRUG OR ALCOHOL OUTPATIENT CLINIC'
                  4='(4) D. PRIVATE OFFICE'
                  5='(5) E. SOCIAL SERVICE AGENCY OR DEPARTMENT'
                  7='(7) G. DROP IN CENTER OR PROGRAM FOR PEOPLE WITH EMOTIONAL PROBL'
                  8='(8) H. CHURCH OR OTHER RELIGIOUS BUILDING' 9='(9) I. OTHER' ;
  VALUE sr612fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A. HOSPITAL EMERGENCY DEPARTMENT'
                  2='(2) B. PSYCHIATRIC OUTPATIENT CLINIC'
                  3='(3) C. DRUG OR ALCOHOL OUTPATIENT CLINIC'
                  4='(4) D. PRIVATE OFFICE'
                  5='(5) E. SOCIAL SERVICE AGENCY OR DEPARTMENT'
                  7='(7) G. DROP IN CENTER OR PROGRAM FOR PEOPLE WITH EMOTIONAL PROBL'
                  8='(8) H. CHURCH OR OTHER RELIGIOUS BUILDING' 9='(9) I. OTHER' ;
  VALUE sr613fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A. HOSPITAL EMERGENCY DEPARTMENT'
                  2='(2) B. PSYCHIATRIC OUTPATIENT CLINIC'
                  3='(3) C. DRUG OR ALCOHOL OUTPATIENT CLINIC'
                  4='(4) D. PRIVATE OFFICE'
                  5='(5) E. SOCIAL SERVICE AGENCY OR DEPARTMENT'
                  7='(7) G. DROP IN CENTER OR PROGRAM FOR PEOPLE WITH EMOTIONAL PROBL'
                  8='(8) H. CHURCH OR OTHER RELIGIOUS BUILDING' 9='(9) I. OTHER' ;
  VALUE sr614fff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) A. HOSPITAL EMERGENCY DEPARTMENT'
                  2='(2) B. PSYCHIATRIC OUTPATIENT CLINIC'
                  3='(3) C. DRUG OR ALCOHOL OUTPATIENT CLINIC'
                  4='(4) D. PRIVATE OFFICE'
                  5='(5) E. SOCIAL SERVICE AGENCY OR DEPARTMENT'
                  7='(7) G. DROP IN CENTER OR PROGRAM FOR PEOPLE WITH EMOTIONAL PROBL'
                  8='(8) H. CHURCH OR OTHER RELIGIOUS BUILDING' 9='(9) I. OTHER' ;
  VALUE em16ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) AGRICULTURE, HUNTING AND FORESTRY' 2='(2) MANUFACTURING'
                  3='(3) ELECTRICITY, GAS AND WATER SUPPLY' 4='(4) CONSTRUCTION'
                  5='(5) WHOLESALE AND RETAIL TRADE' 6='(6) HOTELS AND RESTAURANTS'
                  7='(7) TRANSPORT, STORAGE AND COMMUNICATIONS'
                  8='(8) FINANCIAL INTERMEDIATION'
                  9='(9) REAL ESTATE, RENTING AND BUSINESS ACTIVITIES'
                  10='(10) PUBLIC ADMINISTRATION AND DEFENSE' 11='(11) EDUCATION'
                  12='(12) HEALTH AND SOCIAL WORK'
                  13='(13) OTHER COMMUNITY, SOCIAL AND PERSONAL SERVICE ACTIVITIES'
                  14='(14) OTHER' 15='(15) NOT SURE (SPECIFY)' ;
  VALUE em20ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) AGRICULTURE, HUNTING AND FORESTRY' 2='(2) MANUFACTURING'
                  3='(3) ELECTRICITY, GAS AND WATER SUPPLY' 4='(4) CONSTRUCTION'
                  5='(5) WHOLESALE AND RETAIL TRADE' 6='(6) HOTELS AND RESTAURANTS'
                  7='(7) TRANSPORT, STORAGE AND COMMUNICATIONS'
                  8='(8) FINANCIAL INTERMEDIATION'
                  9='(9) REAL ESTATE, RENTING AND BUSINESS ACTIVITIES'
                  10='(10) PUBLIC ADMINISTRATION AND DEFENSE' 11='(11) EDUCATION'
                  12='(12) HEALTH AND SOCIAL WORK'
                  13='(13) OTHER COMMUNITY, SOCIAL AND PERSONAL SERVICE ACTIVITIES'
                  14='(14) OTHER' 15='(15) NOT SURE (SPECIFY)' ;
  VALUE se10ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) AGRICULTURE, HUNTING AND FORESTRY' 2='(2) MANUFACTURING'
                  3='(3) ELECTRICITY, GAS AND WATER SUPPLY' 4='(4) CONSTRUCTION'
                  5='(5) WHOLESALE AND RETAIL TRADE' 6='(6) HOTELS AND RESTAURANTS'
                  7='(7) TRANSPORT, STORAGE AND COMMUNICATIONS'
                  8='(8) FINANCIAL INTERMEDIATION'
                  9='(9) REAL ESTATE, RENTING AND BUSINESS ACTIVITIES'
                  10='(10) PUBLIC ADMINISTRATION AND DEFENSE' 11='(11) EDUCATION'
                  12='(12) HEALTH AND SOCIAL WORK'
                  13='(13) OTHER COMMUNITY, SOCIAL AND PERSONAL SERVICE ACTIVITIES'
                  14='(14) OTHER' 15='(15) NOT SURE (SPECIFY)' ;
  VALUE se8fffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) AGRICULTURE, HUNTING AND FORESTRY' 2='(2) MANUFACTURING'
                  3='(3) ELECTRICITY, GAS AND WATER SUPPLY' 4='(4) CONSTRUCTION'
                  5='(5) WHOLESALE AND RETAIL TRADE' 6='(6) HOTELS AND RESTAURANTS'
                  7='(7) TRANSPORT, STORAGE AND COMMUNICATIONS'
                  8='(8) FINANCIAL INTERMEDIATION'
                  9='(9) REAL ESTATE, RENTING AND BUSINESS ACTIVITIES'
                  10='(10) PUBLIC ADMINISTRATION AND DEFENSE' 11='(11) EDUCATION'
                  12='(12) HEALTH AND SOCIAL WORK'
                  13='(13) OTHER COMMUNITY, SOCIAL AND PERSONAL SERVICE ACTIVITIES'
                  14='(14) OTHER' 15='(15) NOT SURE (SPECIFY)' ;
  VALUE ch12ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) AGRICULTURE, HUNTING AND FORESTRY' 2='(2) MANUFACTURING'
                  3='(3) ELECTRICITY, GAS AND WATER SUPPLY' 4='(4) CONSTRUCTION'
                  5='(5) WHOLESALE AND RETAIL TRADE' 6='(6) HOTELS AND RESTAURANTS'
                  7='(7) TRANSPORT, STORAGE AND COMMUNICATIONS'
                  8='(8) FINANCIAL INTERMEDIATION'
                  9='(9) REAL ESTATE, RENTING AND BUSINESS ACTIVITIES'
                  10='(10) PUBLIC ADMINISTRATION AND DEFENSE' 11='(11) EDUCATION'
                  12='(12) HEALTH AND SOCIAL WORK'
                  13='(13) OTHER COMMUNITY, SOCIAL AND PERSONAL SERVICE ACTIVITIES'
                  14='(14) OTHER' 15='(15) NOT SURE (SPECIFY)' ;
  VALUE ch17ffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) AGRICULTURE, HUNTING AND FORESTRY' 2='(2) MANUFACTURING'
                  3='(3) ELECTRICITY, GAS AND WATER SUPPLY' 4='(4) CONSTRUCTION'
                  5='(5) WHOLESALE AND RETAIL TRADE' 6='(6) HOTELS AND RESTAURANTS'
                  7='(7) TRANSPORT, STORAGE AND COMMUNICATIONS'
                  8='(8) FINANCIAL INTERMEDIATION'
                  9='(9) REAL ESTATE, RENTING AND BUSINESS ACTIVITIES'
                  10='(10) PUBLIC ADMINISTRATION AND DEFENSE' 11='(11) EDUCATION'
                  12='(12) HEALTH AND SOCIAL WORK'
                  13='(13) OTHER COMMUNITY, SOCIAL AND PERSONAL SERVICE ACTIVITIES'
                  14='(14) OTHER' 15='(15) NOT SURE (SPECIFY)' ;
  VALUE dm23_10f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE dm23_11f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE da31b_1f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE da31b_0f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE da31b_2f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE de20_90f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE de20_91f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE de20_92f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE io1a      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE io2_1fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PARENT(S)'
                  2='(2) SPOUSE/PARTNER' 3='(3) CHILD(REN) UNDER AGE 6'
                  4='(4) PERSON(S) AGE 6-17' 5='(5) OTHER ADULT(S)' ;
  VALUE io2_2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PARENT(S)'
                  2='(2) SPOUSE/PARTNER' 3='(3) CHILD(REN) UNDER AGE 6'
                  4='(4) PERSON(S) AGE 6-17' 5='(5) OTHER ADULT(S)' ;
  VALUE io2_3fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PARENT(S)'
                  2='(2) SPOUSE/PARTNER' 3='(3) CHILD(REN) UNDER AGE 6'
                  4='(4) PERSON(S) AGE 6-17' 5='(5) OTHER ADULT(S)' ;
  VALUE io2_4fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PARENT(S)'
                  2='(2) SPOUSE/PARTNER' 3='(3) CHILD(REN) UNDER AGE 6'
                  4='(4) PERSON(S) AGE 6-17' 5='(5) OTHER ADULT(S)' ;
  VALUE io2_5fff  .R='REFUSED' .D='DONT KNOW' 1='(1) PARENT(S)'
                  2='(2) SPOUSE/PARTNER' 3='(3) CHILD(REN) UNDER AGE 6'
                  4='(4) PERSON(S) AGE 6-17' 5='(5) OTHER ADULT(S)' ;
  VALUE io3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ALL' 2='(2) MOST' 3='(3) ABOUT HALF'
                  4='(4) ABOUT ONE QUARTER' 5='(5) LESS THAN ONE QUARTER' ;
  VALUE io4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NONE' ;
  VALUE io5fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) EXCELLENT' 2='(2) GOOD' 3='(3) FAIR'
                  4='(4) POOR' ;
  VALUE io6fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) EXCELLENT' 2='(2) GOOD' 3='(3) FAIR'
                  4='(4) POOR' ;
  VALUE io7fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) A LOT' 2='(2) SOME' 3='(3) A LITTLE'
                  4='(4) NONE' ;
  VALUE weight    .R='REFUSED' .D='DONT KNOW' 100='(100) BOTTOM CODED AT 100'
                  300='(300) TOP CODED AT 300' ;
  VALUE height    .R='REFUSED' .D='DONT KNOW' 57='(57) BOTTOM CODED AT 57'
                  75='(75) TOP CODED AT 75' ;
  VALUE rancest   .R='REFUSED' .D='DONT KNOW' 1='(1) VIETNAMESE' 2='(2) FILIPINO'
                  3='(3) CHINESE' 4='(4) ALL OTHER ASIAN' 5='(5) CUBAN' 6='(6) PUERTO RICAN'
                  7='(7) MEXICAN' 8='(8) ALL OTHER HISPANIC' 9='(9) AFRO-CARIBBEAN'
                  10='(10) AFRICAN AMERICAN' 11='(11) NON-LATINO WHITES' 12='(12) ALL OTHER' ;
  VALUE de4fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) UNITED STATES' 2='(2) OTHER' ;
  VALUE de20ffff  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE dm1_6fff  .R='REFUSED' .D='DONT KNOW' 1='(1) UNITED STATES' 5='(5) OTHER' ;
  VALUE dm1_14ff  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE sc10_46f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) ONE PHYSICAL HANDICAP MENTIONED'
                  2='(2) TWO PHYSICAL HANDICAPS MENTIONED'
                  3='(3) THREE PHYSICAL HANDICAPS MENTIONED'
                  4='(4) FOUR PHYSICAL HANDICAPS MENTIONED' ;
  VALUE dm_de9_f  .R='REFUSED' .D='DONT KNOW' 8='(8) 8 OR MORE' ;
  VALUE dm_de90f  .R='REFUSED' .D='DONT KNOW' 8='(8) 8 OR MORE' ;
  VALUE dm_ch8ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL FATHER'
                  2='(2) ADOPTIVE FATHER/STEP FATHER (SPOUSE/PARTNER OF MOTHER)'
                  4='(4) OTHER MALE (SPECIFY)' 5='(5) NO MALE IN HOUSEHOLD'
                  6='(6) LIVED WITH DIFFERENT MALE FIGURES' ;
  VALUE dm_ch8a   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE dm_ch13f  .R='REFUSED' .D='DONT KNOW' 1='(1) BIOLOGICAL MOTHER'
                  2='(2) ADOPTIVE MOTHER/STEP MOTHER (SPOUSE/PARTNER OF FATHER)'
                  4='(4) OTHER FEMALE (SPECIFY)' 5='(5) NO FEMALE IN HOUSEHOLD'
                  6='(6) LIVED WITH DIFFERENT FEMALE FIGURES' ;
  VALUE dm_ch13a  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE dm_em7_f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm_em70f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm_em71f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm_em10f  .R='REFUSED' .D='DONT KNOW' 1='(1) PHYSICAL' 2='(2) EMOTIONAL'
                  3='(3) COMBINATION' 4='(4) (IF VOL: MATERNITY)' 5='(5) OTHER (SPECIFY)' ;
  VALUE dm_se2ff  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' 5='(5) FIVE' 6='(6) SIX'
                  7='(7) SEVEN' 8='(8) EIGHT' 9='(9) NINE' 10='(10) TEN' 11='(11) ELEVEN'
                  12='(12) TWELVE' 13='(13) THIRTEEN' 14='(14) FOURTEEN' 15='(15) FIFTEEN'
                  16='(16) SIXTEEN' 17='(17) 17 OR MORE' ;
  VALUE dm_se6a   .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE dm_se40f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm_se41f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm_se42f  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) SELF-EMPLOYED'
                  3='(3) RETIRED' 4='(4) HOMEMAKER' 5='(5) STUDENT' 6='(6) OTHER'
                  97='(97) (IF VOL) NEVER WORKED' ;
  VALUE dm_fn12f  .R='REFUSED' .D='DONT KNOW' 1='(1) WOULD HAVE MONEY LEFT OVER'
                  2='(2) WOULD STILL OWE MONEY'
                  3='(3) DEBTS WOULD JUST ABOUT EQUAL ASSESTS' ;
  VALUE dm_mr16a  .R='REFUSED' .D='DONT KNOW' 3='(3) 3 OR MORE' ;
  VALUE dm_mr18f  .R='REFUSED' .D='DONT KNOW' 3='(3) 3 OR MORE' ;
  VALUE dm_mr19f  .R='REFUSED' .D='DONT KNOW' 14='(14) 14 OR LESS' 42='(42) 42 OR MORE' ;
  VALUE dm_mr25b  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE dm_mr20a  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE dm_cn1ff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX OR MORE' ;
  VALUE dm_cn2ff  .R='REFUSED' .D='DONT KNOW' 0='(0) ZERO' 1='(1) ONE' 2='(2) TWO'
                  3='(3) THREE' 4='(4) FOUR' 5='(5) FIVE' 6='(6) SIX OR MORE' ;
  VALUE dm_da31f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE dm_da30f  .R='REFUSED' .D='DONT KNOW'
                  1='(1) PROTESTANTISM/PROTESTANT, NO DENOMINATION MENTIONED'
                  2='(2) BAPTIST (ALL TYPES)' 3='(3) LUTHERAN'
                  4='(4) METHODIST (ALL TYPES, INCLUDING UNTIED BRETHREN)'
                  5='(5) PENTECOSTAL' 6='(6) PRESBYTERIAN'
                  7='(7) PROTESTANT, OTHER (PLEASE SPECIFY)'
                  8='(8) CATHOLICISM/CATHOLIC, NO DEOMINATION MENTIONED'
                  9='(9) CATHOLIC, ROMAN' 10='(10) CATHOLIC (ALL OTHERS)'
                  11='(11) AGNOSTIC OR ATHEIST' 12='(12) NO RELIGIOUS PREFERENCE'
                  13='(13) NO RELIGION' 14='(14) OTHER (SPECIFY)' ;
  VALUE dm_de5_f  .R='REFUSED' .D='DONT KNOW' 1='(1) NONE' 2='(2) ONE' 3='(3) TWO' ;
  VALUE d37b_1ff  .R='REFUSED' .D='DONT KNOW' 1='(1) BROUGHT ON BY STRESS'
                  2='(2) OUT OF THE BLUE' 5='(5) DONT REMEMBER' ;
  VALUE d37c2fff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE d37b4fff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ir20b4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pt55d2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) DAYS' 2='(2) WEEKS' 3='(3) MONTHS'
                  4='(4) YEARS' ;
  VALUE pt120a    .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE o17c      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE pr20b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad32b2ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad32b3ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE ad32b4ff  .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE d_bipo2f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bipo3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_bipo4f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE d_pts30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_asa   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_asah  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_gad   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_gadh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_pts   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_sad   .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE icd_sadh  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_asa12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_asah1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_gad12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_gadh1f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_pts12f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_asa30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_asah3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_gad30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_gadh3f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE i_pts30f  .R='REFUSED' .D='DONT KNOW' 1='(1) ENDORSED' 5='(5) NOT ENDORSED' ;
  VALUE gad_oni   .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE gad_reci  .R='REFUSED' .D='DONT KNOW' 4='(4) 4 OR LESS' ;
  VALUE ps2fffff  .R='REFUSED' .D='DONT KNOW'
                  1='(1) ONE OR MORE RESPONSES CODED 1 IN PS1A.1, PS1B.1, PS1C.1, P'
                  2='(2) ALL OTHERS' ;
  VALUE ps_flag   .R='REFUSED' .D='DONT KNOW' 1='(1) PRIMARY ADULT IN HOUSEHOLD'
                  2='(2) SECONDARY ADULT IN HOUSEHOLD' ;
  VALUE fb6l      .R='REFUSED' .D='DONT KNOW' 1='(1) YES' 5='(5) NO' ;
  VALUE id        .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id2fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE id3fffff  .R='REFUSED' .D='DONT KNOW' 1='(1) ACETOPHENAZINE' 2='(2) ADAPIN'
                  3='(3) ADDERALL' 4='(4) ALPRAZOLAM' 5='(5) AMANTADINE' 6='(6) AMBIEN'
                  7='(7) AMITRIPTYLINE' 8='(8) AMOBARBITAL' 9='(9) AMOXAPINE'
                  10='(10) AMPHETAMINES' 11='(11) AMYTAL' 12='(12) ANAFRANIL' 13='(13) ANTABUSE'
                  14='(14) ANTIDEPRESSANT' 15='(15) ANTIPSYCHOTIC' 16='(16) AQUACHLORAL'
                  17='(17) ARTANE' 18='(18) ASENDIN' 19='(19) ATIVAN' 20='(20) AVENTYL'
                  21='(21) BENADRYL' 22='(22) BENZTROPINE' 23='(23) BUPROPION' 24='(24) BUSPAR'
                  25='(25) BUSPIRONE' 26='(26) CARBAMAZEPINE' 27='(27) CARBATROL'
                  28='(28) CATAPRES' 29='(29) CELEXA' 30='(30) CHLORAL HYDRATE'
                  31='(31) CHLORDIAZEPOXIDE' 32='(32) CHLORPROMAZINE' 33='(33) CITALOPRAM'
                  34='(34) CLOMIPRAMINE' 35='(35) CLONAZEPAM' 36='(36) CLONIDINE'
                  37='(37) CLORAZEPATE' 38='(38) CLORAZIL' 39='(39) CLORPROTHIXENE'
                  40='(40) CLOZAPINE' 41='(41) CLOZARIL' 42='(42) COGENTIN' 43='(43) CYLERT'
                  44='(44) DALMANE' 45='(45) DEPACON' 46='(46) DEPAKENE' 47='(47) DEPAKOTE'
                  48='(48) DESIPRAMINE' 49='(49) DESOXYN' 50='(50) DESOXYN GRADUMET'
                  51='(51) DESYREL' 52='(52) DEXEDRINE' 53='(53) DEXTROAMPHETAMINE'
                  54='(54) DEXTROSTAT' 55='(55) DIHYDROERGOTAMINE MESYLATE'
                  56='(56) DIAZEPAM' 57='(57) DIPHENHYDRAMINE' 58='(58) DISULFIRAM'
                  59='(59) DIVALPROEX' 60='(60) DORAL' 61='(61) DORIDEN' 62='(62) DOXEPIN'
                  63='(63) DROPERIDOL' 64='(64) DURALITH' 65='(65) EFFEXOR' 66='(66) ELAVIL'
                  67='(67) EPITOL' 68='(68) EQUANIL' 69='(69) ESKALITH' 70='(70) ESKALITH CR-450'
                  71='(71) ESTAZOLAM' 72='(72) ETHCHLORVYNOL' 73='(73) ETRAFON'
                  74='(74) FLUOXETINE' 75='(75) FLUPHENAZINE' 76='(76) FLURAZEPAM'
                  77='(77) FLUVOXAMINE' 78='(78) GABAPENTIN' 79='(79) GEN-XENE'
                  80='(80) GLUTETHIMIDE' 81='(81) HALAZEPAM' 82='(82) HALCION' 83='(83) HALDOL'
                  84='(84) HALDOL DEPOT' 85='(85) HALOPERIDOL' 86='(86) HYDROXYZINE'
                  87='(87) IMIPRAMINE' 88='(88) INAPSINE' 89='(89) INDERAL'
                  90='(90) ISOCARBOXAZID' 91='(91) JANIMINE' 92='(92) KLONOPIN'
                  93='(93) LAMICTAL' 94='(94) LAMOTRIGINE' 95='(95) LIBRAX' 96='(96) LIBRITABS'
                  97='(97) LIBRIUM' 98='(98) LIMBITROL' 99='(99) LITHIUM'
                  100='(100) LITHIUM CARBONATE' 101='(101) LITHIUM CITRATE SYRUP'
                  102='(102) LITHOBID' 103='(103) LITHONATE' 104='(104) LITHOTABS'
                  105='(105) LORAZEPAM' 106='(106) LOXAPINE' 107='(107) LOXITANE'
                  108='(108) LUDIOMIL' 109='(109) LUMINAL' 110='(110) LUVOX' 111='(111) MAPROTILINE'
                  112='(112) MARPLAN' 113='(113) MELLARIL' 114='(114) MEPROBAMATE'
                  115='(115) MESORIDAZINE' 116='(116) METHAMPHETAMINE'
                  117='(117) METHOTRIMEPRAZINE' 118='(118) METHYL-PHENIDATE'
                  119='(119) MIDAZOLAM' 120='(120) MILTOWN' 121='(121) MIRTAZAPINE'
                  122='(122) MITRAN' 123='(123) MOBAN' 124='(124) MOCLOBEMIDE' 125='(125) MOLINDONE'
                  126='(126) NARDIL' 127='(127) NAVANE' 128='(128) NEFAZODONE' 129='(129) NEMBUTAL'
                  130='(130) NEURAMATE' 131='(131) NEURONTIN' 132='(132) NORPRAMINE'
                  133='(133) NORTRIPTYLINE' 134='(134) OBETROL' 135='(135) OLANZAPINE'
                  136='(136) ORAP' 137='(137) OXAZEPAM' 138='(138) OXYBUTYNIN' 139='(139) PAMELOR'
                  140='(140) PARNATE' 141='(141) PAROXETINE' 142='(142) PAXIL' 143='(143) PAXIPAM'
                  144='(144) PEMOLINE' 145='(145) PERMITIL' 146='(146) PERPHENAZINE'
                  147='(147) PHENELZINE' 148='(148) PHENERGAN' 149='(149) PHENOBARBITAL'
                  150='(150) PHENYTOIN' 151='(151) PIMOZIDE' 152='(152) PLACIDYL'
                  153='(153) PRAZEPAM' 154='(154) PROLIXIN' 155='(155) PROLIXIN DEPOT'
                  156='(156) PROPRANOLOL' 157='(157) PROPOFOL' 158='(158) PROSOM'
                  159='(159) PROTRIPTYLINE' 160='(160) PROZAC' 161='(161) QUAZEPAM'
                  162='(162) QUETIAPINE' 163='(163) REMERON' 164='(164) RESERPINE'
                  165='(165) RESTORIL' 166='(166) RISPERDAL' 167='(167) RISPERIDONE'
                  168='(168) RITALIN' 169='(169) SECOBARBITAL' 170='(170) SECONAL' 171='(171) SERAX'
                  172='(172) SERENTIL' 173='(173) SEROQUEL' 174='(174) SERTRALINE'
                  175='(175) SERZONE' 176='(176) SINEQUAN' 177='(177) SODIUM PENTOBARBITAL'
                  178='(178) SODIUM VALPROATE' 179='(179) SONATA' 180='(180) STELAZINE'
                  181='(181) SURMONTIL' 182='(182) SYMMETREL' 183='(183) TARACTAN'
                  184='(184) TEGRETOL' 185='(185) TEMAZEPAM' 186='(186) THIORIDAZINE'
                  187='(187) THIOTHIXENE' 188='(188) THORAZINE' 189='(189) TINDAL'
                  190='(190) TOFRANIL' 191='(191) TRANXENE' 192='(192) TRANYLCYPROMINE'
                  193='(193) TRAZODONE' 194='(194) TRIAVIL' 195='(195) TRIAZOLAM'
                  196='(196) TRIFLUOPERAZINE' 197='(197) TRIFLUPROMAZINE'
                  198='(198) TRIHEXYPHENIDYL' 199='(199) TRILAFON' 200='(200) TRIMIPRAMINE'
                  201='(201) VALIUM' 202='(202) VALPROATE' 203='(203) VALPROIC ACID'
                  204='(204) VENLAFAXINE' 205='(205) VERSED' 206='(206) VESPRIN' 207='(207) VISTARIL'
                  208='(208) VIVACTIL' 209='(209) WELLBUTRIN' 210='(210) XANAX' 211='(211) ZALEPLON'
                  212='(212) ZOLOFT' 213='(213) ZOLPIDEM' 214='(214) ZYBAN' 215='(215) ZYPREXA'
                  997='(997) OTHER' ;
  VALUE hhinc     .R='REFUSED' .D='DONT KNOW' 200000='(200000) TOP CODED AT $200,000' ;
  VALUE povindex  .R='REFUSED' .D='DONT KNOW' 17='(17) TOP CODED AT 17' ;
  VALUE wkstat3c  .R='REFUSED' .D='DONT KNOW' 1='(1) EMPLOYED' 2='(2) UNEMPLOYED'
                  3='(3) NOT IN LABOR FORCE' ;
  VALUE version   2='(2) VERSION 2'

QUIT ;


* SAS DATA STEP;
DATA S20240P2 ;
SET Da20240p2 ;

* SAS MISSING DATA VALUE RECODE STATEMENTS;

array numeric_vars{*} _NUMERIC_ ;
do i = 1 to dim(numeric_vars) ;
   if (numeric_vars[i] EQ -7) then numeric_vars[i] = .N ;
   if (numeric_vars[i] EQ -8) then numeric_vars[i] = .D ;
   if (numeric_vars[i] EQ -9) then numeric_vars[i] = .R ;
end ; 
drop i ;


* SAS FORMAT STATEMENT;

  FORMAT CHILDREN children. ADOL adol. ADULT adult.
         HHSIZE hhsize. SC7 sc7fffff. SC8_1 sc8_1fff.
         SC8_2 sc8_2fff. SC9A sc9a. SC9B sc9b.
         SC9C sc9c. SC9D sc9d. SC9E sc9e.
         SC9F sc9f. SC9G sc9g. SC9H sc9h.
         SC9_01 sc9_01ff. SC9_02 sc9_02ff. SC9_03 sc9_03ff.
         SC9_04 sc9_04ff. SC10_1A sc10_1a. SC10_1B sc10_1b.
         SC10_1C sc10_1c. SC10_1D sc10_1d. SC10_1E sc10_1e.
         SC10_1F sc10_1f. SC10_1H sc10_1h. SC10_2 sc10_2ff.
         SC10_3 sc10_3ff. SC10_4D sc10_4d. SC10_4E sc10_4e.
         SC10_4F sc10_4f. SC10_4G sc10_4g. SC10_5C1 sc10_5cf.
         SC10_5C2 sc10_50f. SC10_5E1 sc10_5ef. SC10_5E2 sc10_51f.
         SC10_5E3 sc10_52f. SC10_5E4 sc10_53f. SC10_5E5 sc10_54f.
         SC10_5E11 sc10_55f. SC10_5E301 sc10_56f. SC10_5E302 sc10_57f.
         SC10_5E303 sc10_58f. SC10_5E304 sc10_59f. SC10_5E305 sc10_10f.
         SC10_5E306 sc10_11f. SC10_5E307 sc10_12f. SC10_5I01 sc10_5if.
         SC10_5I02 sc10_13f. SC10_5I03 sc10_14f. SC10_5I04 sc10_15f.
         SC10_5I05 sc10_16f. SC10_5I06 sc10_17f. SC10_5I07 sc10_18f.
         SC10_5I08 sc10_19f. SC10_5I09 sc10_20f. SC10_5I10 sc10_21f.
         SC10_5I11 sc10_22f. SC10_7AA1 sc10_7af. SC10_7A301 sc10_70f.
         SC10_7A302 sc10_71f. SC10_8B1 sc10_8bf. SC10_8B2 sc10_80f.
         SC10_8C1 sc10_8cf. SC10_8D1 sc10_8df. SC10_8D2 sc10_81f.
         SC10_8FF1 sc10_8ff. SC10_8FF2 sc10_82f. SC10_8F21 sc10_83f.
         SC10_8F301 sc10_84f. SC10_8F302 sc10_85f. SC10_8F303 sc10_86f.
         SC10_8F304 sc10_87f. SC10_8F305 sc10_88f. SC10_8F306 sc10_89f.
         SC10_8F307 sc10_23f. SC10_8GG1 sc10_8gf. SC10_8GG2 sc10_24f.
         SC10_8G301 sc10_25f. SC10_8G302 sc10_26f. SC10_8HH1 sc10_8hf.
         SC10_12B sc10_12b. SC10_12C sc10_12c. SC19 sc19ffff.
         SC20 sc20ffff. SC20A sc20a. SC20_1 sc20_1ff.
         SC20_2 sc20_2ff. SC20_3 sc20_3ff. SC21 sc21ffff.
         SC22 sc22ffff. SC23 sc23ffff. SC24 sc24ffff.
         SC25 sc25ffff. SC25A sc25a. SC26 sc26ffff.
         SC26A sc26a. SC26B sc26b. SC26_1 sc26_1ff.
         SC26_2 sc26_2ff. SC26_3 sc26_3ff. SC26_4 sc26_4ff.
         SC27A sc27a. SC27B sc27b. SC27C sc27c.
         SC27D sc27d. SC27E sc27e. SC27F sc27f.
         SC27_2 sc27_2ff. SC27_3 sc27_3ff. SC27_4 sc27_4ff.
         SC29 sc29ffff. SC29A sc29a. SC29_1 sc29_1ff.
         SC29_2 sc29_2ff. SC29_3 sc29_3ff. SC30 sc30ffff.
         SC30_1 sc30_1ff. SC30_2 sc30_2ff. SC30_3 sc30_3ff.
         SC31 sc31ffff. SC32 sc32ffff. SC33 sc33ffff.
         SC33_1 sc33_1ff. SC33_2 sc33_2ff. SC33_3 sc33_3ff.
         SC34 sc34ffff. SC35 sc35ffff. D1 d1ffffff.
         D1A d1a. D1B d1b. D2 d2ffffff.
         D9 d9ffffff. D9A1 d9a1ffff. D9A2 d9a2ffff.
         D12 d12fffff. D14 d14fffff. D15 d15fffff.
         D16 d16fffff. D17 d17fffff. D18 d18fffff.
         D19 d19fffff. D21 d21fffff. D22 d22fffff.
         D22B1 d22b1fff. D22D1 d22d1fff. D24A d24a.
         D24B d24b. D24C d24c. D24D d24d.
         D24E d24e. D24F d24f. D26A d26a.
         D26B d26b. D26C d26c. D26E d26e.
         D26G d26g. D26H d26h. D26I d26i.
         D26J d26j. D26K d26k. D26L d26l.
         D26M d26m. D26N d26n. D26O d26o.
         D26P d26p. D26Q d26q. D26R d26r.
         D26S d26s. D26T d26t. D26U d26u.
         D26V d26v. D26W d26w. D26X d26x.
         D26Y d26y. D26Z d26z. D26AA d26aa.
         D26BB d26bb. D26CC d26cc. D26DD d26dd.
         D26EE d26ee. D26FF d26ff. D26GG d26gg.
         D26HH d26hh. D26II d26ii. D28 d28fffff.
         D28A d28a. D29A d29a. D29B d29b.
         D37 d37fffff. D38 d38fffff. D38A d38a.
         D38A_6 d38a_6ff. D38A_7B d38a_7b. D38A_9 d38a_9ff.
         D39A d39a. D41 d41fffff. D42_1 d42_1fff.
         D46 d46fffff. D58 d58fffff. D72 d72fffff.
         D86 d86fffff. D87 d87fffff. D37B2 d37b2fff.
         D37B3 d37b3fff. D38A_4A d38a_4a. M1 m1ffffff.
         M3 m3ffffff. M3B2 m3b2ffff. M3D2 m3d2ffff.
         M4 m4ffffff. M5 m5ffffff. M6 m6ffffff.
         M6B2 m6b2ffff. M6D2 m6d2ffff. M7A m7a.
         M7B m7b. M7C m7c. M7D m7d.
         M7E m7e. M7F m7f. M7G m7g.
         M7H m7h. M7I m7i. M7J m7j.
         M7K m7k. M7L m7l. M7M m7m.
         M7N m7n. M7O m7o. M9 m9ffffff.
         M9A m9a. M9B m9b. M10A m10a.
         M10B m10b. M18 m18fffff. M18B2 m18b2fff.
         M18B3 m18b3fff. M18C m18c. M18D2 m18d2fff.
         M19 m19fffff. M19A m19a. M22B m22b.
         M30A m30a. M30B m30b. M30C m30c.
         M30D m30d. M30E m30e. M30F m30f.
         M30G m30g. M30H m30h. M30I m30i.
         M30J m30j. M30K m30k. M33 m33fffff.
         M45 m45fffff. M47 m47fffff. M48 m48fffff.
         IR1A ir1a. IR1B ir1b. IR2 ir2fffff.
         IR4 ir4fffff. IR7 ir7fffff. IR7B2 ir7b2fff.
         IR7C ir7c. IR8A ir8a. IR8B ir8b.
         IR8C ir8c. IR8D ir8d. IR8E ir8e.
         IR8F ir8f. IR8G ir8g. IR8H ir8h.
         IR8I ir8i. IR8J ir8j. IR8K ir8k.
         IR8L ir8l. IR8M ir8m. IR10 ir10ffff.
         IR10A ir10a. IR11 ir11ffff. IR11_1 ir11_1ff.
         IR11_2 ir11_2ff. IR12A ir12a. IR12B ir12b.
         IR20 ir20ffff. IR20B2 ir20b2ff. IR20B3 ir20b3ff.
         IR20C ir20c. IR20D2 ir20d2ff. IR21 ir21ffff.
         IR21A ir21a. IR21A_3A ir21a_3a. IR21A_4B ir21a_4b.
         IR21A_6 ir21a_6f. IR21A_7B ir21a_7b. IR21A_9 ir21a_9f.
         IR38B ir38b. IR48A ir48a. IR48B ir48b.
         IR48C ir48c. IR49 ir49ffff. IR49A ir49a.
         IR49B ir49b. IR49C ir49c. IR56 ir56ffff.
         IR68 ir68ffff. IR70 ir70ffff. IR71 ir71ffff.
         PD1A pd1a. PD1B pd1b. PD1C pd1c.
         PD1D pd1d. PD1E pd1e. PD1F pd1f.
         PD1G pd1g. PD1H pd1h. PD1I pd1i.
         PD1J pd1j. PD1K pd1k. PD1L pd1l.
         PD1M pd1m. PD1N pd1n. PD1O pd1o.
         PD1P pd1p. PD3 pd3fffff. PD6 pd6fffff.
         PD7 pd7fffff. PD7B2 pd7b2fff. PD7B3 pd7b3fff.
         PD8 pd8fffff. PD9 pd9fffff. PD9B2 pd9b2fff.
         PD9B3 pd9b3fff. PD10 pd10ffff. PD10A pd10a.
         PD13A pd13a. PD13B pd13b. PD13C pd13c.
         PD13D pd13d. PD16 pd16ffff. PD16A pd16a.
         PD16C pd16c. PD16D pd16d. PD17 pd17ffff.
         PD21B2 pd21b2ff. PD21B3 pd21b3ff. PD22 pd22ffff.
         PD24 pd24ffff. PD25A pd25a. PD25B pd25b.
         PD38 pd38ffff. PD40 pd40ffff. PD41 pd41ffff.
         PD41A pd41a. PD42 pd42ffff. PD43 pd43ffff.
         PD50 pd50ffff. PD62 pd62ffff. PD64 pd64ffff.
         PD65 pd65ffff. SP1_11 sp1_11ff. SP3A sp3a.
         SP3A2 sp3a2fff. SP3A3 sp3a3fff. SP3B sp3b.
         SP3C2 sp3c2fff. SP3C3 sp3c3fff. SP5A sp5a.
         SP5A2 sp5a2fff. SP5A3 sp5a3fff. SP5B sp5b.
         SP5C2 sp5c2fff. SP5C3 sp5c3fff. SP7A sp7a.
         SP7A2 sp7a2fff. SP7A3 sp7a3fff. SP7B sp7b.
         SP7C2 sp7c2fff. SP7C3 sp7c3fff. SP7F sp7f.
         SP9A sp9a. SP9A2 sp9a2fff. SP9A3 sp9a3fff.
         SP9B sp9b. SP9C2 sp9c2fff. SP9C3 sp9c3fff.
         SP9F sp9f. SP9G sp9g. SP9H sp9h.
         SP9I sp9i. SP11A sp11a. SP11A2 sp11a2ff.
         SP11A3 sp11a3ff. SP11B sp11b. SP11C2 sp11c2ff.
         SP11C3 sp11c3ff. SP11F sp11f. SP11G sp11g.
         SP11H sp11h. SP11I sp11i. SP13A sp13a.
         SP13A2 sp13a2ff. SP13A3 sp13a3ff. SP13B sp13b.
         SP13C2 sp13c2ff. SP13C3 sp13c3ff. SP13F sp13f.
         SP13G sp13g. SP13H sp13h. SP13I sp13i.
         SP13J sp13j. SP16 sp16ffff. SP17 sp17ffff.
         SP18 sp18ffff. SP18A sp18a. SP18B sp18b.
         SP18C sp18c. SP18D sp18d. SP18E sp18e.
         SP18F sp18f. SP18G sp18g. SP18H sp18h.
         SP18I sp18i. SP18J sp18j. SP18K sp18k.
         SP18L sp18l. SP18M sp18m. SP18N sp18n.
         SP18O sp18o. SP19 sp19ffff. SP21 sp21ffff.
         SP22 sp22ffff. SP27 sp27ffff. SP38 sp38ffff.
         SP40 sp40ffff. SP41 sp41ffff. SO1A so1a.
         SO1B so1b. SO1C so1c. SO1D so1d.
         SO1E so1e. SO1F so1f. SO1G so1g.
         SO1H so1h. SO1I so1i. SO1J so1j.
         SO1K so1k. SO1L so1l. SO1M so1m.
         SO1N so1n. SO3INTR1 so3intrf. SO3INTR2 so3int0f.
         ASO3B2 aso3b2ff. ASO3B3 aso3b3ff. ASO6B2 aso6b2ff.
         ASO6B3 aso6b3ff. SO8A so8a. SO8B so8b.
         SO8C so8c. SO9 so9fffff. SO9A so9a.
         SO9B so9b. SO9C so9c. SO9D so9d.
         SO9E so9e. SO9F so9f. SO9G so9g.
         SO9H so9h. SO9I so9i. SO9J so9j.
         SO9K so9k. SO9L so9l. SO9M so9m.
         SO9N so9n. SO9O so9o. SO10 so10ffff.
         SO10A so10a. SO11 so11ffff. SO12 so12ffff.
         SO12A so12a. SO13 so13ffff. SO14 so14ffff.
         SO14A so14a. SO15 so15ffff. SO15A1 so15a1ff.
         SO15A2 so15a2ff. SO15A3 so15a3ff. SO15A4 so15a4ff.
         SO15A5 so15a5ff. SO16 so16ffff. SO17 so17ffff.
         SO18 so18ffff. SO19 so19ffff. SO20 so20ffff.
         SO25 so25ffff. SO36 so36ffff. SO38 so38ffff.
         SO39 so39ffff. AG1 ag1fffff. AG1B ag1b.
         AG1C ag1c. AG1D ag1d. AG1E ag1e.
         AG1F ag1f. AG1G ag1g. AG1H ag1h.
         AG1I ag1i. AG1J ag1j. AG1K ag1k.
         AG3INTR1 ag3intrf. AG3INTR2 ag3int0f. AAG3B2 aag3b2ff.
         AAG3B3 aag3b3ff. AAG3B4 aag3b4ff. AG4A ag4a.
         AG4B ag4b. AG4C ag4c. AG4D ag4d.
         AG4E ag4e. AG4F ag4f. AG4G ag4g.
         AG4H ag4h. AAG6A2 aag6a2ff. AAG6A3 aag6a3ff.
         AG8 ag8fffff. AG8A ag8a. AG9A ag9a.
         AG9B ag9b. AG9C ag9c. AG9D ag9d.
         AG11 ag11ffff. AG11A ag11a. AG11B ag11b.
         AG11C ag11c. AG11D ag11d. AG11E ag11e.
         AG11F ag11f. AG11G ag11g. AG11H ag11h.
         AG11I ag11i. AG11J ag11j. AG11K ag11k.
         AG13 ag13ffff. AG13A1 ag13a1ff. AG14 ag14ffff.
         AG15 ag15ffff. AG16 ag16ffff. AG17 ag17ffff.
         AG17A ag17a. AG18 ag18ffff. AG19 ag19ffff.
         AG24 ag24ffff. AG35 ag35ffff. AG37 ag37ffff.
         AG38 ag38ffff. G101 g101ffff. G102 g102ffff.
         G103 g103ffff. G104 g104ffff. G105 g105ffff.
         G106 g106ffff. G107 g107ffff. G108 g108ffff.
         G109 g109ffff. G110 g110ffff. G111 g111ffff.
         G112 g112ffff. G113 g113ffff. G114 g114ffff.
         G115 g115ffff. G116 g116ffff. G117 g117ffff.
         G118 g118ffff. G119 g119ffff. G120 g120ffff.
         G121 g121ffff. G122 g122ffff. G123 g123ffff.
         G124 g124ffff. G125 g125ffff. G126 g126ffff.
         G3 g3ffffff. G4 g4ffffff. G4A g4a.
         G5A g5a. G9A g9a. G9B g9b.
         G9C g9c. G9D g9d. G9E g9e.
         G9F g9f. G10A g10a. G10B g10b.
         G10C g10c. G10D g10d. G10E g10e.
         G13A g13a. G13B g13b. G13C g13c.
         G13D g13d. G13E g13e. G13F g13f.
         G13G g13g. G13H g13h. G13I g13i.
         G13J g13j. G13K g13k. G13L g13l.
         G13M g13m. G13N g13n. G13O g13o.
         G15 g15fffff. G17 g17fffff. G17A g17a.
         G18A g18a. G18B g18b. G26 g26fffff.
         G26C g26c. G27 g27fffff. G27A g27a.
         G27A_4A g27a_4a. G27A_6 g27a_6ff. G27A_7A g27a_7a.
         G27A_9 g27a_9ff. G30 g30fffff. G36A g36a.
         G36B g36b. G36C g36c. G36D g36d.
         G36E g36e. G36F g36f. G36G g36g.
         G37 g37fffff. G44 g44fffff. G56 g56fffff.
         G58 g58fffff. G59 g59fffff. IED5 ied5ffff.
         IED5A ied5a. IED5B ied5b. IED6 ied6ffff.
         IED7 ied7ffff. IED9 ied9ffff. IED9A ied9a.
         IED10 ied10fff. IED10B ied10b. IED11 ied11fff.
         IED11A ied11a. IED16 ied16fff. IED16A ied16a.
         IED17 ied17fff. IED18 ied18fff. IED18C ied18c.
         IED18D ied18d. IED22 ied22fff. IED29 ied29fff.
         IED30 ied30fff. IED32 ied32fff. IED33 ied33fff.
         SD2 sd2fffff. SD3 sd3fffff. SD4 sd4fffff.
         SD5 sd5fffff. SD6 sd6fffff. SD9 sd9fffff.
         SD10 sd10ffff. SD14 sd14ffff. SD15 sd15ffff.
         SD16 sd16ffff. SD17 sd17ffff. SD18 sd18ffff.
         SD19 sd19ffff. SD19A sd19a. SD22 sd22ffff.
         SD23 sd23ffff. SD27 sd27ffff. SR2 sr2fffff.
         SR3 sr3fffff. SR5A sr5a. SR5D sr5d.
         SR6B sr6b. SR8 sr8fffff. SR9B sr9b.
         SR9_1 sr9_1fff. SR9_1A sr9_1a. SR10 sr10ffff.
         SR10B sr10b. SR11 sr11ffff. SR11B sr11b.
         SR12 sr12ffff. SR13 sr13ffff. SR16 sr16ffff.
         SR1701 sr1701ff. SR1702 sr1702ff. SR1703 sr1703ff.
         SR1704 sr1704ff. SR1705 sr1705ff. SR1706 sr1706ff.
         SR1707 sr1707ff. SR1708 sr1708ff. SR1709 sr1709ff.
         SR1710 sr1710ff. SR20 sr20ffff. SR23 sr23ffff.
         SR24 sr24ffff. SR25 sr25ffff. SR25A sr25a.
         SR28 sr28ffff. SR30 sr30ffff. SR33 sr33ffff.
         SR36 sr36ffff. SR37 sr37ffff. SR38 sr38ffff.
         SR38A sr38a. SR41 sr41ffff. SR44 sr44ffff.
         SR45 sr45ffff. SR46A sr46a. SR46B sr46b.
         SR49 sr49ffff. SR521 sr521fff. SR522 sr522fff.
         SR523 sr523fff. SR524 sr524fff. SR525 sr525fff.
         SR53 sr53ffff. SR54 sr54ffff. SR55 sr55ffff.
         SR55A sr55a. SR58 sr58ffff. SR62 sr62ffff.
         SR63 sr63ffff. SR64 sr64ffff. SR64A sr64a.
         SR67 sr67ffff. SR70 sr70ffff. SR71 sr71ffff.
         SR72 sr72ffff. SR72A sr72a. SR75 sr75ffff.
         SR77 sr77ffff. SR80 sr80ffff. SR83 sr83ffff.
         SR84 sr84ffff. SR85 sr85ffff. SR85A sr85a.
         SR88 sr88ffff. SR90 sr90ffff. SR93 sr93ffff.
         SR96 sr96ffff. SR97 sr97ffff. SR98 sr98ffff.
         SR98A sr98a. SR101 sr101fff. SR10501 sr10501f.
         SR10502 sr10502f. SR10503 sr10503f. SR10504 sr10504f.
         SR10505 sr10505f. SR10506 sr10506f. SR10507 sr10507f.
         SR106 sr106fff. SR107 sr107fff. SR108 sr108fff.
         SR108A sr108a. SR111 sr111fff. SR112 sr112fff.
         SR113 sr113fff. SR114A sr114a. SR116A sr116a.
         SR116B sr116b. SR116C sr116c. SR116D sr116d.
         SR116E sr116e. SR116F sr116f. SR116G sr116g.
         SR116H sr116h. SR116I sr116i. SR116J sr116j.
         SR116K sr116k. SR116L sr116l. SR116M sr116m.
         SR116N sr116n. SR117 sr117fff. SR1181 sr1181ff.
         SR1182 sr1182ff. SR1183 sr1183ff. SR1184 sr1184ff.
         SR1185 sr1185ff. SR1186 sr1186ff. SR1187 sr1187ff.
         SR1188 sr1188ff. SR120A sr120a. SR120B sr120b.
         SR120C sr120c. SR120D sr120d. SR120E sr120e.
         SR120F sr120f. SR120G sr120g. SR120H sr120h.
         SR120I sr120i. SR120J sr120j. SR120K sr120k.
         SR120L sr120l. SR120M sr120m. SR120N sr120n.
         SR120O sr120o. SR121 sr121fff. SR122 sr122fff.
         SR122B sr122b. SR123 sr123fff. SR124 sr124fff.
         SR126A sr126a. SR126B sr126b. SR126C sr126c.
         SR126D sr126d. SR126E sr126e. SR126F sr126f.
         SR126G sr126g. SR126H sr126h. SR126I sr126i.
         SR126J sr126j. SR126K sr126k. SR126L sr126l.
         SR126M sr126m. SR126N sr126n. SR126O sr126o.
         SR127 sr127fff. SR128 sr128fff. SR128A01 sr128a0f.
         SR128A02 sr128a1f. SR128A03 sr128a2f. SR128A04 sr128a3f.
         SR128A05 sr128a4f. SR128A06 sr128a5f. SR128A07 sr128a6f.
         SR128A08 sr128a7f. SR128A09 sr128a8f. SR128A10 sr128a9f.
         SR128A11 sr12810f. SR128A12 sr12811f. SR1301 sr1301ff.
         SR1302 sr1302ff. SR1303 sr1303ff. SR1304 sr1304ff.
         SR1305 sr1305ff. SR1306 sr1306ff. SR1307 sr1307ff.
         SR130B sr130b. SR130C01 sr130c0f. SR130C02 sr130c1f.
         SR130C03 sr130c2f. SR131 sr131fff. SR131C1 sr131c1f.
         SR131C2 sr131c2f. SR131C3 sr131c3f. SR131C4 sr131c4f.
         SR131C5 sr131c5f. SR13301 sr13301f. SR13302 sr13302f.
         SR13303 sr13303f. SR13304 sr13304f. SR13305 sr13305f.
         SR13306 sr13306f. SR135 sr135fff. PEA40 pea40fff.
         PEA41 pea41fff. PEA42 pea42fff. PEA43 pea43fff.
         PEA44 pea44fff. PEA45 pea45fff. PEA46 pea46fff.
         PEA47 pea47fff. PEA48 pea48fff. PEA49 pea49fff.
         PEA50 pea50fff. PEA51 pea51fff. PEA52 pea52fff.
         PEA53 pea53fff. PEA54 pea54fff. PEA55 pea55fff.
         PEA56 pea56fff. PEA57 pea57fff. PEA58 pea58fff.
         PEA59 pea59fff. PEA60 pea60fff. PEA61 pea61fff.
         PEA62 pea62fff. PEA63 pea63fff. PEA64 pea64fff.
         PEA65 pea65fff. PEA66 pea66fff. PEA67 pea67fff.
         PEA68 pea68fff. PEA69 pea69fff. PEA70 pea70fff.
         PEA71 pea71fff. PEA72 pea72fff. PEA73 pea73fff.
         PEA74 pea74fff. PEA75 pea75fff. PEA76 pea76fff.
         PEA77 pea77fff. PEA78 pea78fff. PEA79 pea79fff.
         PEA80 pea80fff. PEA81 pea81fff. PEA82 pea82fff.
         PEA83 pea83fff. SU2B su2b. SU2C su2c.
         SU3 su3fffff. SU5 su5fffff. SU8 su8fffff.
         SU12 su12ffff. SU12A su12a. SU12B su12b.
         SU12C su12c. SU15INTR1 su15intf. SU15INTR2 su15in0f.
         SU15B2 su15b2ff. SU15B3 su15b3ff. SU16 su16ffff.
         SU19 su19ffff. SU19A su19a. SU19B su19b.
         SU19C su19c. SU19D su19d. SU19E su19e.
         SU19F su19f. SU19G su19g. SU19H su19h.
         SU19I su19i. SU19J su19j. SU26 su26ffff.
         SU29 su29ffff. SU30B su30b. SU30C su30c.
         SU34B su34b. SU38A su38a. SU38B su38b.
         SU38C su38c. SU38D su38d. SU38E su38e.
         SU41 su41ffff. SU42 su42ffff. SU43 su43ffff.
         SU44 su44ffff. SU45A1 su45a1ff. SU45A2 su45a2ff.
         SU45B1 su45b1ff. SU45B2 su45b2ff. SU45C1 su45c1ff.
         SU45C2 su45c2ff. SU45D1 su45d1ff. SU45D2 su45d2ff.
         SU47A su47a. SU47B su47b. SU47C su47c.
         SU47D su47d. SU48A su48a. SU48B su48b.
         SU48C su48c. SU48D su48d. SU68B2 su68b2ff.
         SU68B3 su68b3ff. SU83B su83b. SU83C su83c.
         SU65 su65ffff. SU65A su65a. SU65B su65b.
         SU65C su65c. SU68INTR1 su68intf. SU68INTR2 su68in0f.
         SU69 su69ffff. SU72 su72ffff. SU72A su72a.
         SU72B su72b. SU72C su72c. SU72D su72d.
         SU72E su72e. SU72F su72f. SU72G su72g.
         SU72H su72h. SU72I su72i. SU79 su79ffff.
         SU82 su82ffff. SU86A su86a. SU86B su86b.
         SU86C su86c. SU86D su86d. SU86E su86e.
         SU87A2 su87a2ff. SU87A3 su87a3ff. SU87B2 su87b2ff.
         SU87B3 su87b3ff. SU95 su95ffff. SU102 su102fff.
         SU103 su103fff. SU119 su119fff. SU119_2 su119_2f.
         CC1A cc1a. CC1B cc1b. CC1C cc1c.
         CC1D cc1d. CC1E cc1e. CC1F cc1f.
         CC1G cc1g. CC1H cc1h. CC1I cc1i.
         CC1J cc1j. CC1L cc1l. CC1N cc1n.
         CC1O cc1o. CC1S cc1s. CC1T cc1t.
         CC4B cc4b. CC4C cc4c. CC4D cc4d.
         CC4E cc4e. CC4I cc4i. CC4N cc4n.
         CC4O cc4o. CC6 cc6fffff. CC6A01 cc6a01ff.
         CC6A02 cc6a02ff. CC6A03 cc6a03ff. CC6A04 cc6a04ff.
         CC6_1 cc6_1fff. CC6_1B cc6_1b. CC6_1C cc6_1c.
         CC6_21 cc6_21ff. CC6_22 cc6_22ff. CC6_23 cc6_23ff.
         CC6_24 cc6_24ff. CC6_25 cc6_25ff. CC6_26 cc6_26ff.
         CC6_301 cc6_301f. CC6_302 cc6_302f. CC6_303 cc6_303f.
         CC15B cc15b. CC19A cc19a. CC19B cc19b.
         CC19C cc19c. CC19D cc19d. CC19E cc19e.
         CC19F cc19f. CC19G cc19g. CC20A cc20a.
         CC20B cc20b. CC20C cc20c. CC20D cc20d.
         CC24A cc24a. CC24B cc24b. CC24C cc24c.
         CC24D cc24d. CC24E cc24e. CC24F cc24f.
         CC24G cc24g. CC24H cc24h. CC24J cc24j.
         CC26A cc26a. CC26B cc26b. CC26C cc26c.
         CC26D cc26d. CC26E cc26e. CC28_1 cc28_1ff.
         CC28_1A1 cc28_1af. CC28_1A2 cc28_10f. CC28_1A3 cc28_11f.
         CC28_1A4 cc28_12f. CC28_1A5 cc28_13f. CC28_1A6 cc28_14f.
         CC28_2 cc28_2ff. CC28_3 cc28_3ff. CC28_3A cc28_3a.
         CC29_3 cc29_3ff. CC31B cc31b. CC34_2A cc34_2a.
         CC34_2B cc34_2b. CC34_301 cc34_30f. CC34_302 cc34_31f.
         CC34_303 cc34_32f. CC34_304 cc34_33f. CC34_5 cc34_5ff.
         CC34_8 cc34_8ff. CC34_9 cc34_9ff. CC36 cc36ffff.
         CC38INT1 cc38intf. CC38INT2 cc38in0f. CC39 cc39ffff.
         CC40 cc40ffff. CC41 cc41ffff. CC42 cc42ffff.
         CC43 cc43ffff. CC44_2 cc44_2ff. CC45 cc45ffff.
         CC46 cc46ffff. CC46A cc46a. CC48 cc48ffff.
         CC48A cc48a. CC49_2 cc49_2ff. CC49_2A cc49_2a.
         CC49_2B cc49_2b. CC49_2D cc49_2d. CC49_2E cc49_2e.
         CC49_2F cc49_2f. CC50 cc50ffff. CC50_1 cc50_1ff.
         CC50_2 cc50_2ff. CC50_3 cc50_3ff. CC50_3A cc50_3a.
         CC50_4 cc50_4ff. CC50_5 cc50_5ff. CC50_7 cc50_7ff.
         CC50_9 cc50_9ff. CC50_11 cc50_11f. CC50_12 cc50_12f.
         CC50_13 cc50_13f. CC50_14 cc50_14f. CC50_15 cc50_15f.
         CC50_16A cc50_16a. CC50_17A cc50_17a. CC51 cc51ffff.
         CC52 cc52ffff. CC53 cc53ffff. CC62 cc62ffff.
         CC64 cc64ffff. CC66 cc66ffff. CC67 cc67ffff.
         CC70 cc70ffff. CC74 cc74ffff. CC77 cc77ffff.
         CC81 cc81ffff. CC34_10 cc34_10f. N1 n1ffffff.
         N2 n2ffffff. N3 n3ffffff. N4 n4ffffff.
         N4A n4a. N5A n5a. N5B n5b.
         N5C n5c. N5D n5d. N5E n5e.
         N5F n5f. N5G n5g. N5H n5h.
         N7 n7ffffff. N7A n7a. N7B n7b.
         N801 n801ffff. N802 n802ffff. N803 n803ffff.
         N804 n804ffff. N805 n805ffff. N806 n806ffff.
         N807 n807ffff. N808 n808ffff. N809 n809ffff.
         N810 n810ffff. N10 n10fffff. N13 n13fffff.
         N14 n14fffff. N15 n15fffff. N16 n16fffff.
         N17 n17fffff. N17A n17a. N20B n20b.
         N21B n21b. N32 n32fffff. N44 n44fffff.
         N46 n46fffff. N47 n47fffff. FD1 fd1fffff.
         FD1A fd1a. FD2 fd2fffff. FD2A fd2a.
         FD3 fd3fffff. FD3A fd3a. FD4A fd4a.
         FD7A fd7a. FD9A fd9a. FD10 fd10ffff.
         FD11A fd11a. FD11B fd11b. FD11C fd11c.
         FD11D fd11d. FD12 fd12ffff. FD13A fd13a.
         FD13B fd13b. FD13C fd13c. FD14 fd14ffff.
         FD15A fd15a. FD15B fd15b. FD15C fd15c.
         FD16 fd16ffff. FD17A fd17a. FD17B fd17b.
         FD17C fd17c. FD17D fd17d. FD17E fd17e.
         FD18A fd18a. FD18B fd18b. FD18C fd18c.
         FD18D fd18d. FD20 fd20ffff. FD21 fd21ffff.
         FD22 fd22ffff. FD24_1B fd24_1b. FD25 fd25ffff.
         FD25A fd25a. FD25B fd25b. FD26 fd26ffff.
         FD26A fd26a. FD26B fd26b. FD26C2 fd26c2ff.
         NSD1 nsd1ffff. NSD1A nsd1a. NSD1B nsd1b.
         NSD1C nsd1c. NSD1D nsd1d. NSD1E nsd1e.
         NSD1F nsd1f. NSD1G nsd1g. NSD1H nsd1h.
         NSD1I nsd1i. NSD1J nsd1j. NSD1K nsd1k.
         NSD1L nsd1l. NSD1M nsd1m. NSD1N nsd1n.
         NSD2K nsd2k. NSD2L nsd2l. NSD2M nsd2m.
         NSD2N nsd2n. NSD2O nsd2o. NSD2P nsd2p.
         NSD2Q nsd2q. NSD2R nsd2r. NSD2S nsd2s.
         NSD2T nsd2t. NSD2U nsd2u. NSD2V nsd2v.
         NSD2W nsd2w. NSD2X nsd2x. NSD3 nsd3ffff.
         NSD3A nsd3a. NSD3B nsd3b. NSD3_1A nsd3_1a.
         NSD3_1B nsd3_1b. NSD3_1C nsd3_1c. NSD3_1D nsd3_1d.
         NSD4A nsd4a. NSD4B nsd4b. NSD4C nsd4c.
         NSD4D nsd4d. NSD4E nsd4e. NSD4F nsd4f.
         NSD4G nsd4g. NSD5A nsd5a. NSD5B nsd5b.
         NSD5C nsd5c. NSD5D nsd5d. NSD5E nsd5e.
         NSD5F nsd5f. NSD5G nsd5g. NSD5H nsd5h.
         NSD5I nsd5i. NSD5J nsd5j. TB2 tb2fffff.
         TB4 tb4fffff. TB11 tb11ffff. TB15 tb15ffff.
         TB15A tb15a. TB15B tb15b. TB15C tb15c.
         TB15D tb15d. TB15E tb15e. TB15F tb15f.
         TB15G tb15g. TB15H tb15h. TB15I tb15i.
         TB15J tb15j. TB15K tb15k. TB15L tb15l.
         TB15M tb15m. TB16_1 tb16_1ff. TB21 tb21ffff.
         TB22 tb22ffff. TB25 tb25ffff. TB31 tb31ffff.
         TB32 tb32ffff. TB33 tb33ffff. TB34 tb34ffff.
         TB35 tb35ffff. TB38A tb38a. TB41A tb41a.
         TB41B tb41b. TB41C tb41c. TB41D tb41d.
         PR3 pr3fffff. PR3A pr3a. PR4 pr4fffff.
         PR4B pr4b. PR5 pr5fffff. PR6 pr6fffff.
         PR8 pr8fffff. PR10 pr10ffff. PR121 pr121fff.
         PR122 pr122fff. PR13 pr13ffff. PR16 pr16ffff.
         PR16A pr16a. PR19 pr19ffff. PR19A pr19a.
         PR20 pr20ffff. PR21 pr21ffff. PR21A pr21a.
         PR27 pr27ffff. PR30 pr30ffff. O1A o1a.
         O1B o1b. O1C o1c. O1D o1d.
         O1E o1e. O1F o1f. O1G o1g.
         O1H o1h. O1I o1i. O3B o3b.
         O3C o3c. O5B o5b. O5C o5c.
         O7 o7ffffff. O8 o8ffffff. O10 o10fffff.
         O10A o10a. O11 o11fffff. O12 o12fffff.
         O13 o13fffff. O14 o14fffff. O16 o16fffff.
         O16A o16a. O17B o17b. O18 o18fffff.
         O19 o19fffff. O20 o20fffff. O22 o22fffff.
         O22A o22a. O23 o23fffff. O24 o24fffff.
         O24A o24a. O25 o25fffff. O25A o25a.
         O26 o26fffff. O28 o28fffff. O28A o28a.
         O29B o29b. O30 o30fffff. O30A o30a.
         O31 o31fffff. O32 o32fffff. O37A o37a.
         O37B o37b. O37C01 o37c01ff. O37C02 o37c02ff.
         O45 o45fffff. O45B2 o45b2fff. O45B3 o45b3fff.
         O47B o47b. O53A o53a. O67 o67fffff.
         O69 o69fffff. O70 o70fffff. PS1A ps1a.
         PS1A1 ps1a1fff. PS1B ps1b. PS1B1 ps1b1fff.
         PS1C ps1c. PS1C1 ps1c1fff. PS1D ps1d.
         PS1D1 ps1d1fff. PS1E ps1e. PS1E1 ps1e1fff.
         PS1F ps1f. PS1F1 ps1f1fff. PS4 ps4fffff.
         PS7 ps7fffff. PS81 ps81ffff. PS82 ps82ffff.
         PS83 ps83ffff. PS84 ps84ffff. PS10 ps10ffff.
         PS10A ps10a. GM1 gm1fffff. GM1_1A gm1_1a.
         GM1_1B gm1_1b. GM1_1C gm1_1c. GM1_1D gm1_1d.
         GM1_1E gm1_1e. GM1_1F gm1_1f. GM1_1G gm1_1g.
         GM1_1H gm1_1h. GM1_1I gm1_1i. GM1_1J gm1_1j.
         GM1_1K gm1_1k. GM4 gm4fffff. GM29 gm29ffff.
         GM30 gm30ffff. GM31 gm31ffff. GM32 gm32ffff.
         GM35 gm35ffff. GM36 gm36ffff. GM37A gm37a.
         GM37B gm37b. GM37C gm37c. GM37D gm37d.
         GM38A gm38a. GM38B gm38b. GM38C gm38c.
         GM8A gm8a. GM8B gm8b. GM8C gm8c.
         GM8D gm8d. GM10A gm10a. GM10B gm10b.
         GM10C gm10c. GM10D gm10d. GM10E gm10e.
         GM10F gm10f. GM10G gm10g. GM10H gm10h.
         GM10I gm10i. GM10J gm10j. GM10K gm10k.
         GM13 gm13ffff. GM14B gm14b. GM16 gm16ffff.
         GM16A1 gm16a1ff. GM16A2 gm16a2ff. GM17 gm17ffff.
         GM20 gm20ffff. GM20B1 gm20b1ff. GM20B2 gm20b2ff.
         GM21 gm21ffff. GM22A1 gm22a1ff. GM22A2 gm22a2ff.
         GM24 gm24ffff. GM25A1 gm25a1ff. GM25A2 gm25a2ff.
         GM40 gm40ffff. GM41 gm41ffff. GM43 gm43ffff.
         WU101 wu101fff. WU102 wu102fff. WU103 wu103fff.
         WU104 wu104fff. WU105 wu105fff. WU106 wu106fff.
         WU107 wu107fff. WU108 wu108fff. WU109 wu109fff.
         WU110 wu110fff. WU111 wu111fff. WU2 wu2fffff.
         WU301 wu301fff. WU302 wu302fff. WU303 wu303fff.
         WU304 wu304fff. WU305 wu305fff. WU306 wu306fff.
         WU307 wu307fff. WU308 wu308fff. WU309 wu309fff.
         WU310 wu310fff. WU4 wu4fffff. WU5 wu5fffff.
         WU6 wu6fffff. WU6A wu6a. WU6C wu6c.
         EM4B em4b. EM601 em601fff. EM602 em602fff.
         EM603 em603fff. EM604 em604fff. EM605 em605fff.
         EM7E em7e. EM7F em7f. EM7H em7h.
         EM7I em7i. EM7J em7j. EM7K em7k.
         EM10 em10ffff. EM10_1B em10_1b. EM11 em11ffff.
         EM12B em12b. EM141 em141fff. EM142 em142fff.
         EM18 em18ffff. EM22 em22ffff. EM22A em22a.
         EM23 em23ffff. EM23A em23a. EM251 em251fff.
         EM252 em252fff. EM291 em291fff. EM292 em292fff.
         EM36A em36a. EM36B em36b. EM36C em36c.
         EM36D em36d. EM36E em36e. EM36F em36f.
         EM36G em36g. EM36H em36h. EM36I em36i.
         EM36J em36j. EM40 em40ffff. EM41 em41ffff.
         EM42 em42ffff. EM43 em43ffff. SE2 se2fffff.
         SE5 se5fffff. SE6B se6b. FN12 fn12ffff.
         FN14 fn14ffff. FN14A fn14a. FN15 fn15ffff.
         FN16 fn16ffff. FN18 fn18ffff. FN19 fn19ffff.
         MR1B mr1b. MR10_0 mr10_0ff. MR10_2 mr10_2ff.
         MR11 mr11ffff. MR12 mr12ffff. MR13 mr13ffff.
         MR15 mr15ffff. MR20A mr20a. MR23 mr23ffff.
         MR25_4B mr25_4b. MR35A mr35a. MR36A mr36a.
         MR40A mr40a. MR40B mr40b. MR40C mr40c.
         MR40D mr40d. MR40E mr40e. MR40F mr40f.
         MR40G mr40g. MR40H mr40h. MR40I mr40i.
         MR41 mr41ffff. MR41A mr41a. MR41B mr41b.
         MR41_1A mr41_1a. MR41_1B mr41_1b. MR41_1C mr41_1c.
         MR41_1D mr41_1d. MR41_2A mr41_2a. MR41_2B mr41_2b.
         MR41_2C mr41_2c. MR41_2D mr41_2d. MR42 mr42ffff.
         MR43 mr43ffff. MR44 mr44ffff. MR45 mr45ffff.
         MR47 mr47ffff. MR49A mr49a. MR49B mr49b.
         MR49C mr49c. MR49D mr49d. MR49E mr49e.
         MR49F mr49f. MR49G mr49g. MR49H mr49h.
         MR50 mr50ffff. MR53A mr53a. MR53B mr53b.
         MR53C mr53c. MR53D mr53d. MR53E mr53e.
         CN1AA cn1aa. CN1BB cn1bb. CN1CC cn1cc.
         CN2AA cn2aa. CN2BB cn2bb. CN2CC cn2cc.
         CN5 cn5fffff. CN5A cn5a. CN6 cn6fffff.
         CN6A cn6a. CN7 cn7fffff. CN7A cn7a.
         CN7D cn7d. CN7D_101 cn7d_10f. CN7D_102 cn7d_11f.
         CN7D_103 cn7d_12f. CN7D_104 cn7d_13f. CN7D_105 cn7d_14f.
         CN7D_106 cn7d_15f. CN7D_107 cn7d_16f. CN7D_108 cn7d_17f.
         CN7D_109 cn7d_18f. CN7D_110 cn7d_19f. CN7_2 cn7_2fff.
         CN10 cn10ffff. CN11_2 cn11_2ff. CN11_5 cn11_5ff.
         SN1 sn1fffff. SN2 sn2fffff. SN3 sn3fffff.
         SN4 sn4fffff. SN5 sn5fffff. SN6 sn6fffff.
         SN7 sn7fffff. SN8 sn8fffff. SN9 sn9fffff.
         SN10 sn10ffff. SN12 sn12ffff. SN13 sn13ffff.
         SN14 sn14ffff. SN15 sn15ffff. SN16 sn16ffff.
         DA27 da27ffff. DA28 da28ffff. DA29 da29ffff.
         DA30 da30ffff. DA31 da31ffff. DA31A da31a.
         DA33 da33ffff. DA34 da34ffff. DA35 da35ffff.
         DA36 da36ffff. DA36_1 da36_1ff. DA36_1A2 da36_1af.
         DA36_3 da36_3ff. DA39 da39ffff. DA39C da39c.
         DA48 da48ffff. DA41C da41c. DM_DE4 dm_de4ff.
         DE5_1 de5_1fff. DE7 de7fffff. DE8 de8fffff.
         DE9_3 de9_3fff. DE9_7 de9_7fff. DE20_2 de20_2ff.
         DE20_2A de20_2a. DE20_401 de20_40f. DE20_402 de20_41f.
         DE20_403 de20_42f. DE20_404 de20_43f. DE20_405 de20_44f.
         DE20_406 de20_45f. DE20_407 de20_46f. DE20_408 de20_47f.
         DE20_409 de20_48f. DE20_410 de20_49f. DE20_411 de20_10f.
         DE20_412 de20_11f. DE20_413 de20_12f. DE20_414 de20_13f.
         DE20_5 de20_5ff. DE20_7 de20_7ff. DE20_81 de20_81f.
         DE20_82 de20_82f. DE20_83 de20_83f. DE20_84 de20_84f.
         DE20_85 de20_85f. DE20_86 de20_86f. DE20_8A de20_8a.
         DE20_10 de20_14f. DE20_11 de20_15f. DE20_12 de20_16f.
         CH1 ch1fffff. CH2_11 ch2_11ff. CH2_12 ch2_12ff.
         CH2_13 ch2_13ff. CH2_14 ch2_14ff. CH3_1 ch3_1fff.
         CH3_2 ch3_2fff. CH6 ch6fffff. CH6A1 ch6a1fff.
         CH6A2 ch6a2fff. CH6A3 ch6a3fff. CH6CA ch6ca.
         CH8 ch8fffff. CH8A ch8a. CH9 ch9fffff.
         CH13 ch13ffff. CH13A ch13a. CH14 ch14ffff.
         CH19 ch19ffff. CH28 ch28ffff. CH28A1 ch28a1ff.
         CH28A2 ch28a2ff. CH28A3 ch28a3ff. CH28A4 ch28a4ff.
         CH29 ch29ffff. CH30_1A ch30_1a. CH30_1B ch30_1b.
         CH30_1C ch30_1c. CH30_1D ch30_1d. CH30_1E ch30_1e.
         CH38 ch38ffff. CH39_1 ch39_1ff. CH40A ch40a.
         CH40F ch40f. CH40H ch40h. CH40I ch40i.
         CH41 ch41ffff. CH41A ch41a. CH42 ch42ffff.
         CH44 ch44ffff. CH44A ch44a. CH45 ch45ffff.
         CH46 ch46ffff. CH46A ch46a. CH47 ch47ffff.
         CH49 ch49ffff. CH49A ch49a. CH50 ch50ffff.
         CH51 ch51ffff. CH51A ch51a. CH52 ch52ffff.
         CH56 ch56ffff. CH59 ch59ffff. CH59A ch59a.
         CH60 ch60ffff. CH61 ch61ffff. CH62 ch62ffff.
         CH63 ch63ffff. CH64 ch64ffff. CH66 ch66ffff.
         CH67 ch67ffff. CH68 ch68ffff. CH69_1 ch69_1ff.
         CH69_2A ch69_2a. CH69_2B ch69_2b. CH69_2C ch69_2c.
         CH69_2D ch69_2d. CH71 ch71ffff. CH71A ch71a.
         CH72 ch72ffff. CH74 ch74ffff. CH74A ch74a.
         CH75 ch75ffff. CH76 ch76ffff. CH76A ch76a.
         CH77 ch77ffff. CH79 ch79ffff. CH79A ch79a.
         CH80 ch80ffff. CH81 ch81ffff. CH81A ch81a.
         CH82 ch82ffff. CH86 ch86ffff. CH89 ch89ffff.
         CH89A ch89a. CH90 ch90ffff. CH91 ch91ffff.
         CH92 ch92ffff. CH93 ch93ffff. CH94 ch94ffff.
         CH96 ch96ffff. CH97 ch97ffff. AD1A ad1a.
         AD1B ad1b. AD1C ad1c. AD1D ad1d.
         AD1E ad1e. AD1F ad1f. AD1G ad1g.
         AD1H ad1h. AD1I ad1i. AD3 ad3fffff.
         AD3B2 ad3b2fff. AD3B3 ad3b3fff. AD3B4 ad3b4fff.
         AD4 ad4fffff. AD6A ad6a. AD6B ad6b.
         AD6C ad6c. AD6D ad6d. AD14 ad14ffff.
         AD25 ad25ffff. AD27 ad27ffff. AD28 ad28ffff.
         AD30A ad30a. AD30B ad30b. AD30C ad30c.
         AD30D ad30d. AD30E ad30e. AD30F ad30f.
         AD30G ad30g. AD30H ad30h. AD30I ad30i.
         AD30J ad30j. AD30K ad30k. AD32 ad32ffff.
         AD33 ad33ffff. AD35A ad35a. AD35B ad35b.
         AD35C ad35c. AD35D ad35d. AD43_1 ad43_1ff.
         AD43_1B ad43_1b. AD43_1F ad43_1f. AD43_1G ad43_1g.
         OD1A od1a. OD1B od1b. OD1C od1c.
         OD1D od1d. OD1E od1e. OD1F od1f.
         OD1G od1g. OD1H od1h. OD1I od1i.
         OD1J od1j. OD1K od1k. OD3 od3fffff.
         OD3B2 od3b2fff. OD3B3 od3b3fff. OD4 od4fffff.
         OD6 od6fffff. OD12 od12ffff. OD23 od23ffff.
         OD25 od25ffff. OD26 od26ffff. CD1A cd1a.
         CD1B cd1b. CD1C cd1c. CD1D cd1d.
         CD1E cd1e. CD1F cd1f. CD1G cd1g.
         CD1H cd1h. CD1I cd1i. CD1J cd1j.
         CD1K cd1k. CD7 cd7fffff. CD7B1 cd7b1fff.
         CD7B2 cd7b2fff. CD9 cd9fffff. CD11 cd11ffff.
         CD16 cd16ffff. CD16A cd16a. CD16B cd16b.
         CD16C cd16c. CD16D cd16d. CD16E cd16e.
         CD16F cd16f. CD18 cd18ffff. CD20 cd20ffff.
         CD22 cd22ffff. CD32 cd32ffff. CD33 cd33ffff.
         CD37 cd37ffff. SA1A sa1a. SA1B sa1b.
         SA1C sa1c. SA1D sa1d. SA1E sa1e.
         SA1F sa1f. SA1G sa1g. SA1H sa1h.
         SA1I sa1i. SA1J sa1j. SA1K sa1k.
         SA4 sa4fffff. SA5 sa5fffff. SA6 sa6fffff.
         SA7 sa7fffff. SA7A sa7a. SA8 sa8fffff.
         SA8B2 sa8b2fff. SA8B3 sa8b3fff. SA11A sa11a.
         SA11B sa11b. SA11C sa11c. SA11D sa11d.
         SA11E sa11e. SA11F sa11f. SA11G sa11g.
         SA11H sa11h. SA11I sa11i. SA11J sa11j.
         SA11K sa11k. SA11L sa11l. SA11M sa11m.
         SA11N sa11n. SA14 sa14ffff. SA15 sa15ffff.
         SA16 sa16ffff. SA17 sa17ffff. SA18 sa18ffff.
         SA19 sa19ffff. SA19B2 sa19b2ff. SA19B3 sa19b3ff.
         SA20 sa20ffff. SA20A sa20a. SA43 sa43ffff.
         SA44 sa44ffff. SA46 sa46ffff. SA47 sa47ffff.
         FB6A fb6a. FB6A11 fb6a11ff. FB6A12 fb6a12ff.
         FB6A13 fb6a13ff. FB6A14 fb6a14ff. FB6A15 fb6a15ff.
         FB6A16 fb6a16ff. FB6B fb6b. FB6B11 fb6b11ff.
         FB6B12 fb6b12ff. FB6B13 fb6b13ff. FB6B14 fb6b14ff.
         FB6C fb6c. FB6C11 fb6c11ff. FB6C12 fb6c12ff.
         FB6C13 fb6c13ff. FB6C14 fb6c14ff. FB6C15 fb6c15ff.
         FB6C16 fb6c16ff. FB6D fb6d. FB6D11 fb6d11ff.
         FB6D12 fb6d12ff. FB6E fb6e. FB6E11 fb6e11ff.
         FB6E12 fb6e12ff. FB6F fb6f. FB6F11 fb6f11ff.
         FB6F12 fb6f12ff. FB6F13 fb6f13ff. FB6F14 fb6f14ff.
         FB6G fb6g. FB6G11 fb6g11ff. FB6G12 fb6g12ff.
         FB6G13 fb6g13ff. FB6G14 fb6g14ff. FB6H fb6h.
         FB6H11 fb6h11ff. FB6H12 fb6h12ff. FB6H13 fb6h13ff.
         FB6H14 fb6h14ff. FB6H15 fb6h15ff. FB6I fb6i.
         FB6I11 fb6i11ff. FB6I12 fb6i12ff. FB6I13 fb6i13ff.
         FB6I14 fb6i14ff. FB6I15 fb6i15ff. FB6J11 fb6j11ff.
         FB6K fb6k. FB6K11 fb6k11ff. FB6K12 fb6k12ff.
         FB6K13 fb6k13ff. FB6L11 fb6l11ff. FB6L12 fb6l12ff.
         FB8 fb8fffff. FB9A fb9a. FB9B fb9b.
         FB9C fb9c. FB11 fb11ffff. FB13 fb13ffff.
         FB14 fb14ffff. FB15 fb15ffff. PP1 pp1fffff.
         PP1AA pp1aa. T1 t1ffffff. T2 t2ffffff.
         T3 t3ffffff. T3A01 t3a01fff. T3A02 t3a02fff.
         T3A03 t3a03fff. ID4 id4fffff. ID5 id5fffff.
         ID6 id6fffff. ID7 id7fffff. ID8 id8fffff.
         ID9 id9fffff. ID10 id10ffff. ID11 id11ffff.
         ID12 id12ffff. ID13 id13ffff. ID14 id14ffff.
         ID15 id15ffff. ID16 id16ffff. ID17 id17ffff.
         PH5_05B ph5_05b. PH6_05B ph6_05b. PH7_05B ph7_05b.
         PH8_05B ph8_05b. PH9_05B ph9_05b. PH10_05B ph10_05b.
         PH11_05B ph11_05b. PH12_05B ph12_05b. PH13_05B ph13_05b.
         PH14_05B ph14_05b. PH15_05B ph15_05b. PH16_05B ph16_05b.
         PH17_05B ph17_05b. PH18_05B ph18_05b. PH19_05B ph19_05b.
         PH20_05B ph20_05b. PH21_05B ph21_05b. PH14_101 ph14_10f.
         PH14_102 ph14_11f. PH14_103 ph14_12f. PH14_104 ph14_13f.
         PH14_105 ph14_14f. PH14_106 ph14_15f. PH14_107 ph14_16f.
         PH14_108 ph14_17f. PH14_109 ph14_18f. PH14_110 ph14_19f.
         PH14_111 ph14_20f. PH14_112 ph14_21f. PH14_113 ph14_22f.
         PH14_114 ph14_23f. PH14_115 ph14_24f. PH14_116 ph14_25f.
         PH14_2 ph14_2ff. PH15 ph15ffff. PH15_1 ph15_1ff.
         PH17 ph17ffff. PH19 ph19ffff. PH19A ph19a.
         PH20 ph20ffff. PH20A1 ph20a1ff. PH20A2 ph20a2ff.
         PH20A3 ph20a3ff. PH20A4 ph20a4ff. PH20A5 ph20a5ff.
         PH20B01 ph20b01f. PH20B02 ph20b02f. PH20B03 ph20b03f.
         PH20B04 ph20b04f. PH20B05 ph20b05f. PH20B06 ph20b06f.
         PH20B07 ph20b07f. PH20B08 ph20b08f. PH20B09 ph20b09f.
         PH20B10 ph20b10f. PH20B11 ph20b11f. PH20B12 ph20b12f.
         PH21_101 ph21_10f. PH21_102 ph21_11f. PH21_103 ph21_12f.
         PH21_104 ph21_13f. PH21_105 ph21_14f. PH21_106 ph21_15f.
         PH21_107 ph21_16f. PH21_108 ph21_17f. PH21_109 ph21_18f.
         PH21_110 ph21_19f. PH21_111 ph21_20f. PH21_112 ph21_21f.
         PH21_113 ph21_22f. PH21_114 ph21_23f. PH21_115 ph21_24f.
         PH21_116 ph21_25f. PH21_2 ph21_2ff. PH22 ph22ffff.
         PH22_1 ph22_1ff. PH24 ph24ffff. PH26 ph26ffff.
         PH26A ph26a. PH27 ph27ffff. PH27A1 ph27a1ff.
         PH27A2 ph27a2ff. PH27A3 ph27a3ff. PH27A4 ph27a4ff.
         PH27A5 ph27a5ff. PH27B01 ph27b01f. PH27B02 ph27b02f.
         PH27B03 ph27b03f. PH27B04 ph27b04f. PH27B05 ph27b05f.
         PH28_101 ph28_10f. PH28_102 ph28_11f. PH28_103 ph28_12f.
         PH28_104 ph28_13f. PH28_105 ph28_14f. PH28_106 ph28_15f.
         PH28_107 ph28_16f. PH28_108 ph28_17f. PH28_109 ph28_18f.
         PH28_110 ph28_19f. PH28_2 ph28_2ff. PH29 ph29ffff.
         PH29_1 ph29_1ff. PH31 ph31ffff. PH33 ph33ffff.
         PH33A ph33a. PH34 ph34ffff. PH34A1 ph34a1ff.
         PH34A2 ph34a2ff. PH34A3 ph34a3ff. PH34A4 ph34a4ff.
         PH34A5 ph34a5ff. PH34B01 ph34b01f. PH34B02 ph34b02f.
         PH34B03 ph34b03f. PH34B04 ph34b04f. PH34B05 ph34b05f.
         PH2_1A ph2_1a. PH2_1B ph2_1b. PH2_1C ph2_1c.
         PH2_1D ph2_1d. PH2_1E ph2_1e. PH2_3 ph2_3fff.
         DM1_7 dm1_7fff. DM1_12 dm1_12ff. DM1_12A dm1_12a.
         DM1_13 dm1_13ff. DM1_13A dm1_13a. DM4 dm4fffff.
         DM6 dm6fffff. DM7 dm7fffff. DM14_6 dm14_6ff.
         DM21B dm21b. DM21_3B dm21_3b. DM21_4B dm21_4b.
         PT57A3 pt57a3ff. PT58B pt58b. PT58D pt58d.
         PT62_INTRO2 pt62_inf. PT62_INTRO3 pt62_i0f. PT62_INTRO4 pt62_i1f.
         PT62_1 pt62_1ff. PT64 pt64ffff. PT67 pt67ffff.
         PT67A pt67a. PT67B pt67b. PT67C pt67c.
         PT68 pt68ffff. PT69 pt69ffff. PT70 pt70ffff.
         PT71 pt71ffff. PT72 pt72ffff. PT73 pt73ffff.
         PT74 pt74ffff. PT86 pt86ffff. PT87 pt87ffff.
         PT88 pt88ffff. PT89 pt89ffff. PT90 pt90ffff.
         PT102 pt102fff. PT103 pt103fff. PT104 pt104fff.
         PT105 pt105fff. PT106 pt106fff. PT110B pt110b.
         PT110C pt110c. PT113 pt113fff. PT114 pt114fff.
         PT115 pt115fff. PT118 pt118fff. PT119A pt119a.
         PT122 pt122fff. PT207 pt207fff. PT207A pt207a.
         PT207B pt207b. PT207C pt207c. PT207_1 pt207_1f.
         PT207_2 pt207_2f. PT208 pt208fff. PT209 pt209fff.
         PT210 pt210fff. PT211 pt211fff. PT212 pt212fff.
         PT213 pt213fff. PT214 pt214fff. PT217B pt217b.
         PT218B pt218b. PT219 pt219fff. PT220 pt220fff.
         PT221 pt221fff. PT222 pt222fff. PT223 pt223fff.
         PT224 pt224fff. PT225 pt225fff. PT226 pt226fff.
         PT228B pt228b. PT229B pt229b. PT230 pt230fff.
         PT231 pt231fff. PT232 pt232fff. PT233 pt233fff.
         PT234 pt234fff. PT235 pt235fff. PT236 pt236fff.
         PT237 pt237fff. PT239B pt239b. PT240B pt240b.
         PT241 pt241fff. PT242 pt242fff. PT243 pt243fff.
         PT246 pt246fff. PT256 pt256fff. PT261 pt261fff.
         PT262 pt262fff. PT267 pt267fff. PT268 pt268fff.
         PT269 pt269fff. PT270 pt270fff. PT271 pt271fff.
         PT272 pt272fff. PT273 pt273fff. PT274 pt274fff.
         PT275 pt275fff. PT281 pt281fff. PT121A01 pt121a0f.
         PT121A02 pt121a1f. PT121A03 pt121a2f. PT121A04 pt121a3f.
         PT121A05 pt121a4f. PT121A06 pt121a5f. PT121A07 pt121a6f.
         PT121A08 pt121a7f. PT121A09 pt121a8f. PT121A10 pt121a9f.
         PT121A11 pt12110f. PT121A12 pt12111f. PT121A13 pt12112f.
         PT121A14 pt12113f. PT121A15 pt12114f. PT121A16 pt12115f.
         PT121A17 pt12116f. PT26501 pt26501f. PT26502 pt26502f.
         PT26503 pt26503f. PT26504 pt26504f. PT26505 pt26505f.
         PT26506 pt26506f. PT26507 pt26507f. PT26508 pt26508f.
         PT26509 pt26509f. PT26510 pt26510f. PT26511 pt26511f.
         PT26512 pt26512f. PT26513 pt26513f. PT26514 pt26514f.
         PT26515 pt26515f. PT26516 pt26516f. DSM_ADD dsm_add.
         DSM_AGO dsm_ago. DSM_AGP dsm_agp. DSM_ALA dsm_ala.
         DSM_ALAH dsm_alah. DSM_ALD dsm_ald. DSM_ASA dsm_asa.
         DSM_BIPOLARI dsm_bipf. DSM_BIPOLARII dsm_bi0f. DSM_BIPOLARSUB dsm_bi1f.
         DSM_CD dsm_cd. DSM_DRA dsm_dra. DSM_DRD dsm_drd.
         DSM_DYS dsm_dys. DSM_DYSH dsm_dysh. DSM_GAD dsm_gad.
         DSM_GADH dsm_gadh. DSM_HYP dsm_hyp. DSM_IED dsm_ied.
         DSM_IEDH dsm_iedh. DSM_MAN dsm_man. DSM_MDDH dsm_mddh.
         DSM_MDE dsm_mde. DSM_ODD dsm_odd. DSM_ODDH dsm_oddh.
         DSM_PAT dsm_pat. DSM_PDS dsm_pds. DSM_PTS dsm_pts.
         DSM_SAD dsm_sad. DSM_SO dsm_so. DSM_SP dsm_sp.
         DSM_TBD dsm_tbd. D_ADD12 d_add12f. D_AGO12 d_ago12f.
         D_AGP12 d_agp12f. D_ALA12 d_ala12f. D_ALAH12 d_alah1f.
         D_ALD12 d_ald12f. D_ASA12 d_asa12f. D_BIPOLARI12 d_bipolf.
         D_BIPOLARII12 d_bipo0f. D_BIPOLARSUB12 d_bipo1f. D_CD12 d_cd12ff.
         D_DRA12 d_dra12f. D_DRAH12 d_drah1f. D_DRD12 d_drd12f.
         D_DYS12 d_dys12f. D_DYSH12 d_dysh1f. D_GAD12 d_gad12f.
         D_GADH12 d_gadh1f. D_HYP12 d_hyp12f. D_IED12 d_ied12f.
         D_IEDH12 d_iedh1f. D_MAN12 d_man12f. D_MDDH12 d_mddh1f.
         D_MDE12 d_mde12f. D_ODD12 d_odd12f. D_ODDH12 d_oddh1f.
         D_PAT12 d_pat12f. D_PDS12 d_pds12f. D_PTS12 d_pts12f.
         D_SO12 d_so12ff. D_SP12 d_sp12ff. D_TBD12 d_tbd12f.
         D_ALA30 d_ala30f. D_ALAH30 d_alah3f. D_ALD30 d_ald30f.
         D_ASA30 d_asa30f. D_DRA30 d_dra30f. D_DRAH30 d_drah3f.
         D_DRD30 d_drd30f. D_DYS30 d_dys30f. D_DYSH30 d_dysh3f.
         D_GAD30 d_gad30f. D_GADH30 d_gadh3f. D_HYP30 d_hyp30f.
         D_IED30 d_ied30f. D_IEDH30 d_iedh3f. D_MAN30 d_man30f.
         D_MDDH30 d_mddh3f. D_MDE30 d_mde30f. D_PAT30 d_pat30f.
         D_PDS30 d_pds30f. D_SO30 d_so30ff. D_SP30 d_sp30ff.
         ICD_ADD icd_add. ICD_AGP icd_agp. ICD_ALA icd_ala.
         ICD_ALAH icd_alah. ICD_ALD icd_ald. ICD_CD icd_cd.
         ICD_CDH icd_cdh. ICD_DRA icd_dra. ICD_DRD icd_drd.
         ICD_DYS icd_dys. ICD_DYSH icd_dysh. ICD_HYP icd_hyp.
         ICD_MAN icd_man. ICD_MDE icd_mde. ICD_MDEH icd_mdeh.
         ICD_ODD icd_odd. ICD_PAT icd_pat. ICD_PDS icd_pds.
         ICD_SO icd_so. ICD_SP icd_sp. ICD_TBD icd_tbd.
         I_ADD12 i_add12f. I_AGP12 i_agp12f. I_ALA12 i_ala12f.
         I_ALAH12 i_alah1f. I_ALD12 i_ald12f. I_CD12 i_cd12ff.
         I_CDH12 i_cdh12f. I_DRA12 i_dra12f. I_DRD12 i_drd12f.
         I_DYS12 i_dys12f. I_DYSH12 i_dysh1f. I_HYP12 i_hyp12f.
         I_MAN12 i_man12f. I_MDE12 i_mde12f. I_MDEH12 i_mdeh1f.
         I_ODD12 i_odd12f. I_PAT12 i_pat12f. I_PDS12 i_pds12f.
         I_SO12 i_so12ff. I_SP12 i_sp12ff. I_TBD12 i_tbd12f.
         I_AGP30 i_agp30f. I_ALA30 i_ala30f. I_ALAH30 i_alah3f.
         I_ALD30 i_ald30f. I_DRA30 i_dra30f. I_DRD30 i_drd30f.
         I_DYS30 i_dys30f. I_DYSH30 i_dysh3f. I_HYP30 i_hyp30f.
         I_MAN30 i_man30f. I_MDE30 i_mde30f. I_MDEH30 i_mdeh3f.
         I_PAT30 i_pat30f. I_PDS30 i_pds30f. I_SO30 i_so30ff.
         I_SP30 i_sp30ff. I_TBD30 i_tbd30f. ADD_OND add_ond.
         ADD_RECD add_recd. AGO_OND ago_ond. AGO_RECD ago_recd.
         AGP_OND agp_ond. AGP_RECD agp_recd. ALA_OND ala_ond.
         ALA_RECD ala_recd. ALD_OND ald_ond. ALD_RECD ald_recd.
         ASA_OND asa_ond. ASA_RECD asa_recd. BIPOLARI_OND bipolarf.
         BIPOLARI_RECD bipola0f. BIPOLARII_OND bipola1f. BIPOLARII_RECD bipola2f.
         BIPOLARSUB_OND bipola3f. BIPOLARSUB_RECD bipola4f. CD_OND cd_ond.
         CD_RECD cd_recd. DRA_OND dra_ond. DRA_RECD dra_recd.
         DRD_OND drd_ond. DRD_RECD drd_recd. DYS_OND dys_ond.
         DYS_RECD dys_recd. GAD_OND gad_ond. GAD_RECD gad_recd.
         IED_OND ied_ond. IED_RECD ied_recd. MDDH_OND mddh_ond.
         MDDH_RECD mddh_ref. MDE_OND mde_ond. MDE_RECD mde_recd.
         ODD_OND odd_ond. ODD_RECD odd_recd. PAT_OND pat_ond.
         PAT_RECD pat_recd. PD_OND pd_ond. PD_RECD pd_recd.
         SAD_OND sad_ond. SAD_RECD sad_recd. SO_OND so_ond.
         SO_RECD so_recd. SP_OND sp_ond. SP_RECD sp_recd.
         TBD_OND tbd_ond. TBD_RECD tbd_recd. ADD_ONI add_oni.
         ADD_RECI add_reci. AGP_ONI agp_oni. AGP_RECI agp_reci.
         ALA_ONI ala_oni. ALA_RECI ala_reci. ALD_ONI ald_oni.
         ALD_RECI ald_reci. ASA_ONI asa_oni. ASA_RECI asa_reci.
         CD_ONI cd_oni. CD_RECI cd_reci. DRA_ONI dra_oni.
         DRA_RECI dra_reci. DRD_ONI drd_oni. DRD_RECI drd_reci.
         DYS_ONI dys_oni. DYS_RECI dys_reci. MDE_ONI mde_oni.
         MDE_RECI mde_reci. ODD_ONI odd_oni. ODD_RECI odd_reci.
         PAT_ONI pat_oni. PAT_RECI pat_reci. PD_ONI pd_oni.
         PD_RECI pd_reci. SAD_ONI sad_oni. SAD_RECI sad_reci.
         SO_ONI so_oni. SO_RECI so_reci. SPONI sponi.
         SPRECI spreci. TBD_ONI tbd_oni. TBD_RECI tbd_reci.
         PTS_OND pts_ond. PTS_RECD pts_recd. PTS_ONI pts_oni.
         PTS_RECI pts_reci. BULH_OND bulh_ond. BULH_RECD bulh_ref.
         D_AGO30 d_ago30f. D_AGP30 d_agp30f. D_TBD30 d_tbd30f.
         AGE age. REGION region. MAR3CAT mar3cat.
         ED4CAT ed4cat. OBESE6CAT obese6cf. POST911 post911f.
         CPESPROJ cpesproj. SEX sex. DSM_ANO dsm_ano.
         DSM_BINGEH dsm_binf. DSM_BINGEANY dsm_bi2f. DSM_BUL dsm_bul.
         DSM_BULH dsm_bulh. D_ANO12 d_ano12f. D_BINGEH12 d_bingef.
         D_BINGEANY12 d_bing0f. D_BUL12 d_bul12f. D_BULH12 d_bulh1f.
         D_ANO30 d_ano30f. D_BINGEH30 d_bing1f. D_BINGEANY30 d_bing2f.
         D_BUL30 d_bul30f. D_BULH30 d_bulh3f. ICD_ANO icd_ano.
         ICD_ANOH icd_anoh. ICD_BUL icd_bul. I_ANO12 i_ano12f.
         I_ANOH12 i_anoh1f. I_BUL12 i_bul12f. I_ANO30 i_ano30f.
         I_ANOH30 i_anoh3f. I_BUL30 i_bul30f. ANO_OND ano_ond.
         ANO_RECD ano_recd. BINGEH_OND bingeh_f. BINGEH_RECD bingeh0f.
         BINGEANY_OND bingeanf. BINGEANY_RECD bingea0f. BUL_OND bul_ond.
         BUL_RECD bul_recd. ANO_ONI ano_oni. ANO_RECI ano_reci.
         BUL_ONI bul_oni. BUL_RECI bul_reci. EA1 ea1fffff.
         EA1A ea1a. EA6 ea6fffff. EA7 ea7fffff.
         EA9 ea9fffff. EA10 ea10ffff. EA10B ea10b.
         EA10C ea10c. EA10D ea10d. EA12 ea12ffff.
         EA15 ea15ffff. EA16 ea16ffff. EA17 ea17ffff.
         EA17A ea17a. EA17B ea17b. EA17C ea17c.
         EA17D ea17d. EA17E ea17e. EA17F ea17f.
         EA17G ea17g. EA17H ea17h. EA19 ea19ffff.
         EA19B2 ea19b2ff. EA22 ea22ffff. EA23A ea23a.
         EA23B ea23b. EA23C ea23c. EA23D ea23d.
         EA23E ea23e. EA23F ea23f. EA25 ea25ffff.
         EA26 ea26ffff. EA29 ea29ffff. EA35 ea35ffff.
         EA37 ea37ffff. EA38 ea38ffff. AAG6A4 aag6a4ff.
         AG26B2 ag26b2ff. AG26B3 ag26b3ff. ATB3A atb3a.
         ATB3B atb3b. ATB5I1A atb5i1a. ATB5I1B atb5i1b.
         ATB5I2A atb5i2a. ATB5I2B atb5i2b. ATB6AA atb6aa.
         ATB6AB atb6ab. ATB6AAA atb6aaa. ATB6AAB atb6aab.
         ATB211A atb211a. ATB211B atb211b. ATB23A atb23a.
         ATB23B atb23b. ATB26A atb26a. ATB26B atb26b.
         ACD18C2 acd18c2f. ACD18C3 acd18c3f. MEDICATION medicatf.
         MEDICATION2 medica0f. MEDICATION3 medica1f. MEDICATION4 medica2f.
         MEDICATION5 medica3f. MEDICATION6 medica4f. MEDICATION7 medica5f.
         MEDICATION8 medica6f. MEDICATION9 medica7f. MEDICATION10 medica8f.
         MEDICATION11 medica9f. MEDICATION12 medic10f. MEDICATION13 medic11f.
         MEDICATION14 medic12f. MEDICATION15 medic13f. MEDICATION16 medic14f.
         MEDICATION17 medic15f. EM15 em15ffff. EM19 em19ffff.
         SE9 se9fffff. SE7 se7fffff. CH11 ch11ffff.
         CH16 ch16ffff. OCC28MOG occ28mog. D38A_3 d38a_3ff.
         DM17 dm17ffff. MR16A mr16a. DM19 dm19ffff.
         MR18 mr18ffff. DM20 dm20ffff. MR19 mr19ffff.
         DM22 dm22ffff. CN1 cn1fffff. DM23 dm23ffff.
         CN2 cn2fffff. DM1_10 dm1_10ff. DM1_11 dm1_11ff.
         DE9_1 de9_1fff. DE9_4 de9_4fff. DE9_5 de9_5fff.
         DE9_8 de9_8fff. DM_DE20 dm_de20f. SC10_7A01 sc10_72f.
         SC10_8F01 sc10_27f. SC10_8G01 sc10_28f. SC10_5E201 sc10_29f.
         SC10_5E202 sc10_30f. SC10_5E203 sc10_31f. SC10_5E204 sc10_32f.
         SC10_5E205 sc10_33f. SC10_5E206 sc10_34f. SC10_5E207 sc10_35f.
         SC10_5E208 sc10_36f. SC10_7A201 sc10_73f. SC10_7A202 sc10_74f.
         SC10_8F201 sc10_37f. SC10_8F202 sc10_38f. SC10_8F203 sc10_39f.
         SC10_8F204 sc10_40f. SC10_8F205 sc10_41f. SC10_8G201 sc10_42f.
         SC10_8G202 sc10_43f. SC10_8G203 sc10_44f. SC10_8G204 sc10_45f.
         DM201 dm201fff. DM202 dm202fff. DM203 dm203fff.
         EM7_101 em7_101f. EM7_102 em7_102f. EM7_103 em7_103f.
         EM7_104 em7_104f. DM801 dm801fff. DM802 dm802fff.
         DM803 dm803fff. DM804 dm804fff. SE401 se401fff.
         SE402 se402fff. SE403 se403fff. SR611 sr611fff.
         SR612 sr612fff. SR613 sr613fff. SR614 sr614fff.
         EM16 em16ffff. EM20 em20ffff. SE10 se10ffff.
         SE8 se8fffff. CH12 ch12ffff. CH17 ch17ffff.
         DM23_101 dm23_10f. DM23_102 dm23_11f. DA31B_101 da31b_1f.
         DA31B_102 da31b_0f. DA31B_103 da31b_2f. DE20_901 de20_90f.
         DE20_902 de20_91f. DE20_903 de20_92f. IO1A io1a.
         IO2_1 io2_1fff. IO2_2 io2_2fff. IO2_3 io2_3fff.
         IO2_4 io2_4fff. IO2_5 io2_5fff. IO3 io3fffff.
         IO4 io4fffff. IO5 io5fffff. IO6 io6fffff.
         IO7 io7fffff. WEIGHT weight. HEIGHT height.
         RANCEST rancest. DE4 de4fffff. DE20 de20ffff.
         DM1_6 dm1_6fff. DM1_14 dm1_14ff. SC10_5EB01 sc10_46f.
         DM_DE9_1 dm_de9_f. DM_DE9_3 dm_de90f. DM_CH8 dm_ch8ff.
         DM_CH8A dm_ch8a. DM_CH13 dm_ch13f. DM_CH13A dm_ch13a.
         DM_EM7_1 dm_em7_f. DM_EM7_2 dm_em70f. DM_EM7_3 dm_em71f.
         DM_EM10 dm_em10f. DM_SE2 dm_se2ff. DM_SE6A dm_se6a.
         DM_SE401 dm_se40f. DM_SE402 dm_se41f. DM_SE403 dm_se42f.
         DM_FN12 dm_fn12f. DM_MR16A dm_mr16a. DM_MR18 dm_mr18f.
         DM_MR19 dm_mr19f. DM_MR25B dm_mr25b. DM_MR20A dm_mr20a.
         DM_CN1 dm_cn1ff. DM_CN2 dm_cn2ff. DM_DA311 dm_da31f.
         DM_DA312 dm_da30f. DM_DE5_1 dm_de5_f. D37B_1 d37b_1ff.
         D37C2 d37c2fff. D37B4 d37b4fff. IR20B4 ir20b4ff.
         PT55D2 pt55d2ff. PT120A pt120a. O17C o17c.
         PR20B2 pr20b2ff. AD32B2 ad32b2ff. AD32B3 ad32b3ff.
         AD32B4 ad32b4ff. D_BIPOLARI30 d_bipo2f. D_BIPOLARII30 d_bipo3f.
         D_BIPOLARSUB30 d_bipo4f. D_PTS30 d_pts30f. ICD_ASA icd_asa.
         ICD_ASAH icd_asah. ICD_GAD icd_gad. ICD_GADH icd_gadh.
         ICD_PTS icd_pts. ICD_SAD icd_sad. ICD_SADH icd_sadh.
         I_ASA12 i_asa12f. I_ASAH12 i_asah1f. I_GAD12 i_gad12f.
         I_GADH12 i_gadh1f. I_PTS12 i_pts12f. I_ASA30 i_asa30f.
         I_ASAH30 i_asah3f. I_GAD30 i_gad30f. I_GADH30 i_gadh3f.
         I_PTS30 i_pts30f. GAD_ONI gad_oni. GAD_RECI gad_reci.
         PS2 ps2fffff. PS_FLAG ps_flag. FB6L fb6l.
         ID id. ID2 id2fffff. ID3 id3fffff.
         HHINC hhinc. POVINDEX povindex. WKSTAT3C wkstat3c.
         VERSION version.  
;

RUN ;
