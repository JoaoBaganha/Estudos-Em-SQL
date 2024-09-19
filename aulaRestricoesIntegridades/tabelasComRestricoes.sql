CREATE TABLE Clientes (
	id_clientes SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL UNIQUE,
	telefone VARCHAR(20),
	endereco VARCHAR(255)
);

CREATE TABLE Produtos(
	id_produtos SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	preco_venda NUMERIC(10, 2) NOT NULL CHECK (preco_venda > 0),
	quantidade_estoque INTEGER NOT NULL
);

CREATE TABLE Funcionarios (
	id_funcionarios SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cargo VARCHAR(100),
	salario NUMERIC(10, 2),
	data_admissao DATE,
	departamento VARCHAR(255)
);