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

function buscarMedicoes(idEmpresa, idMaquina){
    var instrucaoSql = `SELECT COUNT(*) AS totalMedicoes FROM ViewMedicoes WHERE idEmpresa = ${idEmpresa} AND idMaquina = ${idMaquina};`;
    
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarPorcentagemAlertasCPU(idEmpresa, idMaquina){
    var instrucaoSql = `
    SELECT 
        (COUNT(CASE WHEN nomeRecurso LIKE '%CPU%' AND isAlerta = 1 THEN 1 END) * 100.0 / COUNT(*)) 
        AS porcentagem_alertas_CPU FROM ViewMedicoes WHERE idEmpresa = ${idEmpresa} AND idMaquina = ${idMaquina};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarPorcentagemAlertasRAM(idEmpresa, idMaquina){
    var instrucaoSql = `SELECT(COUNT(CASE WHEN nomeRecurso LIKE '%RAM%' AND isAlerta = 1 THEN 1 END) * 100.0 / COUNT(*)) 
        AS porcentagem_alertas_RAM FROM ViewMedicoes WHERE idEmpresa = ${idEmpresa} AND idMaquina = ${idMaquina};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMediaGaugeCPU(idEmpresa, idMaquina){
    var instrucaoSql = `SELECT mediaUsoCPU FROM MediaUsoCPU WHERE idEmpresa = ${idEmpresa} AND idMaquina = ${idMaquina}      
    AND idRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoCPU');`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarMediaGaugeRAM(idEmpresa, idMaquina){
    var instrucaoSql = `SELECT mediaUsoRAM FROM MediaUsoRAM WHERE idEmpresa = ${idEmpresa} AND idMaquina = ${idMaquina}      
    AND idRecurso = (SELECT idRecurso FROM Recurso WHERE nome = 'usoRAM');`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUsoTotalSemanal(idEmpresa, idMaquina){
    var instrucaoSql = ` SELECT id_maquina, nome_maquina, id_empresa_relacionada, data_registro, media_semanal_uso_cpu, media_semanal_uso_ram 
    FROM uso_maquinas_semana WHERE id_empresa_relacionada = ${idEmpresa} AND id_maquina = ${idMaquina};`

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


function buscarMapaInstabilidade(idEmpresa) {
    var instrucaoSql = `SELECT idMaquina, registro_usoCPU, max_usoCPU, registro_usoRAM, max_usoRAM FROM vista_mapa_instabilidade 
                            WHERE fkEmpresa=${idEmpresa};`;

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

function buscarListaAlertas(idEmpresa) {
    var instrucaoSql = `SELECT * FROM vista_ultimos_alertas
	                        WHERE fkEmpresa = ${idEmpresa}
                                LIMIT 100;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarDadosGraficoAlertas(idEmpresa) {
    var instrucaoSql = `SELECT * FROM vista_alertas_grafico
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

function buscarUsoHardwareAlto(idEmpresa) {
    var instrucaoSql = `SELECT qtdMaquinas FROM ServGuard.MaquinasUsoHardAlto
        WHERE fkEmpresa = ${idEmpresa};
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql, [idEmpresa]);
}

function buscarUsoDiscoAlto(idEmpresa){
    var instrucaoSql = `SELECT COUNT(*) AS qtdMaquinas FROM ServGuard.ArmazenamentoMaquinas
        WHERE fkEmpresa = ${idEmpresa} AND (usadoTotal / capacidadeTotal) > 0.8;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql, [idEmpresa]);
}

function buscarRamCpuMaquina(idEmpresa){
    var instrucaoSql = `SELECT * FROM ServGuard.UsoRamCpuPorEmpresa
        WHERE fkEmpresa = ${idEmpresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql, [idEmpresa]);
}

function buscarUsoDiscoMaquinas(idEmpresa){
    var instrucaoSql = `SELECT idMaquina, discoUsado, discoTotal FROM detalhesDiscoMaquinas
        WHERE fkEmpresa = ${idEmpresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql, [idEmpresa]);
}

function buscarUsoProcessamentoUltimos7(idEmpresa){
    var instrucaoSql = `SELECT * FROM ServGuard.MaioresUsosCpuRamUltimos7Dias
        WHERE idEmpresa = ${idEmpresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql, [idEmpresa]);
}

function buscarHistoricoMaquina(idEmpresa){
    var instrucaoSql = `SELECT * FROM ServGuard.HistoricoUsoMaquinaEmpresa WHERE idEmpresa = 1
        ORDER BY idMaquina, dataCaptura DESC;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql, [idEmpresa]);
}

function obterListaMaquinasPico(idEmpresa){
    var instrucaoSql = `SELECT * FROM detalhesMaquinasPico
        WHERE fkEmpresa = ${idEmpresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql, [idEmpresa]);
}

function obterListaHistoricoProcessamento(idEmpresa, idMaquina){
    var instrucaoSql = `SELECT * FROM ServGuard.HistoricoCpuRam 
        WHERE fkEmpresa = ${idEmpresa}
        AND idMaquina = ${idMaquina}; 
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterHistoricoDiarioProcessamento(idEmpresa, idMaquina){
    var instrucaoSql = `SELECT idEmpresa, data, idMaquina, pico_processamento FROM vista_pico_diario_processamento
        WHERE idEmpresa = ${idEmpresa} AND idMaquina = ${idMaquina};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarDadosHistograma,
    buscarEscalaInstabilidade,
    buscarMapaInstabilidade,
    buscarDadosAlerta,
    buscarListaAlertas,
    buscarDistribuicaoAlertas,
    buscarDadosGraficoAlertas,
    buscarUsoRecursoPorMaquina,
    buscarMaquinasConnect,
    buscarMedicoes,
    buscarPorcentagemAlertasCPU,
    buscarPorcentagemAlertasRAM,
    buscarMediaGaugeCPU,
    buscarMediaGaugeRAM,
    buscarUsoTotalSemanal,
    buscarUsoHardwareAlto,
    buscarUsoDiscoAlto,
    buscarRamCpuMaquina,
    buscarUsoDiscoMaquinas,
    buscarUsoProcessamentoUltimos7,
    buscarHistoricoMaquina,
    obterListaMaquinasPico,
    obterListaHistoricoProcessamento,
    obterHistoricoDiarioProcessamento
}
