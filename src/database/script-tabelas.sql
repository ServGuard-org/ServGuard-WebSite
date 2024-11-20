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


CREATE TABLE IF NOT EXISTS ServGuard.Chaves (
idChave INT NOT NULL AUTO_INCREMENT,
chave VARCHAR(500) NOT NULL,
dthCriacao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL,

PRIMARY KEY(idChave)
);

INSERT INTO ServGuard.Chaves (chave) VALUES
	('CHAVE-AQUI');

-- INSERT INTO Histograma (fkHistograma, registroColuna) VALUES 
	-- ((SELECT MAX(idHistograma) FROM Histograma), %rc);

INSERT INTO Recurso (nome, unidadeMedida) VALUES
	('usoCPU', '%'),
	('usoRAM', '%'),
    ('usoTotal', '%'),
    ('velocidadeDownload', 'Mbps'),
    ('velocidadeUpload', 'Mbps'),
	('erroPacotesEntrada', 'Pacote'),
	('erroPacotesSaida', 'Pacote'),
	('descartePacotesEntrada', 'Pacote'),
	('descartePacotesSaida', 'Pacote'),
	('megabytesRecebidos', 'MB'),
	('megabytesEnviados', 'MB'),
    ('pacotesEnviados', 'Pacote'),
    ('pacotesRecebidos', 'Pacote');

-- VIEWS

CREATE OR REPLACE VIEW vista_capturas_relatorio_semanal AS
	SELECT fkEmpresa as idEmpresa, 
		idCaptura, 
		fkMaquina AS idMaquina, 
		fkMaquinaRecurso AS idRecurso, 
		registro, 
		dthCriacao, 
		isAlerta 
	FROM Captura
		JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
		JOIN Maquina ON fkMaquina = idMaquina
			WHERE dthCriacao >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
		GROUP BY fkEmpresa, idCaptura, fkMaquina, fkMaquinaRecurso;
        
CREATE OR REPLACE VIEW vista_capturas_relatorio_mensal AS
	SELECT fkEmpresa as idEmpresa,
		idCaptura, 
		fkMaquina AS idMaquina, 
		fkMaquinaRecurso AS idRecurso, 
		registro, 
		dthCriacao, 
		isAlerta 
	FROM Captura
		JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
		JOIN Maquina ON fkMaquina = idMaquina
			WHERE dthCriacao >= DATE_SUB(CURDATE(), INTERVAL 30 DAY)
		GROUP BY fkEmpresa, idCaptura, fkMaquina, fkMaquinaRecurso;


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
    MAX(cr.dthCriacao) AS dataMaximaCaptura -- Data da Captura mais recente
FROM 
    ServGuard.Maquina m
JOIN 
    ServGuard.MaquinaRecurso mr ON m.idMaquina = mr.fkMaquina
JOIN 
    ServGuard.Recurso r ON mr.fkRecurso = r.idRecurso
JOIN 
    ServGuard.Captura cr ON mr.idMaquinaRecurso = cr.fkMaquinaRecurso
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
    -- Subquery para obter a última Captura por volume
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
	SELECT registro, idEmpresa, fkRecurso FROM Captura 
		JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
		JOIN Maquina ON fkMaquina = idMaquina
		JOIN Empresa ON fkEmpresa = idEmpresa;
        
SELECT registro FROM vista_registro_cpu
	 WHERE idEmpresa = 1 AND fkRecurso = 1;
             
             
-- VIEW PARA O PLOT DO HISTOGRAMA
CREATE OR REPLACE VIEW vista_histograma_cpu AS
	SELECT registroColuna, fkEmpresa, fkHistograma FROM HistogramaColuna 
		JOIN Histograma ON fkHistograma = idHistograma;   
        
        
