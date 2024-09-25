var database = require("../database/config");

function cadastrarVolume(tipo, capacidade) {
    let instrucaoSql = `INSERT INTO Volume (idVolume, tipo, capacidade) VALUES (DEFAULT, '${tipo}', ${capacidade});`;

    return database.executar(instrucaoSql);
}

function associarVolume(idMaquinaVolume, idVolume) {
    var instrucaoSql = `
        INSERT INTO MaquinaVolume (fkMaquina, fkVolume) VALUES (${idMaquinaVolume}, ${idVolume});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function desassociarVolume(idMaquinaVolume, idVolume) {
    var instrucaoSql = `
        DELETE FROM MaquinaVolume WHERE fkMaquina = ${idMaquinaVolume} AND fkVolume = ${idVolume};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    cadastrarVolume,
    associarVolume,
    desassociarVolume
}