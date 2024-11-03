var database = require("../database/config");

function cadastrar(fkEmpresa, nome, rack) {
    let instrucaoSql = `INSERT INTO Maquina (idMaquina, fkEmpresa, nome, rack) VALUES (DEFAULT, ${fkEmpresa}, '${nome}', '${rack}');`;

    return database.executar(instrucaoSql);
}

function inativarPorId(idMaquina) {
    let instrucaoSql = `UPDATE Maquina SET isAtiva = 0 WHERE idMaquina = ${idMaquina};`;

    return database.executar(instrucaoSql);
}

function ativarPorId(idMaquina) {
    let instrucaoSql = `UPDATE Maquina SET isAtiva = 1 WHERE idMaquina = ${idMaquina};`;

    return database.executar(instrucaoSql);
}

function atualizarApelidoPorId(idMaquina, apelido) {
    let instrucaoSql = `UPDATE Maquina SET apelido = '${apelido}' WHERE idMaquina = ${idMaquina};`;

    return database.executar(instrucaoSql);
}

function listarPorEmpresa(fkEmpresa) {
    let instrucaoSql = `SELECT *
        FROM vista_maquinas_com_disco
        WHERE fkEmpresa = ${fkEmpresa}
        ORDER BY isAtiva DESC;`;
    return database.executar(instrucaoSql)
}

function listarPorId(idMaquina) {
    let instrucaoSql = `SELECT * FROM vista_maquinas_com_disco WHERE idMaquina = ${idMaquina};`;

    return database.executar(instrucaoSql);
}

function listarAlertaPorId(idMaquina) {
    let instrucaoSql = `SELECT * FROM vista_alertas_maquinas WHERE idMaquina = ${idMaquina};`;

    return database.executar(instrucaoSql);
}

function listarVolumesPorMaquina(idMaquina) {
    let instrucaoSql = `SELECT * FROM vista_volumes_atuais WHERE fkMaquina = ${idMaquina};`;

    return database.executar(instrucaoSql);
}

function dadosTempoReal(idMaquina) {
    let instrucaoSql = `SELECT * FROM vista_ultimas_metricas WHERE idMaquina = ${idMaquina};`;

    return database.executar(instrucaoSql);
}

module.exports = { cadastrar, inativarPorId, ativarPorId, atualizarApelidoPorId, listarPorEmpresa, listarPorId, listarAlertaPorId, listarVolumesPorMaquina, dadosTempoReal }