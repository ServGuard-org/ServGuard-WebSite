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

router.post("/atualizarNomePorId", function (req, res) {
    maquinaController.atualizarNomePorId(req, res);
});

router.post("/atualizarRackPorId", function (req, res) {
    maquinaController.atualizarRackPorId(req, res);
});

router.get("/listarPorEmpresa/:idEmpresa", function (req, res) {
    maquinaController.listarPorEmpresa(req, res);
})

module.exports = router;