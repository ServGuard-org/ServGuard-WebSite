var usuarioModel = require("../models/usuarioModel");

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está indefinida!");
    } else {

        usuarioModel.autenticar(email, senha)
            .then(
                function (resultadoAutenticar) {
                    console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                    console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String

                    if (resultadoAutenticar.length == 1) {

                        res.json({
                            idUsuario: resultadoAutenticar[0].idUsuario,
                            email: resultadoAutenticar[0].email,
                            nome: resultadoAutenticar[0].nome,
                            senha: resultadoAutenticar[0].senha,
                            isAdm: resultadoAutenticar[0].isAdm,
                            fkEmpresa: resultadoAutenticar[0].empresaId
                        });
                    } else if (resultadoAutenticar.length == 0) {
                        res.status(403).send("Email e/ou senha inválido(s)");
                    } else {
                        res.status(403).send("Mais de um usuário com o mesmo login e senha!");
                    }
                }).catch(
                    function (erro) {
                        console.log(erro);
                        console.log("\nHouve um erro ao realizar o login! Erro: ", erro.sqlMessage);
                        res.status(500).json(erro.sqlMessage);
                    }
                );
    }

}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var isAdm = req.body.tipoUsuarioServer;
    var cnpj = req.body.cnpjServer;
    var idEmpresa = req.body.idEmpresaServer;

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else {
        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        console.log("Chamando o método da model")
        usuarioModel.cadastrar(nome, email, senha, isAdm, cnpj, idEmpresa)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function alterar(req, res) {

    let nome = req.body.nome;
    let email = req.body.email;
    let isAdm = req.body.isAdm;
    let idUsuario = req.body.isAdm;

    usuarioModel.alterar(nome, email, isAdm, idUsuario)
    .then(
        function (resultado) {
            res.json(resultado);
        }
    ).catch(
        function (erro) {
            console.log(erro);
            console.log(
                "\nHouve um erro ao atualizar os dados de usuário! Erro: ",
                erro.sqlMessage
            );
            res.status(500).json(erro.sqlMessage);
        }
    );

}

function ativar(req, res) {
    idUsuario = req.params.idUsuario;

    usuarioModel.ativar(idUsuario)
    .then(
        function (resultado) {
            res.json(resultado);
        }
    ).catch(
        function (erro) {
            console.log(erro);
            console.log(
                "\nHouve um erro ao ativar o usuário! Erro: ",
                erro.sqlMessage
            );
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function inativar(req, res) {
    idUsuario = req.params.idUsuario;

    usuarioModel.inativar(idUsuario)
    .then(
        function (resultado) {
            res.json(resultado);
        }
    ).catch(
        function (erro) {
            console.log(erro);
            console.log(
                "\nHouve um erro ao inativar o usuário! Erro: ",
                erro.sqlMessage
            );
            res.status(500).json(erro.sqlMessage);
        }
    );
}

function listarPorEmpresa(req, res) {

    idEmpresa = req.params.idEmpresa;

    usuarioModel.listarPorEmpresa(idEmpresa)
    .then(
        function (resultado) {

            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send(`Não foi encontrado nenhum usuário para a empresa de id = ${idEmpresa}`);
            }
        }
    ).catch(
        function (erro) {
            console.log(erro);
            console.log(
                "\nHouve um erro ao inativar o usuário! Erro: ",
                erro.sqlMessage
            );
            res.status(500).json(erro.sqlMessage);
        }
    );

}

module.exports = {
    autenticar,
    cadastrar,
    alterar,
    ativar,
    inativar,
    listarPorEmpresa
}