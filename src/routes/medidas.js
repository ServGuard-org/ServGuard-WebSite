var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/buscar/histograma", function (res) {
    medidaController.buscarDadosHistograma(res);
});

module.exports = router;