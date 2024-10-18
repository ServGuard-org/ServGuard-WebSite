Use ServGuard;

INSERT INTO ServGuard.Empresa (nome, nomeResponsavel, emailResponsavel, CNPJ) VALUES
    ('BankCenter', 'Cláudio Fernandes', 'claudio.fernandes@bcenter.com', '12345678901234');

SET @empresaId = LAST_INSERT_ID();

INSERT INTO ServGuard.Usuario (fkEmpresa, nome, email, senha, isAdm) VALUES
    (@empresaId, 'Cláudio Fernandes', 'claudio.fernandes@bcenter.com', '123', 1);

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
    ((LAST_INSERT_ID() - 3), 100.000),   -- 100 GB
    ((LAST_INSERT_ID() - 2), 200.000),   -- 200 GB
    ((LAST_INSERT_ID() - 1), 400.000),   -- 400 GB
    (LAST_INSERT_ID(), 1000.000);  -- 1 TB