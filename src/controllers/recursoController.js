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

module.exports = {
    buscarUltimosDadosRede
};
