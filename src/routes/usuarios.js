var express = require("express");
var router = express.Router();

var usuarioController = require("../controllers/usuarioController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    usuarioController.cadastrar(req, res);
})

router.post("/autenticar", function (req, res) {
    usuarioController.autenticar(req, res);
});

router.post("/alterar", function (req, res) {
    usuarioController.alterar(req, res);
});

router.get("/ativar/:idUsuario", function (req, res) {
    usuarioController.ativar(req, res);
});

router.get("/inativar/idUsuario", function (req, res) {
    usuarioController.inativar(req, res);
});

router.get("/listarPorEmpresa/:idEmpresa", function (req, res) {
    usuarioController.listarPorEmpresa(req, res);
});

module.exports = router;