CREATE TABLE setor(
    id SERIAL PRIMARY KEY,
    setor VARCHAR(255)
);

CREATE TABLE paciente(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    endereco VARCHAR(255),
    historico_clinico TEXT
);

CREATE TABLE medico(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    crm VARCHAR(5) NOT NULL UNIQUE,
    id_setor INT REFERENCES setor(id),
    especialidade VARCHAR(255) NOT NULL,
    disponibilidade TIME NOT NULL
);

CREATE TABLE enfermeiro(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE, 
    id_setor INT REFERENCES setor(id),
    disponibilidade TIME
);

CREATE TABLE medicamento(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL UNIQUE,
    quantidade_estoque INT NOT NULL,
    descricao TEXT,
    validade DATE NOT NULL
);

CREATE TABLE consulta(
    id SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES paciente(id),
    id_medico INT REFERENCES medico(id),
    data_consulta DATE NOT NULL,
    tempo_consulta TIME NOT NULL
);

CREATE TABLE cirugia(
    id SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES paciente(id),
    id_medico INT REFERENCES medico(id),
    id_medico_auxiliar INT REFERENCES medico(id),
    id_medicamento INT REFERENCES medicamento(id),
    data_cirugia DATE NOT NULL,
    tempo_cirugia TIME NOT NULL
);

CREATE TABLE internacao(
    id SERIAL PRIMARY KEY,
    id_paciente INT REFERENCES paciente(id),
    id_medico INT REFERENCES medico(id),
    id_enfermeiro INT REFERENCES enfermeiro(id),
    id_setor INT REFERENCES setor(id),
    inicio_internacao DATE NOT NULL,
    fim_internacao DATE NOT NULL,
    tempo_internacao TIME NOT NULL
);

CREATE TABLE plantao(
    id SERIAL PRIMARY KEY,
    id_medico INT REFERENCES medico(id),
    id_enfermeiro INT REFERENCES enfermeiro(id),
    id_setor INT REFERENCES setor(id),
    data_plantao DATE NOT NULL,
    tempo_plantao TIME NOT NULL
);

CREATE TABLE financeiro(
    id SERIAL PRIMARY KEY,
    id_consulta INT REFERENCES consulta(id),
    preco NUMERIC(5,2),
    despesa_operacional NUMERIC(5,2)
);

CREATE TABLE administrador(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(255) NOT NULL
);

CREATE TABLE funcionario(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    id_setor INT REFERENCES setor(id),
    funcao VARCHAR(255),
    horario TIME
);

CREATE TABLE usuario(
    id SERIAL PRIMARY KEY,
    login VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    perfil VARCHAR(50) NOT NULL,
    nivel_permissao INT NOT NULL
);

--OS INSERTS FORAM GERADOS COM INTELIGÊNCIA ARTIFICIAL
-- Inserts para a tabela 'setor'
INSERT INTO setor (setor) VALUES 
('Emergência'),
('UTI'),
('Cardiologia'),
('Neurologia'),
('Pediatria'),
('Ginecologia'),
('Ortopedia'),
('Oncologia'),
('Radiologia'),
('Dermatologia'),
('Psiquiatria'),
('Oftalmologia'),
('Odontologia'),
('Fisioterapia'),
('Reumatologia'),
('Geriatria'),
('Nefrologia'),
('Hematologia'),
('Infectologia'),
('Endocrinologia');

