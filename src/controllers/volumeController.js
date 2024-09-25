var volumeModel = require("../models/volumeModel");

function cadastrar(req, res) {

    let tipo = req.body.tipo;
    let capacidade = req.body.capacidade;

    volumeModel.cadastrarVolume(tipo, capacidade)
        .then(
            function (resposta) {
                console.log("Resultados cadastrando Volume:", JSON.stringify(resposta));

                res.json(resposta);
                // aqui dentro, chamar o relacionarVolumeMaquina na model

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

module.exports = {
    cadastrar
}