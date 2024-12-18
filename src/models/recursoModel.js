const database = require("../database/config");

function buscarUltimosDadosRede(idEmpresa) {
    const instrucaoSql = `CALL obter_soma_dados_rede_por_empresa(${idEmpresa});`; // REVISAR AQUI

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

function buscarUltimosDadosDownload(idEmpresa) {
    var instrucaoSql = `
        SELECT
            m.fkEmpresa,
            mr.fkMaquina,
            r.nome AS recurso,
            c.registro AS valor_download
        FROM
            ServGuard.Captura c
        INNER JOIN ServGuard.MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
        INNER JOIN ServGuard.Recurso r ON mr.fkRecurso = r.idRecurso
        INNER JOIN ServGuard.Maquina m ON mr.fkMaquina = m.idMaquina
        WHERE
            r.nome = 'velocidadeDownload'
            AND m.fkEmpresa = ${idEmpresa}
        ORDER BY
            c.dthCriacao DESC
        LIMIT 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimosDadosUpload(idEmpresa) {
    var instrucaoSql = `
        SELECT
            m.fkEmpresa,
            mr.fkMaquina,
            r.nome AS recurso,
            c.registro AS valor_upload  
        FROM
            ServGuard.Captura c
        INNER JOIN ServGuard.MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
        INNER JOIN ServGuard.Recurso r ON mr.fkRecurso = r.idRecurso
        INNER JOIN ServGuard.Maquina m ON mr.fkMaquina = m.idMaquina
        WHERE
            r.nome = 'velocidadeUpload'
            AND m.fkEmpresa = ${idEmpresa}
        ORDER BY
            c.dthCriacao DESC
        LIMIT 1;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
function buscarUltimoHorario(idEmpresa) {
    var instrucaoSql = `
    SELECT
    m.fkEmpresa,
    mr.fkMaquina,
    GREATEST(
        MAX(CASE WHEN r.nome = 'velocidadeUpload' THEN c.dthCriacao END),
        MAX(CASE WHEN r.nome = 'velocidadeDownload' THEN c.dthCriacao END)
    ) AS ultima_captura
FROM
    ServGuard.Captura c
INNER JOIN ServGuard.MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
INNER JOIN ServGuard.Recurso r ON mr.fkRecurso = r.idRecurso
INNER JOIN ServGuard.Maquina m ON mr.fkMaquina = m.idMaquina
WHERE
    r.nome IN ('velocidadeUpload', 'velocidadeDownload') -- Filtra para pegar apenas upload e download
    AND m.fkEmpresa = ${idEmpresa}
GROUP BY
    m.fkEmpresa,
    mr.fkMaquina
ORDER BY
    m.fkEmpresa, mr.fkMaquina;
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarUltimosDadosPacotes(idEmpresa) {
    var instrucaoSql = `
           SELECT
    e.nome AS empresa,
    r.nome AS recurso,
    r.unidadeMedida,
    c.registro AS valor,
    c.dthCriacao AS dataHora
FROM
    ServGuard.Empresa e
JOIN ServGuard.Maquina m ON m.fkEmpresa = e.idEmpresa
JOIN ServGuard.MaquinaRecurso mr ON mr.fkMaquina = m.idMaquina
JOIN ServGuard.Recurso r ON r.idRecurso = mr.fkRecurso
JOIN ServGuard.Captura c ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
WHERE
    e.idEmpresa = ${idEmpresa}
    AND r.nome IN ('pacotesEnviados', 'pacotesRecebidos')
    AND c.dthCriacao = (
        SELECT MAX(c2.dthCriacao)
        FROM ServGuard.Captura c2
        WHERE c2.fkMaquinaRecurso = c.fkMaquinaRecurso
    )
ORDER BY
    c.dthCriacao DESC;

    `;


    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarPerda(idEmpresa) {
    const instrucaoSql = `CALL obter_soma_dados_rede_por_empresa(${idEmpresa});`;

    return database.executar(instrucaoSql, [idEmpresa])
        .then((resultados) => {
            console.log("Resultados:", resultados);
            return resultados;
        })
        .catch((erro) => {
            console.error("Erro durante a execução da procedure:", erro);
            throw erro;
        });

}


module.exports = {
    buscarUltimosDadosRede,
    buscarIrregularidadeCpu,
    buscarIrregularidadeRam,
    buscarIrregularidadeDisco,
    buscarRankingRecurso,
    buscarUltimosDadosDownload,
    buscarUltimosDadosUpload,
    buscarUltimosDadosPacotes,
    buscarUltimoHorario,
    buscarPerda
}