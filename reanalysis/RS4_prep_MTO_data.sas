* This section is adapted from the first few lines of Ptsd_MTO_youth.sas ;
proc sort data = NBER.Mto_jama_preimp_20160111 out = NBER.Mto_jama_preimp_sorted;
by ppid;
run;

data NBER.Mto_jama_preimp_fixed;
set NBER.Mto_jama_preimp_sorted;
format _numeric_;
%include "&folder/Datafix2-mto-youth.sas";
%include "&folder/agefix-youth.sas";
run;

* We now extend this to accomplish a reproduction of JAMA ORs & CI ;

%let imod = 0;
%let pr_seed = 1234567;
%let mi_seed = 524232;
%let formula = 1*(-1.515)+AGE*(0.0263)+SEXF*(0.1105)+
               RHISP*(-0.0819)+RBLK*(-0.5597)+ROTH*(-0.9751)+PT41*(-0.5603)+
               PT42*(0.0504)+PT43*(-0.3877)+PT44*(0.1148)+PT45*(-0.1614)+
               PT46*(0.5993)+PT48*(0.078)+PT50*(0.4687)+PT50_1*(0.4591)+
               PT51*(0.1683)+PT55*(-0.2237)+PT209*(0.3664)+PT211*(-0.0581)+
               PT212*(0.2516)+PT213*(0.1159)+PT214*(0.64)+PT233*(0.8654)+PT237*(0.1323);
%include "&reanalysis/impdata20x.sas";

/* TODO:
  1. 'Assert' that we obtained (to 5 decimal places) the following results:
                  OR      LOWOR    UPOR
    RA_GRP_EXP  3.44025  1.60147  7.39026
    RA_GRP_S8   2.67817  1.23268  5.81873

  2. Rename this file to reflect the fact it achieves a REPRODUCTION
 */
