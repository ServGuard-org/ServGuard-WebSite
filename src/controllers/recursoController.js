const recursoModel = require("../models/recursoModel");

function buscarUltimosDadosRede(req, res) {
    var idEmpresa = req.params.idEmpresa;

    console.log("Erro no recursoController");

    if (idEmpresa == undefined) {
        res.status(400).send("O ID da máquina está indefinido!");
    } else {
        recursoModel.buscarUltimosDadosRede(idEmpresa)
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

function buscarRankingRecurso(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    recursoModel.buscarRankingRecurso(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o ranking recurso.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarUltimosDadosRede,
    buscarIrregularidadeCpu,
    buscarIrregularidadeRam,
    buscarIrregularidadeDisco,
    buscarRankingRecurso
};
