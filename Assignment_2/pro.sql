create or replace procedure pro_print_borrower(current_date date) as
days number;
begin
dbms_output.put_line('Borrower Name'|| chr(10) || 'Book Title' || chr(10) || 'No. of Days'); 
for x in 
(select r.name, b.book_title, i.issue_date 
from books b, borrower r, issue i 
where (i.book_id=b.book_id) and (r.borrower_id=i.borrower_id))
loop
days := current_date - x.issue_date;
dbms_output.put_line (x.book_title ||chr(10) || x.name ||chr(10)||days);
end loop;
end pro_print_borrower;
.
run; 




create or replace procedure pro_print_fine (current_date date) as

fine number;
d number;

begin
dbms_output.put_line('borrower name'|| chr(10) || 'book id' || chr(10)|| 'issue_date' || chr(10) || 'fine');
for x in 
(select b.name, i.book_id, i.issue_date 
from borrower b, issue i 
where (i.borrower_id=b.borrower_id ) and (i.return_date is NULL) )

loop
d := current_date - x.issue_date;
if d >= 1 then
fine := 5*d;
else
fine := 0;
end if;

dbms_output.put_line (x.name ||chr(10)||x.book_id||chr(10)||x.issue_date ||chr(10)|| fine) ;
end loop;
end pro_print_fine;
.
run;





create or replace procedure pro_listborr_mon(borrowerid number, month number, year number) as
begin
dbms_output.put_line('Borrower ID' || chr(10) || 'Borrower Name'|| chr(10) || 'Book ID' || chr(10) || 'Book Title'|| chr(10) || 'ISSUE DATE' || chr(10) || 'RETURN DATE');
for x in 
(select r.borrower_id, r.name, i.book_id, b.book_title, i.issue_date, i.return_date 
from borrower r, issue i, books b
where (r.borrower_id = borrowerid) and (b.book_id=i.book_id) and (i.borrower_id= r.borrower_id) and (to_char(i.issue_date, 'yyyy')= year) and (to_char(i.issue_date, 'mm') = month))
loop      
dbms_output.put_line(x.borrower_id || chr(10)|| x.name|| chr(10) || x.book_id|| chr(10) || x.book_title || chr(10)||  x.issue_date || chr(10)|| x.return_date);
end loop;
end pro_listborr_mon;
.
run;




create or replace procedure pro_listborr as 
begin
dbms_output.put_line('Borrower Name' || chr(10) || 'Book ID' || chr(10) || 'Issue Date');
for x in 
(select r.name, b.book_id, i.issue_date
from books b, issue i, borrower r
where b.book_id = i.book_id and i.borrower_id=r.borrower_id and b.status='issued')

loop
dbms_output.put_line(x.name||chr(10)|| x.book_id ||chr(10)|| x.issue_date);
end loop;

end pro_listborr;
.
run;