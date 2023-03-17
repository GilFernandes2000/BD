USE p1g1
GO

CREATE SCHEMA Airport_Reservation
GO

/*
DROP TABLE Airport_Reservation.Airport
DROP TABLE Airport_Reservation.Airplane_Type
DROP TABLE Airport_Reservation.Airplane
DROP TABLE Airport_Reservation.Flight
DROP TABLE Airport_Reservation.Fare
DROP TABLE Airport_Reservation.Flight_Leg
DROP TABLE Airport_Reservation.Leg_Instance
DROP TABLE Airport_Reservation.Seat
*/

CREATE TABLE Airport_Reservation.Airport(

	Airport_Code INT NOT NULL PRIMARY KEY,
	City VARCHAR(15) NOT NULL,
	Airport_State VARCHAR(15) NOT NULL,
	Airport_Name VARCHAR(20) NOT NULL,

);

CREATE TABLE Airport_Reservation.Airplane_Type(

	Airplane_Type_Name VARCHAR(10) NOT NULL PRIMARY KEY,
	Max_seats INT NOT NULL,
	Company VARCHAR(15) NOT NULL,

);

CREATE TABLE Airport_Reservation.Airplane(

	Airplane_ID INT NOT NULL PRIMARY KEY,
	Total_n_of_seats INT NOT NULL,

);

CREATE TABLE Airport_Reservation.Flight(

	Number INT NOT NULL PRIMARY KEY,
	Airline VARCHAR(15) NOT NULL,
	Weekdays BIT NOT NULL,
	Airplane_Type INT NOT NULL,

	FOREIGN KEY(Airplane_Type) REFERENCES Airport_Reservation.Airplane(Airplane_ID)

);

CREATE TABLE Airport_Reservation.Fare(

	Restrictions VARCHAR(20) NOT NULL,
	Amount INT NOT NULL,
	Code INT NOT NULL PRIMARY KEY,
	Number_Flight INT NOT NULL UNIQUE,

	FOREIGN KEY(Number_Flight) REFERENCES Airport_Reservation.Flight(Number)

);

CREATE TABLE Airport_Reservation.Flight_Leg(

	Number_Flight INT NOT NULL,
	Leg_Number INT NOT NULL PRIMARY KEY,
	Airport_Code_Departure INT NOT NULL,
	Airport_Code_Arrival INT NOT NULL,
	Sched_Depart_Time DATETIME NOT NULL,
	Sched_Arrival_Time DATETIME NOT NULL,

	FOREIGN KEY(Number_Flight) REFERENCES Airport_Reservation.Flight(Number),
	FOREIGN KEY(Airport_Code_Departure) REFERENCES Airport_Reservation.Airport(Airport_Code),
	FOREIGN KEY(Airport_Code_Arrival) REFERENCES Airport_Reservation.Airport(Airport_Code)
);

CREATE TABLE Airport_Reservation.Leg_Instance(

	Number_Flight INT NOT NULL PRIMARY KEY,
	Leg_Number INT NOT NULL UNIQUE,
	Leg_date DATETIME NOT NULL UNIQUE,
	Num_Avail_seats INT NOT NULL,
	Depart_Airport INT NOT NULL,
	Arrive_Airport INT NOT NULL,
	Depart_Time DATETIME NOT NULL,
	Arrive_Time DATETIME NOT NULL,

	FOREIGN KEY(Number_Flight) REFERENCES Airport_Reservation.Flight(Number),
	FOREIGN KEY(Leg_Number) REFERENCES Airport_Reservation.Flight_Leg(Leg_Number),
	FOREIGN KEY(Depart_Airport) REFERENCES Airport_Reservation.Airport(Airport_Code),
	FOREIGN KEY(Arrive_Airport) REFERENCES Airport_Reservation.Airport(Airport_Code)

);

CREATE TABLE Airport_Reservation.Seat(

	Number_Flight INT NOT NULL PRIMARY KEY,
	Leg_Number INT NOT NULL UNIQUE,
	Seat_date DATETIME NOT NULL UNIQUE,
	Seat_Number INT NOT NULL,
	Costumer_Name VARCHAR(20) NOT NULL,
	Cphone INT NOT NULL,

	FOREIGN KEY(Number_Flight) REFERENCES Airport_Reservation.Leg_Instance(Number_Flight),
	FOREIGN KEY(Leg_Number) REFERENCES Airport_Reservation.Leg_Instance(Leg_Number),
	FOREIGN KEY(Seat_Date) REFERENCES Airport_Reservation.Leg_Instance(Leg_Date)
);