-- Plot gráfico analista:
CREATE OR REPLACE VIEW vista_captura_atual_maquina_recurso AS
SELECT registro, fkMaquina, fkEmpresa, fkRecurso 
FROM Captura
JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
JOIN Maquina ON fkMaquina = idMaquina
WHERE dthCriacao = (
    SELECT MAX(dthCriacao) 
    FROM Captura cr 
    JOIN MaquinaRecurso mr ON cr.fkMaquinaRecurso = mr.idMaquinaRecurso
    WHERE mr.fkMaquina = Maquina.idMaquina 
    AND mr.fkRecurso = MaquinaRecurso.fkRecurso
);

SELECT registro, fkMaquina FROM vista_captura_atual_maquina_recurso 
	 WHERE fkEmpresa = 1 AND fkRecurso = 2;
  
-- Irregularidades de CPU
CREATE OR REPLACE VIEW vista_irregularidade AS
	SELECT registro, isAlerta, idEmpresa, fkRecurso FROM Captura 
			JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
			JOIN Maquina ON fkMaquina = idMaquina
			JOIN Empresa ON fkEmpresa = idEmpresa;
            
SELECT count(registro) as qtdCpu FROM vista_irregularidade
	WHERE idEmpresa = 1 AND fkRecurso = 1 AND isAlerta=1;


-- DISTRIBUICAO ALERTA
CREATE OR REPLACE VIEW vista_distribuicao_alerta AS
SELECT 
    SUM(CASE WHEN mr.fkRecurso = 1 AND c.isAlerta = 1 THEN 1 ELSE 0 END) AS qtdCpu,
    SUM(CASE WHEN mr.fkRecurso = 2 AND c.isAlerta = 1 THEN 1 ELSE 0 END) AS qtdRam,
    SUM(CASE WHEN mr.fkRecurso = 3 AND c.isAlerta = 1 THEN 1 ELSE 0 END) AS qtdUsoGeral,
    SUM(CASE WHEN mr.fkRecurso NOT IN (1, 2, 3) AND c.isAlerta = 1 THEN 1 ELSE 0 END) AS qtdRede,
    SUM(CASE WHEN isAlerta = 1 THEN 1 ELSE 0 END) AS qtdAlertas,
    fkEmpresa
FROM Captura c
	JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
	JOIN Maquina m ON mr.fkMaquina = m.idMaquina
		GROUP BY fkEmpresa;

SELECT * FROM vista_distribuicao_alerta WHERE fkEmpresa = 1; 

-- VIEW PARA GRÁFICO - REGRESSÃO LINEAR
CREATE OR REPLACE VIEW vista_alertas_grafico AS
SELECT 
    t1.fkEmpresa,
    DATE_FORMAT(t1.data, '%d-%m-%Y') AS dia_mes, 
    COALESCE(t2.quantidade_alertas, 0) AS quantidade_alertas
FROM 
    (
        -- Gera os últimos 30 dias para cada fkEmpresa
        SELECT m.fkEmpresa, DATE_SUB(CURDATE(), INTERVAL seq DAY) AS data
        FROM (
            SELECT 0 AS seq UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 
            UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7
            UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10 UNION ALL SELECT 11 
            UNION ALL SELECT 12 UNION ALL SELECT 13 UNION ALL SELECT 14 UNION ALL SELECT 15 
            UNION ALL SELECT 16 UNION ALL SELECT 17 UNION ALL SELECT 18 UNION ALL SELECT 19 
            UNION ALL SELECT 20 UNION ALL SELECT 21 UNION ALL SELECT 22 UNION ALL SELECT 23 
            UNION ALL SELECT 24 UNION ALL SELECT 25 UNION ALL SELECT 26 UNION ALL SELECT 27 
            UNION ALL SELECT 28 UNION ALL SELECT 29
        ) AS days
        CROSS JOIN Maquina m
        GROUP BY m.fkEmpresa, data
    ) AS t1
LEFT JOIN 
    (
        -- Contagem de alertas por dia e por empresa
        SELECT DATE(c.dthCriacao) AS data, 
               COUNT(*) AS quantidade_alertas, 
               m.fkEmpresa
        FROM Captura c
        JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
        JOIN Maquina m ON mr.fkMaquina = m.idMaquina
        WHERE c.isAlerta = 1
        GROUP BY DATE(c.dthCriacao), m.fkEmpresa
    ) AS t2 
