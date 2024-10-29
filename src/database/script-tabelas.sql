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

CREATE TABLE IF NOT EXISTS ServGuard.Maquina (
idMaquina INT NOT NULL AUTO_INCREMENT,
fkEmpresa INT NOT NULL,
apelido VARCHAR(50),
nome VARCHAR(50),
rack VARCHAR(20),
modeloCPU VARCHAR(50),
qtdNucleosFisicos INT,
qtdNucleosLogicos INT,
capacidadeRAM DECIMAL(12,3),
MACAddress CHAR(17) UNIQUE NOT NULL,
isAtiva TINYINT DEFAULT 1 NOT NULL,

CONSTRAINT fkEmpresaMaquina FOREIGN KEY (fkEmpresa) REFERENCES ServGuard.Empresa(idEmpresa),
PRIMARY KEY (idMaquina)
);

CREATE TABLE IF NOT EXISTS ServGuard.Volume (
idVolume INT NOT NULL AUTO_INCREMENT,
fkMaquina INT NOT NULL,
pontoMontagem VARCHAR(50) NOT NULL,
capacidade DECIMAL(12,3) NOT NULL,

CONSTRAINT fkMaquinaVolume FOREIGN KEY (fkMaquina) REFERENCES ServGuard.Maquina(idMaquina),
PRIMARY KEY (idVolume)
);

CREATE TABLE IF NOT EXISTS ServGuard.CapturaVolume (
idCapturaVolume INT NOT NULL AUTO_INCREMENT,
fkVolume INT NOT NULL,
usado DECIMAL(12,3) NOT NULL,
dthCriacao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

CONSTRAINT fkVolumeCapturaVolume FOREIGN KEY (fkVolume) REFERENCES ServGuard.Volume(idVolume),
PRIMARY KEY (idCapturaVolume)
);

CREATE TABLE IF NOT EXISTS ServGuard.Recurso (
idRecurso INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) UNIQUE NOT NULL,
unidadeMedida VARCHAR(45) NOT NULL,

PRIMARY KEY (idRecurso)
);

CREATE TABLE IF NOT EXISTS ServGuard.MaquinaRecurso (
idMaquinaRecurso INT NOT NULL AUTO_INCREMENT,
fkMaquina INT NOT NULL,
fkRecurso INT NOT NULL,
max DECIMAL(12,3),

CONSTRAINT fkMaquinaMaquinaRecurso FOREIGN KEY (fkMaquina) REFERENCES ServGuard.Maquina(idMaquina),
CONSTRAINT fkRecursoMaquinaRecurso FOREIGN KEY (fkRecurso) REFERENCES ServGuard.Recurso(idRecurso),
PRIMARY KEY (idMaquinaRecurso)
);

CREATE TABLE IF NOT EXISTS ServGuard.Captura (
idCaptura INT NOT NULL AUTO_INCREMENT,
fkMaquinaRecurso INT NOT NULL,
registro DECIMAL(12,3) NOT NULL,
dthCriacao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,
isAlerta TINYINT DEFAULT 0 NOT NULL,

CONSTRAINT fkMaquinaRecursoCaptura FOREIGN KEY (fkMaquinaRecurso) REFERENCES ServGuard.MaquinaRecurso(idMaquinaRecurso),
PRIMARY KEY (idCaptura)
);


CREATE TABLE IF NOT EXISTS ServGuard.Histograma (
idHistograma INT NOT NULL AUTO_INCREMENT,
fkEmpresa INT NOT NULL,
dthCriacao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

CONSTRAINT fkEmpresaHistograma FOREIGN KEY (fkEmpresa) REFERENCES ServGuard.Empresa(idEmpresa),
PRIMARY KEY (idHistograma)
);
-- INSERT INTO Histograma (fkEmpresa) VALUE (%fk);

CREATE TABLE IF NOT EXISTS ServGuard.HistogramaColuna (
idHistogramaColuna INT NOT NULL AUTO_INCREMENT,
fkHistograma INT NOT NULL,
registroColuna DECIMAL(12,3) NOT NULL,

CONSTRAINT fkHistogramaHistogramaColuna FOREIGN KEY (fkHistograma) REFERENCES ServGuard.Histograma(idHistograma),
PRIMARY KEY (idHistogramaColuna)
);




-- INSERT INTO Histograma (fkHistograma, registroColuna) VALUES 
	-- ((SELECT MAX(idHistograma) FROM Histograma), %rc);

INSERT INTO Recurso (nome, unidadeMedida) VALUES
	('usoCPU', '%'),
	('usoRAM', '%'),
	('erroPacotesEntrada', 'Pacote'),
	('erroPacotesSaida', 'Pacote'),
	('descartePacotesEntrada', 'Pacote'),
	('descartePacotesSaida', 'Pacote'),
	('megabytesRecebidos', 'MB'),
	('megabytesEnviados', 'MB'),
    ('pacotesEnviados', 'Pacote'),
    ('pacotesRecebidos', 'Pacote');

-- VIEWS

