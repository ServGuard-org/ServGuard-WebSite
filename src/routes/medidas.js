var express = require("express");
var router = express.Router();
var medidaController = require("../controllers/medidaController");

router.get("/histograma/:idEmpresa", function (req, res) {
    medidaController.buscarDadosHistograma(req,res);
});

router.get("/escalaInstabilidade/:idEmpresa", function (req, res) {
    medidaController.buscarEscalaInstabilidade(req,res);
});


router.get("/mapaInstabilidade/:idEmpresa", function (req, res) {
    medidaController.buscarMapaInstabilidade(req,res);
});

router.get("/graficoRecurso/:idEmpresa/:idRecurso", function (req, res) {
    medidaController.buscarUsoRecursoPorMaquina(req,res);
});

router.get("/buscarMaquinasConnect/:idEmpresa", function (req, res) {
    medidaController.buscarMaquinasConnect(req,res);
});

router.get("/medidasAlertas/:idEmpresa", function (req, res) {
    medidaController.buscarDadosAlerta(req,res);
});

router.get("/listaAlertas/:idEmpresa", function (req, res) {
    medidaController.buscarListaAlertas(req,res);
});

router.get("/distribuicaoAlertas/:idEmpresa", function (req, res) {
    medidaController.buscarDistribuicaoAlertas(req,res);
});

module.exports = router;