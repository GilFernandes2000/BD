--5.1)

--a)
SELECT p.Pname, p.Pnumber, e.Fname, e.Minit, e.Lname, e.Ssn
FROM Employee e, Project p, Works_on w
WHERE p.Pnumber = w.Pno and w.Essn = e.Ssn

--b)
SELECT e.Fname, e.Minit, e.Lname, e.Ssn
FROM Employee e, Employee se
WHERE e.Super_ssn = se.SSn and se.Fname='Carlos' and se.Minit='D' and se.Lname='Gomes'

--c)
SELECT p.Pname, sum(wo.Hours) as total_hours
FROM Project p, Works_on wo
WHERE p.Pnumber = wo.Pno
GROUP BY p.Pname

--d)
SELECT e.Fname, e.Lname, p.Pname, e.Dno, wo.Hours
FROM Employee e, Porject p, works_on wo
WHERE p.Pnumber = wo.Pno and w.Essn = e.Ssn and e.Dno = 3 and Pname = 'Aveiro Digital' and wo.Hours > 20

--e)
SELECT e.Fname, e.Minit, e.Lname
FROM employee e, works_on wo
WHERE e.Ssn = wo.Essn and wo.Essn is Null

--f)
SELECT d.dname, avg(e.Salary) as avg_female_salary
FROM department as d, employee as e
WHERE d.Dnumber = e.Dno and e.Sex = 'F'
GROUP BY d.dname

--g)
SELECT e.Fname, e.Lname, e.Ssn, count(d.Essn) as num_depend
FROM employee as e, dependent as d
WHERE e.Ssn = d.Essn
GROUP BY e.Fname, e.Lname, e.Ssn
HAVING num_depend > 2

--h)
SELECT e.Fname, e.Lname, e.Ssn, count(d.Essn) as num_depend
FROM employee as e, dependent as d, department as de
WHERE e.Ssn = d.Essn and de.Mgr_ssn = e.Ssn
GROUP BY e.Fname, e.Lname, e.Ssn
HAVING num_depend = 0