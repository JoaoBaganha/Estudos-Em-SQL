CREATE TABLE paciente(
    id_paciente SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    endereco VARCHAR(255),
    historico_clinico TEXT
);

CREATE TABLE setor(
    id_setor SERIAL PRIMARY KEY,
    setor VARCHAR(255)
);

CREATE TABLE funcionario(
    id_funcionario SERIAL PRIMARY KEY,
    perfil VARCHAR(3) CHECK (perfil IN ('adm', 'med', 'enf')),
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    data_nascimento DATE NOT NULL,
    data_contratacao DATE NOT NULL
);

CREATE TABLE medico(
    id_medico SERIAL PRIMARY KEY,
    id_funcionario INT REFERENCES funcionario(id_funcionario),
    crm VARCHAR(5) NOT NULL UNIQUE,
    id_setor INT REFERENCES setor(id_setor),
    especialidade VARCHAR(255) NOT NULL,
    disponibilidade TIME NOT NULL
);

CREATE TABLE enfermeiro(
    id_enfermeiro SERIAL PRIMARY KEY,
    id_funcionario INT REFERENCES funcionario(id_funcionario),
    id_setor INT REFERENCES setor(id_setor),
    disponibilidade TIME
);

CREATE TABLE medicamento(
    id_medicamento SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    quantidade_estoque INT NOT NULL,
    descricao TEXT,
    validade DATE NOT NULL
);

CREATE TABLE consulta(
    id_consulta SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES paciente(id_paciente),
    id_medico INT REFERENCES medico(id_medico),
    data_consulta DATE NOT NULL,
    tempo_consulta TIME NOT NULL
);

CREATE TABLE cirugia(
    id_cirugia SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES paciente(id_paciente),
    id_medico INT REFERENCES medico(id_medico),
    id_medico_auxiliar INT REFERENCES medico(id_medico),
    id_medicamento INT REFERENCES medicamento(id_medicamento),
    data_cirugia DATE NOT NULL,
    tempo_cirugia TIME NOT NULL
);

CREATE TABLE internacao(
    id_internacao SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES paciente(id_paciente),
    id_medico INT REFERENCES medico(id_medico),
    id_enfermeiro INT REFERENCES enfermeiro(id_enfermeiro),
    id_setor INT REFERENCES setor(id_setor),
    inicio_internacao DATE NOT NULL,
    fim_internacao DATE NOT NULL,
    tempo_internacao TIME NOT NULL
);

CREATE TABLE plantao(
    id_plantao SERIAL PRIMARY KEY,
    id_medico INT REFERENCES medico(id_medico),
    id_enfermeiro INT REFERENCES enfermeiro(id_enfermeiro),
    id_setor INT REFERENCES setor(id_setor),
    data_plantao DATE NOT NULL,
    tempo_plantao TIME NOT NULL
);

CREATE TABLE financeiro(
    id_financeiro SERIAL PRIMARY KEY,
    atendimento VARCHAR(10) CHECK (atendimento IN ('consulta', 'cirugia')),
    preco NUMERIC(10,2),
    despesa_operacional NUMERIC(10,2)
);

CREATE TABLE usuario(
    id_usuario SERIAL PRIMARY KEY,
    id_funcionario INT REFERENCES funcionario(id_funcionario),
    login VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    nivel_permissao VARCHAR(5) CHECK (nivel_permissao in ('geral', 'admin'))
);

CREATE TABLE administrador(
    id_administrador SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE
);

-- Inserts for 'setor'
INSERT INTO setor (setor)
VALUES
('Cardiologia'), ('Neurologia'), ('Ortopedia'), ('Pediatria'), ('Urologia'),
('Ginecologia'), ('Dermatologia'), ('Oncologia'), ('Oftalmologia'), ('Psiquiatria'),
('Otorrinolaringologia'), ('Pneumologia'), ('Gastroenterologia'), ('Endocrinologia'), ('Nefrologia'),
('Hematologia'), ('Infectologia'), ('Reumatologia'), ('Alergologia'), ('Cirurgia Geral');

