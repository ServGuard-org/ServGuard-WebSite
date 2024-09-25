var maquinaModel = require("../models/maquinaModel");

function cadastrar(req, res) {
    let idEmpresa = req.body.idEmpresa;
    let nome = req.body.nome;
    let rack = req.body.rack;

    console.log("Dentro de cadastrar() na maquinaController!");

    maquinaModel.cadastrar(idEmpresa, nome, rack)
        .then(
            function(resposta) {
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

module.exports = {
    cadastrar
}