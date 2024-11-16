USE ServGuard;

-- Inserindo dados para as duas semanas
-- Dia 2024-10-20
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        73, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        62, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        66, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        91, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        83, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        297, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        194, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        476, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        599, '2024-10-20 10:00:00', 0);

-- Dia 2024-10-21
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        68, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        57, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        67, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        92, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        82, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        303, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        208, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        476, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        606, '2024-10-21 10:00:00', 0);

-- Dia 2024-10-22
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        70, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        60, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        65, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        88, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        77, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        307, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        204, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        517, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        625, '2024-10-22 10:00:00', 0);

-- Dia 2024-10-23
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        68, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        59, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        65, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        89, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        80, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        308, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        192, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        485, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        616, '2024-10-23 10:00:00', 0);

-- Dia 2024-10-24
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        67, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        62, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        65, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        86, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        80, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        304, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        209, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        479, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        582, '2024-10-24 10:00:00', 0);

-- Dia 2024-10-25
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        70, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        61, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        68, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        94, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        83, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        298, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        194, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        506, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        606, '2024-10-25 10:00:00', 0);

-- Dia 2024-10-26
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        73, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        62, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        63, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        93, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        80, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        291, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        193, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        484, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        605, '2024-10-26 10:00:00', 0);

-- Dia 2024-10-27
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        68, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        59, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        67, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        94, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        80, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        293, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        203, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        476, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        621, '2024-10-27 10:00:00', 0);

-- Dia 2024-10-28
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        68, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        60, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        66, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        88, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        80, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        303, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        193, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        493, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        609, '2024-10-28 10:00:00', 0);

-- Dia 2024-10-29
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        73, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        60, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        63, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        91, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        82, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        312, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        203, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        497, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        608, '2024-10-29 10:00:00', 0);

-- Dia 2024-10-30
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        72, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        60, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        66, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        87, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        83, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        314, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        203, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        487, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        590, '2024-10-30 10:00:00', 0);

-- Dia 2024-10-31
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        72, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        61, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        63, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        86, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        79, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        287, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        196, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        524, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        618, '2024-10-31 10:00:00', 0);

-- Dia 2024-11-01
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        73, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        60, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        65, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        89, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        81, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        300, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        205, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        520, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        575, '2024-11-01 10:00:00', 0);

-- Dia 2024-11-02
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        71, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        63, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        64, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        88, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        81, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        308, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        192, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        491, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        601, '2024-11-02 10:00:00', 0);