var medidaModel = require("../models/medidaModel");

function buscarDadosHistograma(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarDadosHistograma(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas de hitograma.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarEscalaInstabilidade(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarEscalaInstabilidade(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar a escala de instabilidade.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMapaInstabilidade(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarMapaInstabilidade(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o mapa de instabilidade.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUsoRecursoPorMaquina(req,res) {
    var idEmpresa = req.params.idEmpresa;
    var idRecurso = req.params.idRecurso;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    if (idRecurso == undefined){
        console.log("Id recurso está undefined")
    }
    medidaModel.buscarUsoRecursoPorMaquina(idEmpresa, idRecurso).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar dados do gráfico por recurso.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMaquinasConnect(req, res){
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
        return res.status(400).send("Id da empresa é obrigatório.");
    }
    medidaModel.buscarMaquinasConnect(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as máquinas conectadas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarDadosHistograma,
    buscarEscalaInstabilidade,
    buscarMapaInstabilidade,
    buscarUsoRecursoPorMaquina,
    buscarMaquinasConnect
}