var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/histograma/:idEmpresa", function (req, res) {
    medidaController.buscarDadosHistograma(req,res);
});

router.get("/irregularidade/cpu/:idEmpresa", function (req, res) {
    medidaController.buscarIrregularidadeCpu(req,res);
});

router.get("/irregularidade/ram/:idEmpresa", function (req, res) {
    medidaController.buscarIrregularidadeRam(req,res);
});

router.get("/irregularidade/disco/:idEmpresa", function (req, res) {
    medidaController.buscarIrregularidadeDisco(req,res);
});

module.exports = router;