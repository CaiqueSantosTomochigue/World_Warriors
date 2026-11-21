var database = require("../database/config")

function consultaPersonagem() {
    console.log("Acesso a consulta dos personagens foi realizada com sucesso")
    var instrucaoSql = `
            SELECT COUNT(usuario.fk_escolha_personagem) AS votos, escolha_personagem.nome FROM usuario
            RIGHT JOIN escolha_personagem
                ON usuario.fk_escolha_personagem = escolha_personagem.id
            GROUP BY escolha_personagem.nome
                ORDER BY votos DESC;
        `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    consultaPersonagem
}