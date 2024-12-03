const express = require('express');
const router = express.Router();
const recursoController = require("../controllers/recursoController");


router.get("/buscarUltimosDadosRede/:idEmpresa", function (req, res) {
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

router.get("/rankingRecurso/:idEmpresa", function (req, res) {
    recursoController.buscarRankingRecurso(req,res);
});

router.get("/buscarUltimosDadosDownload/:idEmpresa", function (req, res) {
    console.log("Requisição recebida para buscar dados de download para empresa:", req.params.idEmpresa);
    recursoController.buscarUltimosDadosDownload(req, res);
});

router.get("/buscarUltimosDadosUpload/:idEmpresa", function (req, res) {
    console.log("Requisição recebida para buscar dados de upload para empresa:", req.params.idEmpresa);
    recursoController.buscarUltimosDadosUpload(req, res);
});
router.get("/buscarUltimoHorario/:idEmpresa", function (req, res) {
    console.log("Requisição recebida para buscar dados de horario para empresa:", req.params.idEmpresa);
    recursoController.buscarUltimoHorario(req, res);
});
router.get("/buscarUltimosDadosPacotes/:idEmpresa", function (req, res) {
    console.log("Requisição recebida para buscar dados de pacotes para empresa:", req.params.idEmpresa);
    recursoController.buscarUltimosDadosPacotes(req, res);
});
router.get("/buscarPerda/:idEmpresa", function (req, res) {
    console.log("Requisição recebida para buscar dados de perda pacotes para empresa:", req.params.idEmpresa);
    recursoController.buscarPerda(req, res);
});


module.exports = router;