-- Inserts for 'funcionario'
INSERT INTO funcionario (perfil, nome, cpf, data_nascimento, data_contratacao)
VALUES
('adm', 'Alice Souza', '11122233344', '1980-05-10', '2010-03-15'),
('med', 'Dr. Pedro Borges', '22233344455', '1975-09-15', '2005-06-22'),
('med', 'Dr. Carla Fernandes', '33344455566', '1982-12-30', '2012-01-11'),
('enf', 'Enf. Bruno Alves', '44455566677', '1990-08-08', '2016-09-05'),
('enf', 'Enf. Maria Dias', '55566677788', '1987-03-14', '2013-11-20'),
('adm', 'Lucas Pires', '66677788899', '1985-07-23', '2011-07-18'),
('med', 'Dr. Renato Cruz', '77788899900', '1978-04-02', '2008-05-29'),
('med', 'Dra. Ana Moura', '88899900011', '1983-11-21', '2014-02-17'),
('enf', 'Enf. Rafael Nogueira', '99900011122', '1992-02-15', '2017-03-27'),
('adm', 'Joana Santos', '00011122233', '1989-12-09', '2015-08-01'),
('enf', 'Enf. Mariana Barros', '11122233301', '1995-10-14', '2018-10-19'),
('med', 'Dr. Gustavo Lima', '22233344402', '1974-01-28', '2003-09-17'),
('med', 'Dra. Fernanda Silva', '33344455503', '1981-06-16', '2010-11-25'),
('enf', 'Enf. Vitor Correia', '44455566604', '1988-05-05', '2016-04-15'),
('adm', 'Carlos Martins', '55566677705', '1985-08-18', '2012-05-22'),
('med', 'Dr. Fábio Albuquerque', '66677788806', '1979-02-24', '2007-10-10'),
('med', 'Dra. Beatriz Lira', '77788899907', '1986-09-12', '2015-07-03'),
('enf', 'Enf. Daniela Gomes', '88899900008', '1993-04-27', '2019-02-04'),
('adm', 'Felipe Teixeira', '99900011109', '1982-11-04', '2013-12-18'),
('med', 'Dr. Leonardo Azevedo', '00011122210', '1977-07-07', '2009-03-08');

-- Inserts for 'medico'
INSERT INTO medico (id_funcionario, crm, id_setor, especialidade, disponibilidade)
VALUES
(2, 'CRM01', 1, 'Cardiologia', '09:00:00'),
(3, 'CRM02', 2, 'Neurologia', '10:00:00'),
(7, 'CRM03', 3, 'Ortopedia', '11:00:00'),
(8, 'CRM04', 4, 'Pediatria', '08:00:00'),
(12, 'CRM05', 5, 'Urologia', '12:00:00'),
(13, 'CRM06', 6, 'Ginecologia', '09:30:00'),
(16, 'CRM07', 7, 'Dermatologia', '13:00:00'),
(17, 'CRM08', 8, 'Oncologia', '14:30:00'),
(20, 'CRM09', 9, 'Oftalmologia', '15:00:00'),
(2, 'CRM10', 10, 'Psiquiatria', '09:00:00'),
(3, 'CRM11', 11, 'Otorrinolaringologia', '10:30:00'),
(7, 'CRM12', 12, 'Pneumologia', '13:15:00'),
(8, 'CRM13', 13, 'Gastroenterologia', '11:45:00'),
(12, 'CRM14', 14, 'Endocrinologia', '16:00:00'),
(13, 'CRM15', 15, 'Nefrologia', '17:30:00'),
(16, 'CRM16', 16, 'Hematologia', '07:45:00'),
(17, 'CRM17', 17, 'Infectologia', '08:30:00'),
(20, 'CRM18', 18, 'Reumatologia', '14:00:00'),
(2, 'CRM19', 19, 'Alergologia', '09:00:00'),
(3, 'CRM20', 20, 'Cirurgia Geral', '12:30:00');

