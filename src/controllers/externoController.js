const fetch = require('node-fetch');
const { GoogleGenerativeAI } = require("@google/generative-ai");
const externoModel = require('../models/externoModel');

function check(req, res) {
    let url = req.body.url;

    fetch(url)
    .then( resposta => {
        if (resposta.status >= 200 && resposta.status < 300) {
            res.status(200).json({ status: "Ativo", statusCode: resposta.status });
        } else {
            res.status(200).json({ status: "Inativo", statusCode: resposta.status });
        }
    })
    .catch( erro => {
        res.status(500).json({ status: "Erro", message: "Falha ao buscar a URL", erro: erro.message });
    })

}

function GenAIPerguntar(req, res) {
    const pergunta = req.body.pergunta;

    gerarResposta(pergunta).then( resposta => {
        res.status(200).json({ resposta: resposta });
    }).catch( erro => {
        res.status(500).json({ status: "Erro", message: "Falha ao gerar resposta", erro: erro.message});
    });

    async function gerarResposta(mensagem) {

        let chaveGemini = null;

        try {
            const respostaBanco = await externoModel.obterChaveGemini();
            chaveGemini = String(respostaBanco[0].chave);
        } catch (error) {
            console.error(`Erro ao obter chave gemini do banco de dados.`);
        }

        if (!chaveGemini) {
            console.error(` Tentando obter a chave do .env...`);
            chaveGemini = process.env.CHAVE_GEMINI;
        }

        if(chaveGemini) {
            console.log("Chave da API do Gemini Obtida com Sucesso...");
        }

        // instanciando a classe GoogleGenerativeAI
        const chatIA = new GoogleGenerativeAI(chaveGemini);
        // obtendo o modelo de IA
        const modeloIA = chatIA.getGenerativeModel({ model: "gemini-pro" });
    
        try {
            // gerando conteúdo com base na pergunta
            const resultado = await modeloIA.generateContent(`${mensagem}`);
            const resposta = await resultado.response.text();
            
            console.log('Requisição na API do Gemini feita, resposta: ', resposta);
    
            return resposta;
        } catch (error) {
            console.error(error);
            throw error;
        }
    }

}

module.exports = {
    check, GenAIPerguntar
}