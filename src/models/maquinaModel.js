var database = require("../database/config");

function cadastrar(fkEmpresa, nome, rack) {
    let instrucaoSql = `INSERT INTO Maquina (idMaquina, fkEmpresa, nome, rack) VALUES (DEFAULT, ${fkEmpresa}, '${nome}', '${rack}');`;

    return database.executar(instrucaoSql);
}

function deletarPorId(idMaquina) {
    let instrucaoSql = `DELETE FROM Maquina WHERE idMaquina = ${idMaquina};`;

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
    let instrucaoSql = `SELECT idMaquina, fkEmpresa, nome, rack, modeloCPU, qtdNucleosCPU, capacidadeRAM, MACAddress FROM Maquina WHERE fkEmpresa = ${fkEmpresa}`;

    return database.executar(instrucaoSql)
}

module.exports = { cadastrar, deletarPorId, atualizarNomePorId, atualizarRackPorId, listarPorEmpresa}