var database = require("../database/config");

function atualizarPorMaquina(idMaquina, usoCPU, usoRAM) {
    let instrucaoSql = `UPDATE MaquinaRecurso SET max = ${usoCPU} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoCPU');`;
    database.executar(instrucaoSql);
    instrucaoSql = `UPDATE MaquinaRecurso SET max = ${usoRAM} WHERE fkMaquina = ${idMaquina} AND fkRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoRAM');`;

    return database.executar(instrucaoSql);
}

module.exports = { atualizarPorMaquina };