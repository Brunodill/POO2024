CREATE DATABASE clinica;
USE clinica;


-- Criando a tabela de Pacientes
CREATE TABLE Paciente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    sexo ENUM('Masculino', 'Feminino', 'Outro') NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Criando a tabela de Profissionais
CREATE TABLE Profissional (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    crm VARCHAR(20) NOT NULL,
    areaDeAtuacao VARCHAR(100) NOT NULL
);

-- Criando a tabela de Consultas
CREATE TABLE Consulta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    paciente_id INT NOT NULL,
    profissional_id INT NOT NULL,
    motivo VARCHAR(255),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(id),
    FOREIGN KEY (profissional_id) REFERENCES Profissional(id)
);

-- Criando a tabela de Prontuário
CREATE TABLE Prontuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT NOT NULL,
    dadosDoPaciente TEXT,
    historico TEXT,
    diagnostico TEXT,
    prescricao TEXT,
    FOREIGN KEY (paciente_id) REFERENCES Paciente(id)
);

-- Criando a tabela de Agenda
CREATE TABLE Agenda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dia DATE NOT NULL,
    hora TIME NOT NULL,
    profissional_id INT NOT NULL,
    disponibilidade BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (profissional_id) REFERENCES Profissional(id)
);

-- Criando a tabela de Lista de Espera
CREATE TABLE ListaDeEspera (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    profissional_id INT NOT NULL,
    paciente_id INT NOT NULL,
    motivo VARCHAR(255),
    FOREIGN KEY (paciente_id) REFERENCES Paciente(id),
    FOREIGN KEY (profissional_id) REFERENCES Profissional(id)
);
