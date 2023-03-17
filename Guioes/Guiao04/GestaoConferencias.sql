USE p1g1
GO
CREATE SCHEMA GestaoConferencias
GO

CREATE TABLE GestaoConferencias.Instituicao(
	Endereco VARCHAR(20) NOT NULL PRIMARY KEY,
	Nome VARCHAR(20) NOT NULL
);
CREATE TABLE GestaoConferencias.Pessoa(
	Email VARCHAR(20) NOT NULL PRIMARY KEY,
	Instituicao VARCHAR(20) NOT NULL UNIQUE FOREIGN KEY REFERENCES GestaoConferencias.Instituicao(Endereco),
	Nome VARCHAR(20) NOT NULL
);

CREATE TABLE GestaoConferencias.Autor(
	Email VARCHAR(20) NOT NULL PRIMARY KEY,
	Nome VARCHAR(20) NOT NULL
);
CREATE TABLE GestaoConferencias.Artigo(
	Num_artigo VARCHAR(20) NOT NULL PRIMARY KEY,
	Email_autor VARCHAR(20) NOT NULL UNIQUE FOREIGN KEY REFERENCES GestaoConferencias.Autor(Email),
	Titulo VARCHAR(20) NOT NULL
);

CREATE TABLE GestaoConferencias.Participante(
	Email VARCHAR(20) NOT NULL PRIMARY KEY,
	Morada VARCHAR(20) NOT NULL,
	Data_inscricao Datetime NOT NULL
);

CREATE TABLE GestaoConferencias.Nao_Estudante(
	Email VARCHAR(20) NOT NULL PRIMARY KEY REFERENCES GestaoConferencias.Participante(Email),
	Ref_transf VARCHAR(20) NOT NULL
);

CREATE TABLE GestaoConferencias.Estudante(
	Email VARCHAR(20) NOT NULL PRIMARY KEY REFERENCES GestaoConferencias.Participante(Email),
	Loc_comprovativo VARCHAR(20) NOT NULL 
);