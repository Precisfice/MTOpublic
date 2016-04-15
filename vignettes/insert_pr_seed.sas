/* Add a 'pr_seed' variable to existing orci_&imod_&mi_seed datasets,
 * renaming the existing 'seed' to 'mi_seed' for extra clarity.
 * This enables reuse of earlier runs within a new bootstrapping scheme
 * that recognizes the choice of seed for ptsd_random (orig, 1234567) as
 * a further source of arbitrariness that must be explored.
 */
%MACRO add_pr_seed(imodL, imodR, seedL, seedR);

%DO imod = &imodL %TO &imodR; 
  %DO mi_seed= &seedL %TO &seedR;

    data MTO.orci_&imod._1234567_&mi_seed(rename=(seed=mi_seed));
      set MTO.orci_&imod._1234567_&mi_seed;
      pr_seed = 1234567;
	run;

  %END; * imod loop ;
%END; * seed loop ;

%do a=0 %to 1;
  %do r=0 %to 1;
    %do s=40 %to 99 %by 59;

      %let imod = A&a.R&r.S&s.;
	  %let mi_seed = 524232;

      data MTO.orci_&imod._1234567_&mi_seed(rename=(seed=mi_seed));
        set MTO.orci_&imod._1234567_&mi_seed;
        pr_seed = 1234567;
	  run;

    %end; * s loop ;
  %end; * r loop ;
%end; * a loop ;

%MEND add_pr_seed;

%add_pr_seed(imodL=1, imodR=10, seedL=524230, seedR=524239);
