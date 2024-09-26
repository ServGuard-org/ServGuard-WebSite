-- Criação das Tabelas - ServGuard -- 
		-- (MODELAGEM V3) -- 

-- Criação das Tabelas - ServGuard --
CREATE DATABASE ServGuard;

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
senha VARCHAR(45) NOT NULL,
isAdm TINYINT NOT NULL,

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
nome VARCHAR(50) NOT NULL,
rack VARCHAR(20),
modeloCPU VARCHAR(50),
qtdNucleos INT,
capacidadeRAM DECIMAL(8,3),
MACAddress CHAR(17),
isAtiva TINYINT DEFAULT 1 NOT NULL,

CONSTRAINT fkEmpresaMaquina FOREIGN KEY (fkEmpresa) REFERENCES ServGuard.Empresa(idEmpresa),
PRIMARY KEY (idMaquina, fkEmpresa)
);

CREATE TABLE IF NOT EXISTS ServGuard.Volume (
idVolume INT NOT NULL AUTO_INCREMENT,
tipo VARCHAR(50) NOT NULL,
capacidade DECIMAL(8,3) NOT NULL,

PRIMARY KEY (idVolume)
);

CREATE TABLE IF NOT EXISTS ServGuard.MaquinaVolume (
idMaquinaVolume INT NOT NULL AUTO_INCREMENT,
fkMaquina INT NOT NULL,
fkVolume INT NOT NULL,

CONSTRAINT fkMaquinaMaquinaVolume FOREIGN KEY (fkMaquina) REFERENCES ServGuard.Maquina(idMaquina),
CONSTRAINT fkVolumeMaquinaVolume FOREIGN KEY (fkVolume) REFERENCES ServGuard.Volume(idVolume),
PRIMARY KEY (idMaquinaVolume, fkMaquina, fkVolume)
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
fkMaquina INT NOT NULL,
fkRecurso INT NOT NULL,
registro DECIMAL(8,3) NOT NULL,
dthCriacao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

CONSTRAINT fkMaquinaRecursoCaptura FOREIGN KEY (fkMaquinaRecurso) REFERENCES ServGuard.MaquinaRecurso(idMaquinaRecurso),
CONSTRAINT fkMaquinaCaptura FOREIGN KEY (fkMaquina) REFERENCES ServGuard.MaquinaRecurso(fkMaquina),
CONSTRAINT fkRecursoCaptura FOREIGN KEY (fkRecurso) REFERENCES ServGuard.MaquinaRecurso(fkRecurso),
PRIMARY KEY (idCaptura, fkMaquinaRecurso, fkMaquina, fkRecurso)
);