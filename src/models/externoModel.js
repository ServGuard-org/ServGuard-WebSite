var database = require("../database/config");

function obterChaveGemini() {
    const instrucaoSql = `SELECT chave FROM Chaves ORDER BY dthCriacao DESC LIMIT 1;`

    return database.executar(instrucaoSql);
}

module.exports = { obterChaveGemini };