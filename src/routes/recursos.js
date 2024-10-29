const express = require('express');
const router = express.Router();
const recursoController = require("../controllers/recursoController");


router.get("/buscarUltimosDadosRede/:idMaquina", function (req, res) {
    recursoController.buscarUltimosDadosRede(req, res);
});

router.get("/irregularidade/cpu/:idEmpresa", function (req, res) {
    recursoController.buscarIrregularidadeCpu(req,res);
});

router.get("/irregularidade/ram/:idEmpresa", function (req, res) {
    recursoController.buscarIrregularidadeRam(req,res);
});

router.get("/irregularidade/disco/:idEmpresa", function (req, res) {
    recursoController.buscarIrregularidadeDisco(req,res);
});

module.exports = router;