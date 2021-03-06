options mcompilenote=all;
%macro create_panel_charts1 (xsize=,ysize=, file=, group1=, order1=, prodfile=);
proc sql;
select min((ceil(max(percent)*10)/10)+ 0.2,1.2) into :max1 from &file;
quit;


proc catalog c=work.gseg kill; 
run; quit; 

ods html style=special;
goptions reset=all cback=white noborder htitle=14pt htext=14pt;  
goptions device=gif nodisplay xpixels=&xsize ypixels=&ysize;

%do i = 1 %to 8;
	%if &i eq 1 %then %let yname=Checking;
	%if &i eq 2 %then %let yname=Money Market;
	%if &i eq 3 %then %let yname=Savings;
	%if &i eq 4 %then %let yname=Time Deposits;
	%if &i eq 5 %then %let yname=IRAs;
	%if &i eq 6 %then %let yname=Mortgage;
	%if &i eq 7 %then %let yname=Home Equity;
	%if &i eq 8 %then %let yname=Inst. Loan;
	%do j = 1 %to 10;
		%if &j eq 1 %then %let xname=Checking;
		%if &j eq 2 %then %let xname=Money Market;
		%if &j eq 3 %then %let xname=Savings;
		%if &j eq 4 %then %let xname=Time Deposits;
		%if &j eq 5 %then %let xname=IRAs;
		%if &j eq 6 %then %let xname=Mortgage;
		%if &j eq 7 %then %let xname=Home Equity;
		%if &j eq 8 %then %let xname=Inst. Loan;
		%if &j eq 9 %then %let xname=Securities;
		%if &j eq 10 %then %let xname=Insurance;

		%if &i eq 1 %then %do;
			title1 "&xname";
		%end;
		%if &i ne 1 %then %do;
			title1 ;
		%end;
		%if &j eq 1 %then %do;
			axis1 label=(angle=90 f="Arial / bo" justify=center color=black height=14pt "&yname")  minor=none major=none color=white value=none order=(0 to &max1 by 0.1); 
		%end;
		%if &j ne 1 %then %do;
			axis1 label=none  minor=none major=none color=white value=none order=(0 to &max1 by 0.1); 
		%end;
		axis2 label=none  minor=none major=none value=none ;
		
	
		proc gchart data=&file(where=(y="&yname" and x="&xname")) gout=work.gseg;
		vbar &group1 / sumvar=percent subgroup=&group1 discrete raxis=axis1 width=25 maxis=axis2 gaxis=axis2 outside=sum nolegend noframe;
		format percent percent8.0;
		run;
		quit;
	%end;
	 title1 ;
      %if &i eq 1 %then %do;
		title1 'Avg. Products';
	%end;
/*	ods html style=MTB;*/
/*	goptions  cback=white noborder htitle=14pt htext=14pt;  */
/*	goptions device=gif nodisplay xpixels=&xsize ypixels=&ysize;*/
/*	Pattern1 c=cx007856;*/
/*	Pattern2 c=cx7AB800;*/
/*	Pattern3 c=cxFFB300;*/
/*	Pattern4 c=cx86499D;*/
/*	 axis1 label=none  minor=none major=none color=white value=none order=(0 to 5 by 0.5); */
/*	  axis2 label=none  minor=none major=none value=none order=(&order1);*/
/*	   proc gchart data=&prodfile(where=(num=&i)) gout=work.gseg;*/
/*		vbar &group1 / sumvar=prods subgroup=&group1 discrete raxis=axis1 width=25 maxis=axis2 gaxis=axis2 outside=sum nolegend noframe;*/
/*		format prods comma5.1;*/
/*		run;*/
/*		quit;*/
%end;



%mend create_panel_charts1;

data extra;
length hudson $ 3 mtb $ 3 group $ 4;
input group hudson mtb  percent;
datalines;
dual iln heq 0
dual ins iln 0
dual iln iln 0
dual iln mms 0
dual iln sec 0
dual iln tda 0
dual heq heq 0
dual heq ins 0
dual ins dda 0
dual ins heq 0
dual ins ira 0
dual ins ins 0
dual ins mms 0
dual ins mtg 0
dual ins sav 0
dual ins sec 0
dual ins tda 0
dual iln ins 0
dual heq iln 0
;
run;


data combined1;
set combined1 extra;
run;


data combined1;
length y $ 20 x $ 20;
set combined1;
where hudson ne 'All' and mtb ne 'All';
select (hudson);
	when ('dda')  y='Checking';
	when ('mms')  y='Money Market';
	when ('sav')  y='Savings';
	when ('tda')  y='Time Deposits';
	when ('ira')  y='IRAs';
	when ('mtg')  y='Mortgage';
	when ('heq')  y='Home Equity';
	when ('iln')  y='Inst. Loan';
	when ('sec')  y='Securities';
	when ('ins')  y='Insurance';
end;
select (mtb);
	when ('dda')  x='Checking';
	when ('mms')  x='Money Market';
	when ('sav')  x='Savings';
	when ('tda')  x='Time Deposits';
	when ('ira')  x='IRAs';
	when ('mtg')  x='Mortgage';
	when ('heq')  x='Home Equity';
	when ('iln')  x='Inst. Loan';
	when ('sec')  x='Securities';
	when ('ins')  x='Insurance';
end;
run;







proc tabulate data=combined1 missing;
class x y;
table y,x;
run;

proc template;
     define style special;
     parent=styles.default;
	 style graphdata1 from graphdata2 / color=cx003359 contrastcolor=black;
     end;
   run;
   ods listing style=special;

%create_panel_charts1 (xsize=300, ysize=200, file=combined1, group1=group, order1 = "Dual",prodfile=wip.products_combined)



%custom_panel(x=10,y=8,fileout=C:\Documents and Settings\ewnym5s\My Documents\Hudson City\panelchart.gif,x_size=3000,y_size=1600)
