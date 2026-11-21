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

function obterIndicadores() {
    console.log("Acesso a consulta dos indicadores foi realizada com sucesso")
    var instrucaoSql = `
            SELECT * FROM vw_progresso_usuarios;
    `
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function obterEstrelas() {
    console.log("Acesso a consulta das avaliações foi realizada com sucesso")
    var instrucaoSql = `
            SELECT u.id, u.nome, a.qtd_estrelas, a.descricao
            FROM usuario u
            LEFT JOIN avaliacao a ON a.fk_usuario = u.id;
    `
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    consultaPersonagem,
    obterIndicadores,
    obterEstrelas
}