var express = require("express");
var router = express.Router();

var maquinaController = require("../controllers/maquinaController");

router.post("/cadastrar", function (req, res) {
    maquinaController.cadastrar(req, res);
});

router.get("/inativarPorId/:idMaquina", function (req, res) {
    maquinaController.inativarPorId(req, res);
});

router.get("/ativarPorId/:idMaquina", function (req, res) {
    maquinaController.ativarPorId(req, res);
});

router.post("/atualizarApelidoPorId", function (req, res) {
    maquinaController.atualizarApelidoPorId(req, res);
});

router.get("/listarPorEmpresa/:idEmpresa", function (req, res) {
    maquinaController.listarPorEmpresa(req, res);
});

router.get("/listarPorId/:idMaquina", function (req, res) {
    maquinaController.listarPorId(req, res);
});

router.get("/listarAlertaPorId/:idMaquina", function (req, res) {
    maquinaController.listarAlertaPorId(req, res);
});

router.get("/listarVolumesPorMaquina/:idMaquina", function (req, res) {
    maquinaController.listarVolumesPorMaquina(req, res);
});

router.get("/dadosTempoReal/:idMaquina", function (req, res) {
    maquinaController.dadosTempoReal(req, res);
});

module.exports = router;