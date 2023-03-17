USE p1g1
GO

CREATE SCHEMA Company
GO



CREATE TABLE Company.Department(
	Dname VARCHAR(15) NOT NULL,
	Dnumber INT NOT NULL PRIMARY KEY,
	Mgr_ssn VARCHAR(8) NOT NULL,
	Mgr_start_date DATE NOT NULL
);


CREATE TABLE Company.Employee(
	Fname VARCHAR(15) NOT NULL,
	Minit VARCHAR(15) NOT NULL,
	Lname VARCHAR(15) NOT NULL,
	Ssn VARCHAR(8) NOT NULL PRIMARY KEY,
	Bdate DATE NOT NULL,
	EAddress VARCHAR(30) NOT NULL,
	Sex VARCHAR(15) NOT NULL,
	Salary INT NOT NULL,
	Super_ssn VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES Company.Employee(Ssn),
	Dno INT NOT NULL FOREIGN KEY REFERENCES Company.Department(Dnumber)
);

CREATE TABLE Company.Dept_Locations(
	Dnumber INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Company.Department(Dnumber),
	Dlocation VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE Company.Project(
	Pname VARCHAR(15) NOT NULL,
	Pnumber INT NOT NULL PRIMARY KEY,
	Plocation VARCHAR(15) NOT NULL,
	Dnum INT NOT NULL FOREIGN KEY REFERENCES Company.Department(Dnumber)
);

CREATE TABLE Company.Works_on(
	Essn VARCHAR(8) NOT NULL UNIQUE FOREIGN KEY REFERENCES Company.Employee(Ssn),
	Pno INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Company.Project(Pnumber),
	WHours TIME NOT NULL 
);

CREATE TABLE Company.Dependent(
	Essn VARCHAR(8) NOT NULL UNIQUE FOREIGN KEY REFERENCES Company.Employee(Ssn),
	Dependent_name VARCHAR(15) NOT NULL UNIQUE,
	Sex VARCHAR(15) NOT NULL,
	Bdate DATE NOT NULL,
	Relationship VARCHAR(10) NOT NULL
);