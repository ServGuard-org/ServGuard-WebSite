var express = require("express");
var router = express.Router();

const alertaController = require("../controllers/alertaController");

router.post("/atualizarPorMaquina/:idMaquina", function (req, res) {
    alertaController.atualizarPorMaquina(req, res);
});

module.exports = router;