-- Inserts para a tabela 'paciente'
INSERT INTO paciente (nome, data_nascimento, cpf, endereco, historico_clinico) VALUES
('Carlos Silva', '1980-01-15', '12345678901', 'Rua A, 123', 'Histórico: hipertensão'),
('Maria Oliveira', '1975-06-23', '98765432101', 'Rua B, 456', 'Histórico: diabetes tipo 2'),
('João Santos', '1992-03-10', '45678912302', 'Rua C, 789', 'Histórico: asmático'),
('Ana Costa', '1985-11-30', '32165498703', 'Rua D, 101', 'Histórico: anemia'),
('Paulo Souza', '1960-08-05', '65412378904', 'Rua E, 202', 'Histórico: colesterol alto'),
('Rita Dias', '1995-09-12', '78932165405', 'Rua F, 303', 'Histórico: saudável'),
('Bruno Pereira', '2000-02-25', '23456789012', 'Rua G, 404', 'Histórico: alergias'),
('Marina Santos', '1988-12-14', '87654321012', 'Rua H, 505', 'Histórico: gastrite'),
('Felipe Mendes', '1991-04-17', '67890543210', 'Rua I, 606', 'Histórico: saudável'),
('Tatiana Lima', '1982-07-19', '54321678908', 'Rua J, 707', 'Histórico: hipertireoidismo'),
('Rodrigo Gonçalves', '1993-01-20', '12309845678', 'Rua K, 808', 'Histórico: rinite'),
('Larissa Rocha', '1989-05-28', '45678901234', 'Rua L, 909', 'Histórico: saudável'),
('Eduardo Farias', '1970-10-15', '90876543219', 'Rua M, 1010', 'Histórico: problemas cardíacos'),
('Fernanda Queiroz', '1998-03-02', '67812345609', 'Rua N, 1111', 'Histórico: anemia'),
('Gabriel Martins', '1996-09-30', '54321098765', 'Rua O, 1212', 'Histórico: sinusite'),
('Carla Almeida', '1983-02-18', '32198765432', 'Rua P, 1313', 'Histórico: saudável'),
('Thiago Borges', '1977-11-25', '45678934521', 'Rua Q, 1414', 'Histórico: hipertensão'),
('Aline Barros', '1994-06-22', '23498765432', 'Rua R, 1515', 'Histórico: asma'),
('Leonardo Teixeira', '1999-07-14', '65432109876', 'Rua S, 1616', 'Histórico: saudável'),
('Patrícia Silva', '1986-12-11', '78901234567', 'Rua T, 1717', 'Histórico: hipotireoidismo');

-- Inserts para a tabela 'medico'
INSERT INTO medico (nome, crm, id_setor, especialidade, disponibilidade) VALUES
('Dr. Marcos Almeida', '12345', 1, 'Emergencial', '08:00'),
('Dr. Luciana Ribeiro', '23456', 2, 'UTI', '09:00'),
('Dr. Carlos Melo', '34567', 3, 'Cardiologia', '10:00'),
('Dr. Pedro Ramos', '45678', 4, 'Neurologia', '11:00'),
('Dra. Amanda Lopes', '56789', 5, 'Pediatria', '12:00'),
('Dra. Fernanda Dias', '67890', 6, 'Ginecologia', '13:00'),
('Dr. João Azevedo', '78901', 7, 'Ortopedia', '14:00'),
('Dr. Bruno Moreira', '89012', 8, 'Oncologia', '15:00'),
('Dra. Camila Costa', '90123', 9, 'Radiologia', '16:00'),
('Dra. Renata Fonseca', '01234', 10, 'Dermatologia', '17:00'),
('Dr. Lucas Vieira', '11223', 11, 'Psiquiatria', '08:00'),
('Dr. Paulo Tavares', '22334', 12, 'Oftalmologia', '09:00'),
('Dr. Matheus Ferreira', '33445', 13, 'Odontologia', '10:00'),
('Dra. Rafaela Silva', '44556', 14, 'Fisioterapia', '11:00'),
('Dra. Gabriela Souza', '55667', 15, 'Reumatologia', '12:00'),
('Dr. Leandro Mendes', '66778', 16, 'Geriatria', '13:00'),
('Dra. Tatiana Moura', '77889', 17, 'Nefrologia', '14:00'),
('Dr. Rafael Lima', '88990', 18, 'Hematologia', '15:00'),
('Dra. Mariana Rocha', '99001', 19, 'Infectologia', '16:00'),
('Dra. Juliana Santos', '10011', 20, 'Endocrinologia', '17:00');

