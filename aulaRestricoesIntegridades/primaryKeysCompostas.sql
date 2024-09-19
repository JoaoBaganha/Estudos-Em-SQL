CREATE TABLE emp_locs(
	nome_emp VARCHAR,
	localizacao_proj VARCHAR, 
	PRIMARY KEY(nome_emp, localizacao_proj)
);

CREATE TABLE emp_proj1(
	cpf VARCHAR(11),
	numero_proj INT,
	horas INT,
	nome_proj VARCHAR,
	localizacao_proj VARCHAR,
	PRIMARY KEY (cpf, numero_proj)
);

