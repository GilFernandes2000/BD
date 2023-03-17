USE p1g1
GO

CREATE SCHEMA ATL
GO

/*
DROP TABLE ATL.Professor
DROP TABLE ATL.Encarregado_de_Educacao
DROP TABLE ATL.Pessoa
DROP TABLE ATL.Truma
DROP TABLE ATL.Aluno
DROP TABLE ATL.Ano_Letivo
DROP TABLE ATL.Entrega
DROP TABLE ATL.Atividade
DROP TABLE ATL.Tem
DROP TABLE ATL.Frequenta
*/

CREATE TABLE ATL.Professor(

	Nome VARCHAR(20) NOT NULL,
	Morada VARCHAR(20) NOT NULL,
	Email VARCHAR(25) NOT NULL,
	Num_Funcionario INT NOT NULL,
	Num_CC INT NOT NULL PRIMARY KEY,
	Data_Nascimento DATE NOT NULL,
	Telefone INT NOT NULL

);

CREATE TABLE ATL.Encarregado_de_Educacao(

	Nome VARCHAR(20) NOT NULL,
	Num_CC INT NOT NULL PRIMARY KEY,
	Morada VARCHAR(20) NOT NULL,
	Data_Nascimento DATE NOT NULL,
	Telefone INT NOT NULL,
	Email VARCHAR(25) NOT NULL

);

CREATE TABLE ATL.Pessoa(

	Nome VARCHAR(20) NOT NULL,
	Num_CC INT NOT NULL PRIMARY KEY,
	Morada VARCHAR(20) NOT NULL,
	Data_Nascimento DATE NOT NULL,
	Telefone INT NOT NULL,
	Email VARCHAR(25) NOT NULL

);

CREATE TABLE ATL.Turma(

	Identificador INT NOT NULL PRIMARY KEY,
	Num_Max_Alunos INT NOT NULL,
	Designacao VARCHAR(20) NOT NULL,
	CC_Professor INT NOT NULL,

	FOREIGN KEY(CC_Professor) REFERENCES ATL.Professor(Num_CC)

);

CREATE TABLE ATL.Aluno(

	Nome VARCHAR(20) NOT NULL,
	Morada VARCHAR(20) NOT NULL,
	Email VARCHAR(25) NOT NULL,
	Num_Enc_Educacao INT NOT NULL,
	Data_Nascimento DATE NOT NULL,
	Telefone INT NOT NULL,
	Num_CC INT NOT NULL PRIMARY KEY,
	ID_Turma INT NOT NULL,

	FOREIGN KEY(Num_Enc_Educacao) REFERENCES ATL.Encarregado_de_Educacao(Num_CC),
	FOREIGN KEY(ID_Turma) REFERENCES ATL.Turma(Identificador)
);

CREATE TABLE ATL.Ano_Letivo(

	Ano INT NOT NULL,
	Identificador_Turma INT NOT NULL,
	
	FOREIGN KEY(Identificador_Turma) REFERENCES ATL.Turma(Identificador)

);

CREATE TABLE ATL.Entrega(

	CC_Pessoa INT NOT NULL,
	CC_Aluno INT NOT NULL,

	FOREIGN KEY(CC_Pessoa) REFERENCES ATL.Pessoa(Num_CC),
	FOREIGN KEY(CC_Aluno) REFERENCES ATL.Aluno(Num_CC)

);

CREATE TABLE ATL.Atividade(

	Identificador INT NOT NULL PRIMARY KEY,
	Custo INT NOT NULL,
	Designacao VARCHAR(20) NOT NULL,

);

CREATE TABLE ATL.Tem(

	ID_Turma INT NOT NULL FOREIGN KEY REFERENCES ATL.Turma(Identificador),
	ID_Atividade INT NOT NULL FOREIGN KEY REFERENCES ATL.Atividade(Identificador)

);

CREATE TABLE ATL.Frequenta(

	ID_Atividade INT NOT NULL FOREIGN KEY REFERENCES ATL.Atividade(Identificador),
	CC_Aluno INT NOT NULL FOREIGN KEY REFERENCES ATL.Aluno(Num_CC)

);