ON t1.data = t2.data AND t1.fkEmpresa = t2.fkEmpresa
ORDER BY t1.fkEmpresa, t1.data;

SELECT * FROM vista_alertas_grafico WHERE fkEmpresa = 1;
    
-- Irregularidades de DISCO
CREATE OR REPLACE VIEW vista_irregularidade_disco AS
	SELECT idMaquina, usado, capacidade, idEmpresa FROM Maquina
		JOIN Empresa ON idEmpresa = fkEmpresa
		JOIN Volume ON idMaquina = fkMaquina
		JOIN CapturaVolume ON idVolume = fkVolume;

SELECT COUNT(DISTINCT idMaquina) as DicosIrregulares FROM vista_irregularidade_disco
	WHERE (usado / capacidade) > 0.85 AND idEmpresa=1;
    
    
-- Escala instabilidade
CREATE OR REPLACE VIEW vista_irregularidade_total_e_percentual AS
SELECT 
    m.fkEmpresa,
    -- Subquery para contar as máquinas irregulares com validações de alerta e data
    (
        SELECT COUNT(DISTINCT m_in.idMaquina)
        FROM Maquina m_in
        JOIN MaquinaRecurso mr_in ON m_in.idMaquina = mr_in.fkMaquina
        JOIN Captura c_in ON mr_in.idMaquinaRecurso = c_in.fkMaquinaRecurso
        WHERE m_in.fkEmpresa = m.fkEmpresa
          AND c_in.isAlerta = 1
          AND DATE(c_in.dthCriacao) = CURDATE()
    ) AS total_maquinas_irregulares,
    -- Total de máquinas na empresa
    (SELECT COUNT(*) FROM Maquina WHERE fkEmpresa = m.fkEmpresa) AS total_maquinas,
    -- Cálculo do percentual de máquinas irregulares
    (
        (
            SELECT COUNT(DISTINCT m_in.idMaquina)
            FROM Maquina m_in
            JOIN MaquinaRecurso mr_in ON m_in.idMaquina = mr_in.fkMaquina
            JOIN Captura c_in ON mr_in.idMaquinaRecurso = c_in.fkMaquinaRecurso
            WHERE m_in.fkEmpresa = m.fkEmpresa
              AND c_in.isAlerta = 1
              AND DATE(c_in.dthCriacao) = CURDATE()
        ) / (SELECT COUNT(*) FROM Maquina WHERE fkEmpresa = m.fkEmpresa) * 100
    ) AS percentual_irregulares
FROM Maquina m
GROUP BY m.fkEmpresa;

                
SELECT total_maquinas_irregulares, percentual_irregulares, total_maquinas 
FROM vista_irregularidade_total_e_percentual 
WHERE fkEmpresa = 1;

-- Dados media de alertas
CREATE OR REPLACE VIEW vista_capturas_alerta_total_e_media_diaria AS
    SELECT 
        (SELECT COUNT(*) FROM Captura 
			WHERE isAlerta = 1 AND DATE(dthCriacao) = CURDATE()) AS total_capturas_alerta_hoje,
        COUNT(*) / COUNT(DISTINCT DATE(dthCriacao)) AS media_diaria_alertas,
        fkEmpresa 
		FROM Captura
			JOIN MaquinaRecurso on fkMaquinaRecurso = idMaquinaRecurso
            JOIN Maquina on fkMaquina = idMaquina
    WHERE isAlerta = 1
    GROUP BY fkEmpresa;

SELECT * FROM vista_capturas_alerta_total_e_media_diaria WHERE fkEmpresa=1;

