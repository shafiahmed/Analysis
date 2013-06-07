ods html close;
proc tabulate data=segment_results out=segment_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new  /preloadfmt ;
class segment;
var hh_sum;
table tag_new, segment*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. segment segfmt.;
run;
ods html;
data segment_a;
set segment_a;
pct1 = pct1/100;
if segment eq . then segment = 7;
format pct1 percent10.1;
run;
proc sort data=segment_a;
by tag_new segment;
run;
proc summary data=segment_a;
by tag_new segment;
output out=segment_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=segment_b out=segment_final;
by tag_new;
id segment;
var pct1;
format tag_new $ordera.;
run;
proc tabulate data=cbr_results out=cbr_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new cbr /preloadfmt ;
var hh_sum;
table tag_new, cbr*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. cbr cbr2012fmt.;
run;
ods html;
data cbr_a;
set cbr_a;
pct1 = pct1/100;
if cbr eq . then cbr = 99;
format pct1 percent10.1;
run;
proc sort data=cbr_a;
by tag_new cbr;
run;
proc summary data=cbr_a;
by tag_new cbr;
output out=cbr_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=cbr_b out=cbr_final;
by tag_new;
id cbr;
var pct1;
run;
proc tabulate data=market_results out=market_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new market /preloadfmt ;
var hh_sum;
table tag_new, market*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. market mkt2012fmt.;
run;
ods html;
data market_a;
set market_a;
pct1 = pct1/100;
if market eq . then market = 99;
format pct1 percent10.1;
run;
proc sort data=market_a;
by tag_new market;
run;
proc summary data=market_a;
by tag_new market;
output out=market_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=market_b out=market_final;
by tag_new;
id market;
var pct1;
run;
proc tabulate data=band_results out=band_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new band /preloadfmt ;
var hh_sum;
table tag_new, band*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. band $2.;
run;
ods html;
data band_a;
set band_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=band_a;
by tag_new band;
run;
proc summary data=band_a;
by tag_new band;
output out=band_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=band_b out=band_final;
by tag_new;
id band;
var pct1;
run;
proc tabulate data=tenure_yr_results out=tenure_yr_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new tenure_yr /preloadfmt ;
var hh_sum;
table tag_new, tenure_yr*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. tenure_yr tenureband.;
run;
ods html;
data tenure_yr_a;
set tenure_yr_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=tenure_yr_a;
by tag_new tenure_yr;
run;
proc summary data=tenure_yr_a;
by tag_new tenure_yr;
output out=tenure_yr_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=tenure_yr_b out=tenure_yr_final;
by tag_new;
id tenure_yr;
var pct1;
run;
proc tabulate data=svcs_results out=svcs_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new svcs /preloadfmt ;
var hh_sum;
table tag_new, svcs*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. svcs comma2.;
run;
ods html;
data svcs_a;
set svcs_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=svcs_a;
by tag_new svcs;
run;
proc summary data=svcs_a;
by tag_new svcs;
output out=svcs_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=svcs_b out=svcs_final;
by tag_new;
id svcs;
var pct1;
run;
proc tabulate data=cqi_results out=cqi_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new cqi /preloadfmt ;
var hh_sum;
table tag_new, cqi*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. cqi cqifmt.;
run;
ods html;
data cqi_a;
set cqi_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=cqi_a;
by tag_new cqi;
run;
proc summary data=cqi_a;
by tag_new cqi;
output out=cqi_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=cqi_b out=cqi_final;
by tag_new;
id cqi;
var pct1;
run;
proc tabulate data=cqi_dd_results out=cqi_dd_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new cqi_dd /preloadfmt ;
var hh_sum;
table tag_new, cqi_dd*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. cqi_dd binary_flag.;
run;
ods html;
data cqi_dd_a;
set cqi_dd_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=cqi_dd_a;
by tag_new cqi_dd;
run;
proc summary data=cqi_dd_a;
by tag_new cqi_dd;
output out=cqi_dd_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=cqi_dd_b out=cqi_dd_final;
by tag_new;
id cqi_dd;
var pct1;
run;
proc tabulate data=cqi_bp_results out=cqi_bp_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new cqi_bp /preloadfmt ;
var hh_sum;
table tag_new, cqi_bp*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. cqi_bp binary_flag.;
run;
ods html;
data cqi_bp_a;
set cqi_bp_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=cqi_bp_a;
by tag_new cqi_bp;
run;
proc summary data=cqi_bp_a;
by tag_new cqi_bp;
output out=cqi_bp_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=cqi_bp_b out=cqi_bp_final;
by tag_new;
id cqi_bp;
var pct1;
run;
proc tabulate data=cqi_web_results out=cqi_web_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new cqi_web /preloadfmt ;
var hh_sum;
table tag_new, cqi_web*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. cqi_web binary_flag.;
run;
ods html;
data cqi_web_a;
set cqi_web_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=cqi_web_a;
by tag_new cqi_web;
run;
proc summary data=cqi_web_a;
by tag_new cqi_web;
output out=cqi_web_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=cqi_web_b out=cqi_web_final;
by tag_new;
id cqi_web;
var pct1;
run;
proc tabulate data=cqi_deb_results out=cqi_deb_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new cqi_deb /preloadfmt ;
var hh_sum;
table tag_new, cqi_deb*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. cqi_deb binary_flag.;
run;
ods html;
data cqi_deb_a;
set cqi_deb_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=cqi_deb_a;
by tag_new cqi_deb;
run;
proc summary data=cqi_deb_a;
by tag_new cqi_deb;
output out=cqi_deb_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=cqi_deb_b out=cqi_deb_final;
by tag_new;
id cqi_deb;
var pct1;
run;
proc tabulate data=cqi_odl_results out=cqi_odl_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new cqi_odl /preloadfmt ;
var hh_sum;
table tag_new, cqi_odl*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. cqi_odl binary_flag.;
run;
ods html;
data cqi_odl_a;
set cqi_odl_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=cqi_odl_a;
by tag_new cqi_odl;
run;
proc summary data=cqi_odl_a;
by tag_new cqi_odl;
output out=cqi_odl_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=cqi_odl_b out=cqi_odl_final;
by tag_new;
id cqi_odl;
var pct1;
run;
proc tabulate data=rm_results out=rm_a(rename=(hh_sum_sum=hh hh_sum_pctsum_10=pct1)) missing order=data ;
where _type_ eq '11';
class tag_new rm /preloadfmt ;
var hh_sum;
table tag_new, rm*hh_sum*(sum*f=comma12. rowpctsum<hh_sum>*f=pctfmt.) / nocellmerge;
format tag_new $ordera. rm $rmfmt.;
run;
ods html;
data rm_a;
set rm_a;
pct1 = pct1/100;
format pct1 percent10.1;
run;
proc sort data=rm_a;
by tag_new rm;
run;
proc summary data=rm_a;
by tag_new rm;
output out=rm_b sum(hh)=hh sum(pct1) = pct1;
run;
proc transpose data=rm_b out=rm_final;
by tag_new;
id rm;
var pct1;
run;
ods html;
proc print data=segment_final (drop=_name_) noobs;
format tag_new $ordera.;
run;
proc print data=cbr_final (drop=_name_) noobs;
run;
proc print data=market_final (drop=_name_) noobs;
run;
proc print data=band_final (drop=_name_) noobs;
run;
proc print data=tenure_yr_final (drop=_name_) noobs;
run;
proc print data=svcs_final (drop=_name_) noobs;
run;
proc print data=cqi_final (drop=_name_) noobs;
run;
proc print data=cqi_dd_final (drop=_name_) noobs;
run;
proc print data=cqi_bp_final (drop=_name_) noobs;
run;
proc print data=cqi_web_final (drop=_name_) noobs;
run;
proc print data=cqi_deb_final (drop=_name_) noobs;
run;
proc print data=cqi_odl_final (drop=_name_) noobs;
run;
proc print data=rm_final (drop=_name_) noobs;
run;