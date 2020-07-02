create or replace trigger trg_maxbooks
before insert on issue

for each row

declare
bid number ;
s varchar2(20);
num number := 0;

begin

begin

select i.borrower_id, b.status, count(b.borrower_id) into bid, s, num 
from issue i, borrower b
where (i.borrower_id=b.borrower_id) and (:new.borrower_id = b.borrower_id)
group by i.borrower_id, b.status;
exception
when NO_DATA_FOUND then
bid := NULL;
s := NULL;
end;


if s = 'student' then 
	if num >3 then
	RAISE_APPLICATION_ERROR(-1, '2 books issued to this student already');
		    end if;
else
	if num > 4 then
	RAISE_APPLICATION_ERROR(-2, '3 books issued to this faculty member already');
	end if;
end if;

end trg_maxbooks;
.
run;


create or replace trigger trg_issue
after insert on issue
for each row
begin
update books b
set b.status = 'issued'
where (b.book_id = :new.book_id);
end trg_issue;
.
run;



create or replace trigger trg_notissue
after update of return_date on issue
for each row
begin
update books b 
set b.status = 'not_issued' 
where (b.book_id = :new.book_id);
end trg_notissue;
.
run;