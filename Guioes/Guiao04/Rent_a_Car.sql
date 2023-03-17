Use p1g1 -- ir para a nossa base de dados
go

Create schema Rent_a_Car -- organizar base de dados
go

-- posso selecionar as linhas que quero executar
/*
DROP TABLE Rent_a_Car.Cliente
DROP TABLE Rent_a_car.Tipo_de_Veiculo
DROP TABLE Rent_a_car.Balcao
DROP TABLE Rent_a_car.Veiculo
DROP TABLE Rent_a_car.Ligeiro
DROP TABLE Rent_a_car.Pesado
DROP TABLE Rent_a_car.Aluger
*/

CREATE TABLE Rent_a_Car.Cliente(

	NIF INT NOT NULL,	-- meter primarias em cima
	Nome VARCHAR(30) NOT NULL, -- maneira safe de usar chars
	Edereco VARCHAR(20) NOT NULL,
	NUM_CARTA INT NOT NULL, -- port default tem 11 digitos

	PRIMARY KEY(NIF)

); -- port causa do schema

CREATE TABLE Rent_a_Car.Tipo_de_Veiculo(

	Codigo INT NOT NULL,
	Designacao VARCHAR(10) NOT NULL,
	ar_condicionado BIT,
	
	PRIMARY KEY(Codigo)

);

CREATE TABLE Rent_a_Car.Balcao(

	Numero INT NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Endereco VARCHAR(20) NOT NULL,

	PRIMARY KEY(Numero)

);

CREATE TABLE Rent_a_Car.Veiculo(

	Matricula VARCHAR(8) NOT NULL,
	Marca VARCHAR(10) NOT NULL,
	Ano INT NOT NULL,
	Codigo_do_tipo_de_veiculo INT NOT NULL,

	PRIMARY KEY(Matricula),
	FOREIGN KEY(Codigo_do_tipo_de_veiculo) REFERENCES Rent_a_Car.Tipo_de_Veiculo(Codigo)

);

CREATE TABLE Rent_a_Car.Ligeiro(

	Codigo_do_tipo_de_veiculo INT NOT NULL,
	num_lugares INT NOT NULL,
	Portas INT NOT NULL,
	Combustivel VARCHAR(10) NOT NULL,
	
	PRIMARY KEY(Codigo_do_tipo_de_veiculo),
	FOREIGN KEY(Codigo_do_tipo_de_veiculo) REFERENCES Rent_a_Car.Tipo_de_Veiculo(Codigo)
);

CREATE TABLE Rent_a_Car.Pesado(

	Codigo_do_tipo_de_veiculo INT NOT NULL,
	Passageiros INT NOT NULL,
	Peso INT NOT NULL,
	
	PRIMARY KEY(Codigo_do_tipo_de_veiculo),
	FOREIGN KEY(Codigo_do_tipo_de_veiculo) REFERENCES Rent_a_Car.Tipo_de_Veiculo(Codigo)
);

CREATE TABLE Rent_a_Car.Aluger(

	Numero INT NOT NULL,
	Duracao INT NOT NULL,
	Data_aluger VARCHAR(12) NOT NULL,
	NIF_cliente INT NOT NULL,
	matricula_veiculo VARCHAR(8),
	numero_balcao INT NOT NULL,

	PRIMARY KEY(Numero),
	FOREIGN KEY(NIF_cliente) REFERENCES Rent_a_Car.Cliente(NIF),
	FOREIGN KEY(matricula_veiculo) REFERENCES Rent_a_Car.Veiculo(Matricula),
	FOREIGN KEY(numero_balcao) REFERENCES Rent_a_Car.Balcao(Numero)

);