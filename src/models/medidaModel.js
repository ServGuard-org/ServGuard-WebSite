var database = require("../database/config");

function buscarDadosHistograma(idEmpresa) {
    var instrucaoSql = `SELECT registroColuna FROM vista_histograma_cpu 
		                    WHERE fkHistograma = (SELECT MAX(fkHistograma) FROM HistogramaColuna) 
                            AND fkEmpresa = ${idEmpresa}; `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarEscalaInstabilidade(idEmpresa) {
    var instrucaoSql = `SELECT total_maquinas_irregulares, percentual_irregulares, total_maquinas 
                            FROM vista_irregularidade_total_e_percentual 
                                WHERE fkEmpresa = ${idEmpresa};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarDadosAlerta(idEmpresa) {
    var instrucaoSql = `SELECT * FROM vista_capturas_alerta_total_e_media_diaria 
                            WHERE fkEmpresa=${idEmpresa};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarDistribuicaoAlertas(idEmpresa) {
    var instrucaoSql = `SELECT * FROM vista_distribuicao_alerta 
                            WHERE fkEmpresa = ${idEmpresa}; 
`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMapaInstabilidade(idEmpresa) {
    var instrucaoSql = `SELECT idMaquina, registro_usoCPU, max_usoCPU, registro_usoRAM, max_usoRAM FROM vista_mapa_instabilidade 
                            WHERE fkEmpresa=${idEmpresa};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function buscarListaAlertas(idEmpresa) {
    var instrucaoSql = `SELECT * FROM vista_ultimos_alertas
	                        WHERE fkEmpresa = ${idEmpresa};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUsoRecursoPorMaquina(idEmpresa, idRecurso) {
    var instrucaoSql = `SELECT registro, fkMaquina FROM vista_captura_atual_maquina_recurso 
	                        WHERE fkEmpresa = ${idEmpresa} AND fkRecurso = ${idRecurso};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMaquinasConnect(idEmpresa){
    var instrucaoSql = `
    SELECT 
		COUNT(*) AS maquinas_conectadas
	FROM 
		MaquinasConectadas
	WHERE 
		pacotes_enviados > 0 
		AND pacotes_recebidos > 0
		AND idEmpresa = ${idEmpresa};

    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql, [idEmpresa]);
}

module.exports = {
    buscarDadosHistograma,
    buscarEscalaInstabilidade,
    buscarDadosAlerta,
    buscarDistribuicaoAlertas,
    buscarMapaInstabilidade,
    buscarListaAlertas,
    buscarUsoRecursoPorMaquina,
    buscarMaquinasConnect
}
