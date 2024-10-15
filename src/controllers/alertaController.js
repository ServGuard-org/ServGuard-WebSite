
var alertaModel = require("../models/alertaModel");

function atualizarPorMaquina(req, res) {
    let idMaquina = req.params.idMaquina;
    let usoCPU = req.body.usoCPU;
    let usoRAM = req.body.usoRAM;

    alertaModel.atualizarPorMaquina(idMaquina, usoCPU, usoRAM)
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

module.exports = { atualizarPorMaquina };