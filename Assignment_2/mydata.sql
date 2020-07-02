declare
t number;

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