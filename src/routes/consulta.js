var express = require("express");
var router = express.Router();

var consultaController = require("../controllers/consultaController");

router.get("/consultaPersonagem", function (req, res) {
    consultaController.consultaPersonagem(req, res);
});

router.get("/obterIndicadores", function (req, res) {
    consultaController.obterIndicadores(req, res);
});

router.get("/obterEstrelas", function (req, res) {
    consultaController.obterEstrelas(req, res);
});

module.exports = router;