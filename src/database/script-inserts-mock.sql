    Use ServGuard;

    INSERT INTO ServGuard.Empresa (nome, nomeResponsavel, emailResponsavel, CNPJ) VALUES
        ('BankCenter', 'Cláudio Fernandes', 'claudio.fernandes@bcenter.com', '12345678901234');

    SET @empresaId = LAST_INSERT_ID();

    INSERT INTO ServGuard.Usuario (fkEmpresa, nome, email, senha, isAdm) VALUES
        (@empresaId, 'Cláudio Fernandes', 'claudio.fernandes@bcenter.com', '123', 1),
        (@empresaId, 'João Silva', 'joao.silva@bcenter.com', '123', 0),
        (@empresaId, 'Maria Santos', 'maria.santos@bcenter.com', '123', 1),
        (@empresaId, 'José Oliveira', 'jose.oliveira@bcenter.com', '123', 0);

    INSERT INTO ServGuard.Maquina (fkEmpresa, apelido, nome, modeloCPU, qtdNucleosFisicos, qtdNucleosLogicos, capacidadeRAM, MACAddress) VALUES
        (@empresaId, 'indefinido', 'pix-srv-01', 'Intel(R) Xeon(TM) Gold 6258R @ 2.70 GHz', 28, 56, 128.000, '00:00:00:00:00:00');

    SET @maquinaId = LAST_INSERT_ID();

    INSERT INTO ServGuard.Volume (fkMaquina, pontoMontagem, capacidade) VALUES
        (@maquinaId, '/mnt/backup', 500.000),     -- 500 GB
        (@maquinaId, '/mnt/media', 1000.000),     -- 1 TB
        (@maquinaId, '/mnt/logs', 2000.000),      -- 2 TB
        (@maquinaId, '/mnt/archive', 5000.000);   -- 5 TB

    SET @volumeIdBase = LAST_INSERT_ID();

    INSERT INTO ServGuard.CapturaVolume (fkVolume, usado) VALUES
        ((LAST_INSERT_ID()), 100.000),   -- 100 GB
        ((LAST_INSERT_ID() + 1), 200.000),   -- 200 GB
        ((LAST_INSERT_ID() + 2), 400.000),   -- 400 GB
        ((LAST_INSERT_ID() + 3), 1000.000);  -- 1 TB

    INSERT INTO ServGuard.MaquinaRecurso (fkMaquina, fkRecurso) VALUES
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')),
        (@maquinaId, (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos'));

    INSERT INTO ServGuard.Captura (fkMaquinaRecurso, registro, isAlerta) VALUES
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoCPU')), 89.000, 1),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoRAM')), 77.000, 0),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'usoTotal')), 83.000, 1),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeDownload')), 100.000, 0),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'velocidadeUpload')), 150.000, 0),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesEntrada')), 5.000, 0),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'erroPacotesSaida')), 3.000, 1),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesEntrada')), 2.000, 0),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'descartePacotesSaida')), 1.000, 0),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesRecebidos')), 500.000, 0),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'megabytesEnviados')), 300.000, 0),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesEnviados')), 1000.000, 0),
        ((SELECT idMaquinaRecurso FROM ServGuard.MaquinaRecurso WHERE fkMaquina = @maquinaId AND fkRecurso = (SELECT idRecurso FROM ServGuard.Recurso WHERE nome = 'pacotesRecebidos')), 1200.000, 0);