

-- o mesmo POI nao pode existir em cidades diferentes
go
create trigger same_POI_diff_city on TripPlanner.POInterest
instead of insert
as
begin
    declare @contact1 as varchar(15);
    declare @city1 as varchar(15);
    declare @contact2 as varchar(15);
    declare @city2 as varchar(15);
    
    select @contact1 = inserted.Contact, @city1 = inserted.City from inserted;

    declare POI cursor
    for 
        select Contact, City
        from TripPlanner.POInterest;
    
    open POI;
    fetch POI into @contact2, @city2;
    while @@fetch_status = 0
    begin
        if(@contact1 == @contact2 and @city1 != @city2)
        begin
            raiserror('ERROR: The same POI in different cities', 16, 1);
            close POI;
            deallocate POI;
            return;
        end
        fetch POI int @contact2, @city2;
    end
    close POI;
    deallocate POI;

    insert into TripPlanner.POInterest select * from inserted;
end


-- uma estadia nao pode exceder as datas da viagem
go 
declare trigger dates_dont_combine on TripPlanner.Stays_In
instead of insert
as
begin
    declare @trip_dep as date;
    declare @trip_duration as int;
    declare @stay_trip as int;
    declare @stay_in as date;
    declare @stay_duration as int;

    select @stay_trip = inserted.Trip_ID, @stay_in = inserted.Check_In, @stay_duration = datediff(day, inserted.Check_In, inserted.Check_Out) from inserted;
    select @trip_dep = Departure_Date, @trip_duration = Duration from TripPlanner.Trip where ID=@stay_trip

    if ((@stay_in != @trip_dep) or (@stay_duration != @trip_duration))
    begin
        raiserror('ERROR: Stay and trip dates missmatch');
        return;
    end

    insert into TripPlanner.Stays_In select * from inserted;
end

-- uma pessoa nao pode estar em duas viagens diferentes
go
declare trigger one_person_two_trips on TripPlanner.Trip
instead of insert
as
begin
    declare @person1 as varchar(8);
    declare @trip1_dep as date;
    declare @trip1_leave as date;
    declare @trip2_dep as date;
    declare @trip2_leave as date;

    select @person1 = inserted.Elaborator_CC, @trip1_dep = inserted.Departure_Date, @trip1_leave = dateadd(day, inserted.Duration, inserted.Departure_Date) from inserted

    declare T cursor
    for 
        select Departure_Date, dateadd(day, Duration, Departure_Date) as leave from TripPlanner.Trip
        where @person1 = Elaborator_CC
    open T;
    fetch T into @trip2_dep, @trip2_leave;
    while @@fetch_status = 0
    begin
        if((@trip2_dep between @trip1_dep and @trip1_leave) or (@trip2_leave between @trip1_dep and @trip1_leave))
        begin
            raiserror('ERROR: Person in overlapping trips', 16, 1);
            close T;
            deallocate T;
            return;
        end
        fetch T into @trip2_dep, @trip2_leave;
    end
    close T;
    deallocate T;

    insert into TripPlanner.Trip select * from inserted;
end

-- o dia de visita de um local tem de estar dentro do intervalo da viagem
go
create trigger POI_visit_within_trip on Visits
instead of insert
as
begin
    declare @trip_begin;
    declare @trip_end;
    declare @trip_id;
    declare @visit_day;

    select @trip_id = inserted.trip_id, @visit_day = inserted.visit_day from inserted;

    select Departure_Date, dateadd(day, Duration, Departure_Date) as end_date from TripPlanner.Trip

    if (@visit_day not between @trip_begin and trip_end)
    begin
        raiserror('ERROR: Visiting outside the trip schedule');
        return;
    end
end~


    select from 

-- apaga uma viagem, tambem apaga as tabelas Stays_in, Done_in, Has, Visit

