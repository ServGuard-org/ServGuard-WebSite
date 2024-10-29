const database = require("../database/config");

function buscarUltimosDadosRede(idMaquina) {
    const instrucaoSql = `CALL obter_ultimos_dados_rede(${idMaquina});`;

return database.executar(instrucaoSql)
}

function buscarIrregularidadeCpu(idEmpresa) {
    var instrucaoSql = `SELECT count(registro) as qtdCpu FROM vista_irregularidade_cpu
	                        WHERE idEmpresa = ${idEmpresa} AND fkRecurso = 1 AND isAlerta=1;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarIrregularidadeRam(idEmpresa) {
    var instrucaoSql = `SELECT count(registro) as qtdRam FROM vista_irregularidade_cpu
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
module.exports = { 
    buscarUltimosDadosRede,
    buscarIrregularidadeCpu,
    buscarIrregularidadeRam,
    buscarIrregularidadeDisco 
}