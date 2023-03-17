USE p1g1
GO

CREATE SCHEMA Gestao_Stock
GO

/*
DROP TABLE Gestao_Stock.Armazem
DROP TABLE Gestao_Stock.Encomenda
DROP TABLE Gestao_Stock.Produto
DROP TABLE Gestao_Stock.Taxa_Iva
DROP TABLE Gestao_Stock.Contem
DROP TABLE Gestao_Stock.Tipo_de_Fornecedor
DROP TABLE Gestao_Stock.Fornecedor
DROP TABLE Gestao_Stock.Condicoes_de_Pagamento
*/

CREATE TABLE Gestao_Stock.Armazem(

	Codigo INT NOT NULL PRIMARY KEY,
	Nome VARCHAR(20) NOT NULL,
	Localizacao VARCHAR(20) NOT NULL

);

CREATE TABLE Gestao_Stock.Encomenda(

	Numero	INT NOT NULL PRIMARY KEY,
	Data_Encomenda DATETIME NOT NULL

);

CREATE TABLE Gestao_Stock.Produto(

	Codigo INT NOT NULL PRIMARY KEY,
	Nome VARCHAR(20) NOT NULL,
	Preco DECIMAL(10,2) NOT NULL,
	Preco_Quantidade DECIMAL(10,2) NOT NULL,
	Quantidade INT NOT NULL,
	Codigo_Armazem INT NOT NULL FOREIGN KEY REFERENCES Gestao_Stock.Armazem(Codigo)

);

CREATE TABLE Gestao_Stock.Taxa_Iva(

	Valor_Iva INT NOT NULL PRIMARY KEY,
	Codigo_Produto INT NOT NULL UNIQUE FOREIGN KEY REFERENCES Gestao_Stock.Produto(Codigo)

);

CREATE TABLE Gestao_Stock.Contem(

	Codigo_Produto INT NOT NULL FOREIGN KEY REFERENCES Gestao_Stock.Produto(Codigo),
	Num_Encomenda INT NOT NULL FOREIGN KEY REFERENCES Gestao_Stock.Encomenda(Numero),
	Quantidade INT NOT NULL,
	Preco DECIMAL(10,2) NOT NULL

);

CREATE TABLE Gestao_Stock.Tipo_de_Fornecedor(

	Codigo_Interno INT NOT NULL PRIMARY KEY,
	Designacao VARCHAR(20) NOT NULL

);

CREATE TABLE Gestao_Stock.Fornecedor(

	NIF INT NOT NULL PRIMARY KEY,
	Nome VARCHAR(20) NOT NULL,
	Endereco VARCHAR(20) NOT NULL,
	Num_de_Fax INT NOT NULL,
	Codigo_do_Tipo_de_Forncedor INT NOT NULL FOREIGN KEY REFERENCES Gestao_Stock.Tipo_de_Fornecedor(Codigo_Interno)

);

CREATE TABLE Gestao_Stock.Condicoes_Pagamento(

	Condigo_Interno INT NOT NULL,
	NIF_do_Fornecedor INT NOT NULL FOREIGN KEY REFERENCES Gestao_Stock.Fornecedor(NIF)

);