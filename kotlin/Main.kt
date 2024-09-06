fun main() {
    // Criação dos objetos e listas necessárias
    val servguard = Projeto()
    val listaEmpresa = mutableListOf<CadastrarEmpresa>()
    val listaFuncionario = mutableListOf<CadastrarFuncionario>()

    while (true) {
        // Exibe o menu de opções
        println("""
            ------SERVGUARD------
             1 - Cadastrar Empresa
             2 - Cadastrar Funcionário
             3 - Deletar Funcionário
             4 - Adicionar Componente
             5 - Energia consumida diariamente do seu PC
             6 - Listar Empresas
             7 - Listar Funcionários
             8 - Sair
             --------------------
        """.trimIndent())

        // Solicita ao usuário que escolha uma opção
        print("Escolha uma opção: ")
        val opcaoEscolha = readln().toInt()

        // Processa a escolha do usuário
        when(opcaoEscolha) {
            1 -> {
                // Cadastro de uma nova empresa
                val cadastroEmpresa = CadastrarEmpresa()
                println("Digite o nome da Instituição:")
                cadastroEmpresa.nomeEmpresa = readln()
                println("Digite o CNPJ da Instituição:")
                cadastroEmpresa.cnpj = readln()
                println("Digite o número de registro disponibilizado pela reguladora financeira:")
                cadastroEmpresa.numResgistro = readln()
                // Adiciona a empresa à lista
                adicionarEmpresa(listaEmpresa, cadastroEmpresa)
            }
            2 -> {
                // Cadastro de um novo funcionário
                val cadastroFunc = CadastrarFuncionario()
                println("Digite o nome do Funcionário:")
                cadastroFunc.nomeFunc = readln()
                println("Digite o cargo do funcionário:")
                cadastroFunc.cargo = readln()
                println("Digite o seu e-mail:")
                cadastroFunc.emailFunc = readln()
                println("Digite a sua senha:")
                cadastroFunc.senha = readln()
                // Adiciona o funcionário à lista
                adicionarFuncionario(listaFuncionario, cadastroFunc)
            }
            3 -> {
                // Deletar um funcionário
                println("Digite o nome do Funcionário que deseja deletar:")
                val nomeFunc = readln()
                println("Digite o e-mail do funcionário:")
                val emailFunc = readln()
                // Remove o funcionário da lista
                deletarFuncionario(listaFuncionario, nomeFunc, emailFunc)
            }
            4 -> {
                // Adiciona um componente ao sistema
                print("Digite qual componente deseja adicionar à lista: ")
                val componente = readln()
                println(servguard.adicionarComponente(componente))
            }
            5 -> {
                // Calcula e exibe a energia consumida pelo PC
                print("Quantos watts seu PC consome? (é possível consultar na Etiqueta de Especificação do Hardware): ")
                val watts = readln().toInt()
                println("Seu PC consome em média: ${servguard.energiaConsumida(watts)} por dia")
            }
            6 -> {
                // Lista todas as empresas cadastradas
                listarDados(listaEmpresa)
            }
            7 -> {
                // Lista todos os funcionários cadastrados
                listaFuncionario(listaFuncionario)
            }
            8 -> break  // Sai do loop e encerra o programa
            else -> println("Não é possível selecionar essa opção.")  // Opção inválida
        }
        // Aguarda 3 segundos antes de mostrar o menu novamente
        Thread.sleep(3000)
    }
}

// Função para adicionar uma empresa à lista
fun adicionarEmpresa(listaEmpresa: MutableList<CadastrarEmpresa>, empresa: CadastrarEmpresa) {
    listaEmpresa.add(empresa)
}

// Função para listar os dados das empresas
fun listarDados(lista: MutableList<CadastrarEmpresa>) {
    for (empresa in lista) {
        println("""
            Nome da Empresa: ${empresa.nomeEmpresa}
            CNPJ: ${empresa.cnpj}
            Número de Registro: ${empresa.numResgistro} 
        """.trimIndent())
    }
}

// Função para adicionar um funcionário à lista
fun adicionarFuncionario(listaFuncionario: MutableList<CadastrarFuncionario>, funcionario: CadastrarFuncionario) {
    listaFuncionario.add(funcionario)
}

// Função para listar os dados dos funcionários
fun listaFuncionario(listaF: MutableList<CadastrarFuncionario>) {
    for (funcionario in listaF) {
        println("""
            Nome Funcionário: ${funcionario.nomeFunc}
            Cargo: ${funcionario.cargo}
            Email: ${funcionario.emailFunc}
            Senha: ${funcionario.senha}
        """.trimIndent())
    }
}

// Função para deletar um funcionário da lista com base no nome e e-mail
fun deletarFuncionario(listaFuncionario: MutableList<CadastrarFuncionario>, nome: String, email: String) {
    val iterator = listaFuncionario.iterator()
    while (iterator.hasNext()) {
        val funcionario = iterator.next()
        if (funcionario.nomeFunc == nome && funcionario.emailFunc == email) {
            iterator.remove()
            println("Funcionário deletado com sucesso.")
            return
        }
    }
    println("Funcionário não encontrado.")
}
