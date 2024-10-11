var database = require("../database/config");

function autenticar(email, senha) {
    var instrucaoSql = `
        SELECT idUsuario, nome, email, fkEmpresa as empresaId, isAdm FROM Usuario WHERE email = '${email}' AND senha = '${senha}';
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}
// Coloque os mesmos parâmetros aqui. Vá para a var instrucaoSql
function cadastrar(nome, email, senha, isAdm, cnpj, idEmpresa) {
    const condicao = cnpj ? `cnpj = ${cnpj}` : `idEmpresa = ${idEmpresa}`;
    // Insira exatamente a query do banco aqui, lembrando da nomenclatura exata nos valores
    //  e na ordem de inserção dos dados.
    var instrucaoSql = `
        INSERT INTO Usuario (idUsuario, fkEmpresa, nome, email, senha, isAdm) VALUES (DEFAULT, (SELECT idEmpresa FROM Empresa WHERE ${condicao}), '${nome}', '${email}', '${senha}', ${isAdm});
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function alterar(nome, email, isAdm, idUsuario) {
    let instrucaoSql = `UPDATE Usuario SET nome = '${nome}', email = '${email}', isAdm = ${isAdm} WHERE idUsuario = ${idUsuario};`;
    console.log(`executando: ${instrucaoSql}`)
    return database.executar(instrucaoSql);
}

function ativar(idUsuario) {
    let instrucaoSql = `UPDATE Usuario SET isAtivo = 1 WHERE idUsuario = ${idUsuario};`;

    return database.executar(instrucaoSql);
}

function inativar(idUsuario) {
    let instrucaoSql = `UPDATE Usuario SET isAtivo = 0 WHERE idUsuario = ${idUsuario};`;

    return database.executar(instrucaoSql);
}

function listarPorEmpresa(fkEmpresa) {
    let instrucaoSql = `SELECT idUsuario, fkEmpresa, nome, email, isAdm, isAtivo FROM Usuario WHERE fkEmpresa = ${fkEmpresa} ORDER BY isAtivo DESC;`;

    return database.executar(instrucaoSql);
}

function consultarPorId(idUsuario) {
    let instrucaoSql = `SELECT * FROM Usuario WHERE idUsuario = ${idUsuario}`;

    return database.executar(instrucaoSql);
}

function alterarSenha(nome, email, senha, idUsuario) {

    const mudaSenha = senha ? `, senha = '${senha}'` : ``;

    const instrucaoSql = `UPDATE Usuario SET nome = '${nome}', email = '${email}'${mudaSenha} WHERE idUsuario = ${idUsuario};`;

    console.log("Executando UPDATE: ", instrucaoSql);

    return database.executar(instrucaoSql);
}

module.exports = {
    autenticar,
    cadastrar,
    alterar,
    ativar,
    inativar,
    listarPorEmpresa,
    consultarPorId,
    alterarSenha
};