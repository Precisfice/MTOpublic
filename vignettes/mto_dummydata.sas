* Simulate dummy MTO data from descriptive statistics ;
%LET folder = /folders/myfolders;
%LET outputs = &folder/outputs;
%LET mto = &folder/simulated/MTO/data;
%LET nber = &mto/NBER;
libname OUTPUTS "&outputs";
libname MTO "&mto";
libname NBER "&nber";
proc iml;
  N = 1000;
  * Create the empty data set ;
  use OUTPUTS.preimp_numdesc;
    read all var{varname};
  close;
  numvars = unique(varname);
  use OUTPUTS.preimp_chardesc;
    read all var{varname};
  close;
  charvars = unique(varname);
  idx = 1:N; * allocate ;
  call randseed(2017);
  * Define char types and lengths for the charvars ;
  f_svy_final_desc = "........................................";
  f_svy_final_disp = ".....";
  f_svy_sample2007 = "..";
  rawvars = {ycv1_pt13 ycv2_pt14 ycv3_pt15 ycv4_pt16 ycv5_pt17 ycv6_pt18
             ycv7_pt20 ycv8_pt22 ycv9_pt22_1 ycv10_pt23 ycv11_pt27};
             /*
	  AD_AGE_LE35 AD_AGE_LE40 AD_AGE_LE45 AD_AGE_LE50 
      CH_AGE_LT14 CH_AGE_LT15 CH_AGE_LT16 CH_AGE_LT17 
      HHSIZE_3PLUS HHSIZE_4PLUS HHSIZE_5PLUS 
      X_F_SITE_BALT X_F_SITE_BOS X_F_SITE_CHI X_F_SITE_LA  ymh_cov_ad_single_mother f_c9010t_perpov_bl
      &adage &edvars &demos &pers &c2vars &chage &schvars &hhvars &hoodvars &housvars 
      &incvars &sitevars &ptsdvars &dxvars &convars
      */
  morevars = {x_f_site_balt x_f_site_bos x_f_site_chi x_f_site_la
    x_f_ad_edged x_f_ad_edgradhs x_f_ad_edinsch
    x_f_c2_hosp x_f_c2_lowbw x_f_c2_read
    x_f_ad_nevmarr x_f_ad_parentu18 x_f_ad_working
    x_f_ch_male
    x_f_ch_schplay x_f_ch_specmed x_f_hh_afdc x_f_hh_car 
    x_f_hh_disabl x_f_hh_noteens x_f_hh_victim x_f_hood_5y 
    x_f_hood_chat x_f_hood_nbrkid x_f_hood_nofamily x_f_hood_nofriend
    x_f_hood_unsafenit x_f_hood_verydissat x_f_hous_fndapt x_f_hous_mov3tm
    x_f_hous_movdrgs x_f_hous_movschl x_f_hous_sec8bef x_f_ch_bl_age617
    x_f_ch_age13 x_f_ch_age14 x_f_ch_age15 x_f_ch_age16 x_f_ch_age17
    x_f_ad_le_35 x_f_ad_36_40 x_f_ad_41_45 x_f_ad_46_50
    x_f_hh_size2 x_f_hh_size3 x_f_hh_size4
    };
  create NBER.Mto_jama_preimp_20160111
   var({'ppid' 'famid'}
       || numvars || charvars || rawvars || morevars);
    * Fill the data set with simulated data ;
    ppid = 1:N;
    famid = ppid;
    do i=1 to ncol(numvars);
      call execute("use OUTPUTS.preimp_numdesc where(varname='"+numvars[i]+"');");
        read all var{val count};
        call randgen(idx, "table", count/sum(count));
        call execute(numvars[i]+"= val[idx];");
      close;
    end;
    do i=1 to ncol(charvars);
      call execute("use OUTPUTS.preimp_chardesc where(varname='"+charvars[i]+"');");
        read all var{val count};
        call randgen(idx, "table", count/sum(count));
        call execute(charvars[i]+"= val[idx];");
      close;
    end;
    * Enforce constraints on some calculated dummies ;
    ra_grp_exp     = (ra_group = 1);
    ra_grp_s8      = (ra_group = 2);
    ra_grp_control = (ra_group = 3);
    * Most numeric vars defied description, no doubt due to special formats ;
	do i=1 to ncol(rawvars);
	  call randgen(idx, "table", {0.5 0.5});
      call execute(rawvars[i]+"= {0 1}[idx];");
    end;
    x_f_site_balt = (ra_site=1);
    x_f_site_bos  = (ra_site=2);
    x_f_site_chi  = (ra_site=3);
    x_f_site_la   = (ra_site=4);
    x_f_ad_edged = (mod(ppid,3)=0);
    x_f_ad_edgradhs = (mod(ppid,3)=1);
    x_f_ad_edinsch = (mod(ppid,3)=2);
    x_f_c2_hosp  = (mod(ppid,11)=0);
    x_f_c2_lowbw = (mod(ppid,7)=0);
    x_f_c2_read  = (mod(ppid,2)=0);
    x_f_ad_nevmarr = 1:N;
    call randgen(x_f_ad_nevmarr, "table", {0.5 0.5});
    x_f_ad_nevmarr = x_f_ad_nevmarr - 1;
    x_f_ad_parentu18 = 1:N; 
    call randgen(x_f_ad_parentu18, "table", {0.5 0.5});
    x_f_ad_parentu18 = x_f_ad_parentu18 - 1; 
    x_f_ad_working = 1:N;
    call randgen(x_f_ad_working, "table", {0.5 0.5});
    x_f_ad_working = x_f_ad_working - 1;
    x_f_ch_male = 1:N;
    call randgen(x_f_ch_male, "table", {0.5 0.5});
    x_f_ch_male = x_f_ch_male - 1;
    x_f_ch_schplay = 1:N;
    call randgen(x_f_ch_schplay, "table", {0.5 0.5});
    x_f_ch_schplay = x_f_ch_schplay - 1;
    x_f_ch_specmed = 1:N;
    call randgen(x_f_ch_specmed, "table", {0.5 0.5});
    x_f_ch_specmed = x_f_ch_specmed - 1;
    x_f_hh_afdc = 1:N;
    call randgen(x_f_hh_afdc, "table", {0.5 0.5});
    x_f_hh_afdc = x_f_hh_afdc - 1;
    x_f_hh_car = 1:N;
    call randgen(x_f_hh_car, "table", {0.5 0.5});
    x_f_hh_car = x_f_hh_car - 1;
    x_f_hh_disabl = 1:N;
    call randgen(x_f_hh_disabl, "table", {0.5 0.5});
    x_f_hh_disabl = x_f_hh_disabl - 1;
    x_f_hh_noteens = 1:N;
    call randgen(x_f_hh_noteens, "table", {0.5 0.5});
    x_f_hh_noteens = x_f_hh_noteens - 1;
    x_f_hh_victim = 1:N;
    call randgen(x_f_hh_victim, "table", {0.5 0.5});
    x_f_hh_victim = x_f_hh_victim - 1;
    x_f_hood_5y = 1:N;
    call randgen(x_f_hood_5y, "table", {0.5 0.5});
    x_f_hood_5y = x_f_hood_5y - 1;
    x_f_hood_chat = 1:N;
    call randgen(x_f_hood_chat, "table", {0.5 0.5});
    x_f_hood_chat = x_f_hood_chat - 1;
    x_f_hood_nbrkid = 1:N;
    call randgen(x_f_hood_nbrkid, "table", {0.5 0.5});
    x_f_hood_nbrkid = x_f_hood_nbrkid - 1;
    x_f_hood_nofamily = 1:N;
    call randgen(x_f_hood_nofamily, "table", {0.5 0.5});
    x_f_hood_nofamily = x_f_hood_nofamily - 1;
    x_f_hood_nofriend = 1:N;
    call randgen(x_f_hood_nofriend, "table", {0.5 0.5});
    x_f_hood_nofriend = x_f_hood_nofriend - 1;
    x_f_hood_unsafenit = 1:N; 
    call randgen(x_f_hood_unsafenit, "table", {0.5 0.5});
    x_f_hood_unsafenit = x_f_hood_unsafenit - 1; 
    x_f_hood_verydissat = 1:N; 
    call randgen(x_f_hood_verydissat, "table", {0.5 0.5});
    x_f_hood_verydissat = x_f_hood_verydissat - 1; 
    x_f_hous_fndapt = 1:N;
    call randgen(x_f_hous_fndapt, "table", {0.5 0.5});
    x_f_hous_fndapt = x_f_hous_fndapt - 1;
    x_f_hous_mov3tm = 1:N;
    call randgen(x_f_hous_mov3tm, "table", {0.5 0.5});
    x_f_hous_mov3tm = x_f_hous_mov3tm - 1;
    x_f_hous_movdrgs = 1:N;
    call randgen(x_f_hous_movdrgs, "table", {0.5 0.5});
    x_f_hous_movdrgs = x_f_hous_movdrgs - 1;
    x_f_hous_movschl = 1:N;
    call randgen(x_f_hous_movschl, "table", {0.5 0.5});
    x_f_hous_movschl = x_f_hous_movschl - 1;
    x_f_hous_sec8bef = 1:N;
    call randgen(x_f_hous_sec8bef, "table", {0.5 0.5});
    x_f_hous_sec8bef = x_f_hous_sec8bef - 1;
    x_f_ch_bl_age617 = (f_svy_age_bl_imp > 5);
    x_f_ch_age13 = (f_svy_age_iw = 14);
    x_f_ch_age14 = (f_svy_age_iw = 15);
    x_f_ch_age15 = (f_svy_age_iw = 16);
    x_f_ch_age16 = (f_svy_age_iw = 17);
    x_f_ch_age17 = (f_svy_age_iw = 18);
    x_f_ad_le_35 = (mod(ppid,5)=0);
    x_f_ad_36_40 = (mod(ppid,5)=1);
    x_f_ad_41_45 = (mod(ppid,5)=2);
    x_f_ad_46_50 = (mod(ppid,5)=3);
    x_f_hh_size2 = (mod(ppid,3)=0);
    x_f_hh_size3 = (mod(ppid,3)=1);
    x_f_hh_size4 = (mod(ppid,3)=2);
    append;
  close  NBER.Mto_jama_preimp_20160111;

%include "&reanalysis/RS4_prep_MTO_data.sas";
