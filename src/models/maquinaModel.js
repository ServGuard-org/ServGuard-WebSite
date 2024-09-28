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

function atualizarNomePorId(idMaquina, nome) {
    let instrucaoSql = `UPDATE Maquina SET nome = '${nome}' WHERE idMaquina = ${idMaquina};`;

    return database.executar(instrucaoSql);
}

function atualizarRackPorId(idMaquina, rack) {
    let instrucaoSql = `UPDATE Maquina SET rack = '${rack}' WHERE idMaquina = ${idMaquina};`;

    return database.executar(instrucaoSql);
}

function listarPorEmpresa(fkEmpresa) {
    let instrucaoSql = `SELECT idMaquina, fkEmpresa, nome, rack, modeloCPU, qtdNucleos, capacidadeRAM, MACAddress FROM Maquina WHERE fkEmpresa = ${fkEmpresa} ORDER BY isAtiva DESC;`;

    return database.executar(instrucaoSql)
}

module.exports = { cadastrar, inativarPorId, ativarPorId, atualizarNomePorId, atualizarRackPorId, listarPorEmpresa}