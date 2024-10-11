var database = require("../database/config");

function buscarPorId(id) {
  var instrucaoSql = `SELECT * FROM Empresa WHERE id = '${id}'`;

  return database.executar(instrucaoSql);
}

function listar() {
  var instrucaoSql = `SELECT id, razao_social, cnpj, codigo_ativacao FROM Empresa`;

  return database.executar(instrucaoSql);
}

function buscarPorCnpj(cnpj) {
  var instrucaoSql = `SELECT * FROM Empresa WHERE cnpj = '${cnpj}'`;

  return database.executar(instrucaoSql);
}

function cadastrar(nomeEmpresa, nomeResponsavel, emailResponsavel, cnpj) {
  var instrucaoSql = `INSERT INTO Empresa (idEmpresa, nome, nomeResponsavel, emailResponsavel, CNPJ) VALUES (DEFAULT, '${nomeEmpresa}', '${nomeResponsavel}', '${emailResponsavel}', '${cnpj}')`;
  console.log('Executando: ',instrucaoSql)
  return database.executar(instrucaoSql);
}

module.exports = { buscarPorCnpj, buscarPorId, cadastrar, listar };