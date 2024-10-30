var express = require("express");
var router = express.Router();
var medidaController = require("../controllers/medidaController");

router.get("/histograma/:idEmpresa", function (req, res) {
    medidaController.buscarDadosHistograma(req,res);
});

router.get("/escalaInstabilidade/:idEmpresa", function (req, res) {
    medidaController.buscarEscalaInstabilidade(req,res);
});

module.exports = router;