-- MAPA INSTABILIDADE
CREATE OR REPLACE VIEW vista_mapa_instabilidade AS
    SELECT 
        m.idMaquina,
        m.fkEmpresa,
        
        -- CPU
        (SELECT c.idCaptura 
         FROM Captura c
         JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
         JOIN Recurso r ON mr.fkRecurso = r.idRecurso
         WHERE mr.fkMaquina = m.idMaquina AND r.nome = 'usoCPU'
         ORDER BY c.dthCriacao DESC
         LIMIT 1) AS idCaptura_usoCPU,
        
        (SELECT c.registro 
         FROM Captura c
         JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
         JOIN Recurso r ON mr.fkRecurso = r.idRecurso
         WHERE mr.fkMaquina = m.idMaquina AND r.nome = 'usoCPU'
         ORDER BY c.dthCriacao DESC
         LIMIT 1) AS registro_usoCPU,
        
        (SELECT mr.max 
         FROM MaquinaRecurso mr
         JOIN Recurso r ON mr.fkRecurso = r.idRecurso
         WHERE mr.fkMaquina = m.idMaquina AND r.nome = 'usoCPU'
         LIMIT 1) AS max_usoCPU,

        -- RAM
        (SELECT c.idCaptura 
         FROM Captura c
         JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
         JOIN Recurso r ON mr.fkRecurso = r.idRecurso
         WHERE mr.fkMaquina = m.idMaquina AND r.nome = 'usoRAM'
         ORDER BY c.dthCriacao DESC
         LIMIT 1) AS idCaptura_usoRAM,
        
        (SELECT c.registro 
         FROM Captura c
         JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
         JOIN Recurso r ON mr.fkRecurso = r.idRecurso
         WHERE mr.fkMaquina = m.idMaquina AND r.nome = 'usoRAM'
         ORDER BY c.dthCriacao DESC
         LIMIT 1) AS registro_usoRAM,
        
        (SELECT mr.max 
         FROM MaquinaRecurso mr
         JOIN Recurso r ON mr.fkRecurso = r.idRecurso
         WHERE mr.fkMaquina = m.idMaquina AND r.nome = 'usoRAM'
         LIMIT 1) AS max_usoRAM

    FROM Maquina m;
    

-- LISTA ULTIMOS ALERTAS
CREATE OR REPLACE VIEW vista_ultimos_alertas AS
	SELECT fkMaquina, Recurso.nome, dthCriacao, fkEmpresa FROM Captura
		JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
		JOIN Recurso ON fkRecurso = idRecurso
		JOIN Maquina ON fkMaquina = idMaquina
			WHERE Captura.isAlerta = 1
				ORDER BY dthCriacao DESC;
                
SELECT * FROM vista_ultimos_alertas
	WHERE fkEmpresa = 1;

CREATE OR REPLACE VIEW vista_ultimas_metricas AS
SELECT 
    m.idMaquina,
    m.fkEmpresa,
    m.nome AS nomeMaquina,
    (SELECT c.registro
     FROM Captura c
     JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
     WHERE mr.fkMaquina = m.idMaquina 
     AND mr.fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoCPU')
     ORDER BY c.dthCriacao DESC
     LIMIT 1) AS ultimo_uso_cpu,
    
    (SELECT c.registro
     FROM Captura c
     JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
     WHERE mr.fkMaquina = m.idMaquina 
     AND mr.fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoRAM')
     ORDER BY c.dthCriacao DESC
     LIMIT 1) AS ultimo_uso_ram,
    
    (SELECT c.registro
     FROM Captura c
     JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
     WHERE mr.fkMaquina = m.idMaquina 
     AND mr.fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'pacotesEnviados')
     ORDER BY c.dthCriacao DESC
     LIMIT 1) AS ultimos_pacotes_enviados,
    
    (SELECT c.registro
     FROM Captura c
     JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
     WHERE mr.fkMaquina = m.idMaquina 
     AND mr.fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'pacotesRecebidos')
     ORDER BY c.dthCriacao DESC
     LIMIT 1) AS ultimos_pacotes_recebidos,
    
    (SELECT c.dthCriacao
     FROM Captura c
     JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
     WHERE mr.fkMaquina = m.idMaquina
     ORDER BY c.dthCriacao DESC
     LIMIT 1) AS ultima_captura
FROM 
    Maquina m
WHERE 
    m.isAtiva = 1;

