var database = require("../database/config");

function buscarDadosHistograma() {

    var instrucaoSql = `SELECT * FROM vista_histograma_cpu;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarDadosHistograma
}
