CREATE TABLE projeto(
	id_projeto SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	orcamento NUMERIC(10, 2) NOT NULL,
	descricao TEXT
);

CREATE TABLE empregado(
	id_empregado SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	cpf VARCHAR(11) NOT NULL UNIQUE,
	cargo VARCHAR(255) NOT NULL
);

CREATE TABLE empregado_projeto(
	id_projeto_fk INT REFERENCES projeto(id_projeto),
	id_empregado_fk INT REFERENCES empregado(id_empregado)
);