SELECT * FROM vista_ultimas_metricas WHERE idMaquina = 1;


-- ranking de recursos mais problematicos
CREATE OR REPLACE VIEW vista_ranking_recurso AS
	SELECT (SELECT COUNT(DISTINCT idMaquina) AS DicosIrregulares FROM vista_irregularidade_disco WHERE (usado / capacidade) > 0.85) AS qtdDISCO,
			(SELECT COUNT(registro) AS qtdCpu FROM vista_irregularidade WHERE idEmpresa = 1 AND fkRecurso = 1 AND isAlerta=1) AS qtdCPU,
			(SELECT COUNT(registro) AS qtdCpu FROM vista_irregularidade WHERE idEmpresa = 1 AND fkRecurso = 2 AND isAlerta=1) AS qtdRAM,
			idEmpresa FROM Empresa;
             
select qtdCPU,qtdRAM,qtdDISCO from vista_ranking_recurso
	WHERE idEmpresa=1;
            
CREATE OR REPLACE VIEW vista_irregularidade AS
	SELECT registro, isAlerta, idEmpresa, fkRecurso FROM Captura 
			JOIN MaquinaRecurso ON fkMaquinaRecurso = idMaquinaRecurso
			JOIN Maquina ON fkMaquina = idMaquina
			JOIN Empresa ON fkEmpresa = idEmpresa;

CREATE OR REPLACE VIEW vista_semanas_captura_empresa AS
SELECT DISTINCT
    m.fkEmpresa,
    DATE_SUB(DATE(c.dthCriacao), 
        INTERVAL WEEKDAY(c.dthCriacao) DAY) AS inicio_semana,
    DATE_ADD(DATE_SUB(DATE(c.dthCriacao), 
        INTERVAL WEEKDAY(c.dthCriacao) DAY), 
        INTERVAL 6 DAY) AS fim_semana,
    YEARWEEK(c.dthCriacao, 7) as numero_semana,
    COUNT(DISTINCT c.idCaptura) as total_capturas,
    MIN(c.dthCriacao) as primeira_captura,
    MAX(c.dthCriacao) as ultima_captura
FROM 
    Captura c
    JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
    JOIN Maquina m ON mr.fkMaquina = m.idMaquina
GROUP BY
    m.fkEmpresa,
    YEARWEEK(c.dthCriacao, 7),
    inicio_semana,
    fim_semana
ORDER BY
    inicio_semana DESC;

CREATE OR REPLACE VIEW vista_soma_pacotes_por_dia AS
SELECT
    m.fkEmpresa AS idEmpresa,
    DATE(c.dthCriacao) AS data,
    SUM(CASE WHEN r.nome = 'pacotesEnviados' THEN c.registro ELSE 0 END) AS total_pacotes_enviados,
    SUM(CASE WHEN r.nome = 'pacotesRecebidos' THEN c.registro ELSE 0 END) AS total_pacotes_recebidos,
    SUM(CASE WHEN r.nome IN ('pacotesEnviados', 'pacotesRecebidos') THEN c.registro ELSE 0 END) AS total_pacotes
FROM
    Captura c
JOIN
    MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
JOIN
    Recurso r ON mr.fkRecurso = r.idRecurso
JOIN
    Maquina m ON mr.fkMaquina = m.idMaquina
GROUP BY
    m.fkEmpresa,
    DATE(c.dthCriacao);

-- PROCEDURES

DELIMITER //

CREATE PROCEDURE obter_ultimos_dados_rede(IN maquina INT)
BEGIN
    SELECT 
        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "velocidadeDownload")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS velocidadeDownload,

        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "velocidadeUpload")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS velocidadeUpload,

        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "pacotesEnviados")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS pacotesEnviados,

        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "pacotesRecebidos")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS pacotesRecebidos,

        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "megabytesEnviados")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS megabytesEnviados,

        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "megabytesRecebidos")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS megabytesRecebidos,

        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "descartePacotesEntrada")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS descartePacotesEntrada,

        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "descartePacotesSaida")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS descartePacotesSaida,

        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "erroPacotesEntrada")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS erroPacotesEntrada,

        (SELECT registro 
         FROM ServGuard.Captura 
         WHERE fkMaquinaRecurso = (
             SELECT idMaquinaRecurso 
             FROM ServGuard.MaquinaRecurso 
             WHERE fkMaquina = maquina 
             AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = "erroPacotesSaida")
         ) 
         ORDER BY dthCriacao DESC 
         LIMIT 1) AS erroPacotesSaida;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE obter_soma_dados_rede_por_empresa(IN empresa INT)
