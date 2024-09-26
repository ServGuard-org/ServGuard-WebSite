var express = require("express");
var router = express.Router();

var volumeController = require("../controllers/volumeController");

router.post("/cadastrar", function (req, res) {
    volumeController.cadastrar(req, res);
});

router.post("/associarVolume/", function (req, res){
    volumeController.associarVolume(req, res);
});

router.post("/desassociarVolume/", function (req, res){
    volumeController.desassociarVolume(req, res);
});

module.exports = router;