-- Inserts para a tabela 'enfermeiro'
INSERT INTO enfermeiro (nome, cpf, id_setor, disponibilidade) VALUES
('Carlos Souza', '11111111111', 1, '08:00'),
('Ana Bezerra', '22222222222', 2, '09:00'),
('Bruno Alves', '33333333333', 3, '10:00'),
('Juliana Castro', '44444444444', 4, '11:00'),
('Felipe Duarte', '55555555555', 5, '12:00'),
('Renata Nascimento', '66666666666', 6, '13:00'),
('Thiago Ribeiro', '77777777777', 7, '14:00'),
('Marina Cardoso', '88888888888', 8, '15:00'),
('André Soares', '99999999999', 9, '16:00'),
('Isabela Gonçalves', '12345678910', 10, '17:00'),
('Fernando Martins', '10987654321', 11, '08:00'),
('Luciana Moraes', '11223344556', 12, '09:00'),
('Gustavo Oliveira', '22334455667', 13, '10:00'),
('Daniela Pinto', '33445566778', 14, '11:00'),
('Diego Barros', '44556677889', 15, '12:00'),
('Amanda Costa', '55667788990', 16, '13:00'),
('João Victor', '66778899001', 17, '14:00'),
('Beatriz Borges', '77889900112', 18, '15:00'),
('Victor Lopes', '88990011223', 19, '16:00'),
('Fernanda Ferreira', '99001122334', 20, '17:00');

-- Inserts para a tabela 'medicamento'
INSERT INTO medicamento (nome, quantidade_estoque, descricao, validade) VALUES
('Paracetamol', 100, 'Analgésico e antitérmico', '2025-01-01'),
('Amoxicilina', 200, 'Antibiótico para infecções bacterianas', '2024-11-01'),
('Dipirona', 150, 'Analgésico e antitérmico', '2025-03-01'),
('Ibuprofeno', 300, 'Anti-inflamatório e analgésico', '2024-12-01'),
('Omeprazol', 80, 'Inibidor de ácido gástrico', '2025-05-01'),
('Diclofenaco', 60, 'Anti-inflamatório e analgésico', '2024-10-15'),
('Loratadina', 120, 'Antialérgico', '2025-06-01'),
('Metformina', 180, 'Antidiabético oral', '2024-09-01'),
('Salbutamol', 90, 'Broncodilatador', '2025-04-01'),
('Prednisona', 70, 'Corticosteroide', '2024-08-01'),
('Losartana', 110, 'Antihipertensivo', '2025-07-01'),
('Aspirina', 140, 'Analgésico e anti-inflamatório', '2025-02-01'),
('Captopril', 130, 'Antihipertensivo', '2024-12-15'),
('Clonazepam', 50, 'Ansiolítico', '2025-08-01'),
('Cetirizina', 160, 'Antialérgico', '2024-11-15'),
('Gliclazida', 30, 'Antidiabético oral', '2025-03-15'),
('Furosemida', 100, 'Diurético', '2025-06-15'),
('Levotiroxina', 200, 'Hormônio tireoidiano', '2024-10-01'),
('Fluconazol', 90, 'Antifúngico', '2025-05-15'),
('Amitriptilina', 60, 'Antidepressivo', '2025-01-15');

