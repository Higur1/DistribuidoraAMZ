use SistemaGerenciamentoWEB

CREATE TABLE Cliente(
	id int IDENTITY,
	nomeRazaoSocial VARCHAR(max),
	cpfCnpj VARCHAR(max),
	telefone VARCHAR(max),
	email VARCHAR(max),
	inscricaoEstadual VARCHAR(max)

	CONSTRAINT pk_id_cliente PRIMARY KEY(id)
)
CREATE TABLE Endereco(
	id int IDENTITY,
	id_cliente int,
	cep VARCHAR(max),
	cidade VARCHAR(max),
	estado VARCHAR(max),
	logradouro VARCHAR(max),
	numero VARCHAR(max),
	complemento VARCHAR(max),
	
	CONSTRAINT fk_id_cliente_endereco FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
)
CREATE TABLE FORNECEDOR(
	id int IDENTITY,
	razaoSocial VARCHAR(max),
	cnpj VARCHAR(max),
	inscricaoEstadual VARCHAR(max),
	telefone VARCHAR(max),
	CONSTRAINT pk_id_fornecedor PRIMARY KEY(id)
)




CREATE PROC sp_lista_fornecedores
AS
	SELECT * FROM FORNECEDOR

EXEC sp_lista_fornecedores

CREATE PROC sp_lista_clientes
AS
	SELECT c.id, c.nomeRazaoSocial, c.cpfCnpj,c.telefone, c.email, c.inscricaoEstadual,
	 e.cep,  e.estado,e.cidade,e.logradouro, e.numero, e.complemento
	 FROM Cliente c INNER JOIN Endereco e ON c.id = e.id_cliente 

Exec sp_lista_clientes


// 26/05/2022

CREATE TABLE Categoria (
	id int IDENTITY,
	nome VARCHAR(max)
	)

ALTER TABLE CATEGORIA
ADD CONSTRAINT pk_id_categoria PRIMARY KEY(id)


CREATE TABLE Produto (
	id int IDENTITY,
	nome VARCHAR(max),
	descricao VARCHAR(max),
	ncmSh VARCHAR(max),
	preco FLOAT
	)

ALTER TABLE PRODUTO
ADD CONSTRAINT pk_id_produto PRIMARY KEY(id)

CREATE Table categoria_produto(
	id_categoria int,
	id_produto int,
	CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES Categoria(id),
	CONSTRAINT fk_id_produto FOREIGN KEY (id_produto) REFERENCES Produto(id)
	)