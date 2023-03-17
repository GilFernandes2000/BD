-- Usar estes templates para fazer inserts

-- insert into TripPlanner.City(CName, Country, Continent) values();
-- insert into TripPlanner.Done_In(City_Name, Trip_ID) values();
-- insert into TripPlanner.Has(Person_CC, Trip_ID) values();
-- insert into TripPlanner.Museum(MContact, Synopsis, Theme) values();
-- insert into TripPlanner.Person(Sex, PfName, PmName, PlName, Email, CC, PAddress) values();
-- insert into TripPlanner.PoIEvent(RContact, EType) values();
-- insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values();
-- insert into TripPlanner.Restaurant(RContact, Stars, Speciality) values();
-- insert into TripPlanner.Stay(Email, Rating, SName, Contact, SAddress, TrType, City) values();
-- insert into TripPlanner.Store(RContact, SType) values();
-- insert into TripPlanner.Trip(TrType, TrName, Price, Duration, Departure, TrState, Elaborator_CC) values();
-- insert into TripPlanner.TripType(TypeName) values();


insert into TripPlanner.TripType(TypeName) values('Cultural')
insert into TripPlanner.TripType(TypeName) values('Luxo')
insert into TripPlanner.TripType(TypeName) values('Casual')
insert into TripPlanner.TripType(TypeName) values('Low Cost')

insert into TripPlanner.City(CName, Country, Continent) values('Aveiro', 'Portugal', 'Europa');
insert into TripPlanner.City(CName, Country, Continent) values('Paris', 'França', 'Europa');
insert into TripPlanner.City(CName, Country, Continent) values('New York', 'EUA', 'America');

insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values('restauranteEsquina@gmail.com', '4', 'restauranteEsquina', '960594359', '€€', 'Rua Esquina', 3, 'Aveiro');
insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values('restaurantLounge@gmail.com', '5', 'Restaurante Lounge', '960123459', '€€€', 'Rua Alberto', 2, 'Aveiro');
insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values('grelhados@gmail.com', '4', 'grelhados', '960535994', '€', 'Rua grills', 4, 'New York');

insert into TripPlanner.Restaurant(RContact, Stars, Specialty) values('960594359', '0', 'Bacalhau à Brás');
insert into TripPlanner.Restaurant(RContact, Stars, Specialty) values('960123459', '2', 'Risoto à chefe');
insert into TripPlanner.Restaurant(RContact, Stars, Specialty) values('960535994', '0', 'Bacalhau à Brás');

insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values('museusarte@gmail.com', '4', 'artemuseu', '964253132', '€', 'Rua Arte', 1, 'Aveiro');
insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values('louvre@gmail.com', '5', 'Louvre', '969217390', '€€€', 'Rua Louvre', 2, 'Paris');
insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values('museuargu@gmail.com', '4', 'Museu Argus', '960529094', '€', 'Rua Argus', 4, 'Aveiro');

insert into TripPlanner.Museum(MContact, Synopsis, Theme) values('964253132', 'Museu que contem arte produzida na cidade de Aveiro', 'Arte de Aveiro');
insert into TripPlanner.Museum(MContact, Synopsis, Theme) values('969217390', 'Contem uma vasta quantidade de arte a nivel mundial e artefactos de valor incalculavel', 'Historia do Mundo');
insert into TripPlanner.Museum(MContact, Synopsis, Theme) values('960529094', 'Apresenta a historia da cerveja Argus', 'Cerveja Argus');

insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values('lembrançasAverio@gmail.com', '3', 'Loja Lembranças', '960356123', '€€', 'Rua Aveiro', 1, 'Aveiro');
insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values('gucci@gmail.com', '5', 'Loja Gucci', '969875459', '€€€', 'Campos Elisios', 2, 'Paris');
insert into TripPlanner.POInterest(Email, Rating, PoIName, Contact, Price, PoIAddress, TrType, City) values('peixinho@gmail.com', '5', 'Peixinho', '960579894', '€€€', 'Rua Peixinho', 4, 'Aveiro');

insert into TripPlanner.Store(RContact, SType) values('960356123', 'Lembranças');
insert into TripPlanner.Store(RContact, SType) values('969875459', 'Roupas de Luxo');
insert into TripPlanner.Store(RContact, SType) values('960579894', 'Ovos Moles');

-- insert into TripPlanner.Store(RContact, SType) values();
-- insert into TripPlanner.Store(RContact, SType) values();
-- insert into TripPlanner.Store(RContact, SType) values();

insert into TripPlanner.Person(Sex, PfName, PmName, PlName, Email, CC, PAddress) values('M', 'João', 'G.', 'Fernandes', 'joaogilfernandes@gmail.com', '02030402', 'Miami');
insert into TripPlanner.Person(Sex, PfName, PmName, PlName, Email, CC, PAddress) values('M', 'David', 'E.', 'Raposo', 'daividRap@gmail.com', '02318473', 'Lisboa');
insert into TripPlanner.Person(Sex, PfName, PmName, PlName, Email, CC, PAddress) values('F', 'Catarina', 'H.', 'Almeida', 'catAlm@gmail.com', '03494372', 'Paris');

insert into TripPlanner.Stay(Email, Rating, SName, Contact, SAddress, TrType, City) values('aveiroPal@gmail.com', '5', 'Palace', '943584712', 'rua Palace', 2, 'Aveiro');
insert into TripPlanner.Stay(Email, Rating, SName, Contact, SAddress, TrType, City) values('hotelRural@gmail.com', '3', 'Hotel Rural', '942753967', 'rua Cabrita', 4, 'Paris');
insert into TripPlanner.Stay(Email, Rating, SName, Contact, SAddress, TrType, City) values('casaAveiro@gmail.com', '4', 'Casa Aveiro', '924789712', 'rua Afonso', 1, 'Aveiro');



insert into TripPlanner.Trip(TrType, TrName, Price, Duration, Departure_Date, TrState, Elaborator_CC) values(1, 'Trip Aveiro', '500', '4', '2022-06-09', 'Scheduled', '02030402');

insert into TripPlanner.Has(Person_CC, Trip_ID) values('02030402', 1);
insert into TripPlanner.Has(Person_CC, Trip_ID) values('02318473', 1);
insert into TripPlanner.Has(Person_CC, Trip_ID) values('03494372', 1);

insert into TripPlanner.Done_In(City_Name, Trip_ID) values('Aveiro', 1);

insert into TripPlanner.Stays_In(Trip_ID, StayContact, Check_In, Check_Out) values (1, '924789712', '2022-06-09', '2022-06-13');
insert into TripPlanner.Visit(Trip_ID, POIContact) values (1, '964253132');
insert into TripPlanner.Visit(Trip_ID, POIContact) values (1, '960579894');
insert into TripPlanner.Visit(Trip_ID, POIContact) values (1, '960594359');