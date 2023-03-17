USE p1g1
go

CREATE SCHEMA Prescricao_Medicamentos
go

/*
DROP TABLE Prescricao_Medicamnetos.Medico
DROP TABLE Prescricao_Medicamnetos.Paciente
DROP TABLE Prescricao_Medicamnetos.Farmacia
DROP TABLE Prescricao_Medicamnetos.Farmaceutica
DROP TABLE Prescricao_Medicamnetos.Precricao
DROP TABLE Prescricao_Medicamnetos.Farmaco
*/

CREATE TABLE Prescricao_Medicamentos.Medico(

	Num_ID INT NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Especialidade VARCHAR(10) NOT NULL,

	PRIMARY KEY(Num_ID)

);

CREATE TABLE Prescricao_Medicamentos.Paciente(

	Num_Utente INT NOT NULL,
	Nome VARCHAR NOT NULL,
	Data_nascimento DATE NOT NULL,
	Endereco VARCHAR(20) NOT NULL,

	PRIMARY KEY(Num_Utente)

);

CREATE TABLE Prescricao_Medicamentos.Farmacia(

	NIF INT NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Endereço VARCHAR(20) NOT NULL,
	Telefone INT NOT NULL,

	PRIMARY KEY(NIF)

);

CREATE TABLE Prescricao_Medicamentos.Farmaceutica(

	Num_reg_Nacional INT NOT NULL,
	Nome VARCHAR(20) NOT NULL,
	Telefone INT NOT NULL,
	Endereco VARCHAR(10) NOT NULL,

	PRIMARY KEY(Num_reg_Nacional)

);

CREATE TABLE Prescricao_Medicamentos.Prescricao(

	Num_Unico INT NOT NULL,
	ID_Medico INT NOT NULL,
	NIF_Farmacia INT NOT NULL,
	Num_Utente_Paciente INT NOT NULL,
	Data_de_prescricao DATE NOT NULL,

	PRIMARY KEY(Num_Unico),
	FOREIGN KEY(ID_Medico) REFERENCES Prescricao_Medicamentos.Medico(Num_ID),
	FOREIGN KEY(NIF_Farmacia) REFERENCES Prescricao_Medicamentos.Farmacia(NIF),
	FOREIGN KEY(Num_Utente_Paciente) REFERENCES Prescricao_Medicamentos.Paciente(Num_Utente)
);

CREATE TABLE Prescricao_Medicamentos.Farmaco(

	Num_Unico INT NOT NULL,
	Num_reg_Nacional INT NOT NULL,
	Formula VARCHAR(30) NOT NULL,
	Nome_Comercial VARCHAR(10) NOT NULL,
	Endereco VARCHAR(10) NOT NULL,

	PRIMARY KEY(Num_Unico),
	FOREIGN KEY(Num_Unico) REFERENCES Prescricao_Medicamentos.Prescricao(Num_Unico),
	FOREIGN KEY(Num_reg_Nacional) REFERENCES Prescricao_Medicamentos.Farmaceutica(Num_reg_Nacional)
);