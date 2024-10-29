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

function buscarIrregularidadeCpu(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarIrregularidadeCpu(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas irregularidades de CPU.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarIrregularidadeRam(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarIrregularidadeRam(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas irregularidades de RAM.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarIrregularidadeDisco(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarIrregularidadeDisco(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas irregularidades de DISCO.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}


module.exports = {
    buscarDadosHistograma,
    buscarIrregularidadeCpu,
    buscarIrregularidadeRam,
    buscarIrregularidadeDisco
}