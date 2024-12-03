const recursoModel = require("../models/recursoModel");

function buscarUltimosDadosRede(req, res) {
    var idEmpresa = req.params.idEmpresa;

    console.log("Erro no recursoController");

    if (idEmpresa == undefined) {
        res.status(400).send("O ID da máquina está indefinido!");
    } else {
        recursoModel.buscarUltimosDadosRede(idEmpresa)
            .then(function (resposta) {
                console.log("Resultados ao buscar últimos dados de rede:", JSON.stringify(resposta));
                res.json(resposta);
            })
            .catch(function (erro) {
                console.log(erro);
                console.log("\nHouve um erro ao buscar os dados de rede! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function buscarIrregularidadeCpu(req, res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined) {
        console.log("Id empresa está undefined")
    }
    recursoModel.buscarIrregularidadeCpu(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas irregularidades de CPU.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarIrregularidadeRam(req, res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined) {
        console.log("Id empresa está undefined")
    }
    recursoModel.buscarIrregularidadeRam(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas irregularidades de RAM.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarIrregularidadeDisco(req, res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined) {
        console.log("Id empresa está undefined")
    }
    recursoModel.buscarIrregularidadeDisco(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas irregularidades de DISCO.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarRankingRecurso(req, res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined) {
        console.log("Id empresa está undefined")
    }
    recursoModel.buscarRankingRecurso(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o ranking recurso.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUltimosDadosDownload(req, res) {
    var idEmpresa = req.params.idEmpresa;

    if (idEmpresa == undefined) {
        console.log("ID da empresa está undefined");
        res.status(400).send("O ID da empresa é obrigatório.");
        return;
    }

    recursoModel.buscarUltimosDadosDownload(idEmpresa)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado[0]);
            } else {
                res.status(204).send("Nenhum dado de download encontrado!");
            }
        })
        .catch(function (erro) {
            console.log("Erro ao buscar os últimos dados de download:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarUltimosDadosUpload(req, res) {
    var idEmpresa = req.params.idEmpresa;

    if (idEmpresa == undefined) {
        console.log("ID da empresa está undefined");
        res.status(400).send("O ID da empresa é obrigatório.");
        return;
    }

    recursoModel.buscarUltimosDadosUpload(idEmpresa)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado[0]);
            } else {
                res.status(204).send("Nenhum dado de upload encontrado!");
            }
        })
        .catch(function (erro) {
            console.log("Erro ao buscar os últimos dados de upload:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarUltimosDadosPacotes(req, res) {
    var idEmpresa = req.params.idEmpresa;

    if (idEmpresa == undefined) {
        res.status(400).send("O ID da empresa está indefinido!");
    } else {
        recursoModel.buscarUltimosDadosPacotes(idEmpresa)
            .then(function (resposta) {
                if (resposta.length > 0) {
                    res.json(resposta);
                } else {
                    res.status(404).send("Nenhum dado encontrado para a empresa.");
                }
            })
            .catch(function (erro) {
                console.log("\nErro ao buscar dados de pacotes: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            });
    }
}

function buscarUltimoHorario(req, res) {
    var idEmpresa = req.params.idEmpresa;

    if (idEmpresa == undefined) {
        res.status(400).send("O ID da empresa está indefinido!");
    } else {
        // Chama a função da model para buscar o último horário
        recursoModel.buscarUltimoHorario(idEmpresa)
            .then(function (resposta) {
                if (resposta.length > 0) {
                    res.json(resposta); // Retorna os dados encontrados em formato JSON
                } else {
                    res.status(404).send("Nenhum dado encontrado para a empresa.");
                }
            })
            .catch(function (erro) {
                console.log("\nErro ao buscar o último horário: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage); // Retorna erro em caso de falha na consulta
            });
    }
}

function buscarPerda(req, res) {
    var idEmpresa = req.params.idEmpresa;
  
    if (idEmpresa == undefined) {
      return res.status(400).send("O ID da empresa está indefinido!");
    }
  
    recursoModel.buscarPerda(idEmpresa)
      .then(function (resposta) {
        console.log("Resultados ao buscar perda de pacotes:", JSON.stringify(resposta, null, 2));
  
        if (resposta.length > 0) {
          res.status(200).json(resposta); // Enviar resposta ao cliente
        } else {
          res.status(204).send("Nenhum dado encontrado.");
        }
      })
      .catch(function (erro) {
        console.error("Erro ao buscar perda de pacotes:", erro);
        res.status(500).json({ erro: "Erro ao buscar dados de perda de pacotes.", detalhe: erro });
      });
  }
  

module.exports = {
    buscarUltimosDadosRede,
    buscarIrregularidadeCpu,
    buscarIrregularidadeRam,
    buscarIrregularidadeDisco,
    buscarRankingRecurso,
    buscarUltimosDadosDownload,
    buscarUltimosDadosUpload,
    buscarUltimosDadosPacotes,
    buscarUltimoHorario,
    buscarPerda
};
