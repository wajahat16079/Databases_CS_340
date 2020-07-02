rem CS 340 Programming Assignment 1
rem S Wajahat Ali
rem s19100082



DBMS_OUTPUT.PUT_LINE('Query #1');
select distinct p.pat_id
from patent p, categories c
where (p.cat= c.cat) and (c.catnamelong='Chemical' or c.catnamelong='Drugs AND Medical');


DBMS_OUTPUT.PUT_LINE('Query #2'); 
select distinct i.lastname,i.firstname,i.country,i.postate
from patent p,categories c,inventor i
where (p.pat_id=i.patentnum) and (p.subcat = c.subcat) and (p.cat = c.cat) and (c.catnamelong = 'Chemical' or c.catnamelong = 'Drugs AND Medical');

DBMS_OUTPUT.PUT_LINE('Query #3');
select distinct i.lastname,i.firstname,i.country,i.postate
from inventor i
where  not exists (select *
		from patent p,categories c 
		where (p.pat_id=i.patentnum) and (p.cat= c.cat) and not (c.catnamelong ='Chemical'));

DBMS_OUTPUT.PUT_LINE('Query #4');
select distinct pat_id
from patent p,inventor i
where (p.pat_id=i.patentnum) and (i.postate='CA' or i.postate='NJ');

DBMS_OUTPUT.PUT_LINE('Query #5');
select distinct p.pat_id
from patent p,inventor i
where (p.pat_id=i.patentnum) and (i.postate='CA' or i.postate='NJ') and (i.invseq=1 or i.invseq=2);

DBMS_OUTPUT.PUT_LINE('Query #6');
select c.compname
from patent p,company c
where c.assignee = p.assignee 
group by c.compname
having count(c.compname) = (select MAX (n)
	           from (
                    select cc.compname,count(cc.compname) n
		    from company cc,patent pp
		    where cc.assignee=pp.assignee
                    group by cc.compname));



DBMS_OUTPUT.PUT_LINE('Query #7');
select c.compname
from patent p,company c,categories c1
where (c.assignee = p.assignee) and (p.subcat = c1.subcat) and (p.cat=c1.cat) and (c1.catnamelong='Chemical')
group by c.compname
having count(c.compname) = (select MAX (n)
	           from (
                    select cc.compname,count(cc.compname) n
		    from company cc,patent pp,categories cc1
		    where (cc.assignee=pp.assignee)and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Chemical')
                    group by cc.compname));

DBMS_OUTPUT.PUT_LINE('Query #8');
select c.compname
from patent p,company c,categories c1
where (p.assignee=c.assignee) and (p.subcat = c1.subcat) and  (p.cat=c1.cat) and (c1.catnamelong='Chemical')
group by c.compname
having count(*) >2 ;


DBMS_OUTPUT.PUT_LINE('Query #9');
select c.compname
from patent p,company c,categories c1
where (c.assignee = p.assignee) and (p.subcat = c1.subcat) and (p.cat=c1.cat)  and (c1.catnamelong ='Chemical') and (c1.subcat = 11)
group by c.compname
having count(c.compname) = (select MAX (n)
	           from (
                    select cc.compname,count(cc.compname) n
		    from company cc,patent pp,categories cc1
		    where (cc.assignee=pp.assignee) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Chemical') and (cc1.subcat = 11)
                    group by cc.compname))
union 
select c.compname
from patent p,company c,categories c1
where (c.assignee = p.assignee) and (p.subcat = c1.subcat) and (p.cat=c1.cat)  and (c1.catnamelong ='Chemical') and (c1.subcat = 12)
group by c.compname
having count(c.compname) = (select MAX (n)
	           from (
                    select cc.compname,count(cc.compname) n
		    from company cc,patent pp,categories cc1
		    where (cc.assignee=pp.assignee) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Chemical') and (cc1.subcat = 12)
                    group by cc.compname))
