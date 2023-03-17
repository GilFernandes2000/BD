
-- estadias em aveiro
select s.Sname, s.Contact, tp.TypeName
from TripPlanner.City c, TripPlanner.Stay s, TripPlanner.TripType tp
where c.CName = s.City and s.TrType = tp.ID and c.CName = 'Aveiro'

-- pessoas na viagem 1
select p.PfName, p.PlName
from TripPlanner.Person p, TripPlanner.Trip t, TripPlanner.Has h
where t.ID = h.Trip_ID and h.Person_CC = p.CC and t.ID = 1

-- POIs em aveiro 
select p.PoIName, p.Contact, p.Rating, p.Price, tp.TypeName
from TripPlanner.City c, TripPlanner.POInterest p, TripPlanner.TripType tp
where c.CName = p.City and p.TrType = tp.ID and c.CName = 'Aveiro'

-- POIs
select *
from TripPlanner.Museum

--Locais para visitar na viagem
select t.TrName, p.PoIName, p.PoIAddress
from TripPlanner.Trip t, TripPlanner.Visit v, TripPlanner.POInterest p 
where t.ID = v.Trip_ID and v.POIContact = p.Contact