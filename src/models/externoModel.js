var database = require("../database/config");

function obterChaveGemini() {
    const instrucaoSql = `SELECT chave FROM Chaves;`

    return database.executar(instrucaoSql);
}

module.exports = { obterChaveGemini };