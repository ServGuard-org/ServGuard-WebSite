var database = require("../database/config");

function buscarDadosHistograma(idEmpresa) {
    var instrucaoSql = `SELECT registroColuna FROM vista_histograma_cpu 
		                    WHERE fkHistograma = (SELECT MAX(fkHistograma) FROM HistogramaColuna) 
                            AND fkEmpresa = ${idEmpresa}; `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarEscalaInstabilidade(idEmpresa) {
    var instrucaoSql = `SELECT total_maquinas_irregulares, percentual_irregulares 
                            FROM vista_irregularidade_total_e_percentual 
                                WHERE fkEmpresa = ${idEmpresa};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}



module.exports = {
    buscarDadosHistograma,
    buscarEscalaInstabilidade
}