BEGIN
    WITH RecursosRede AS (
        SELECT 
            r.idRecurso,
            r.nome,
            mr.idMaquinaRecurso,
            mr.fkMaquina
        FROM ServGuard.Recurso r
        JOIN ServGuard.MaquinaRecurso mr ON mr.fkRecurso = r.idRecurso
        JOIN ServGuard.Maquina m ON m.idMaquina = mr.fkMaquina
        WHERE m.fkEmpresa = empresa
        AND m.isAtiva = 1
        AND r.nome IN (
            'velocidadeDownload',
            'velocidadeUpload',
            'pacotesEnviados',
            'pacotesRecebidos',
            'megabytesEnviados',
            'megabytesRecebidos',
            'descartePacotesEntrada',
            'descartePacotesSaida',
            'erroPacotesEntrada',
            'erroPacotesSaida'
        )
    ),
    UltimasLeituras AS (
        SELECT 
            rr.nome,
            rr.fkMaquina,
            c.registro,
            ROW_NUMBER() OVER (PARTITION BY rr.fkMaquina, rr.nome ORDER BY c.dthCriacao DESC) as rn
        FROM RecursosRede rr
        LEFT JOIN ServGuard.Captura c ON c.fkMaquinaRecurso = rr.idMaquinaRecurso
    ),
    UltimosValoresPorMaquina AS (
        SELECT 
            nome,
            registro
        FROM UltimasLeituras
        WHERE rn = 1
    )
    SELECT 
        SUM(CASE WHEN nome = 'velocidadeDownload' THEN registro ELSE 0 END) as velocidadeDownload,
        SUM(CASE WHEN nome = 'velocidadeUpload' THEN registro ELSE 0 END) as velocidadeUpload,
        SUM(CASE WHEN nome = 'pacotesEnviados' THEN registro ELSE 0 END) as pacotesEnviados,
        SUM(CASE WHEN nome = 'pacotesRecebidos' THEN registro ELSE 0 END) as pacotesRecebidos,
        SUM(CASE WHEN nome = 'megabytesEnviados' THEN registro ELSE 0 END) as megabytesEnviados,
        SUM(CASE WHEN nome = 'megabytesRecebidos' THEN registro ELSE 0 END) as megabytesRecebidos,
        SUM(CASE WHEN nome = 'descartePacotesEntrada' THEN registro ELSE 0 END) as descartePacotesEntrada,
        SUM(CASE WHEN nome = 'descartePacotesSaida' THEN registro ELSE 0 END) as descartePacotesSaida,
        SUM(CASE WHEN nome = 'erroPacotesEntrada' THEN registro ELSE 0 END) as erroPacotesEntrada,
        SUM(CASE WHEN nome = 'erroPacotesSaida' THEN registro ELSE 0 END) as erroPacotesSaida,
        COUNT(DISTINCT fkMaquina) as totalMaquinas
    FROM UltimasLeituras
    WHERE rn = 1;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE obter_metricas_semana(IN empresa_id INT, IN week_number VARCHAR(6))