-- Inserts para a tabela 'consulta'
INSERT INTO consulta (id_paciente, id_medico, data_consulta, tempo_consulta) VALUES
(1, 3, '2024-10-01', '10:00'),
(2, 5, '2024-10-01', '11:00'),
(3, 4, '2024-10-02', '09:30'),
(4, 2, '2024-10-02', '10:15'),
(5, 1, '2024-10-03', '14:00'),
(6, 7, '2024-10-04', '15:00'),
(7, 6, '2024-10-04', '16:30'),
(8, 8, '2024-10-05', '08:00'),
(9, 9, '2024-10-05', '09:00'),
(10, 10, '2024-10-06', '13:00'),
(11, 12, '2024-10-07', '10:00'),
(12, 14, '2024-10-07', '11:00'),
(13, 11, '2024-10-08', '12:00'),
(14, 13, '2024-10-09', '14:30'),
(15, 15, '2024-10-09', '15:45'),
(16, 16, '2024-10-10', '08:00'),
(17, 17, '2024-10-10', '09:30'),
(18, 18, '2024-10-11', '10:45'),
(19, 19, '2024-10-12', '11:15'),
(20, 20, '2024-10-13', '13:45');

-- Inserts para a tabela 'cirugia'
INSERT INTO cirugia (id_paciente, id_medico, id_medico_auxiliar, id_medicamento, data_cirugia, tempo_cirugia) VALUES
(1, 3, 4, 1, '2024-10-14', '09:00'),
(2, 5, 6, 2, '2024-10-14', '13:00'),
(3, 7, 8, 3, '2024-10-15', '08:30'),
(4, 2, 3, 4, '2024-10-15', '14:00'),
(5, 9, 10, 5, '2024-10-16', '10:00'),
(6, 11, 12, 6, '2024-10-16', '11:30'),
(7, 13, 14, 7, '2024-10-17', '09:15'),
(8, 15, 16, 8, '2024-10-17', '15:45'),
(9, 17, 18, 9, '2024-10-18', '08:45'),
(10, 19, 20, 10, '2024-10-18', '10:15'),
(11, 1, 2, 11, '2024-10-19', '11:45'),
(12, 3, 4, 12, '2024-10-19', '13:00'),
(13, 5, 6, 13, '2024-10-20', '08:00'),
(14, 7, 8, 14, '2024-10-20', '14:30'),
(15, 9, 10, 15, '2024-10-21', '09:00'),
(16, 11, 12, 16, '2024-10-21', '10:30'),
(17, 13, 14, 17, '2024-10-22', '11:15'),
(18, 15, 16, 18, '2024-10-22', '12:45'),
(19, 17, 18, 19, '2024-10-23', '08:30'),
(20, 19, 20, 20, '2024-10-23', '14:00');

-- Inserts para a tabela 'internacao'
INSERT INTO internacao (id_paciente, id_medico, id_enfermeiro, id_setor, inicio_internacao, fim_internacao, tempo_internacao) VALUES
(1, 3, 1, 1, '2024-10-01', '2024-10-10', '09:00'),
(2, 5, 2, 2, '2024-10-02', '2024-10-12', '08:00'),
(3, 4, 3, 3, '2024-10-03', '2024-10-11', '07:00'),
(4, 2, 4, 4, '2024-10-04', '2024-10-14', '06:00'),
(5, 1, 5, 5, '2024-10-05', '2024-10-15', '05:00'),
(6, 7, 6, 6, '2024-10-06', '2024-10-16', '10:00'),
(7, 6, 7, 7, '2024-10-07', '2024-10-17', '09:00'),
(8, 8, 8, 8, '2024-10-08', '2024-10-18', '08:00'),
(9, 9, 9, 9, '2024-10-09', '2024-10-19', '07:00'),
(10, 10, 10, 10, '2024-10-10', '2024-10-20', '06:00'),
(11, 12, 11, 11, '2024-10-11', '2024-10-21', '10:00'),
(12, 14, 12, 12, '2024-10-12', '2024-10-22', '09:00'),
(13, 11, 13, 13, '2024-10-13', '2024-10-23', '08:00'),
(14, 13, 14, 14, '2024-10-14', '2024-10-24', '07:00'),
(15, 15, 15, 15, '2024-10-15', '2024-10-25', '06:00'),
(16, 16, 16, 16, '2024-10-16', '2024-10-26', '10:00'),
(17, 17, 17, 17, '2024-10-17', '2024-10-27', '09:00'),
(18, 18, 18, 18, '2024-10-18', '2024-10-28', '08:00'),
(19, 19, 19, 19, '2024-10-19', '2024-10-29', '07:00'),
(20, 20, 20, 20, '2024-10-20', '2024-10-30', '06:00');

