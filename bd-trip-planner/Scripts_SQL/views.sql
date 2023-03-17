-- ver informação da pessoa
create view TripPlanner.personInfo as
    select p.Sex, p.PfName, p.PmName, p.PlName, p.Email, p.CC, p.PAddress
	from TripPlanner.Person p
go 

insert into TripPlanner.personInfo values ()


create view TripPlanner.Locais as
	select *
	from TripPlanner.POInterest poi
go

-- ver os locais existentes na cidade
create view TripPalnner.LocaisNaCidade as
	select poi.PoIName, s.SName
	from TripPlanner.POInterest poi, TripPlanner.Stay s, TripPlanner.City c
	where poi.Contact = c.PoI_Contact and s.Contact = c.Stay_Contact
	group by c.CName
go
