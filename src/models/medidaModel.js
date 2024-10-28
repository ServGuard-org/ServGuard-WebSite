var database = require("../database/config");

function buscarDadosHistograma(idEmpresa) {
    // var instrucaoSql = `SELECT * FROM vista_histograma_cpu;`;
    var instrucaoSql = `SELECT registroColuna FROM HistogramaColuna 
		                    JOIN Histograma ON fkHistograma = idHistograma
			                    WHERE (SELECT MAX(fkHistograma) FROM HistogramaColuna) AND fkEmpresa = ${idEmpresa}; `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarDadosHistograma
}
