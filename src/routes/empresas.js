var express = require("express");
var router = express.Router();

var empresaController = require("../controllers/empresaController");

//Recebendo os dados do html e direcionando para a função cadastrar de usuarioController.js
router.post("/cadastrar", function (req, res) {
    empresaController.cadastrar(req, res);
})

router.get("/buscar", function (req, res) {
    empresaController.buscarPorCnpj(req, res);
});

router.get("/buscar/:id", function (req, res) {
  empresaController.buscarPorId(req, res);
});

router.get("/listar", function (req, res) {
  empresaController.listar(req, res);
});

router.get("/obterSemanas/:idEmpresa", function (req, res) {
  empresaController.obterSemanas(req, res);
});

router.get("/obterCards/:idEmpresa/:numeroSemana", function (req, res) {
  empresaController.obterCards(req, res);
});

router.get("/obterMapaSemana/:idEmpresa/:numeroSemana", function (req, res) {
  empresaController.obterMapaSemana(req, res);
});

router.get("/obterPacotes/:idEmpresa", function (req, res) {
  empresaController.obterPacotes(req, res);
});

router.get("/obterQtdMaquinasPorSemana/:idEmpresa", function (req, res) {
  empresaController.obterQtdMaquinasPorSemana(req, res);
});

router.get("/obterQtdAlertasSemana/:idEmpresa", function (req, res) {
  empresaController.obterQtdAlertasSemana(req, res);
});

module.exports = router;