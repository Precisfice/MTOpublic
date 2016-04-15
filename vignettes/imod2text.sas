* Convert existing orci_&imod_&seed datasets to char imod ;
%MACRO imod2text(imodL, imodR, seedL, seedR);

%DO imod = &imodL %TO &imodR; 
  %DO mi_seed= &seedL %TO &seedR;

    data MTO.orci_&imod._&mi_seed(drop=imod);
	  attrib imod_text length=$7;
      set MTO.orci_&imod._&mi_seed;
	  imod_text = "&imod";
	  imod_text = right(imod_text);
	run;

	data MTO.orci_&imod._&mi_seed(rename=(imod_text=imod));
	  set MTO.orci_&imod._&mi_seed;
	run;

  %END; * imod loop ;
%END; * seed loop ;

%MEND imod2text;

%imod2text(imodL=1, imodR=10, seedL=524230, seedR=524239);
