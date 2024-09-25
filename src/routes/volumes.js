var express = require("express");
var router = express.Router();

var volumeController = require("../controllers/volumeController");

router.post("/cadastrar", function (req, res) {
    volumeController.cadastrar(req, res);
});

module.exports = router;