union 
select c.compname
from patent p,company c,categories c1
where (c.assignee = p.assignee) and (p.subcat = c1.subcat) and (p.cat=c1.cat)  and (c1.catnamelong ='Chemical') and (c1.subcat = 13)
group by c.compname
having count(c.compname) = (select MAX (n)
	           from (
                    select cc.compname,count(cc.compname) n
		    from company cc,patent pp,categories cc1
		    where (cc.assignee=pp.assignee) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Chemical') and (cc1.subcat = 13)
                    group by cc.compname))
union 
select c.compname
from patent p,company c,categories c1
where (c.assignee = p.assignee) and (p.subcat = c1.subcat) and (p.cat=c1.cat)  and (c1.catnamelong ='Chemical') and (c1.subcat = 14)
group by c.compname
having count(c.compname) = (select MAX (n)
	           from (
                    select cc.compname,count(cc.compname) n
		    from company cc,patent pp,categories cc1
		    where (cc.assignee=pp.assignee) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Chemical') and (cc1.subcat = 14)
                    group by cc.compname))
union 
select c.compname
from patent p,company c,categories c1
where (c.assignee = p.assignee) and (p.subcat = c1.subcat) and (p.cat=c1.cat)  and (c1.catnamelong ='Chemical') and (c1.subcat = 15)
group by c.compname
having count(c.compname) = (select MAX (n)
	           from (
                    select cc.compname,count(cc.compname) n
		    from company cc,patent pp,categories cc1
		    where (cc.assignee=pp.assignee) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Chemical') and (cc1.subcat = 15)
                    group by cc.compname))
union 
select c.compname
from patent p,company c,categories c1
where (c.assignee = p.assignee) and (p.subcat = c1.subcat) and (p.cat=c1.cat)  and (c1.catnamelong ='Chemical') and (c1.subcat = 19)
group by c.compname
having count(c.compname) = (select MAX (n)
	           from (
                    select cc.compname,count(cc.compname) n
		    from company cc,patent pp,categories cc1
		    where (cc.assignee=pp.assignee) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Chemical') and (cc1.subcat = 19)
                    group by cc.compname));

DBMS_OUTPUT.PUT_LINE('Query #10');
select i.lastname,i.firstname, count(*)
from patent p, inventor i, categories c1
where (p.pat_id=i.patentnum) and (p.subcat = c1.subcat) and (p.cat=c1.cat) and (c1.catnamelong='Electrical AND Electronic')
group by i.lastname,i.firstname
having count(*) = (select MAX (n)
	           from (
                    select ii.lastname,ii.firstname, count(*) n
		    from patent pp,inventor ii, categories cc1
		    where (pp.pat_id=ii.patentnum) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Electrical AND Electronic')
                    group by ii.lastname,ii.firstname));


DBMS_OUTPUT.PUT_LINE('Query #11');
select i.lastname,i.firstname, count(*)
from patent p, inventor i, categories c1
where (p.pat_id=i.patentnum) and (p.subcat = c1.subcat) and (p.cat=c1.cat) and (c1.catnamelong='Chemical')
group by i.lastname,i.firstname
having count(*) = (select MAX (n)
	           from (
                    select ii.lastname,ii.firstname, count(*) n
		    from patent pp,inventor ii, categories cc1
		    where (pp.pat_id=ii.patentnum) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Chemical')
                    group by ii.lastname,ii.firstname))
union all
select i.lastname,i.firstname, count(*)
from patent p, inventor i, categories c1
where (p.pat_id=i.patentnum) and (p.subcat = c1.subcat) and (p.cat=c1.cat) and (c1.catnamelong='Computers AND Communications')
group by i.lastname,i.firstname
having count(*) = (select MAX (n)
	           from (
                    select ii.lastname,ii.firstname, count(*) n
		    from patent pp,inventor ii, categories cc1
		    where (pp.pat_id=ii.patentnum) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Computers AND Communications')
                    group by ii.lastname,ii.firstname))
