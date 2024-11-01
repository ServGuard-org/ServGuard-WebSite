var database = require("../database/config");

function atualizarPorMaquina(idMaquina, usoCPU, usoRAM, usoTotal) {
    let instrucaoSql = `UPDATE MaquinaRecurso SET max = ${usoCPU} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoCPU');`;
    database.executar(instrucaoSql);
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${usoRAM} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoRAM');`;
    database.executar(instrucaoSql);
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${usoTotal} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoTotal');`;

    return database.executar(instrucaoSql);
}

module.exports = { atualizarPorMaquina };