-- Inserts for 'paciente' (adicionados para corrigir a falta de dados referenciados)
INSERT INTO paciente (nome, data_nascimento, cpf, endereco, historico_clinico)
VALUES
('Ana Silva', '1985-02-14', '12345678901', 'Rua A, 123', 'Hipertensão'),
('João Pereira', '1990-06-30', '23456789012', 'Rua B, 456', 'Diabetes'),
('Maria Costa', '1978-08-20', '34567890123', 'Rua C, 789', 'Asma'),
('Carlos Oliveira', '1982-12-25', '45678901234', 'Rua D, 101', 'Obesidade'),
('Paula Santos', '1995-09-10', '56789012345', 'Rua E, 202', 'Hipertensão'),
('Rafael Sousa', '2000-01-15', '67890123456', 'Rua F, 303', 'Nenhum'),
('Juliana Lima', '1989-11-22', '78901234567', 'Rua G, 404', 'Diabetes'),
('Bruno Mendes', '1993-03-18', '89012345678', 'Rua H, 505', 'Hipotireoidismo'),
('Larissa Rocha', '1987-07-09', '90123456789', 'Rua I, 606', 'Alergia a medicamentos'),
('Gabriel Farias', '1999-04-29', '01234567890', 'Rua J, 707', 'Nenhum'),
('Mariana Almeida', '1983-05-17', '12312312312', 'Rua K, 808', 'Colesterol alto'),
('Lucas Nunes', '1996-12-11', '23423423423', 'Rua L, 909', 'Alergia a pólen'),
('Bianca Barros', '1977-10-05', '34534534534', 'Rua M, 111', 'Bronquite'),
('Felipe Neves', '1980-02-02', '45645645645', 'Rua N, 222', 'Nenhum'),
('Isabela Cunha', '1988-06-25', '56756756756', 'Rua O, 333', 'Hipertensão'),
('Thiago Ribeiro', '1992-08-13', '67867867867', 'Rua P, 444', 'Nenhum'),
('Camila Pinto', '1984-09-29', '78978978978', 'Rua Q, 555', 'Diabetes'),
('Rodrigo Araújo', '1979-03-20', '89089089089', 'Rua R, 666', 'Colesterol alto'),
('Letícia Moreira', '1998-01-07', '90190190190', 'Rua S, 777', 'Asma'),
('André Ferreira', '1997-11-18', '01201201201', 'Rua T, 888', 'Nenhum');

-- Inserts for 'consulta' (corrigidos para garantir que os pacientes existam)
INSERT INTO consulta (id_paciente, id_medico, data_consulta, tempo_consulta)
VALUES
(1, 1, '2024-10-01', '10:00:00'),
(2, 2, '2024-10-01', '11:00:00'),
(3, 3, '2024-10-01', '12:00:00'),
(4, 4, '2024-10-02', '09:30:00'),
(5, 5, '2024-10-02', '10:45:00'),
(6, 6, '2024-10-02', '11:30:00'),
(7, 7, '2024-10-02', '14:00:00'),
(8, 8, '2024-10-03', '15:00:00'),
(9, 9, '2024-10-03', '16:30:00'),
(10, 10, '2024-10-03', '17:15:00'),
(11, 11, '2024-10-03', '08:00:00'),
(12, 12, '2024-10-04', '09:15:00'),
(13, 13, '2024-10-04', '10:30:00'),
(14, 14, '2024-10-04', '11:45:00'),
(15, 15, '2024-10-04', '13:00:00'),
(16, 16, '2024-10-05', '14:15:00'),
(17, 17, '2024-10-05', '15:30:00'),
(18, 18, '2024-10-05', '16:45:00'),
(19, 19, '2024-10-05', '17:30:00'),
(20, 20, '2024-10-06', '08:45:00');