union all
select i.lastname,i.firstname, count(*)
from patent p, inventor i, categories c1
where (p.pat_id=i.patentnum) and (p.subcat = c1.subcat) and (p.cat=c1.cat) and (c1.catnamelong='Mechanical')
group by i.lastname,i.firstname
having count(*) = (select MAX (n)
	           from (
                    select ii.lastname,ii.firstname, count(*) n
		    from patent pp,inventor ii, categories cc1
		    where (pp.pat_id=ii.patentnum) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Mechanical')
                    group by ii.lastname,ii.firstname))
union all
select i.lastname,i.firstname, count(*)
from patent p, inventor i, categories c1
where (p.pat_id=i.patentnum) and (p.subcat = c1.subcat) and (p.cat=c1.cat) and (c1.catnamelong='Drugs AND Medical')
group by i.lastname,i.firstname
having count(*) = (select MAX (n)
	           from (
                    select ii.lastname,ii.firstname, count(*) n
		    from patent pp,inventor ii, categories cc1
		    where (pp.pat_id=ii.patentnum) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Drugs AND Medical')
                    group by ii.lastname,ii.firstname))
union all
select i.lastname,i.firstname, count(*)
from patent p, inventor i, categories c1
where (p.pat_id=i.patentnum) and (p.subcat = c1.subcat) and (p.cat=c1.cat) and (c1.catnamelong='Others')
group by i.lastname,i.firstname
having count(*) = (select MAX (n)
	           from (
                    select ii.lastname,ii.firstname, count(*) n
		    from patent pp,inventor ii, categories cc1
		    where (pp.pat_id=ii.patentnum) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Others')
                    group by ii.lastname,ii.firstname))
union all
select i.lastname,i.firstname, count(*)
from patent p, inventor i, categories c1
where (p.pat_id=i.patentnum) and (p.subcat = c1.subcat) and (p.cat=c1.cat) and (c1.catnamelong='Electrical AND Electronic')
group by i.lastname,i.firstname
having count(*) = (select MAX (n)
	           from (
                    select ii.lastname,ii.firstname, count(*) n
		    from patent pp,inventor ii, categories cc1
		    where (pp.pat_id=ii.patentnum) and (pp.subcat = cc1.subcat) and (pp.cat=cc1.cat) and (cc1.catnamelong='Electrical AND Electronic')
                    group by ii.lastname,ii.firstname));


DBMS_OUTPUT.PUT_LINE('Query #12');
select distinct c.compname
from patent p,company c
where (p.assignee= c.assignee) and (p.subcat IN (select c1.subcat
         					from categories c1
         					where (c1.catnamelong='Electrical AND Electronic')));



DBMS_OUTPUT.PUT_LINE('Query #13');


DBMS_OUTPUT.PUT_LINE('Query #14');
select p.pat_id
from patent p, citations c
where p.pat_id=c.cited
group by c.cited
having count(c.cited) = (select MAX (n)
	           from (
                    select pp.pat_id,count(cc.cited) n
		    from patent pp ,citations cc
		    where pp.pat_id=cc.cited
                    group by cc.cited));

DBMS_OUTPUT.PUT_LINE('Query #15');
select p.pat_id
from patent p, citations c, categories c1
where p.pat_id = c.cited and p.cat = c1.cat and c1.subcat = p.subcat and c1.catnamelong='Electrical AND Electronic'
group by c.cited, p.pat_id
having count(c.cited) = (select MAX (n)
	           from (
                    select pp.pat_id, count(cc.cited) n
		    from patent pp ,citations cc, categories cc1
		    where pp.pat_id = cc.cited and pp.cat = cc1.cat and cc1.subcat = pp.subcat and cc1.catnamelong='Electrical AND Electronic'
                    group by cc.cited, pp.pat_id ))