CREATE OR REPLACE VIEW vista_maquinas_com_disco AS
SELECT 
    m.idMaquina,
    m.fkEmpresa,
    IFNULL(m.apelido, 'indefinido') AS apelido,
    m.nome,
    m.modeloCPU,
    m.qtdNucleosFisicos,
    m.qtdNucleosLogicos,
    m.capacidadeRAM,
    m.MACAddress,
    m.isAtiva,
    -- Captura o último valor de usado
    (SELECT SUM(cv.usado)
     FROM ServGuard.CapturaVolume cv
     JOIN ServGuard.Volume v2 ON v2.idVolume = cv.fkVolume
     WHERE v2.fkMaquina = m.idMaquina 
     AND cv.dthCriacao = (
         SELECT MAX(cv2.dthCriacao)
         FROM ServGuard.CapturaVolume cv2
         WHERE cv2.fkVolume = v2.idVolume
     )
    ) AS discoUsado,
    -- Soma a capacidade total dos volumes
    SUM(DISTINCT v.capacidade) AS discoTotal
FROM 
    ServGuard.Maquina m
LEFT JOIN 
    ServGuard.Volume v ON v.fkMaquina = m.idMaquina
GROUP BY 
    m.idMaquina,
    m.fkEmpresa,
    m.apelido,
    m.nome,
    m.modeloCPU,
    m.qtdNucleosFisicos,
    m.qtdNucleosLogicos,
    m.capacidadeRAM,
    m.MACAddress,
    m.isAtiva
ORDER BY 
    m.isAtiva DESC;

CREATE OR REPLACE VIEW vista_alertas_maquinas AS
SELECT 
    m.idMaquina, -- ID da máquina
    m.nome AS nomeMaquina, -- Nome da máquina
    r.nome AS recursoNome, -- Nome do recurso
    mr.max AS maxRecurso, -- Valor máximo do recurso da tabela MaquinaRecurso
    MAX(cr.dthCriacao) AS dataMaximaCaptura -- Data da captura mais recente
FROM 
    ServGuard.Maquina m
JOIN 
    ServGuard.MaquinaRecurso mr ON m.idMaquina = mr.fkMaquina
JOIN 
    ServGuard.Recurso r ON mr.fkRecurso = r.idRecurso
JOIN 
    ServGuard.Captura cr ON mr.idMaquinaRecurso = cr.fkMaquinaRecurso
WHERE 
    r.nome IN ('usoCPU', 'usoRAM')
GROUP BY 
    m.idMaquina, m.nome, r.nome, mr.max -- Inclui mr.max no GROUP BY
ORDER BY 
    r.nome;

CREATE OR REPLACE VIEW vista_volumes_atuais AS
SELECT 
    v.idVolume,
    v.fkMaquina,
    v.pontoMontagem,
    v.capacidade AS capacidadeTotal,
    cv.usado AS capacidadeUsada,
    cv.dthCriacao AS dataUltimaCaptura
FROM 
    ServGuard.Volume v
JOIN 
    ServGuard.CapturaVolume cv ON v.idVolume = cv.fkVolume
JOIN (
    -- Subquery para obter a última captura por volume
    SELECT 
        fkVolume, 
        MAX(dthCriacao) AS dataUltimaCaptura
    FROM 
        ServGuard.CapturaVolume
    GROUP BY 
        fkVolume
) cv2 ON cv.fkVolume = cv2.fkVolume AND cv.dthCriacao = cv2.dataUltimaCaptura;


-- VIEW PARA O E DO ETL
CREATE OR REPLACE VIEW vista_registro_cpu AS
	SELECT registro, idEmpresa, fkRecurso FROM captura 
		JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
		JOIN Maquina ON fkMaquina = idMaquina
		JOIN Empresa ON fkEmpresa = idEmpresa;
        
SELECT registro FROM vista_registro_cpu
	 WHERE idEmpresa = 1 AND fkRecurso = 1;
             
             
-- VIEW PARA O PLOT DO HISTOGRAMA
CREATE OR REPLACE VIEW vista_histograma_cpu AS
	SELECT registroColuna, fkEmpresa, fkHistograma FROM HistogramaColuna 
		JOIN Histograma ON fkHistograma = idHistograma;   
        
select registroColuna from vista_histograma_cpu 
		WHERE fkHistograma = (SELECT MAX(fkHistograma) FROM HistogramaColuna) AND fkEmpresa = 1;
  
-- Irregularidades de CPU
CREATE OR REPLACE VIEW vista_irregularidade_cpu AS
	SELECT registro, isAlerta, idEmpresa, fkRecurso FROM captura 
			JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
			JOIN Maquina ON fkMaquina = idMaquina
			JOIN Empresa ON fkEmpresa = idEmpresa;
            
SELECT count(registro) FROM vista_irregularidade_cpu
	WHERE idEmpresa = 1 AND fkRecurso = 1 AND isAlerta=1;
             
             
-- Irregularidades de RAM
CREATE OR REPLACE VIEW vista_irregularidade_ram AS
	SELECT registro, isAlerta, idEmpresa, fkRecurso FROM captura 
		JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
		JOIN Maquina ON fkMaquina = idMaquina
		JOIN Empresa ON fkEmpresa = idEmpresa;
            
SELECT count(registro) FROM vista_irregularidade_cpu
	WHERE idEmpresa = 1 AND fkRecurso = 2 AND isAlerta=1;

-- Irregularidades de DISCO
CREATE OR REPLACE VIEW vista_irregularidade_disco AS
	SELECT idMaquina, usado, capacidade, idEmpresa FROM Maquina
		JOIN Empresa ON idEmpresa = fkEmpresa
		JOIN Volume ON idMaquina = fkMaquina
		JOIN CapturaVolume ON idVolume = fkVolume;

SELECT COUNT(DISTINCT idMaquina) as DicosIrregulares FROM vista_irregularidade_disco
	WHERE (usado / capacidade) > 0.85 AND idEmpresa=1;