-- Inserts para a tabela 'plantao'
INSERT INTO plantao (id_medico, id_enfermeiro, id_setor, data_plantao, tempo_plantao) VALUES
(1, 1, 1, '2024-10-01', '08:00'),
(2, 2, 2, '2024-10-01', '08:00'),
(3, 3, 3, '2024-10-02', '08:00'),
(4, 4, 4, '2024-10-02', '08:00'),
(5, 5, 5, '2024-10-03', '08:00'),
(6, 6, 6, '2024-10-03', '08:00'),
(7, 7, 7, '2024-10-04', '08:00'),
(8, 8, 8, '2024-10-04', '08:00'),
(9, 9, 9, '2024-10-05', '08:00'),
(10, 10, 10, '2024-10-05', '08:00'),
(11, 11, 11, '2024-10-06', '08:00'),
(12, 12, 12, '2024-10-06', '08:00'),
(13, 13, 13, '2024-10-07', '08:00'),
(14, 14, 14, '2024-10-07', '08:00'),
(15, 15, 15, '2024-10-08', '08:00'),
(16, 16, 16, '2024-10-08', '08:00'),
(17, 17, 17, '2024-10-09', '08:00'),
(18, 18, 18, '2024-10-09', '08:00'),
(19, 19, 19, '2024-10-10', '08:00'),
(20, 20, 20, '2024-10-10', '08:00');

-- Inserts para a tabela 'financeiro'
INSERT INTO financeiro (id_consulta, preco, despesa_operacional) VALUES
(1, 200.00, 50.00),
(2, 150.00, 40.00),
(3, 250.00, 60.00),
(4, 300.00, 80.00),
(5, 120.00, 30.00),
(6, 180.00, 45.00),
(7, 210.00, 55.00),
(8, 230.00, 70.00),
(9, 260.00, 65.00),
(10, 170.00, 40.00),
(11, 240.00, 75.00),
(12, 220.00, 60.00),
(13, 190.00, 50.00),
(14, 160.00, 45.00),
(15, 280.00, 85.00),
(16, 300.00, 90.00),
(17, 310.00, 95.00),
(18, 330.00, 100.00),
(19, 340.00, 105.00),
(20, 350.00, 110.00);

-- Inserts para a tabela 'administrador'
INSERT INTO administrador (nome, cpf, cargo) VALUES
('José da Silva', '11111111122', 'Coordenador'),
('Maria Fernandes', '22222222233', 'Gerente de TI'),
('Pedro Almeida', '33333333344', 'Diretor Clínico'),
('Ana Souza', '44444444455', 'Gerente Administrativo'),
('Carlos Mendes', '55555555566', 'Chefe de Estoque'),
('Clara Rodrigues', '66666666677', 'Supervisora de Internações'),
('Ricardo Tavares', '77777777788', 'Gerente Financeiro'),
('Fernanda Oliveira', '88888888899', 'Gerente de RH'),
('João Pinto', '99999999900', 'Coordenador de Plantões'),
('Mariana Lima', '12345678901', 'Supervisora de Agendamentos'),
('Lucas Rocha', '23456789012', 'Diretor Geral'),
('Carolina Cardoso', '34567890123', 'Gerente de Serviços Médicos'),
('Bruno Dias', '45678901234', 'Supervisor de Tecnologias Médicas'),
('Paula Nunes', '56789012345', 'Chefe de Atendimento ao Paciente'),
('Vinicius Moreira', '67890123456', 'Coordenador de Setores Médicos'),
('Gabriela Cunha', '78901234567', 'Gerente de Equipamentos Médicos'),
('Thiago Matos', '89012345678', 'Gerente de Contas Hospitalares'),
('Isabela Santos', '90123456789', 'Supervisora de Medicamentos'),
('Felipe Farias', '01234567890', 'Coordenador de Recursos Humanos'),
('Renata Lopes', '10234567891', 'Gerente de Projetos Hospitalares');