union
select p.pat_id
from patent p, citations c, categories c1
where p.pat_id = c.cited and p.cat = c1.cat and c1.subcat = p.subcat and c1.catnamelong='Chemical'
group by c.cited, p.pat_id
having count(c.cited) = (select MAX (n)
	           from (
                    select pp.pat_id, count(cc.cited) n
		    from patent pp ,citations cc, categories cc1
		    where pp.pat_id = cc.cited and pp.cat = cc1.cat and cc1.subcat = pp.subcat and cc1.catnamelong='Chemical'
                    group by cc.cited, pp.pat_id ))
union
select p.pat_id
from patent p, citations c, categories c1
where p.pat_id = c.cited and p.cat = c1.cat and c1.subcat = p.subcat and c1.catnamelong='Mechanical'
group by c.cited, p.pat_id
having count(c.cited) = (select MAX (n)
	           from (
                    select pp.pat_id, count(cc.cited) n
		    from patent pp ,citations cc, categories cc1
		    where pp.pat_id = cc.cited and pp.cat = cc1.cat and cc1.subcat = pp.subcat and cc1.catnamelong='Mechanical'
                    group by cc.cited, pp.pat_id ))
union
select p.pat_id
from patent p, citations c, categories c1
where p.pat_id = c.cited and p.cat = c1.cat and c1.subcat = p.subcat and c1.catnamelong='Drugs AND Medical'
group by c.cited, p.pat_id
having count(c.cited) = (select MAX (n)
	           from (
                    select pp.pat_id, count(cc.cited) n
		    from patent pp ,citations cc, categories cc1
		    where pp.pat_id = cc.cited and pp.cat = cc1.cat and cc1.subcat = pp.subcat and cc1.catnamelong='Drugs AND Medical'
                    group by cc.cited, pp.pat_id ))
union
select p.pat_id
from patent p, citations c, categories c1
where p.pat_id = c.cited and p.cat = c1.cat and c1.subcat = p.subcat and c1.catnamelong='Computers AND Communications'
group by c.cited, p.pat_id
having count(c.cited) = (select MAX (n)
	           from (
                    select pp.pat_id, count(cc.cited) n
		    from patent pp ,citations cc, categories cc1
		    where pp.pat_id = cc.cited and pp.cat = cc1.cat and cc1.subcat = pp.subcat and cc1.catnamelong='Computers AND Communications'
                    group by cc.cited, pp.pat_id ))
union
select p.pat_id
from patent p, citations c, categories c1
where p.pat_id = c.cited and p.cat = c1.cat and c1.subcat = p.subcat and c1.catnamelong='Others'
group by c.cited, p.pat_id
having count(c.cited) = (select MAX (n)
	           from (
                    select pp.pat_id, count(cc.cited) n
		    from patent pp ,citations cc, categories cc1
		    where pp.pat_id = cc.cited and pp.cat = cc1.cat and cc1.subcat = pp.subcat and cc1.catnamelong='Others'
                    group by cc.cited, pp.pat_id ));


DBMS_OUTPUT.PUT_LINE('Query #16');
select p.pat_id
from patent p, citations c
where p.pat_id=c.citing
group by c.citing
having count(c.citing) = (select MAX (n)
	           from (
                    select pp.pat_id,count(cc.citing) n
		    from patent pp,citations cc
		    where pp.pat_id=cc.citing
                    group by cc.citing));


DBMS_OUTPUT.PUT_LINE('Query #17');
select distinct i.firstname, i.lastname, i.invseq, i.city, i.postate
from patent p, citations c,inventor i
where (i.patentnum=p.pat_id) and p.pat_id IN (select pat_id
from patent pp, citations cc
where pp.pat_id=cc.cited
group by cc.cited
having count(cc.cited) = (select MAX (n)
	           from (
                    select ppp.pat_id,count(ccc.cited) n
		    from citations ccc, patent ppp
		    where ppp.pat_id=ccc.cited
                    group by ccc.cited)));

