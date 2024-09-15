CREATE TABLE usuario(
	id_usuario SERIAL PRIMARY KEY,
	nome_usuario VARCHAR(255) NOT NULL,
	senha_usuario VARCHAR(255) NOT NULL,
	email_usuario VARCHAR(255) NOT NULL,
	tipo_usuario VARCHAR(255) NOT NULL
);

CREATE TABLE turma(
	id_turma SERIAL PRIMARY KEY,
	nome_turma VARCHAR(255) NOT NULL,
	id_instituicao_fk INT REFERENCES instituicao(id_instituicao)

);

CREATE TABLE usuario_turma(
	id_usuario_fk INT REFERENCES usuario(id_usuario),
	id_turma_fk INT REFERENCES turma(id_turma)
	
);

CREATE TABLE instituicao(
	id_instituicao SERIAL PRIMARY KEY,
	nome_instituicao VARCHAR(255) NOT NULL
	
);

CREATE TABLE jogo(
	id_jogo SERIAL PRIMARY KEY,
	nome_jogo VARCHAR(255) NOT NULL
);

CREATE TABLE usuario_jogo(
	id_usuario_jogo SERIAL PRIMARY KEY,
	id_usuario_fk INT REFERENCES usuario(id_usuario),
	id_jogo_fk INT REFERENCES jogo(id_jogo),
	erro INT,
	tempo TIME,
	ponto INT
	
);

CREATE TABLE jogo_turma(
	id_jogo_fk INT REFERENCES jogo(id_jogo),
	id_turma_fk INT REFERENCES turma(id_turma)
);

CREATE TABLE regra(
	id_regra SERIAL PRIMARY KEY,
	id_jogo_fk INT REFERENCES jogo(id_jogo),
	ponto_fase_1 INT,
	ponto_fase_2 INT,
	ponto_fase_3 INT,
	ponto_fase_4 INT,
	tempo_jogo TIME
	
);

CREATE TABLE alternativa(
	id_alternativa SERIAL PRIMARY KEY,
	id_jogo_fk INT REFERENCES jogo(id_jogo),
	pergunta TEXT NOT NULL,
	alternativa_1 BOOLEAN,
	alternativa_2 BOOLEAN,
	alternativa_3 BOOLEAN,
	alternativa_4 BOOLEAN,
	resposta_certa BOOLEAN,
	dica TEXT
	
);

INSERT INTO public.usuario(
	id_usuario, nome_usuario, senha_usuario, email_usuario, tipo_usuario) VALUES
	(1, 'fulano', 'a', 'fulano@gmail.com', 'adm'),
	(2, 'ciclano', 'b', 'cic@gmail.com', 'estud'),
 	(3, 'beltrano', 'c', 'bel@gmail.com', 'estud');

INSERT INTO public.instituicao(
	id_instituicao, nome_instituicao)
	VALUES (1, 'cesupa'),
	(2, 'unama'),
	(3, 'fibra');

INSERT INTO public.jogo(
	id_jogo, nome_jogo)
	VALUES (1, 'jogo1'),
	(2, 'jogo2'),
	(3, 'jogo3');

INSERT INTO public.turma(
	id_turma, nome_turma, id_instituicao_fk)
	VALUES (1, 'turma1', 1),
	(2, 'turma2', 2),
	(3, 'turma3', 3);
	
INSERT INTO public.jogo_turma(
	id_jogo_fk, id_turma_fk)
	VALUES (1, 1),
	(2, 2),
	(3, 3);

INSERT INTO public.regra(
	id_regra, id_jogo_fk, ponto_fase_1, ponto_fase_2, ponto_fase_3, ponto_fase_4, tempo_jogo)
	VALUES (1, 1, 10, 10, 10, 10, '2024-01-01 10:00'),
	(2, 2, 20, 20, 20, 20, '2024-01-01 15:00'),
	(3, 3, 30, 30, 30, 30, '2024-01-01 20:00');

INSERT INTO public.alternativa(
	id_alternativa, id_jogo_fk, pergunta, alternativa_1, alternativa_2, alternativa_3, alternativa_4, resposta_certa, dica)
	VALUES (1, 1, 'A barata tem 7 saias de filó', true, false, true, false, false, 'é mentira da barata'),
	(2, 2, 'A barata tem 8 saias de filó', true, false, true, false, false, 'é mentira da barata'),
	(3, 3, 'A barata tem 9 saias de filó', true, false, true, false, false, 'é mentira da barata');

INSERT INTO public.usuario_jogo(
	id_usuario_jogo, id_usuario_fk, id_jogo_fk, erro, tempo, ponto)
	VALUES (1, 1, 1, 1, '2024-01-01 10:00', 10),
	(2, 2, 2, 2, '2024-01-01 15:00', 20),
	(3, 3, 3, 3, '2024-01-01 20:00', 30);

INSERT INTO public.usuario_turma(
	id_usuario_fk, id_turma_fk)
	VALUES (1, 1),
	(2, 2),
	(3, 3);

 select * from alternativa
 select * from instituicao
 select * from jogo
 select * from jogo_turma
 select * from regra
 select * from turma
 select * from usuario
 select * from usuario_jogo
 select * from usuario_turma





