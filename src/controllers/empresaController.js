var empresaModel = require("../models/empresaModel");

function buscarPorCnpj(req, res) {
  var cnpj = req.query.cnpj;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function listar(req, res) {
  empresaModel.listar().then((resultado) => {
    res.status(200).json(resultado);
  });
}

function buscarPorId(req, res) {
  var id = req.params.id;

  empresaModel.buscarPorId(id).then((resultado) => {
    res.status(200).json(resultado);
  });
}

function cadastrar(req, res) {

  var nomeEmpresa = req.body.nomeEmpresaServer;
  var nomeResponsavel = req.body.nomeResponsavelServer;
  var emailResponsavel = req.body.emailResponsavelServer;
  var cnpj = req.body.cnpjServer;

  empresaModel.buscarPorCnpj(cnpj).then((resultado) => {
    if (resultado.length > 0) {
      res.status(401).json({ mensagem: `a empresa com o cnpj ${cnpj} já existe` });
    } else {
      empresaModel.cadastrar(nomeEmpresa, nomeResponsavel, emailResponsavel, cnpj).then((resultado) => {
        res.status(201).json(resultado);
      });
    }
  });
}

function obterSemanas(req, res) {
  var idEmpresa = req.params.idEmpresa;

  empresaModel.obterSemanas(idEmpresa).then((resultado) => {
    if (resultado.length == 0) {
      res.status(404).json({ mensagem: `não há semanas de captura para a empresa com id ${idEmpresa}` });
    } else {
      res.status(200).json(resultado);
    }
  });
}

function obterCards(req, res) {
  var idEmpresa = req.params.idEmpresa;
  var numeroSemana = req.params.numeroSemana;

  empresaModel.obterCards(idEmpresa, numeroSemana).then((resultado) => {
    if (resultado.length == 0) {
      res.status(404).json({ mensagem: `não há cards para a empresa com id ${idEmpresa} na semana ${numeroSemana}` });
    } else {
      res.status(200).json(resultado);
    }
  });
}

function obterMapaSemana(req, res) {
  var idEmpresa = req.params.idEmpresa;
  var numeroSemana = req.params.numeroSemana;

  empresaModel.obterMapaSemana(idEmpresa, numeroSemana).then((resultado) => {
    if (resultado.length == 0) {
      res.status(404).json({ mensagem: `não há mapa para a empresa com id ${idEmpresa} na semana ${numeroSemana}` });
    } else {
      res.status(200).json(resultado);
    }
  });
}

function obterPacotes(req, res) {
  var idEmpresa = req.params.idEmpresa;

  empresaModel.obterPacotes(idEmpresa).then((resultado) => {
    if (resultado.length == 0) {
      res.status(404).json({ mensagem: `não há pacotes para a empresa com id ${idEmpresa}` });
    } else {
      res.status(200).json(resultado);
    }
  });
}

function obterQtdMaquinasPorSemana(req, res) {
  var idEmpresa = req.params.idEmpresa;

  empresaModel.obterQtdMaquinasPorSemana(idEmpresa).then((resultado) => {
    if (resultado.length == 0) {
      res.status(404).json({ mensagem: `não há maquinas que realizaram medidas históricas para a empresa de id: ${idEmpresa}` });
    } else {
      res.status(200).json(resultado);
    }
  });
}

function obterQtdAlertasSemana(req, res) {
  var idEmpresa = req.params.idEmpresa;

  empresaModel.obterQtdAlertasSemana(idEmpresa).then((resultado) => {
    if (resultado.length == 0) {
      res.status(404).json({ mensagem: `não há contagem de alertas de rede para a empresa de id: ${idEmpresa}` });
    } else {
      res.status(200).json(resultado);
    }
  });
}

module.exports = {
  buscarPorCnpj,
  buscarPorId,
  cadastrar,
  listar,
  obterSemanas,
  obterCards,
  obterMapaSemana,
  obterPacotes,
  obterQtdMaquinasPorSemana,
  obterQtdAlertasSemana
};
