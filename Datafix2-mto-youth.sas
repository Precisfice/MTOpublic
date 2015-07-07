******************************************************************
* PROGRAM: Datafix2-youth.sas                                    *
* DATE: 4/15/2010                                                *
*                                                                *
* MTO Youth                                                      *
******************************************************************;

%macro datafix2;

******************************************************************************************
* For onset/recency ages less than 4 reset to 4                                          *
******************************************************************************************;

array onsetrec YDE6a_D22a YDE6d_D22c YDE13a_D37a YDE13b_D37b1 YDE14b_D38c YMA2a_M3a
               YMA2d_M3c YMA6a_M6a YMA6d_M6c YMA10a_M18a YMA10b_M18b1 YMA13_M19d
               YPD5a_PD9a YPD5b_PD9b1 YPD7c_PD10d YGA11a_G26a YGA11b_G26b1 YGA12c_G27c
               YIE8a_IED18a YIE8b_IED18b1 YIE9a_IED22a YCV14b_PT64a YCV14c YOD3a_OD3a
               YOD3b_OD3b1 YOD4a_OD4a;

do over onsetrec;
   if 0 <= onsetrec < 4 then onsetrec = 4;
end;

%mend datafix2;

%datafix2;
