USE p1g1
GO

-- CREATE SCHEMA TripPlanner

if not exists (select * from sys.schemas where name='TripPlanner')
begin
	exec('CREATE SCHEMA TripPlanner;')
end
go	

-- select * from TripPlanner.Restaurant

create table TripPlanner.TripType(
	ID int identity(1,1) primary key,
	TypeName varchar(15) not null,
);

CREATE TABLE TripPlanner.City(
	CName VARCHAR(15) NOT NULL PRIMARY KEY,
	Country VARCHAR(15) NOT NULL,
	Continent VARCHAR(15) NOT NULL,
	CHECK(Continent='Europa' or Continent='Asia' or Continent='Oceania' or Continent='Africa' or Continent='America')
);

CREATE TABLE TripPlanner.POInterest(
	Email VARCHAR(30) NOT NULL,
	Rating INT NOT NULL,
	PoIName VARCHAR(30) NOT NULL,
	Contact VARCHAR(15) NOT NULL PRIMARY KEY,
	Price VARCHAR(10) NOT NULL,
	PoIAddress VARCHAR(30) NOT NULL,
	City varchar(15) not null foreign key references TripPlanner.City(CName),
	TrType int not null foreign key references TripPlanner.TripType(ID),
	CHECK(Rating >= 0 and Rating <= 5)
);

CREATE TABLE TripPlanner.Restaurant(
	RContact VARCHAR(15) PRIMARY KEY FOREIGN KEY REFERENCES TripPlanner.POInterest(Contact),
	Stars INT NOT NULL,
	Specialty VARCHAR(15) NOT NULL,
	CHECK(Stars>=0 and Stars <=3)
);

CREATE TABLE TripPlanner.Museum(
	MContact VARCHAR(15) PRIMARY KEY FOREIGN KEY REFERENCES TripPlanner.POInterest(Contact),
	Synopsis VARCHAR(100) NOT NULL,
	Theme VARCHAR(20) NOT NULL 
);

CREATE TABLE TripPlanner.Store(
	RContact VARCHAR(15) PRIMARY KEY FOREIGN KEY REFERENCES TripPlanner.POInterest(Contact),
	SType VARCHAR(15) NOT NULL 
);

CREATE TABLE TripPlanner.PoIEvent(
	RContact VARCHAR(15) PRIMARY KEY FOREIGN KEY REFERENCES TripPlanner.POInterest(Contact),
	EType VARCHAR(15) NOT NULL 
);

CREATE TABLE TripPlanner.Stay(
	Email VARCHAR(30) NOT NULL,
	Rating INT NOT NULL,
	SName VARCHAR(15) NOT NULL,
	Contact VARCHAR(15) NOT NULL PRIMARY KEY,
	SAddress VARCHAR(30) NOT NULL,
	-- Price int not null,
	City varchar(15) not null foreign key references TripPlanner.City(CName),
	TrType int not null foreign key references TripPlanner.TripType(ID),
	CHECK(Rating >= 0 and Rating <= 5)
);

CREATE TABLE TripPlanner.Person(
	Sex CHAR NOT NULL,
	PfName VARCHAR(15) NOT NULL,
	PmName VARCHAR(15) NOT NULL,
	PlName VARCHAR(15) NOT NULL,
	Email VARCHAR(30) NOT NULL,
	CC VARCHAR(8) NOT NULL PRIMARY KEY,
	PAddress VARCHAR(30) NOT NULL,
	CHECK(Sex='F' OR Sex='M'),
	CHECK(CC LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

CREATE TABLE TripPlanner.Trip(
	TrType int NOT NULL foreign key references TripPlanner.TripType(ID),
	ID INT IDENTITY(1,1) PRIMARY KEY,
	TrName VARCHAR(15) NOT NULL,
	Price INT NOT NULL,
	Duration INT NOT NULL,
	Departure_Date DATE NOT NULL,
	TrState VARCHAR(10) NOT NULL,
	Elaborator_CC VARCHAR(8) NOT NULL FOREIGN KEY REFERENCES TripPlanner.Person(CC)
);

create table TripPlanner.Stays_In(
	Trip_ID int not null,
	StayContact varchar(15) not null,
	Check_In date not null,
	Check_Out date not null,
	primary key (Trip_ID, StayContact),
	foreign key (Trip_ID) references TripPlanner.Trip(ID),
	foreign key (StayContact) references TripPlanner.Stay(Contact)
);

create table TripPlanner.Visits(
	InDay date not null,
	Trip_ID int not null,
	POIContact varchar(15) not null,
	primary key (Trip_ID, POIContact)
);

CREATE TABLE TripPlanner.Has(
	Person_CC VARCHAR(8) NOT NULL,
	Trip_ID INT NOT NULL,
	PRIMARY KEY (Person_CC, Trip_ID),
	FOREIGN KEY (Person_CC) REFERENCES TripPlanner.Person(CC),
	FOREIGN KEY (Trip_ID) REFERENCES TripPlanner.Trip(ID)
);

CREATE TABLE TripPlanner.Done_In(
	City_Name VARCHAR(15) NOT NULL,
	Trip_ID INT NOT NULL,
	PRIMARY KEY (City_Name, Trip_ID),
	FOREIGN KEY (Trip_ID) REFERENCES TripPlanner.Trip(ID),
	FOREIGN KEY (City_Name) REFERENCES TripPlanner.City(CName)
);

-- CREATE TABLE TripPlanner.Transport(
-- 	ID INT IDENTITY(1,1) PRIMARY KEY,
-- 	Price INT NOT NULL, 
-- 	Departure DATE NOT NULL,
-- 	Arrival DATE NOT NULL,
-- 	Num_seats INT NOT NULL,
-- 	CHECK(Num_seats > 0),
-- 	CHECK(Departure <= Arrival)
-- );

-- CREATE TABLE TripPlanner.Car(
-- 	Car_ID INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES TripPlanner.Transport(ID),
-- 	Brand VARCHAR(15) NOT NULL,
-- 	Registration VARCHAR(15) NOT NULL
-- );

-- CREATE TABLE TripPlanner.Plane(
-- 	Plane_ID INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES TripPlanner.Transport(ID),
-- 	Company VARCHAR(15) NOT NULL,
-- 	Plane_Type VARCHAR(15) NOT NULL
-- );

-- CREATE TABLE TripPlanner.Train(
-- 	Train_ID INT NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES TripPlanner.Transport(ID),
-- 	Company VARCHAR(15) NOT NULL,
-- 	Train_Type VARCHAR(15) NOT NULL
-- );




-- CREATE TABLE TripPlanner.Can_Have(
-- 	Transport_ID INT NOT NULL,
-- 	Trip_ID INT NOT NULL,
-- 	PRIMARY KEY (Transport_ID, Trip_ID),
-- 	FOREIGN KEY (Transport_ID) REFERENCES TripPlanner.Transport(ID),
-- 	FOREIGN KEY (Trip_ID) REFERENCES TripPlanner.Trip(ID)
-- );

