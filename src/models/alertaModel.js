var database = require("../database/config");

function atualizarPorMaquina(idMaquina, usoCPU, usoRAM, usoTotal, velocidadeDownload, velocidadeUpload, erroPacotesEntrada, erroPacotesSaida, descartePacotesEntrada, descartePacotesSaida, megabytesRecebidos, megabytesEnviados, pacotesRecebidos, pacotesEnviados) {
    let instrucaoSql = `UPDATE MaquinaRecurso SET max = ${usoCPU} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoCPU');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${usoRAM} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoRAM');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${usoTotal} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoTotal');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${velocidadeDownload} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'velocidadeDownload');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${velocidadeUpload} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'velocidadeUpload');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${erroPacotesEntrada} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'erroPacotesEntrada');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${erroPacotesSaida} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'erroPacotesSaida');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${descartePacotesEntrada} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'descartePacotesEntrada');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${descartePacotesSaida} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'descartePacotesSaida');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${megabytesRecebidos} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'megabytesRecebidos');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${megabytesEnviados} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'megabytesEnviados');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${pacotesRecebidos} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'pacotesRecebidos');`;
    database.executar(instrucaoSql);
    
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${pacotesEnviados} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'pacotesEnviados');`;
    return database.executar(instrucaoSql);
 }

module.exports = { atualizarPorMaquina };