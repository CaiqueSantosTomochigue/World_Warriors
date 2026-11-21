var express = require("express");
var router = express.Router();

var consultaController = require("../controllers/consultaController");

router.get("/consultaPersonagem", function (req, res) {
    consultaController.consultaPersonagem(req, res);
});

module.exports = router;