BEGIN
    WITH NetworkMetrics AS (
        SELECT 
            m.fkEmpresa,
            r.nome as recurso,
            c.registro,
            c.dthCriacao
        FROM Captura c
        JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
        JOIN Maquina m ON mr.fkMaquina = m.idMaquina
        JOIN Recurso r ON mr.fkRecurso = r.idRecurso
        WHERE m.fkEmpresa = empresa_id
        AND YEARWEEK(c.dthCriacao, 3) = week_number
    )
    SELECT 
        -- Pacotes
        SUM(CASE WHEN recurso = 'pacotesEnviados' THEN registro ELSE 0 END) as total_pacotes_enviados,
        SUM(CASE WHEN recurso = 'pacotesRecebidos' THEN registro ELSE 0 END) as total_pacotes_recebidos,
        
        -- Megabytes
        SUM(CASE WHEN recurso = 'megabytesEnviados' THEN registro ELSE 0 END) as total_megabytes_enviados,
        SUM(CASE WHEN recurso = 'megabytesRecebidos' THEN registro ELSE 0 END) as total_megabytes_recebidos,
        
        -- Erros (soma entrada e saída)
        SUM(CASE 
            WHEN recurso IN ('erroPacotesEntrada', 'erroPacotesSaida') 
            THEN registro 
            ELSE 0 
        END) as total_erros,
        
        -- Descartes (soma entrada e saída)
        SUM(CASE 
            WHEN recurso IN ('descartePacotesEntrada', 'descartePacotesSaida') 
            THEN registro 
            ELSE 0 
        END) as total_descartes,
        
        -- Metadata
        MIN(dthCriacao) as inicio_semana,
        MAX(dthCriacao) as fim_semana
    FROM NetworkMetrics;
END //

DELIMITER ;

DELIMITER //

CREATE PROCEDURE obter_mapa_semana(IN empresa_id INT, IN week_number VARCHAR(6))
BEGIN
    WITH RECURSIVE hours AS (
        SELECT 0 as hour
        UNION ALL
        SELECT hour + 1 FROM hours WHERE hour < 23
    ),
    NetworkMetrics AS (
        SELECT 
            m.fkEmpresa,
            r.nome as recurso,
            c.registro,
            c.dthCriacao,
            HOUR(c.dthCriacao) as hora,
            WEEKDAY(c.dthCriacao) + 1 as dia_semana, -- WEEKDAY retorna 0-6 (Mon-Sun), +1 for 1-7
            DATE(c.dthCriacao) as data
        FROM Captura c
        JOIN MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
        JOIN Maquina m ON mr.fkMaquina = m.idMaquina
        JOIN Recurso r ON mr.fkRecurso = r.idRecurso
        WHERE m.fkEmpresa = empresa_id
        AND YEARWEEK(c.dthCriacao, 3) = week_number
    ),
    TimeGrid AS (
        SELECT 
            h.hour as hora,
            DATE(MIN(m.dthCriacao) + INTERVAL d.dia DAY) as data,
            WEEKDAY(MIN(m.dthCriacao) + INTERVAL d.dia DAY) + 1 as dia_semana
        FROM hours h
        CROSS JOIN (
            SELECT 0 as dia UNION ALL SELECT 1 UNION ALL SELECT 2 
            UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 
            UNION ALL SELECT 6
        ) d
        CROSS JOIN NetworkMetrics m
        GROUP BY h.hour, d.dia
    )
    SELECT 
        tg.data,
        tg.hora,
        tg.dia_semana,
        COALESCE(SUM(CASE 
            WHEN nm.recurso = 'pacotesEnviados' THEN nm.registro
            ELSE 0 
        END), 0) as pacotes_enviados,
        COALESCE(SUM(CASE 
            WHEN nm.recurso = 'pacotesRecebidos' THEN nm.registro
            ELSE 0 
        END), 0) as pacotes_recebidos,
        COALESCE(SUM(CASE 
            WHEN nm.recurso IN ('pacotesEnviados', 'pacotesRecebidos') THEN nm.registro
            ELSE 0 
        END), 0) as total_pacotes
    FROM TimeGrid tg
    LEFT JOIN NetworkMetrics nm ON 
        tg.hora = nm.hora AND 
        tg.data = nm.data
    GROUP BY 
        tg.data,
        tg.hora,
        tg.dia_semana
    ORDER BY 
        tg.data,
        tg.hora;
END //

DELIMITER ;