-- Inserts for 'cirugia'
INSERT INTO cirugia (id_paciente, id_medico, id_medico_auxiliar, id_medicamento, data_cirugia, tempo_cirugia)
VALUES
(1, 1, 2, 1, '2024-10-07', '09:00:00'),
(2, 3, 4, 2, '2024-10-08', '10:30:00'),
(3, 5, 6, 3, '2024-10-09', '12:00:00'),
(4, 7, 8, 4, '2024-10-10', '14:00:00'),
(5, 9, 10, 5, '2024-10-11', '08:30:00'),
(6, 11, 12, 6, '2024-10-12', '09:45:00'),
(7, 13, 14, 7, '2024-10-13', '11:15:00'),
(8, 15, 16, 8, '2024-10-14', '13:30:00'),
(9, 17, 18, 9, '2024-10-15', '15:00:00'),
(10, 19, 20, 10, '2024-10-16', '09:00:00'),
(11, 2, 3, 11, '2024-10-17', '10:15:00'),
(12, 4, 5, 12, '2024-10-18', '11:30:00'),
(13, 6, 7, 13, '2024-10-19', '13:45:00'),
(14, 8, 9, 14, '2024-10-20', '15:15:00'),
(15, 10, 11, 15, '2024-10-21', '08:30:00'),
(16, 12, 13, 16, '2024-10-22', '09:45:00'),
(17, 14, 15, 17, '2024-10-23', '11:00:00'),
(18, 16, 17, 18, '2024-10-24', '12:15:00'),
(19, 18, 19, 19, '2024-10-25', '13:30:00'),
(20, 20, 1, 20, '2024-10-26', '15:00:00');

-- Inserts for 'internacao'
INSERT INTO internacao (id_paciente, id_medico, id_enfermeiro, id_setor, inicio_internacao, fim_internacao, tempo_internacao)
VALUES
(1, 1, 4, 1, '2024-10-01', '2024-10-03', '12:00:00'),
(2, 2, 5, 2, '2024-10-04', '2024-10-06', '18:00:00'),
(3, 3, 9, 3, '2024-10-07', '2024-10-10', '16:00:00'),
(4, 4, 11, 4, '2024-10-11', '2024-10-12', '14:00:00'),
(5, 5, 14, 5, '2024-10-13', '2024-10-15', '18:00:00'),
(6, 6, 4, 6, '2024-10-16', '2024-10-19', '12:00:00'),
(7, 7, 5, 7, '2024-10-20', '2024-10-23', '12:00:00'),
(8, 8, 9, 8, '2024-10-24', '2024-10-26', '18:00:00'),
(9, 9, 11, 9, '2024-10-27', '2024-10-29', '18:00:00'),
(10, 10, 14, 10, '2024-10-30', '2024-11-01', '18:00:00'),
(11, 11, 4, 11, '2024-11-02', '2024-11-04', '18:00:00'),
(12, 12, 5, 12, '2024-11-05', '2024-11-07', '18:00:00'),
(13, 13, 9, 13, '2024-11-08', '2024-11-10', '18:00:00'),
(14, 14, 11, 14, '2024-11-11', '2024-11-13', '18:00:00'),
(15, 15, 14, 15, '2024-11-14', '2024-11-16', '18:00:00'),
(16, 16, 4, 16, '2024-11-17', '2024-11-19', '18:00:00'),
(17, 17, 5, 17, '2024-11-20', '2024-11-22', '18:00:00'),
(18, 18, 9, 18, '2024-11-23', '2024-11-25', '18:00:00'),
(19, 19, 11, 19, '2024-11-26', '2024-11-28', '18:00:00'),
(20, 20, 14, 20, '2024-11-29', '2024-12-01', '18:00:00');

-- Inserts for 'plantao'
INSERT INTO plantao (id_medico, id_enfermeiro, id_setor, data_plantao, tempo_plantao)
VALUES
(1, 4, 1, '2024-10-01', '12:00:00'),
(2, 5, 2, '2024-10-02', '12:00:00'),
(3, 9, 3, '2024-10-03', '12:00:00'),
(4, 11, 4, '2024-10-04', '12:00:00'),
(5, 14, 5, '2024-10-05', '12:00:00'),
(6, 4, 6, '2024-10-06', '12:00:00'),
(7, 5, 7, '2024-10-07', '12:00:00'),
(8, 9, 8, '2024-10-08', '12:00:00'),
(9, 11, 9, '2024-10-09', '12:00:00'),
(10, 14, 10, '2024-10-10', '12:00:00'),
(11, 4, 11, '2024-10-11', '12:00:00'),
(12, 5, 12, '2024-10-12', '12:00:00'),
(13, 9, 13, '2024-10-13', '12:00:00'),
(14, 11, 14, '2024-10-14', '12:00:00'),
(15, 14, 15, '2024-10-15', '12:00:00'),
(16, 4, 16, '2024-10-16', '12:00:00'),
(17, 5, 17, '2024-10-17', '12:00:00'),
(18, 9, 18, '2024-10-18', '12:00:00'),
(19, 11, 19, '2024-10-19', '12:00:00'),
(20, 14, 20, '2024-10-20', '12:00:00');

