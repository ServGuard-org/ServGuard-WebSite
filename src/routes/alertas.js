var express = require("express");
var router = express.Router();

router.get("/ultimas/:idAquario", function (req, res) {
    medidaController.buscarUltimasMedidas(req, res);
});

module.exports = router;