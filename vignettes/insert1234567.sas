/* Incorporate <pr_seed> in names of existing orci_&imod_&mi_seed datasets.
 * This enables reuse of earlier runs within a new bootstrapping scheme
 * that recognizes the choice of seed for ptsd_random (orig, 1234567) as
 * a further source of arbitrariness that must be explored.
 *
 * Note that this also requires dropping the '_imputed' suffix, as otherwise
 * the alt-model cached files would have names longer than 32 chars!
 */
%MACRO inject1234567(imodL, imodR, seedL, seedR);

%DO imod = &imodL %TO &imodR; 
  %DO mi_seed= &seedL %TO &seedR;

    data MTO.orci_&imod._1234567_&mi_seed;
      set MTO.orci_&imod._&mi_seed;
	run;

    data MTO.cached_&imod._1234567_&mi_seed;
      set MTO.cached_&imod._&mi_seed._imputed;
	run;

  %END; * imod loop ;
%END; * seed loop ;

%do a=0 %to 1;
  %do r=0 %to 1;
    %do s=40 %to 99 %by 59;

      %let imod = A&a.R&r.S&s.;
	  %let mi_seed = 524232;

      data MTO.orci_&imod._1234567_&mi_seed;
        set MTO.orci_&imod._&mi_seed;
	  run;

      data MTO.cached_&imod._1234567_&mi_seed;
        set MTO.cached_&imod._&mi_seed._imputed;
	  run;

    %end; * s loop ;
  %end; * r loop ;
%end; * a loop ;

%MEND inject1234567;

%inject1234567(imodL=1, imodR=10, seedL=524230, seedR=524239);
