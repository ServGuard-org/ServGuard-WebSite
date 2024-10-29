<<<<<<< HEAD
var recursoModel = require("../models/recursoModel");



module.exports = {  }
=======
const recursoModel = require("../models/recursoModel");

function buscarUltimosDadosRede(req, res) {
    var idMaquina = req.params.idMaquina;

    console.log("Erro no recursoController");

    if (idMaquina == undefined) {
        res.status(400).send("O ID da máquina está indefinido!");
    } else {
        recursoModel.buscarUltimosDadosRede(idMaquina)
            .then(function (resposta) {
                console.log("Resultados ao buscar últimos dados de rede:", JSON.stringify(resposta));
                res.json(resposta);
            })
            .catch(function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao buscar os dados de rede! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function buscarIrregularidadeCpu(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    recursoModel.buscarIrregularidadeCpu(idEmpresa).then(function (resultado) {
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
    recursoModel.buscarIrregularidadeRam(idEmpresa).then(function (resultado) {
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
    recursoModel.buscarIrregularidadeDisco(idEmpresa).then(function (resultado) {
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
    buscarUltimosDadosRede,
    buscarIrregularidadeCpu,
    buscarIrregularidadeRam,
    buscarIrregularidadeDisco
};
>>>>>>> 2c5ca5518c8f585ca6dc96633a6459483b14e61a