-- Inserts para a tabela 'funcionario'
INSERT INTO funcionario (nome, cpf, id_setor, funcao, horario) VALUES
('Renato Almeida', '10101010101', 1, 'Recepcionista', '08:00'),
('Juliana Santos', '20202020202', 2, 'Assistente de Enfermagem', '09:00'),
('Felipe Souza', '30303030303', 3, 'Técnico em Radiologia', '10:00'),
('Carolina Faria', '40404040404', 4, 'Assistente Administrativo', '11:00'),
('Daniel Oliveira', '50505050505', 5, 'Auxiliar de Limpeza', '12:00'),
('Larissa Gomes', '60606060606', 6, 'Técnica em Enfermagem', '13:00'),
('Eduardo Lima', '70707070707', 7, 'Assistente de Farmácia', '14:00'),
('Vanessa Pereira', '80808080808', 8, 'Técnica de Laboratório', '15:00'),
('Leonardo Silva', '90909090909', 9, 'Técnico em Manutenção', '16:00'),
('Claudia Rodrigues', '11223344556', 10, 'Recepcionista', '17:00'),
('Gustavo Borges', '22334455667', 11, 'Assistente Financeiro', '08:00'),
('Flavia Neves', '33445566778', 12, 'Técnica em Nutrição', '09:00'),
('Marcos Fonseca', '44556677889', 13, 'Auxiliar de Serviços Gerais', '10:00'),
('Luana Ferreira', '55667788990', 14, 'Assistente de Contabilidade', '11:00'),
('Marcelo Nunes', '66778899001', 15, 'Motorista', '12:00'),
('Renata Pinto', '77889900112', 16, 'Técnica de Enfermagem', '13:00'),
('Henrique Martins', '88990011223', 17, 'Auxiliar de Almoxarifado', '14:00'),
('Sabrina Costa', '99001122334', 18, 'Assistente de Recursos Humanos', '15:00'),
('Vitor Dias', '10234567891', 19, 'Técnico de Suporte', '16:00'),
('Luiza Melo', '11234567892', 20, 'Recepcionista', '17:00');

-- Inserts para a tabela 'usuario'
INSERT INTO usuario (login, senha, perfil, nivel_permissao) VALUES
('admin1', 'senha123', 'administrador', 1),
('medico1', 'senha123', 'medico', 2),
('enfermeiro1', 'senha123', 'enfermeiro', 3),
('funcionario1', 'senha123', 'funcionario', 4),
('admin2', 'senha123', 'administrador', 1),
('medico2', 'senha123', 'medico', 2),
('enfermeiro2', 'senha123', 'enfermeiro', 3),
('funcionario2', 'senha123', 'funcionario', 4),
('admin3', 'senha123', 'administrador', 1),
('medico3', 'senha123', 'medico', 2),
('enfermeiro3', 'senha123', 'enfermeiro', 3),
('funcionario3', 'senha123', 'funcionario', 4),
('admin4', 'senha123', 'administrador', 1),
('medico4', 'senha123', 'medico', 2),
('enfermeiro4', 'senha123', 'enfermeiro', 3),
('funcionario4', 'senha123', 'funcionario', 4),
('admin5', 'senha123', 'administrador', 1),
('medico5', 'senha123', 'medico', 2),
('enfermeiro5', 'senha123', 'enfermeiro', 3),
('funcionario5', 'senha123', 'funcionario', 4),
('admin6', 'senha123', 'administrador', 1);
