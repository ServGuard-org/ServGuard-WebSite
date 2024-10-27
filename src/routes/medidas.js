var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/histograma", function (req, res) {
    medidaController.buscarDadosHistograma(req,res);
});

module.exports = router;