GO

CREATE PROCEDURE TripPlanner.AddTrip(
	@TrType INT,
	@TrName varchar(15),
	@Price INT,
	@Duration INT,
	@Departure_Date DATE,
	@TrState VARCHAR(10),
	@Elaborator_CC VARCHAR(8))

AS

BEGIN
	SET nocount ON
	BEGIN TRY
		SET IDENTITY_INSERT TripPlanner.Trip OFF
		INSERT INTO TripPlanner.Trip(TrType,TrName,Price,Duration,Departure_Date,TrState,Elaborator_CC)
		VALUES (@TrType,@TrName,@Price,@Duration,@Departure_Date,@TrState,@Elaborator_CC);
		PRINT 'Viagem criada com sucesso!'
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END

Drop Procedure TripPlanner.AddTrip;
--EXEC TripPlanner.AddTrip
	--@TrType = 2,
	--@TrName = 'Viagem a Quintelaaaaa',
	--@Price = 2000,
	--@Duration = 4,
	--@Departure_Date = '2022-06-11',
	--@TrState = 'ON',
	--@Elaborator_CC = '02318473'

GO

--------

GO

CREATE PROCEDURE TripPlanner.AddPerson(
	@Sex char,
	@PfName varchar(15),
	@PmName varchar(15),
	@Plname varchar(15),
	@Email varchar(30),
	@CC varchar(8),
	@PAddress varchar(30))

AS

BEGIN
	BEGIN TRY
		INSERT INTO TripPlanner.Person(Sex,PfName,PmName,PlName,Email,CC,PAddress)
		VALUES (@Sex,@PfName,@PmName,@Plname,@Email,@CC,@PAddress);
		PRINT 'Pessoa adicionada com sucesso!'
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END

--Drop Procedure TripPlanner.AddPerson;
--EXEC TripPlanner.AddPerson
	--@Sex = 'M',
	--@PfName = 'Helder',
	--@PmName = 'N',
	--@Plname = 'Zagalo',
	--@Email = 'helderZ@ua.pt',
	--@CC = '14683698',
	--@PAddress = 'Cascos de rolha'

GO

-----
GO

CREATE PROCEDURE TripPlanner.AddStay(
	@Email varchar(30),
	@Rating int,
	@SName varchar(15),
	@SAddress varchar(30),
	@StayType varchar(30),
	@Contact varchar(15))

AS
	
BEGIN
	BEGIN TRY
		SET IDENTITY_INSERT TripPlanner.TripType OFF
		INSERT INTO TripPlanner.Stay(Email,Rating,Sname,SAddress,StayType,Contact)
		VALUES (@Email,@Rating,@SName,@SAddress,@StayType,@Contact);
		PRINT 'Alojamento criado com sucesso!'
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END

--Drop Procedure TripPlanner.AddStay;
--EXEC TripPlanner.AddStay
	--@Email = 'hotel@gmail.com',
	--@Rating = 4,
	--@SName = 'Hotel Maravilhas',
	--@SAddress = 'Centro de Lisboa',
	--@StayType = 'Cultural',
	--@Contact = '935246235'

GO


-----

GO

CREATE PROCEDURE TripPlanner.AddPOInterest(
	@Email varchar(30),
	@Rating int,
	@PoIName varchar(15),
	@Contact varchar(15),
	@PoIAddress varchar(30),
	@PoIType varchar(30),
	@TrType int)

AS
	
BEGIN
	BEGIN TRY
		SET IDENTITY_INSERT TripPlanner.TripType OFF
		INSERT INTO TripPlanner.POInterest(Email,Rating,PoIName,Contact,PoIAddress,PoIType,TrType)
		VALUES (@Email,@Rating,@PoIName,@Contact,@PoIAddress,@PoIType,@TrType);
		PRINT 'Ponto de Interesse criado com sucesso!'
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END

--Drop Procedure TripPlanner.AddCity;

GO

---------

CREATE PROCEDURE TripPlanner.AddCity(
	@CName varchar(15),
	@Country varchar(15),
	@Continent varchar(15),
	@Stay_Contact varchar(15),
	@PoI_Contact varchar(15))

AS

BEGIN
	BEGIN TRY
		INSERT INTO TripPlanner.City(CName,Country,Continent,Stay_Contact,PoI_Contact)
		VALUES (@CName,@Country,@Continent,@Stay_Contact,@PoI_Contact);
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() AS ErrorNumber
		,ERROR_SEVERITY() AS ErrorSeverity
		,ERROR_STATE() AS ErrorState
		,ERROR_PROCEDURE() AS ErrorProcedure
		,ERROR_LINE() AS ErrorLine
		,ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END

Drop Procedure TripPlanner.AddCity;

GO