-- a)

-- i)
create index ssn_pk on employee(ssn)

-- ii)
create index Fname_Lname_pk on employee(Fname, Lname)

-- iii)
create index Dno_pk on employee(Dno)

-- iv)
create index Pno_pk on works_on(Pno)