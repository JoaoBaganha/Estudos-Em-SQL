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
