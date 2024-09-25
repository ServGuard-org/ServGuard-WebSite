var database = require("../database/config");

function cadastrarVolume(tipo, capacidade) {
    let instrucaoSql = `INSERT INTO Volume (idVolume, tipo, capacidade) VALUES (DEFAULT, '${tipo}', ${capacidade});`;

    return database.executar(instrucaoSql);
}

module.exports = {
    cadastrarVolume
}