DBMS_OUTPUT.PUT_LINE('Query #18');
select i.lastname,i.firstname, i.city, i.postate ,count(*)
from patent p, inventor i
where (p.pat_id=i.patentnum) and (i.invseq=1)
group by i.lastname,i.firstname, i.city, i.postate
having count(*) = (select MAX (n)
	           from (
                    select lastname,firstname,city,postate,count(*) n
		    from patent pp, inventor ii
		    where (pp.pat_id=ii.patentnum) and (ii.invseq=1)
                    group by ii.lastname,ii.firstname, ii.city, ii.postate));

DBMS_OUTPUT.PUT_LINE('Query #19');
select i.lastname,i.firstname, i.city, i.postate ,count(*)
from patent p, inventor i, categories c
where (p.pat_id = i.patentnum) and (i.invseq = 1) and (c.catnamelong = 'Electrical AND Electronic') and (p.subcat = c.subcat) and (p.cat=c.cat)
group by i.lastname,i.firstname, i.city, i.postate
having count(*) = (select MAX (n)
	           from (
                    select lastname,firstname,city,postate,count(*) n
		    from patent pp, inventor ii, categories cc
		    where (pp.pat_id=ii.patentnum) and (ii.invseq=1)and (cc.catnamelong='Electrical AND Electronic') and (pp.subcat = cc.subcat) and (pp.cat=cc.cat)
                    group by ii.lastname,ii.firstname, ii.city, ii.postate))
union all 
select i.lastname,i.firstname, i.city, i.postate ,count(*)
from patent p, inventor i, categories c
where (p.pat_id = i.patentnum) and (i.invseq = 1) and (c.catnamelong = 'Chemical') and (p.subcat = c.subcat) and (p.cat=c.cat)
group by i.lastname,i.firstname, i.city, i.postate
having count(*) = (select MAX (n)
	           from (
                    select lastname,firstname,city,postate,count(*) n
		    from patent pp, inventor ii, categories cc
		    where (pp.pat_id=ii.patentnum) and (ii.invseq=1)and (cc.catnamelong='Chemical') and (pp.subcat = cc.subcat) and (pp.cat=cc.cat)
                    group by ii.lastname,ii.firstname, ii.city, ii.postate))
union all
select i.lastname,i.firstname, i.city, i.postate ,count(*)
from patent p, inventor i, categories c
where (p.pat_id = i.patentnum) and (i.invseq = 1) and (c.catnamelong = 'Mechanical') and (p.subcat = c.subcat) and (p.cat=c.cat)
group by i.lastname,i.firstname, i.city, i.postate
having count(*) = (select MAX (n)
	           from (
                    select lastname,firstname,city,postate,count(*) n
		    from patent pp, inventor ii, categories cc
		    where (pp.pat_id=ii.patentnum) and (ii.invseq=1)and (cc.catnamelong='Mechanical') and (pp.subcat = cc.subcat) and (pp.cat=cc.cat)
                    group by ii.lastname,ii.firstname, ii.city, ii.postate))
union all
select i.lastname,i.firstname, i.city, i.postate ,count(*)
from patent p, inventor i, categories c
where (p.pat_id = i.patentnum) and (i.invseq = 1) and (c.catnamelong = 'Drugs AND Medical') and (p.subcat = c.subcat) and (p.cat=c.cat)
group by i.lastname,i.firstname, i.city, i.postate
having count(*) = (select MAX (n)
	           from (
                    select lastname,firstname,city,postate,count(*) n
		    from patent pp, inventor ii, categories cc
		    where (pp.pat_id=ii.patentnum) and (ii.invseq=1)and (cc.catnamelong='Drugs AND Medical') and (pp.subcat = cc.subcat) and (pp.cat=cc.cat)
                    group by ii.lastname,ii.firstname, ii.city, ii.postate))
union all
select i.lastname,i.firstname, i.city, i.postate ,count(*)
from patent p, inventor i, categories c
where (p.pat_id = i.patentnum) and (i.invseq = 1) and (c.catnamelong = 'Computers AND Communications') and (p.subcat = c.subcat) and (p.cat=c.cat)
group by i.lastname,i.firstname, i.city, i.postate
having count(*) = (select MAX (n)
	           from (
                    select lastname,firstname,city,postate,count(*) n
		    from patent pp, inventor ii, categories cc
		    where (pp.pat_id=ii.patentnum) and (ii.invseq=1)and (cc.catnamelong='Computers AND Communications') and (pp.subcat = cc.subcat) and (pp.cat=cc.cat)
                    group by ii.lastname,ii.firstname, ii.city, ii.postate))
