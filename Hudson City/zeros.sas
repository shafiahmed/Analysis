proc contents data = test out = vars (keep = name type) noprint;
run;
data vars;
set vars (where=(type eq 1));
index=_n_;
run;
proc sql noprint;
select max(index) into :nvars from vars;
quit;
data test_new;
set vars;
if _n_ eq 0 then do;
declare hash vars1(dataset:'work.vars');
vars1.DefineKey('index') ;
vars1.DefineData('name') ;
vars1.DefineDone() ;
end;
do until (eof2);
set test;
. ;