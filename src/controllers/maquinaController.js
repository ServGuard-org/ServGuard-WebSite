var maquinaModel = require("../models/maquinaModel");

function cadastrar(req, res) {
    let idEmpresa = req.body.idEmpresa;
    let nome = req.body.nome;
    let rack = req.body.rack;

    console.log("Dentro de cadastrar() na maquinaController!");

    maquinaModel.cadastrar(idEmpresa, nome, rack)
        .then(
            function (resposta) {
                res.json(resposta);
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        )

}

function inativarPorId(req, res) {
    let idMaquina = req.params.idMaquina;

    maquinaModel.inativarPorId(idMaquina)
        .then(
            function (resposta) {
                res.json(resposta)
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        )
}

function ativarPorId(req, res) {
    let idMaquina = req.params.idMaquina;

    maquinaModel.ativarPorId(idMaquina)
        .then(
            function (resposta) {
                res.json(resposta)
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        )
}

function atualizarNomePorId(req, res) {
    let idMaquina = req.body.idMaquina;
    let nome = req.body.nome;

    maquinaModel.atualizarNomePorId(idMaquina, nome)
        .then(
            function (resposta) {
                res.json(resposta)
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        )
}

function atualizarRackPorId(req, res) {
    let idMaquina = req.body.idMaquina;
    let rack = req.body.rack;

    maquinaModel.atualizarRackPorId(idMaquina, rack)
        .then(
            function (resposta) {
                res.json(resposta)
            }
        ).catch(
            function (erro) {
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar o cadastro! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        )
}

function listarPorEmpresa(req, res) {
    let idEmpresa = req.params.idEmpresa;

    maquinaModel.listarPorEmpresa(idEmpresa)
        .then(
            resposta => {
                if (resposta.length > 0) {
                    res.status(200).json(resposta)
                } else {
                    res.status(204).send(`Não foi encontrada nenhuma máquina para esta empresa! idEmpresa: ${idEmpresa} `);
                }
            }
        ).catch(erro => {
            console.log(erro);
            console.log("Houve um erro ao buscar as máquinas por empresa: ", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

module.exports = {
    cadastrar, inativarPorId, ativarPorId, atualizarNomePorId, atualizarRackPorId, listarPorEmpresa
}