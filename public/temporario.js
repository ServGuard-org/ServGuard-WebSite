
    function sairNavbar() {
      event.preventDefault();
      sessionStorage.clear();
      window.location.href = "../index.html";
    }

    function DashboardAnalista() {
      window.location.href = "dashboard-analista.html";
    }

    function gerarGrafico() {
      const data = {
        labels: [
          "0-10",
          "10-20",
          "20-30",
          "30-40",
          "40-50",
          "50-60",
          "60-70",
          "70-80",
          "80-90",
          "90-100",
        ],
        datasets: [
          {
            label: "Frequência da faixa",
            data: dados,
            backgroundColor: "#8a4dfb",
            borderColor: "#4E2E9E",
            borderWidth: 2,
            barThickness: 80, // Ajuste da largura das barras em pixels
            borderRadius: 5, // Ajuste do border-radius
            borderSkipped: false,
          },
        ],
      };

      const config = {
        type: "bar",
        data: data,
        options: {
          responsive: true, // Para tornar o gráfico responsivo
          maintainAspectRatio: false, // Define se a proporção deve ser mantida
          plugins: {
            legend: {
              display: false,
            },
          },
          scales: {
            x: {
              beginAtZero: true,
              title: {
                display: true,
                text: "Faixas de uso em %",
                beginAtZero: true,
              },
              grid: {
                display: false,
              },
            },
            y: {
              beginAtZero: true,
              title: {
                display: true,
                text: "Frequência",
                beginAtZero: true,
              },
              grid: {
                display: false,
              },
            },
          },
        },
      };

      const myHistogram = new Chart(
        document.getElementById("myHistogram"),
        config
      );
    }

    function carregarPagina() {
      // isAtivoBACEN("https://jsonplaceholder.typicode.com/todos/1"); // INATIVADO PARA A SPRINT 2 ------------------------------

      const data = obterData();
      let escalaInstabilidade = obterEscalaInstabilidade();
      let nomeEmpresa = obterNomeEmpresa();
      let nomeUsuario = obterNomeUsuario();
      let irregularidadesCPU = obterIrrCPU();
      let irregularidadesRAM = obterIrrRAM();
      let irregularidadesDisco = obterIrrDisco();

      const elementoInstabilidade = document.getElementById(
        "escala-instabilidade"
      );

      const elementoData = document.getElementById("data_tempo_real");

      const elementoEmpresa = document.getElementById("empresa_usuario");

      const elementoNomeUsuario = document.getElementById("nome_usuario");

      const elementoServico = document.getElementById("elemento_servico");

      const elementoIrrCPU = document.getElementById("irr_cpu");

      const elementoIrrRAM = document.getElementById("irr_ram");

      const elementoIrrDisco = document.getElementById("irr_disco");

      elementoIrrCPU.innerHTML = irregularidadesCPU;
      elementoIrrRAM.innerHTML = irregularidadesRAM;
      elementoIrrDisco.innerHTML = irregularidadesDisco;
      elementoNomeUsuario.innerHTML = nomeUsuario;
      elementoEmpresa.innerHTML = nomeEmpresa;
      elementoData.innerHTML = data;

      switch (escalaInstabilidade) {
        case 0:
          // verde
          elementoInstabilidade.classList.remove(
            "text-green",
            "text-red",
            "text-orange",
            "text-yellow",
            "text-gray"
          );
          elementoInstabilidade.classList.add("text-green");
          elementoInstabilidade.innerHTML = escalaInstabilidade;

          break;
        case 1:
          // amarelo
          elementoInstabilidade.classList.remove(
            "text-green",
            "text-red",
            "text-orange",
            "text-yellow",
            "text-gray"
          );
          elementoInstabilidade.classList.add("text-yellow");
          elementoInstabilidade.innerHTML = escalaInstabilidade;

          break;
        case 2:
          // laranja
          elementoInstabilidade.classList.remove(
            "text-green",
            "text-red",
            "text-orange",
            "text-yellow",
            "text-gray"
          );
          elementoInstabilidade.classList.add("text-orange");
          elementoInstabilidade.innerHTML = escalaInstabilidade;

          break;
        case 3:
          // vermelho
          elementoInstabilidade.classList.remove(
            "text-green",
            "text-red",
            "text-orange",
            "text-yellow",
            "text-gray"
          );
          elementoInstabilidade.classList.add("text-red");
          elementoInstabilidade.innerHTML = escalaInstabilidade;

          break;
        default:
          // sem cor (teoricamente aqui é impossível)
          elementoInstabilidade.classList.remove(
            "text-green",
            "text-red",
            "text-orange",
            "text-yellow",
            "text-gray"
          );
          elementoInstabilidade.classList.add("text-gray");
          elementoInstabilidade.innerHTML = escalaInstabilidade;

          break;
      }
    }

    function obterEscalaInstabilidade() {
      return 2;
    }

    function obterNomeEmpresa() {
      const nomeEmpresa = sessionStorage.getItem("NOME_EMPRESA");
      const idEmpresa = sessionStorage.getItem("ID_EMPRESA_USUARIO");
      return ${nomeEmpresa} - ID: ${idEmpresa};
    }

    function consultarMaquinas() {
      const idEmpresa = sessionStorage.getItem("ID_EMPRESA_USUARIO");

      fetch(/maquinas/listarPorEmpresa/${idEmpresa}, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      })
        .then((response) => response.json())
        .then((data) => {
          document.getElementById("total_maquinas").innerText = data.length;

          const maquinasAtivas = data.filter(maquina => maquina.isAtiva === 1);
              document.getElementById("funcionamento_maquinas").innerText = maquinasAtivas.length;
        });
    }

    function obterIrrCPU() {
      return 1;
    }

    function obterIrrRAM() {
      return 0;
    }

    function obterIrrDisco() {
      return 2;
    }

    function obterNomeUsuario() {
      let nomeUsuario = sessionStorage.getItem("NOME_USUARIO");

      if (nomeUsuario) {
        return nomeUsuario;
      } else {
        return "indefinido";
      }
    }

    // revisar
    function isAtivoBACEN(url) {
      fetch(/externos/check/${url})
        .then((resposta) => {
          elemento_servico.innerHTML = resposta.json.status;
        })
        .catch((error) => {
          // vermelho
          console.log(error);
          elemento_servico.innerHTML = "Erro ao Obter Dados: " + error;
        });
    }

    function obterData() {
      const data = new Date();

      const diasDaSemana = [
        "Domingo",
        "Segunda-Feira",
        "Terça-Feira",
        "Quarta-Feira",
        "Quinta-Feira",
        "Sexta-Feira",
        "Sábado",
      ];
      const diaSemana = diasDaSemana[data.getDay()];

      const dia = String(data.getDate()).padStart(2, "0");
      const mes = String(data.getMonth() + 1).padStart(2, "0"); // +1 porque janeiro é 0
      const ano = data.getFullYear();

      const horas = String(data.getHours()).padStart(2, "0");
      const minutos = String(data.getMinutes()).padStart(2, "0");

      return ${diaSemana} ${dia}/${mes}/${ano} - ${horas}:${minutos};
    }

    var dados = [];
    function obterDadosHistograma() {
      const idEmpresa = sessionStorage.getItem("ID_EMPRESA_USUARIO");

      fetch(/medidas/histograma/${idEmpresa}, {
        method: "GET",
        headers: {
          "Content-Type": "application/json",
        },
      })
        .then(function (resposta) {
          console.log("Iniciando a busca dos dados do histograma");

          if (resposta.ok) {
            console.log(resposta);

            resposta.json().then((json) => {
              console.log(json);
              console.log(JSON.stringify(json));

              dados = [];
              console.log(Formando a lista:);
              for (var i = 0; i < 10; i++) {
                console.log(json[i].registroColuna);
                dados.push(json[i].registroColuna);
              }
              // json.forEach(item => {
              //   dados.push(item.registroColuna);
              // });

              gerarGrafico();
            });
          } else {
            console.log(
              "Houve um erro ao tentar capturar os dados do histograma!"
            );
          }
        })
        .catch(function (erro) {
          console.log(erro);
        });

      return false;
    }