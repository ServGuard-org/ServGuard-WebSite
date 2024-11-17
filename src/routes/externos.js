const express = require("express");
const router = express.Router();

const externoController = require("../controllers/externoController")

router.post("/check", function (req, res) {
   externoController.check(req, res);
});

router.post("/GenAI/Perguntar", function (req, res) {
   externoController.GenAIPerguntar(req, res);
});

module.exports = router;