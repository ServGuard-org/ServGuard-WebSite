
var alertaModel = require("../models/alertaModel");

function atualizarPorMaquina(req, res) {
    let idMaquina = req.params.idMaquina;
    let usoCPU = req.body.usoCPU;
    let usoRAM = req.body.usoRAM;
    let usoTotal = req.body.usoTotal;
    let velocidadeDownload = req.body.velocidadeDownload;
    let velocidadeUpload = req.body.velocidadeUpload;
    let erroPacotesEntrada = req.body.erroPacotesEntrada;
    let erroPacotesSaida = req.body.erroPacotesSaida;
    let descartePacotesEntrada = req.body.descartePacotesEntrada;
    let descartePacotesSaida = req.body.descartePacotesSaida;
    let megabytesRecebidos = req.body.megabytesRecebidos;
    let megabytesEnviados = req.body.megabytesEnviados;
    let pacotesRecebidos = req.body.pacotesRecebidos;
    let pacotesEnviados = req.body.pacotesEnviados;

    alertaModel.atualizarPorMaquina(
        idMaquina, 
        usoCPU, 
        usoRAM, 
        usoTotal,
        velocidadeDownload,
        velocidadeUpload,
        erroPacotesEntrada,
        erroPacotesSaida,
        descartePacotesEntrada,
        descartePacotesSaida,
        megabytesRecebidos,
        megabytesEnviados,
        pacotesRecebidos,
        pacotesEnviados
    )
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