-- Inserts for 'financeiro'
INSERT INTO financeiro (atendimento, preco, despesa_operacional)
VALUES
('consulta', 100.00, 30.00),
('cirugia', 5000.00, 1500.00),
('consulta', 120.00, 40.00),
('cirugia', 4500.00, 1300.00),
('consulta', 80.00, 20.00),
('consulta', 110.00, 35.00),
('consulta', 90.00, 25.00),
('consulta', 95.00, 28.00),
('cirugia', 5500.00, 1800.00),
('consulta', 105.00, 33.00),
('consulta', 115.00, 38.00),
('consulta', 75.00, 18.00),
('cirugia', 4000.00, 1200.00),
('consulta', 85.00, 22.00),
('consulta', 125.00, 45.00),
('consulta', 115.00, 39.00),
('consulta', 70.00, 17.00),
('cirugia', 6000.00, 2000.00),
('consulta', 130.00, 50.00),
('consulta', 100.00, 30.00);

-- Inserts for 'usuario'
INSERT INTO usuario (id_funcionario, login, senha, nivel_permissao)
VALUES
(1, 'alice.souza', 'senha123', 'admin'),
(2, 'pedro.borges', 'senha123', 'geral'),
(3, 'carla.fernandes', 'senha123', 'geral'),
(4, 'bruno.alves', 'senha123', 'geral'),
(5, 'maria.dias', 'senha123', 'geral'),
(6, 'lucas.pires', 'senha123', 'admin'),
(7, 'renato.cruz', 'senha123', 'geral'),
(8, 'ana.moura', 'senha123', 'geral'),
(9, 'rafael.nogueira', 'senha123', 'geral'),
(10, 'joana.santos', 'senha123', 'admin'),
(11, 'mariana.barros', 'senha123', 'geral'),
(12, 'gustavo.lima', 'senha123', 'geral'),
(13, 'fernanda.silva', 'senha123', 'geral'),
(14, 'vitor.correia', 'senha123', 'geral'),
(15, 'carlos.martins', 'senha123', 'admin'),
(16, 'fabio.albuquerque', 'senha123', 'geral'),
(17, 'beatriz.lira', 'senha123', 'geral'),
(18, 'daniela.gomes', 'senha123', 'geral'),
(19, 'felipe.teixeira', 'senha123', 'admin'),
(20, 'leonardo.azevedo', 'senha123', 'geral');

-- Inserts for 'administrador'
INSERT INTO administrador (nome, cpf)
VALUES
('Carlos Administrador', '11111111111'),
('Ana Administradora', '22222222222'),
('João Administrador', '33333333333'),
('Fernanda Administradora', '44444444444'),
('Paulo Administrador', '55555555555'),
('Luciana Administradora', '66666666666'),
('Ricardo Administrador', '77777777777'),
('Mariana Administradora', '88888888888'),
('Gabriel Administrador', '99999999999'),
('Juliana Administradora', '00000000000'),
('Felipe Administrador', '11122233344'),
('Letícia Administradora', '22233344455'),
('Bruno Administrador', '33344455566'),
('Natália Administradora', '44455566677'),
('Gustavo Administrador', '55566677788'),
('Bianca Administradora', '66677788899'),
('Renato Administrador', '77788899900'),
('Camila Administradora', '88899900011'),
('Thiago Administrador', '99900011122'),
('Vanessa Administradora', '00011122233');
