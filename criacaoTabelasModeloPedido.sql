CREATE TABLE cliente(
	cpf VARCHAR(11) PRIMARY KEY,
	nome_cliente VARCHAR(255) NOT NULL,
	telefone_cliente VARCHAR(11) NOT NULL,
	id_endereco_fk INT REFERENCES endereco(id_endereco)
	
);

CREATE TABLE fornecedor(
	cnpj VARCHAR(14) PRIMARY KEY,
	nome_fornecedor VARCHAR(255) NOT NULL,
	telefone_fornecedor VARCHAR(11) NOT NULL,
	id_endereco_fk INT REFERENCES endereco(id_endereco)

);

CREATE TABLE peca(
	cod_peca SERIAL PRIMARY KEY,
	preco NUMERIC(10, 2) NOT NULL,
	quantidade NUMERIC(10, 2),
	descricao TEXT

);

CREATE TABLE vendedor(
	cod_venda SERIAL PRIMARY KEY,
	nome_vendedor VARCHAR(255) NOT NULL,
	data_admissao DATE,
	id_endereco_fk INT REFERENCES endereco(id_endereco)
	
);

CREATE TABLE pedido(
	nota_fiscal SERIAL PRIMARY KEY,
	data_pedido DATE NOT NULL,
	valor NUMERIC(10, 2)
	
);

CREATE TABLE endereco(
	id_endereco SERIAL PRIMARY KEY,
	nome_endereco VARCHAR(255) NOT NULL,
	cidade VARCHAR(58) NOT NULL,
	cep VARCHAR(8)
	
);