union all
select i.lastname,i.firstname, i.city, i.postate ,count(*)
from patent p, inventor i, categories c
where (p.pat_id = i.patentnum) and (i.invseq = 1) and (c.catnamelong = 'Others') and (p.subcat = c.subcat) and (p.cat=c.cat)
group by i.lastname,i.firstname, i.city, i.postate
having count(*) = (select MAX (n)
	           from (
                    select lastname,firstname,city,postate,count(*) n
		    from patent pp, inventor ii, categories cc
		    where (pp.pat_id=ii.patentnum) and (ii.invseq=1)and (cc.catnamelong='Others') and (pp.subcat = cc.subcat) and (pp.cat=cc.cat)
                    group by ii.lastname,ii.firstname, ii.city, ii.postate));


DBMS_OUTPUT.PUT_LINE('Query #20');
select p.pat_id
from patent p ,categories c
where (c.catnamelong = 'Chemical') and (p.subcat = c.subcat) and (p.cat=c.cat) and not exists   
(select cited
   from patent,citations
   where P.pat_id=citations.cited);

DBMS_OUTPUT.PUT_LINE('Query #21');
select p.cat, p.subcat, count(*) 
from patent p,inventor i
where (p.pat_id=i.patentnum) and (i.postate='CA')
group by p.cat, p.subcat;


DBMS_OUTPUT.PUT_LINE('Query #22');
select avg(n)
from(select COUNT (*) as n
     from patent p, inventor i, company c
     where (c.assignee = p.assignee) and (i.postate='NJ') and (i.patentnum=p.pat_id) and (i.invseq=1)
     group by c.assignee);

DBMS_OUTPUT.PUT_LINE('Query #23');
select c.compname, count(*)
from patent p, company c
where p.assignee=c.assignee
group by c.compname
having count(*) >
	(select avg(count(ii.invseq))
	from inventor ii, patent pp
	where (pp.pat_id = ii.patentnum) and (ii.postate = 'NY') 
	group by ii.invseq);


DBMS_OUTPUT.PUT_LINE('Query #24');
select avg(count(*))
from inventor i, patent p, categories c
where p.pat_id = i.patentnum and p.cat = c.cat and c.subcat=p.subcat and p.cat IN (select cc.cat 
										from categories cc 
										where cc.catnamelong='Electrical AND Electronic')
group by i.patentnum;

DBMS_OUTPUT.PUT_LINE('Query #25');
select distinct i.firstname, i.lastname
from inventor i, citations c, patent p
where (i.patentnum = p.pat_id) and (c.citing = p.pat_id) and c.cited NOT IN
								(select i.patentnum
								from inventor ii
								where (i.firstname = ii.firstname) and (i.lastname = ii.lastname));


DBMS_OUTPUT.PUT_LINE('View A');
create view VIEWA as
select p.pat_id, i.firstname, i.lastname, p.gyear, cc.compname, c.catnamelong, c.subcatname
from inventor i, categories c, patent p, company cc
where (p.pat_id = i.patentnum) and (cc.assignee = p.assignee) and (c.cat = p.cat) and (c.subcat = p.subcat) and (i.invseq = 1);

DBMS_OUTPUT.PUT_LINE('View B');
create view VIEWB as
select p.assignee, c.compname, cc.catnamelong, cc.subcatname, temp.n
from company c, patent p, categories cc, (select pp.assignee, count(*) as n
from patent pp
group by pp.assignee) temp
where (p.assignee = c.assignee) and (p.assignee= temp.assignee) and (p.cat = cc.cat) and (p.subcat = cc.subcat);
