use p1g1
go

use Company
go

--a)
create proc remove_func (@ssn as varchar(8))
as
begin
	delete from Dependent where Essn = @ssn
	delete from Works_on where Essn = @ssn
	update Department set Mgr_ssn = null where Mgr_ssn = @ssn
	update Employee set Super_ssn = null where Super_ssn = @ssn
	delete from Employee where Ssn = @ssn
end
go

create proc record_set_gesto (@last_ssn as varchar(8), @last_year as date)
as
begin
	select Fname, Minit, Lname, Ssn, Salary, Dno, Mgr_start_date
	from employee, department
	where Mgr_ssn = Ssn;

	select top(1) @last_ssn = Ssn, @last_year = YEAR(Mgr_start_date)
	from employee, department
	where Mgr_ssn = Ssn
	order by Mgr_start_date
end
go

select * from Company.Employee

insert into Company.Employee(Fname, Minit, Lname, Ssn, Bdate, EAddress, Sex, Salary, Super_ssn, Dno) 
values ('Paula','A','Sousa','18362361','2009-10-12','Rua da FRENTE','F',1450.00,NULL,3)