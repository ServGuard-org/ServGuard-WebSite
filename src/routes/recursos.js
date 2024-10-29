const express = require('express');
const router = express.Router();
const medidaController = require("../controllers/recursoController");


router.get("/buscarUltimosDadosRede/:idMaquina", function (req, res) {
    medidaController.buscarUltimosDadosRede(req, res);
});

module.exports = {router,  buscarUltimosDadosRede};