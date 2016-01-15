******************************************************************
* PROGRAM: Screen-mto-youth.sas                                  *
* DATE: 4/15/2010                                                *
*                                                                *
* MTO Youth                                                      *
* Calculate variables for screening into a diagnosis             *
******************************************************************;

%macro scrvar;

    if YSC6_SC21 = 1 or YSC7_SC22 = 1 or YSC8_SC23 = 1 then f_mh_dep_scr_yt = 1;
    else f_mh_dep_scr_yt = 0;

    if YSC9_SC24 = 1 or YSC11_SC25a = 1 then f_mh_man_scr_yt = 1;
    else f_mh_man_scr_yt = 0;

    if YSC1_SC20 = 1 or YSC2_SC20a = 1 then f_mh_pds_scr_yt = 1;
    else f_mh_pds_scr_yt = 0;

    if YSC12_SC26 = 1 or YSC13_SC26a = 1 or YSC14_SC26b = 1 then f_mh_gad_scr_yt = 1;
    else f_mh_gad_scr_yt = 0;

    if YSC3_SC20_1 = 1 or YSC4_SC20_2 = 1 or YSC5_SC20_3 = 1 then f_mh_ied_scr_yt = 1;
    else f_mh_ied_scr_yt = 0;

    if YSC17_SC33 = 1 then f_mh_odd_scr_yt = 1;
    else f_mh_odd_scr_yt = 0; 

%mend scrvar;

%scrvar;