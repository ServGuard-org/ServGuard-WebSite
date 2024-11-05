const database = require("../database/config");

function buscarUltimosDadosRede(idEmpresa) {
    const instrucaoSql = `CALL obter_soma_dados_rede_por_empresa(${idEmpresa});`;

return database.executar(instrucaoSql)
}

function buscarIrregularidadeCpu(idEmpresa) {
    var instrucaoSql = `SELECT count(registro) AS qtdCpu FROM vista_irregularidade
	                        WHERE idEmpresa = ${idEmpresa} AND fkRecurso = 1 AND isAlerta=1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarIrregularidadeRam(idEmpresa) {
    var instrucaoSql = `SELECT count(registro) AS qtdRam FROM vista_irregularidade
	                        WHERE idEmpresa = ${idEmpresa} AND fkRecurso = 2 AND isAlerta=1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarIrregularidadeDisco(idEmpresa) {
    var instrucaoSql = `SELECT COUNT(DISTINCT idMaquina) as DicosIrregulares FROM vista_irregularidade_disco
	                        WHERE (usado / capacidade) > 0.85 AND idEmpresa=${idEmpresa};`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarRankingRecurso(idEmpresa) {
    var instrucaoSql = `SELECT idMaquina, registro_usoCPU, max_usoCPU, registro_usoRAM, max_usoRAM 
                            FROM vista_mapa_instabilidade 
                                WHERE fkEmpresa=${idEmpresa};
`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = { 
    buscarUltimosDadosRede,
    buscarIrregularidadeCpu,
    buscarIrregularidadeRam,
    buscarIrregularidadeDisco,
    buscarRankingRecurso
}