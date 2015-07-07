*****************************************************************************
* PROGRAM: agefix-youth.sas                                                 *
* DATE: 4/8/10                                                              *
*                                                                           *
* MTO youth                                                                 *
*****************************************************************************;

options mprint;

%macro agefix1(agevar, probe1, probe2);

    /* Recalculate age for age variable using probe variables */

    if &agevar IN(.,.D,.R) then do;
        if &probe1 = 1 then &agevar = 4;          /* Before started school */
        else if &probe2 = 1 then &agevar = 12;    /* Before teenager       */
        else if &probe2 = 5 then &agevar = 13;    /* After teenager        */
    end;

%mend agefix1;

/* Fix data for YGA5a_G5, YGA5b_G5 using probes YGA5c_G5, YGA5d_G5 */

if YGA5a_G5 IN(.,.D,.R) then do;
   if YGA5c_G5 = 1 then do;     /* Recode to 6 months for Yes to probe("was it 6 months") */
      YGA5a_G5 = 6;
      YGA5b_G5 = 3;
   end;
   else if YGA5d_G5 = 1 then do;     /* Recode to 1 months for Yes to probe("was it 1 month") */
      YGA5a_G5 = 1;
      YGA5b_G5 = 3;
   end;
end;


/* Call specified for macro to compute age using probe questions */

%agefix1(YDE13a_D37a, YDE13c_D37b2, YDE13d_D37b3);
%agefix1(YDE13b_D37b1, YDE13c_D37b2, YDE13d_D37b3);
%agefix1(YMA10a_M18a, YMA10c_M18b2, YMA10d_M18b3);
%agefix1(YMA10b_M18b1, YMA10c_M18b2, YMA10d_M18b3);
%agefix1(YPD5a_PD9a, YPD5c_PD9b2, YPD5d_PD9b3);
%agefix1(YPD5b_PD9b1, YPD5c_PD9b2, YPD5d_PD9b3);
%agefix1(YGA11a_G26a, YGA11c_G26b2, YGA11d_G26b3);
%agefix1(YGA11b_G26b1, YGA11c_G26b2, YGA11d_G26b3);
%agefix1(YIE8a_IED18a, YIE8c_IED18b2, YIE8d_IED18b3);
%agefix1(YIE8b_IED18b1, YIE8c_IED18b2, YIE8d_IED18b3);
%agefix1(YOD3a_OD3a, YOD3c_OD3b2, YOD3d_OD3b3);
%agefix1(YOD3b_OD3b1, YOD3c_OD3b2, YOD3d_OD3b3);

