var express = require("express");
var router = express.Router();
var medidaController = require("../controllers/medidaController");

router.get("/histograma/:idEmpresa", function (req, res) {
    medidaController.buscarDadosHistograma(req,res);
});

router.get("/escalaInstabilidade/:idEmpresa", function (req, res) {
    medidaController.buscarEscalaInstabilidade(req,res);
});

router.get("/totalMedicoes/:idEmpresa/:idMaquina", function(req, res){
    medidaController.buscarMedicoes(req,res);
});

router.get("/porcentagemAlertasCPU/:idEmpresa/:idMaquina", function(req, res){
    medidaController.buscarPorcentagemAlertasCPU(req,res);
});

router.get("/porcentagemAlertasRAM/:idEmpresa/:idMaquina", function(req, res){
    medidaController.buscarPorcentagemAlertasRAM(req,res);
});

router.get("/mediaGaugeCPU/:idEmpresa/:idMaquina", function(req, res){
    medidaController.buscarMediaGaugeCPU(req,res);
});

router.get("/mediaGaugeRAM/:idEmpresa/:idMaquina", function(req, res){
    medidaController.buscarMediaGaugeRAM(req,res);
});

router.get("/usoTotalsemanal/:idEmpresa/:idMaquina", function(req, res){
    medidaController.buscarUsoTotalSemanal(req,res);
});

router.get("/mapaInstabilidade/:idEmpresa", function (req, res) {
    medidaController.buscarMapaInstabilidade(req,res);
});

router.get("/graficoRecurso/:idEmpresa/:idRecurso", function (req, res) {
    medidaController.buscarUsoRecursoPorMaquina(req,res);
});

router.get("/buscarMaquinasConnect/:idEmpresa", function (req, res) {
    medidaController.buscarMaquinasConnect(req,res);
});

router.get("/medidasAlertas/:idEmpresa", function (req, res) {
    medidaController.buscarDadosAlerta(req,res);
});

router.get("/listaAlertas/:idEmpresa", function (req, res) {
    medidaController.buscarListaAlertas(req,res);
});

router.get("/distribuicaoAlertas/:idEmpresa", function (req, res) {
    medidaController.buscarDistribuicaoAlertas(req,res);
});

router.get("/dadosGraficoAlertas/:idEmpresa", function (req, res) {
    medidaController.buscarDadosGraficoAlertas(req,res);
});

router.get("/usohardwarealto/:idEmpresa", function(req,res){
    medidaController.buscarUsoHardwareAlto(req,res);
});

router.get("/usoDiscoAlto/:idEmpresa", function (req, res){
    medidaController.buscarUsoDiscoAlto(req,res);
});

router.get("/usoRamCpuPorMaquina/:idEmpresa", function (req, res){
    medidaController.buscarRamCpuMaquina(req,res);
});

router.get("/usoDiscoMaquinas/:idEmpresa", function(req, res){
    medidaController.buscarUsoDiscoMaquinas(req,res);
});

router.get("/usoProcessamentoUltimos7/:idEmpresa", function(req, res){
    medidaController.buscarUsoProcessamentoUltimos7(req,res);
});

router.get("/usoMaquinaHistorico/:idEmpresa", function(req,res){
    medidaController.buscarHistoricoMaquina(req,res);
});

module.exports = router;