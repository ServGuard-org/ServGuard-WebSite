const database = require("../database/config");

function buscarUltimosDadosRede(idMaquina) {
    const instrucaoSql = `CALL obter_ultimos_dados_rede(${idMaquina});`;

return database.executar(instrucaoSql)
}