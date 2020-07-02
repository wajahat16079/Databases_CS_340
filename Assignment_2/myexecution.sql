@createtable;
@populate;
@tgr;
@fun;
@pro;

declare
t number;
r number;

begin
t:=fun_issue_book(1,2,To_Date('04/04/2016', 'mm/dd/yyyy'));
t:=fun_issue_book(2,2,To_Date('03/03/2016', 'mm/dd/yyyy'));
t:=fun_issue_book(3,1,To_Date('05/03/2016', 'mm/dd/yyyy'));
t:=fun_issue_book(4,1,To_Date('03/06/2016', 'mm/dd/yyyy'));
t:=fun_issue_book(5,3,To_Date('09/04/2016', 'mm/dd/yyyy'));
t:=fun_issue_book(6,1,To_Date('03/09/2016', 'mm/dd/yyyy'));
t:=fun_issue_book(7,2,To_Date('08/08/2016', 'mm/dd/yyyy'));
t:=fun_issue_book(10,2,To_Date('08/08/2016', 'mm/dd/yyyy'));
end






declare
i number;
begin
i:=fun_issue_anyedition(2,'DATA MANAGEMENT','C.J.DATES',To_Date('03/03/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(4,'CALCULUS','H.ANTON',To_Date('03/04/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(5,'ORACLE','ORACLE PRESS',To_Date('03/04/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(10,'IEEE MULTIMEDIA','IEEE',To_Date('02/27/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(2,'MIS MANAGEMENT','C.J.DATES',To_Date('05/03/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(4,'CALCULUS II','H.ANTON',To_Date('03/04/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(10,'ORACLE','ORACLE PRESS',To_Date('03/04/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(5,'IEEE MULTIMEDIA','IEEE',To_Date('02/26/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(2,'DATA SRUCTURE ','W. GATES',To_Date('03/03/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(4,'CALCULUS III','H.ANTON',To_Date('04/04/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(11,'ORACLE','ORACLE PRESS',To_Date('03/08/2017', 'mm/dd/yyyy'));
i:=fun_issue_anyedition(6,'IEEE MULTIMEDIA','IEEE',To_Date('02/17/2017', 'mm/dd/yyyy'));
end;

EXEC pro_print_borrower(To_Date('12/12/2017', 'dd/mm/yyyy'));
EXEC pro_print_fine(To_Date('12/12/2017', 'dd/mm/yyyy'));

declare
r number;
begin
r:=fun_return_book(1,To_Date('10/10/2017', 'mm/dd/yyyy'));
r:=fun_return_book(2,To_Date('10/10/2017', 'mm/dd/yyyy'));
r:=fun_return_book(4,To_Date('10/10/2017', 'mm/dd/yyyy'));
r:=fun_return_book(10,To_Date('10/10/2017', 'mm/dd/yyyy'));
end;


select * 
from pending_request;

select * 
from issue;


EXEC pro_listborr_mon(To_Date('28/02/2016', 'dd/mm/yyyy'));
EXEC pro_listborr_mon(To_Date('28/03/2016', 'dd/mm/yyyy'));
EXEC pro_listborr();

@dropall