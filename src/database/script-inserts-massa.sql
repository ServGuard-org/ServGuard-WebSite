USE ServGuard;

-- Inserindo dados para as duas semanas
-- Dia 2024-10-20
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        71.023, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        61.313, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        66.639, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        90.938, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        77.483, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.919, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1.046, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        0.975, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        0.960, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        306.829, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        199.023, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        488.001, '2024-10-20 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        626.002, '2024-10-20 10:00:00', 0);

-- Dia 2024-10-21
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        67.146, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        58.658, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        67.408, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        90.618, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        82.200, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.925, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1.018, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1.032, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        0.975, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        304.093, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        194.993, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        524.267, '2024-10-21 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        629.456, '2024-10-21 10:00:00', 0);

-- Dia 2024-10-22
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        69.269, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        60.931, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        68.128, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        88.768, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        79.486, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.912, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1.034, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        0.970, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1.042, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        288.408, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        201.788, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        504.523, '2024-10-22 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        593.414, '2024-10-22 10:00:00', 0);

-- Dia 2024-10-23
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        71.714, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        61.992, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        67.186, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        89.983, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        76.916, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2.044, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1.036, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        0.999, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1.010, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        291.901, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        197.090, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        498.432, '2024-10-23 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        614.814, '2024-10-23 10:00:00', 0);

-- Dia 2024-10-24
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        70.658, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        57.368, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        68.084, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        92.246, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        77.872, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.903, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        0.953, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1.029, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        0.992, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        301.960, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        198.915, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        509.193, '2024-10-24 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        576.192, '2024-10-24 10:00:00', 0);

-- Dia 2024-10-25
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        68.089, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        61.355, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        66.824, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        92.887, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        83.634, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        2.025, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        0.965, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        0.981, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        0.969, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        314.371, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        209.854, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        493.088, '2024-10-25 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        628.800, '2024-10-25 10:00:00', 0);

-- Dia 2024-10-26
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        72.596, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        62.170, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        65.519, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        92.153, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        77.964, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.944, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1.040, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1.017, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1.003, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        312.362, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        191.184, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        520.820, '2024-10-26 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        604.211, '2024-10-26 10:00:00', 0);

-- Dia 2024-10-27
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        66.847, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        62.657, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        65.201, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        90.736, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        83.861, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.980, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        0.980, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        0.981, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        0.986, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        296.544, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        198.632, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        489.717, '2024-10-27 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        595.669, '2024-10-27 10:00:00', 0);

-- Dia 2024-10-28
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        72.689, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        59.904, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        64.810, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        86.574, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        82.949, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.958, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1.025, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        0.990, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1.018, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        302.722, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        202.591, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        494.409, '2024-10-28 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        582.770, '2024-10-28 10:00:00', 0);

-- Dia 2024-10-29
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        72.740, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        58.991, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        65.434, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        90.186, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        77.419, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.970, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        0.971, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        0.975, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1.044, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        297.488, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        204.875, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        484.793, '2024-10-29 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        585.920, '2024-10-29 10:00:00', 0);

-- Dia 2024-10-30
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        70.910, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        61.418, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        66.318, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        92.693, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        77.370, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.979, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        0.968, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1.022, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1.003, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        303.071, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        193.722, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        479.794, '2024-10-30 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        603.374, '2024-10-30 10:00:00', 0);

-- Dia 2024-10-31
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        68.820, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        59.790, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        66.544, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        87.373, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        82.430, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.927, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1.014, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        0.968, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        0.954, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        303.836, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        202.537, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        496.017, '2024-10-31 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        576.649, '2024-10-31 10:00:00', 0);

-- Dia 2024-11-01
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        69.334, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        61.761, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        67.470, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        93.652, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        78.089, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.934, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        1.002, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        0.966, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        1.037, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        294.553, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        208.378, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        494.704, '2024-11-01 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        604.320, '2024-11-01 10:00:00', 0);

-- Dia 2024-11-02
INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, dthCriacao, isAlerta) VALUES
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 
        67.099, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 
        59.947, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 
        67.750, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 
        87.370, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 
        78.988, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 
        1.916, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 
        0.968, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 
        1.017, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 
        0.961, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 
        306.675, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 
        195.781, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 
        510.527, '2024-11-02 10:00:00', 0),
    ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso 
        WHERE fkMaquina = 1 AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 
        588.700, '2024-11-02 10:00:00', 0);
