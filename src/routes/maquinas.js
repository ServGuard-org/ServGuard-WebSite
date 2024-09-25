var express = require("express");
var router = express.Router();

var maquinaController = require("../controllers/maquinaController");

router.post("/cadastrar", function (req, res) {
    maquinaController.cadastrar(req, res);
});

router.post("/deletarPorId/:idMaquina", function (req, res) {
    maquinaController.deletarPorId(req, res);
});

router.post("/atualizarNomePorId/:idMaquina", function (req, res) {
    maquinaController.atualizarNomePorId(req, res);
});

router.post("/atualizarRackPorId/:idMaquina", function (req, res) {
    maquinaController.atualizarRackPorId(req, res);
});

router.post("/listarPorEmpresa/:idEmpresa", function (req, res) {
    maquinaController.listarPorEmpresa(req, res);
})

module.exports = router;