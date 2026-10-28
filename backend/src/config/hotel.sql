DROP DATABASE IF EXISTS hotel;

CREATE DATABASE hotel;

USE hotel;

CREATE TABLE hospedes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo VARCHAR(150) NOT NULL,
    cpf VARBINARY(255) NOT NULL,
    cpf_iv BINARY(12) NOT NULL,
    cpf_tag BINARY(16) NOT NULL,
    data_nascimento DATE NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE quartos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    identificacao VARCHAR(20) NOT NULL UNIQUE,
    categoria VARCHAR(50) NOT NULL,
    capacidade_maxima INT NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL
);

CREATE TABLE reservas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    hospede_id INT NOT NULL,
    quarto_id INT NOT NULL,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    quantidade_pessoas INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativa',

    FOREIGN KEY (hospede_id) REFERENCES hospedes(id),
    FOREIGN KEY (quarto_id) REFERENCES quartos(id)
);