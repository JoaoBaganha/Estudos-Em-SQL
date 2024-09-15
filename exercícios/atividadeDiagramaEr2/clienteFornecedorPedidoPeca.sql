CREATE TABLE cliente(
	cpf VARCHAR(11) PRIMARY KEY,
	nome_cliente VARCHAR(255) NOT NULL,
	telefone_cliente VARCHAR(11) NOT NULL,
	id_endereco_fk INT REFERENCES endereco(id_endereco)
	
);

CREATE TABLE vendedor(
	cod_venda SERIAL PRIMARY KEY,
	nome_vendedor VARCHAR(255) NOT NULL,
	data_admissao DATE,
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

CREATE TABLE pedido(
	nota_fiscal SERIAL PRIMARY KEY,
	data_pedido DATE NOT NULL,
	valor NUMERIC(10, 2),
	cod_venda_fk INT REFERENCES vendedor(cod_venda),
	cpf_fk VARCHAR(11) NOT NULL REFERENCES cliente(cpf) 
);

CREATE TABLE peca_pedido(
	quantidade_pedida NUMERIC(10, 2) NOT NULL,
	cod_peca_fk INT REFERENCES peca(cod_peca),
	nota_fiscal_fk INT REFERENCES pedido(nota_fiscal)
);

CREATE TABLE fornecedor_peca(
	cnpj_fk VARCHAR(14) REFERENCES fornecedor(cnpj),
	cod_peca_fk INT REFERENCES peca (cod_peca)
);

CREATE TABLE endereco(
	id_endereco SERIAL PRIMARY KEY,
	nome_endereco VARCHAR(255) NOT NULL,
	numero_endereco VARCHAR(255) NOT NULL, 
	cidade VARCHAR(58) NOT NULL,
	cep VARCHAR(8)
	
);

INSERT INTO endereco(nome_endereco, numero_endereco, cidade, cep) VALUES
('Rua dos Bobos', '0', 'Fantasia', '11111111'),
('Avenida Brasil', '1000', 'Rio de Janeiro', '20000000'),
('Praça da Sé', '15', 'São Paulo', '01001000'),
('Setor Comercial Sul', '8', 'Brasília', '70303901'),
('Rua XV de Novembro', '891', 'Curitiba', '80020120'),
('Rua dos Andradas', '1234', 'Porto Alegre', '90020000'),
('Avenida Paulista', '1578', 'São Paulo', '01310200'),
('Avenida Atlântica', '420', 'Rio de Janeiro', '22021001'),
('Avenida Contorno', '6061', 'Belo Horizonte', '30110970'),
('Rua Marechal Deodoro', '711', 'Curitiba', '80010230');

INSERT INTO cliente(cpf, nome_cliente, telefone_cliente, id_endereco_fk) VALUES
('12345678901', 'João Silva', '21987654321', 1),
('23456789012', 'Maria Oliveira', '21987654322', 2),
('34567890123', 'Antônio Santos', '21987654323', 3),
('45678901234', 'Francisco Costa', '21987654324', 4),
('56789012345', 'Ana Dias', '21987654325', 5),
('67890123456', 'Luiz Souza', '21987654326', 6),
('78901234567', 'Paula Morais', '21987654327', 7),
('89012345678', 'Pedro Alves', '21987654328', 8),
('90123456789', 'Lucas Pereira', '21987654329', 9),
('01234567890', 'Patrícia Lima', '21987654330', 10);

INSERT INTO vendedor(nome_vendedor, data_admissao, id_endereco_fk) VALUES
('Carlos Machado', '2019-06-15', 1),
('Roberta Medeiros', '2018-07-20', 2),
('Ricardo Gomes', '2020-01-25', 3),
('Sandra Goulart', '2017-12-30', 4),
('Thiago Nogueira', '2021-02-19', 5),
('Fernanda Lima', '2019-11-08', 6),
('Bruno Costa', '2018-05-15', 7),
('Juliana Martins', '2022-03-22', 8),
('Marcelo Soares', '2017-08-29', 9),
('Tatiane Araujo', '2020-10-30', 10);

INSERT INTO fornecedor(cnpj, nome_fornecedor, telefone_fornecedor, id_endereco_fk) VALUES
('11223344000101', 'Fornecedora A', '2133334444', 1),
('22334455000102', 'Fornecedora B', '2133335555', 2),
('33445566000103', 'Fornecedora C', '2133336666', 3),
('44556677000104', 'Fornecedora D', '2133337777', 4),
('55667788000105', 'Fornecedora E', '2133338888', 5),
('66778899000106', 'Fornecedora F', '2133339999', 6),
('77889900010107', 'Fornecedora G', '2133340000', 7),
('88990011010108', 'Fornecedora H', '2133341111', 8),
('99001122010109', 'Fornecedora I', '2133342222', 9),
('00112233020110', 'Fornecedora J', '2133343333', 10);

INSERT INTO peca(preco, quantidade, descricao) VALUES
(100.50, 20, 'Peça X'),
(150.75, 15, 'Peça Y'),
(200.00, 10, 'Peça Z'),
(250.25, 5, 'Peça W'),
(300.40, 8, 'Peça V'),
(350.65, 7, 'Peça U'),
(400.85, 4, 'Peça T'),
(450.95, 6, 'Peça S'),
(500.15, 3, 'Peça R'),
(550.45, 2, 'Peça Q');

INSERT INTO pedido(data_pedido, valor, cod_venda_fk, cpf_fk) VALUES
('2023-09-01', 500.00, 1, '12345678901'),
('2023-09-02', 600.00, 2, '23456789012'),
('2023-09-03', 700.00, 3, '34567890123'),
('2023-09-04', 800.00, 4, '45678901234'),
('2023-09-05', 900.00, 5, '56789012345'),
('2023-09-06', 1000.00, 6, '67890123456'),
('2023-09-07', 1100.00, 7, '78901234567'),
('2023-09-08', 1200.00, 8, '89012345678'),
('2023-09-09', 1300.00, 9, '90123456789'),
('2023-09-10', 1400.00, 10, '01234567890');

INSERT INTO peca_pedido(quantidade_pedida, cod_peca_fk, nota_fiscal_fk) VALUES
(2, 1, 1),
(3, 2, 2),
(1, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

INSERT INTO fornecedor_peca(cnpj_fk, cod_peca_fk) VALUES
('11223344000101', 1),
('22334455000102', 2),
('33445566000103', 3),
('44556677000104', 4),
('55667788000105', 5),
('66778899000106', 6),
('77889900010107', 7),
('88990011010108', 8),
('99001122010109', 9),
('00112233020110', 10);



