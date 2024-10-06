-- Criação das Tabelas - ServGuard -- 
		-- (MODELAGEM V3) -- 

-- Criação das Tabelas - ServGuard --
CREATE DATABASE IF NOT EXISTS ServGuard;

USE ServGuard;

CREATE TABLE IF NOT EXISTS ServGuard.Empresa (
idEmpresa INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(70) NOT NULL,
nomeResponsavel VARCHAR(70) NOT NULL,
emailResponsavel VARCHAR(255) UNIQUE NOT NULL,
CNPJ CHAR(14) UNIQUE NOT NULL,

PRIMARY KEY (idEmpresa)
);

CREATE TABLE IF NOT EXISTS ServGuard.Usuario (
idUsuario INT NOT NULL AUTO_INCREMENT,
fkEmpresa INT NOT NULL,
nome VARCHAR(70) NOT NULL,
email VARCHAR(255) UNIQUE NOT NULL,
senha VARCHAR(255) NOT NULL,
isAdm TINYINT NOT NULL,
isAtivo TINYINT NOT NULL DEFAULT 1,

CONSTRAINT fkEmpresaUsuario FOREIGN KEY (fkEmpresa) REFERENCES ServGuard.Empresa(idEmpresa),
PRIMARY KEY (idUsuario, fkEmpresa)
);

CREATE TABLE IF NOT EXISTS ServGuard.ServicoMonitorado (
idServicoMonitorado INT NOT NULL AUTO_INCREMENT,
fkEmpresa INT NOT NULL,
nome VARCHAR(50) NOT NULL,
URL VARCHAR(255) NOT NULL,

CONSTRAINT fkEmpresaServicoMonitorado FOREIGN KEY (fkEmpresa) REFERENCES ServGuard.Empresa(idEmpresa),
PRIMARY KEY (idServicoMonitorado, fkEmpresa)
);

CREATE TABLE IF NOT EXISTS ServGuard.Maquina (
idMaquina INT NOT NULL AUTO_INCREMENT,
fkEmpresa INT NOT NULL,
apelido VARCHAR(50),
nome VARCHAR(50),
rack VARCHAR(20),
modeloCPU VARCHAR(50),
qtdNucleosFisicos INT,
qtdNucleosLogicos INT,
capacidadeRAM DECIMAL(8,3),
MACAddress CHAR(17) UNIQUE NOT NULL,
isAtiva TINYINT DEFAULT 1 NOT NULL,

CONSTRAINT fkEmpresaMaquina FOREIGN KEY (fkEmpresa) REFERENCES ServGuard.Empresa(idEmpresa),
PRIMARY KEY (idMaquina, fkEmpresa)
);

CREATE TABLE IF NOT EXISTS ServGuard.Volume (
idVolume INT NOT NULL AUTO_INCREMENT,
fkMaquina INT NOT NULL,
apelido VARCHAR(50),
pontoMontagem VARCHAR(50) NOT NULL,
tipo VARCHAR(50) NOT NULL,
capacidade DECIMAL(8,3) NOT NULL,

CONSTRAINT fkMaquinaVolume FOREIGN KEY (fkMaquina) REFERENCES ServGuard.Maquina(idMaquina),
PRIMARY KEY (idVolume)
);

CREATE TABLE IF NOT EXISTS ServGuard.CapturaVolume (
idCapturaVolume INT NOT NULL AUTO_INCREMENT,
fkVolume INT NOT NULL,
registro DECIMAL(8,3) NOT NULL,
dthCriacao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

CONSTRAINT fkMaquinaCapturaVolume FOREIGN KEY (fkMaquina) REFERENCES ServGuard.Maquina(idMaquina),
PRIMARY KEY (idCapturaVolume)
);

CREATE TABLE IF NOT EXISTS ServGuard.Recurso (
idRecurso INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
unidadeMedida VARCHAR(45) NOT NULL,

PRIMARY KEY (idRecurso)
);

CREATE TABLE IF NOT EXISTS ServGuard.MaquinaRecurso (
idMaquinaRecurso INT NOT NULL AUTO_INCREMENT,
fkMaquina INT NOT NULL,
fkRecurso INT NOT NULL,
max DECIMAL(8,3),

CONSTRAINT fkMaquinaMaquinaRecurso FOREIGN KEY (fkMaquina) REFERENCES ServGuard.Maquina(idMaquina),
CONSTRAINT fkRecursoMaquinaRecurso FOREIGN KEY (fkRecurso) REFERENCES ServGuard.Recurso(idRecurso),
PRIMARY KEY (idMaquinaRecurso, fkMaquina, fkRecurso)
);

CREATE TABLE IF NOT EXISTS ServGuard.Captura (
idCaptura INT NOT NULL AUTO_INCREMENT,
fkMaquinaRecurso INT NOT NULL,
registro DECIMAL(8,3) NOT NULL,
dthCriacao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

CONSTRAINT fkMaquinaRecursoCaptura FOREIGN KEY (fkMaquinaRecurso) REFERENCES ServGuard.MaquinaRecurso(idMaquinaRecurso),
PRIMARY KEY (idCaptura)
);

INSERT INTO Recurso (nome, unidadeMedida) VALUES
	('usoCPU', '%'),
	('usoRAM', '%'),
	('usadoDisco', 'GB'),
	('livreDisco', 'GB'),
	('perdaPacotesEntrada', 'Pacotes'),
	('perdaPacotesSaida', 'Pacotes'),
	('descartePacotesEntrada', 'Pacotes'),
	('descartePacotesSaida', 'Pacotes');
