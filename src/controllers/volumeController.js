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

function associarVolume(req, res){

    let idMaquinaVolume = req.body.idMaquinaVolume;
    let idVolume = req.body.idVolume;

    console.log("Dentro de associarVolume() na volumeController!");

    if (idMaquinaVolume == undefined || idVolume == undefined){
        res.status(400).send("O ID da máquina ou do volume está indefinido!")
    } else {
        associarModel.associarVolume(idMaquinaVolume, idVolume)
        .then(
            function(resposta) {
                res.json(resposta);
            }
        ).catch(
            function(erro){
                console.log(erro);
                console.log(
                    "\nHouve um erro ao realizar ao associar o volume! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage)
            }
        )
    }

}

function desassociarVolume(req, res){
    let idMaquinaVolume = req.body.idMaquinaVolume;
    let idVolume = req.body.idVolume;

    console.log("Dentro de desassociarVolume() volumeController!");

    if(idMaquinaVolume == undefined || idVolume == undefined){
        res.status(400).send("O ID da máquina ou do volume está indefinido")
    } else {
        volumeModel.desassociarVolume(idMaquinaVolume, idVolume)
        .then(
        function(resposta){
            res.json(resposta);
            }
        ).catch(
            function(erro){
                console.log(erro);
                console.log(
                    "\nHouve um erro ao desassociar o volume da máquina! Erro: ",
                    erro.sqlMessage
                );
                res.status(500).json(erro.sqlMessage);
            }
        )
    
    }
        
    
}


module.exports = {
    cadastrar,
    associarVolume,
    desassociarVolume
}