
create or replace function fun_issue_book (borrower_id number, book_id number, current_date date) return number as t number;
temp varchar2(20);

begin

select b.status into temp 
from books b
where b.book_id = book_id;

if temp = 'issued' then
insert into pending_request values(book_id, borrower_id, current_date , NULL);
return 0;

else 
insert into issue values(book_id, borrower_id, current_date , NULL);
return 1;

end if;	

end fun_issue_book;
.
run;

create or replace function fun_issue_anyedition (borrower_id number, book_title varchar2, a_name varchar2, current_date date) return number as t number;
bid number;
begin

begin

select temp2.book_id into bid
from (select b.book_id
	from books b, author a
	where (book_title  = b.book_title) and (a_name = a.name) and not (b.status = 'issued') 
	order by b.edition desc)  temp2
where rownum = 1;
exception
when NO_DATA_FOUND then
bid := 0;
end; 

if bid = 0 then
select temp3.book_id into bid 
from (select ii.book_id
	from books bb, issue ii 
	where (book_title =bb.book_title) and (bb.book_id=ii.book_id) and (ii.return_date is NULL) 
	order by ii.issue_date asc)  temp3
where rownum = 1;
insert into pending_request values(bid, borrower_id, current_date, NULL);
return 0;

else 
insert into issue values(bid, borrower_id, current_date, NULL);
return 1;

end if;

end fun_issue_anyedition;
.
run;


create or replace function fun_most_popular (month number, year number) return number as t number;
begin
for iii in 
(select b.book_id, count(*) 
from books b, issue i 
where (b.book_id = i.book_id) and (to_char(i.issue_date, 'mm') = month) and (to_char(i.issue_date, 'yyyy') = year) 
group by b.book_id  
having count(*) = (select max(temp) 
		   from (select bb.book_id, count(bb.book_id) temp 
			from books bb, issue ii 
			where (bb.book_id = ii.book_id) and (to_char(ii.issue_date, 'mm') = month) and (to_char(ii.issue_date, 'yyyy') = year) 
			group by bb.book_id )) )

loop
dbms_output.put_line(iii.book_id);
end loop;

end fun_most_popular;
.
run;



create or replace function fun_return_book (book_id number, current_date date) return number as t number;
bid number := 1;
begin
update issue i
set i.return_date = current_date
where (book_id=i.book_id) and (i.return_date is NULL);

begin
select requester_id into bid
from (select p.requester_id 
	from pending_request p 
	where (book_id=p.book_id) and (p.issue_date is NULL) 
	order by p.request_date)
where rownum = 1;
exception
when NO_DATA_FOUND then
bid := 0;
end;


if bid = 0 then
return 0;

else 
update pending_request pp 
set pp.issue_date = current_date 
where (pp.book_id=book_id) and (pp.requester_id=bid) and (pp.issue_date is NULL);
insert into issue values(book_id, bid, current_date, NULL);
return 1;

end if;

end fun_return_book;
.
run;


create or replace function fun_renew_book (borrower_id number, book_id number, current_date  date) return number as bid number;
p number ;
i number ;
temp number;


begin
p := 1;
i := 1;
begin
select i.book_id into temp
from issue i
where (book_id=i.book_id) and (borrower_id=i.borrower_id);
exception
when NO_DATA_FOUND then
i := 0;
end;


begin
select p.book_id into temp
from pending_request p 
where  (book_id=p.book_id);
exception
when NO_DATA_FOUND then
p := 0;
end;

if  i != 0  and p = 0 then
update issue i 
set i.issue_date = current_date  
where (book_id=i.book_id) and (borrower_id=i.borrower_id);
return 1;

else
return 0;

end if;

end fun_renew_book;
.
run;








