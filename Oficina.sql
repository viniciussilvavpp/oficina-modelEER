CREATE DATABASE OficinaVeiculos;
USE OficinaVeiculos;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45),
    Telefone VARCHAR(45)
);

-- Tabela Veiculo
CREATE TABLE Veiculo (
    idVeiculo INT PRIMARY KEY AUTO_INCREMENT,
    Modelo VARCHAR(45) NOT NULL,
    Placa VARCHAR(45) UNIQUE NOT NULL,
    Ano INT,
    Cliente_idCliente INT NOT NULL,
    FOREIGN KEY (Cliente_idCliente) REFERENCES Cliente(idCliente) ON DELETE CASCADE
);

-- Tabela Equipe
CREATE TABLE Equipe (
    idEquipe INT PRIMARY KEY AUTO_INCREMENT,
    Nome_equipe VARCHAR(45) NOT NULL
);

-- Tabela Mecanico
CREATE TABLE Mecanico (
    idMecanico INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45),
    Especialidade VARCHAR(45),
    Equipe_idEquipe INT NOT NULL,
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe) ON DELETE CASCADE
);

-- Tabela Ordem de Serviço
CREATE TABLE Ordem_de_Servico (
    idOS INT PRIMARY KEY AUTO_INCREMENT,
    Data_emissao DATE NOT NULL,
    Data_conclusao DATE,
    Valor_Total FLOAT DEFAULT 0,
    Status VARCHAR(45) NOT NULL,
    Veiculo_idVeiculo INT NOT NULL,
    Equipe_idEquipe INT NOT NULL,
    FOREIGN KEY (Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo) ON DELETE CASCADE,
    FOREIGN KEY (Equipe_idEquipe) REFERENCES Equipe(idEquipe) ON DELETE CASCADE
);

-- Tabela OS Peca
CREATE TABLE OS_Peca (
    idOS_Peca INT PRIMARY KEY AUTO_INCREMENT,
    Quantidade INT NOT NULL,
    Valor_total_peca FLOAT DEFAULT 0
);

-- Tabela Peca
CREATE TABLE Peca (
    idPeca INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(45) NOT NULL,
    Valor_unitario FLOAT NOT NULL,
    OS_Peca_idOS_Peca INT NOT NULL,
    FOREIGN KEY (OS_Peca_idOS_Peca) REFERENCES OS_Peca(idOS_Peca) ON DELETE CASCADE
);

-- Tabela OS Servico
CREATE TABLE OS_Servico (
    idOS_Servico INT PRIMARY KEY AUTO_INCREMENT,
    Quantidade INT NOT NULL,
    Valor_aplicado FLOAT DEFAULT 0
);

-- Tabela Servico
CREATE TABLE Servico (
    idServico INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(45) NOT NULL,
    Valor_mao_obra FLOAT NOT NULL,
    OS_Servico_idOS_Servico INT NOT NULL,
    FOREIGN KEY (OS_Servico_idOS_Servico) REFERENCES OS_Servico(idOS_Servico) ON DELETE CASCADE
);

-- Tabela OS_Peca_has_Ordem_de_Servico (Relacionamento entre OS_Peca e Ordem_de_Servico)
CREATE TABLE OS_Peca_has_Ordem_de_Servico (
    OS_Peca_idOS_Peca INT,
    Ordem_de_Servico_idOS INT,
    Ordem_de_Servico_Veiculo_idVeiculo INT,
    Ordem_de_Servico_Equipe_idEquipe INT,
    PRIMARY KEY (OS_Peca_idOS_Peca, Ordem_de_Servico_idOS, Ordem_de_Servico_Veiculo_idVeiculo, Ordem_de_Servico_Equipe_idEquipe),
    FOREIGN KEY (OS_Peca_idOS_Peca) REFERENCES OS_Peca(idOS_Peca) ON DELETE CASCADE,
    FOREIGN KEY (Ordem_de_Servico_idOS) REFERENCES Ordem_de_Servico(idOS) ON DELETE CASCADE,
    FOREIGN KEY (Ordem_de_Servico_Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo) ON DELETE CASCADE,
    FOREIGN KEY (Ordem_de_Servico_Equipe_idEquipe) REFERENCES Equipe(idEquipe) ON DELETE CASCADE
);

-- Tabela Ordem_de_Servico_has_OS_Servico (Relacionamento entre Ordem_de_Servico e OS_Servico)
CREATE TABLE Ordem_de_Servico_has_OS_Servico (
    Ordem_de_Servico_idOS INT,
    Ordem_de_Servico_Veiculo_idVeiculo INT,
    Ordem_de_Servico_Equipe_idEquipe INT,
    OS_Servico_idOS_Servico INT,
    PRIMARY KEY (Ordem_de_Servico_idOS, Ordem_de_Servico_Veiculo_idVeiculo, Ordem_de_Servico_Equipe_idEquipe, OS_Servico_idOS_Servico),
    FOREIGN KEY (Ordem_de_Servico_idOS) REFERENCES Ordem_de_Servico(idOS) ON DELETE CASCADE,
    FOREIGN KEY (Ordem_de_Servico_Veiculo_idVeiculo) REFERENCES Veiculo(idVeiculo) ON DELETE CASCADE,
    FOREIGN KEY (Ordem_de_Servico_Equipe_idEquipe) REFERENCES Equipe(idEquipe) ON DELETE CASCADE,
    FOREIGN KEY (OS_Servico_idOS_Servico) REFERENCES OS_Servico(idOS_Servico) ON DELETE CASCADE
);
