var medidaModel = require("../models/medidaModel");

function buscarDadosHistograma(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarDadosHistograma(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as ultimas medidas de hitograma.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarEscalaInstabilidade(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarEscalaInstabilidade(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar a escala de instabilidade.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMedicoes(req, res) {
    var idEmpresa = req.params.idEmpresa;
    var idMaquina = req.params.idMaquina;

    if (idEmpresa == undefined || idMaquina == undefined) {
        console.log("Id empresa ou Id máquina está undefined");
        return res.status(400).send("Id da empresa ou da máquina não foi fornecido.");
    }

    medidaModel
        .buscarMedicoes(idEmpresa, idMaquina)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!");
            }
        })
        .catch(function (erro) {
            console.log("Houve um erro ao buscar as medições:", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarPorcentagemAlertasCPU(req, res) {
    var idEmpresa = req.params.idEmpresa;
    var idMaquina = req.params.idMaquina;

    if (idEmpresa == undefined || idMaquina == undefined) {
        console.log("Id empresa ou Id máquina está undefined");
        return res.status(400).send("Id da empresa ou da máquina não foi fornecido.");
    }
    medidaModel
        .buscarPorcentagemAlertasCPU(idEmpresa, idMaquina)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!");
            }
        })
        .catch(function (erro) {
            console.log("Houve um erro ao buscar a porcentagem de alertas de CPU!!!!", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}
function buscarMediaGaugeCPU(req, res) {
    var idEmpresa = req.params.idEmpresa;
    var idMaquina = req.params.idMaquina;
    // var idMaquinaRecurso = req.params.idMaquinaRecurso;

    if (idEmpresa == undefined || idMaquina == undefined) {
        console.log("Id empresa ou Id máquina está undefined");
        return res.status(400).send("O idEmpresa ou idMaquina não foram fornecidos.");
    }
    medidaModel
        .buscarMediaGaugeCPU(idEmpresa, idMaquina)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!");
            }
        })
        .catch(function (erro) {
            console.log("Houve um erro ao buscar a media de uso de CPU!!!!", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarMediaGaugeRAM(req, res) {
    var idEmpresa = req.params.idEmpresa;
    var idMaquina = req.params.idMaquina;
    // var idMaquinaRecurso = req.params.idMaquinaRecurso;

    if (idEmpresa == undefined || idMaquina == undefined) {
        console.log("Id empresa ou Id máquina está undefined");
        return res.status(400).send("O idEmpresa ou idMaquina não foram fornecidos.");
    }
    medidaModel
        .buscarMediaGaugeRAM(idEmpresa, idMaquina)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!");
            }
        })
        .catch(function (erro) {
            console.log("Houve um erro ao buscar a media de uso de RAM!!!!", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarUsoTotalSemanal(req, res) {
    var idEmpresa = req.params.idEmpresa;
    var idMaquina = req.params.idMaquina;
    // var idMaquinaRecurso = req.params.idMaquinaRecurso;

    if (idEmpresa == undefined || idMaquina == undefined) {
        console.log("Id empresa ou Id máquina está undefined");
        return res.status(400).send("O idEmpresa ou idMaquina não foram fornecidos.");
    }
    medidaModel
        .buscarUsoTotalSemanal(idEmpresa, idMaquina)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!");
            }
        })
        .catch(function (erro) {
            console.log("Houve um erro ao buscar o uso total da máquina!!!!", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}

function buscarPorcentagemAlertasRAM(req, res) {
    var idEmpresa = req.params.idEmpresa;
    var idMaquina = req.params.idMaquina;

    if (idEmpresa == undefined || idMaquina == undefined) {
        console.log("Id empresa ou Id máquina está undefined");
        return res.status(400).send("Id da empresa ou da máquina não foi fornecido.");
    }
    medidaModel
        .buscarPorcentagemAlertasRAM(idEmpresa, idMaquina)
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!");
            }
        })
        .catch(function (erro) {
            console.log("Houve um erro ao buscar a porcentagem de alertas de RAM!!!!", erro.sqlMessage);
            res.status(500).json(erro.sqlMessage);
        });
}


function buscarMapaInstabilidade(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarMapaInstabilidade(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar o mapa de instabilidade.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarDadosAlerta(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarDadosAlerta(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar dados de alerta!.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarDistribuicaoAlertas(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarDistribuicaoAlertas(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar distribuicao de alerta!.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarListaAlertas(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarListaAlertas(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar a lista de alertas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarDadosGraficoAlertas(req,res) {
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    medidaModel.buscarDadosGraficoAlertas(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar os dados de grafico alerta.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUsoRecursoPorMaquina(req,res) {
    var idEmpresa = req.params.idEmpresa;
    var idRecurso = req.params.idRecurso;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
    }
    if (idRecurso == undefined){
        console.log("Id recurso está undefined")
    }
    medidaModel.buscarUsoRecursoPorMaquina(idEmpresa, idRecurso).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar dados do gráfico por recurso.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarMaquinasConnect(req, res){
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined")
        return res.status(400).send("Id da empresa é obrigatório.");
    }
    medidaModel.buscarMaquinasConnect(idEmpresa).then(function (resultado) {
        if (resultado.length > 0) {
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!")
        }
    }).catch(function (erro) {
        console.log(erro);
        console.log("Houve um erro ao buscar as máquinas conectadas.", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUsoHardwareAlto(req, res){
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined");
        return res.status(400).send("Id da Empresa é Obrigatorio.");
    }
    medidaModel.buscarUsoHardwareAlto(idEmpresa).then(function (resultado){
        if (resultado.length > 0){
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!");
        }
    }).catch(function (erro){
        console.log(erro);
        console.log("Houve um erro ao buscar quantidade de maquinas com uso de Hardware alto", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUsoDiscoAlto(req, res){
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined");
        return res.status(400).send("Id da Empresa é Obrigatorio.");
    }
    medidaModel.buscarUsoDiscoAlto(idEmpresa).then(function (resultado){
        if (resultado.length > 0){
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!");
        }
    }).catch(function (erro){
        console.log(erro);
        console.log("Houve um erro ao buscar quantidade de maquinas com uso de Disco alto", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarRamCpuMaquina(req,res){
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined");
        return res.status(400).send("Id da Empresa é Obrigatorio.");
    }
    medidaModel.buscarRamCpuMaquina(idEmpresa).then(function (resultado){
        if (resultado.length > 0){
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!");
        }
    }).catch(function (erro){
        console.log(erro);
        console.log("Houve um erro ao buscar uso de CPU e Ram das Máquinas", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUsoDiscoMaquinas(req, res){
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined");
        return res.status(400).send("Id da Empresa é Obrigatorio.");
    }
    medidaModel.buscarUsoDiscoMaquinas(idEmpresa).then(function (resultado){
        if (resultado.length > 0){
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!");
        }
    }).catch(function (erro){
        console.log(erro);
        console.log("Houve um erro ao buscar uso de Disco das Máquinas", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

function buscarUsoProcessamentoUltimos7(req, res){
    var idEmpresa = req.params.idEmpresa;
    if (idEmpresa == undefined){
        console.log("Id empresa está undefined");
        return res.status(400).send("Id da Empresa é Obrigatorio.");
    }
    medidaModel.buscarUsoProcessamentoUltimos7(idEmpresa).then(function (resultado){
        if (resultado.length > 0){
            res.status(200).json(resultado);
        } else {
            res.status(204).send("Nenhum resultado encontrado!");
        }
    }).catch(function (erro){
        console.log(erro);
        console.log("Houve um erro ao buscar uso de processamento das Máquinas nos ultimos 7 dias", erro.sqlMessage);
        res.status(500).json(erro.sqlMessage);
    });
}

module.exports = {
    buscarDadosHistograma,
    buscarEscalaInstabilidade,
    buscarMapaInstabilidade,
    buscarDadosAlerta,
    buscarDistribuicaoAlertas,
    buscarListaAlertas,
    buscarDadosGraficoAlertas,
    buscarUsoRecursoPorMaquina,
    buscarMaquinasConnect,
    buscarMedicoes,
    buscarPorcentagemAlertasCPU,
    buscarPorcentagemAlertasRAM,
    buscarMediaGaugeCPU,
    buscarMediaGaugeRAM,
    buscarUsoTotalSemanal,
    buscarUsoHardwareAlto,
    buscarUsoDiscoAlto,
    buscarRamCpuMaquina,
    buscarUsoDiscoMaquinas,
    buscarUsoProcessamentoUltimos7
}