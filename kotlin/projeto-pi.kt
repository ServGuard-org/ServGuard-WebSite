fun main() {

    val servguard = Projeto()
    while (true) {
        println("------SERVGUARD------")
        println("1 - ")
        println("2 - ")
        println("3 - ")
        println("4 - Adicionar componente")
        println("5 - Energia consumida diariamente do seu PC")
        println("6 - Adicionar uma empresa")
        println("7 - Sair")
        println("--------------------")

        print("Escolha uma opção: ")
        val opcaoEscolha = readln().toInt()

        when(opcaoEscolha) {
        1 -> {
            println("Em manutenção")
        }
        2 -> {
            println("Em manutenção")
        }

        3 -> {
            println("Em manutenção")
        }
        4-> {
            print("Digite qual componente deseja adicionar a lista: ")
            val componente = readln()
            println(servguard.adicionarComponente(componente))


        }
        5 -> {
            print("Quantos watts seu pc consome? (é possível consultar na Etiqueta de Especificação do Hardware): ")
            val watts = readln().toInt()
            println("Seu PC consome em média: ${servguard.energiaConsumida(watts)} por dia")
        }
        6 -> {
            print("Digite qual empresa deseja adicionar a lista: ")
            val nomeEmpresa = readln()
            servguard.adicionarEmpresa(nomeEmpresa)
            println("Adicionado ${nomeEmpresa} com sucesso!")
        }
            7 -> break
            else -> println("Não é possível selecionar essa opção.")
        }
        Thread.sleep(3000)
    }


}