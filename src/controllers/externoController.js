const fetch = require('node-fetch');

function check(req, res) {
    let url = req.params.url;

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

module.exports = {
    check
}