const consultaModel = require("../models/consultaModel");

function consultaPersonagem(req, res) {
    consultaModel.consultaPersonagem()
    .then(resposta => {
        res.status(200).json(resposta);
    })
    .catch(erro => {
        res.status(503).send("Erro no Banco");
    })

}

module.exports = {
    consultaPersonagem
}