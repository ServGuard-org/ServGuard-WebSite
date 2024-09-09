fun main() {

    val servguard = Projeto()
    while (true) {
        println("------SERVGUARD COMPONENTES------")
        println("1 - Adicionar componente e descrição")
        println("2 - Energia consumida diariamente do seu PC")
        println("3 - Listar descrições")
        println("4 - Sair")
        println("---------------------------------")

        print("Escolha uma opção: ")
        val opcaoEscolha = readln().toInt()

        when(opcaoEscolha) {
        1 -> {
            print("Digite qual componente deseja adicionar a lista: ")
           println(servguard.adicionarComponente(componente = readln()))
            print("Digite qual a descrição desse componente: ")
            servguard.adicionarDescricao(descricao = readln())
        }
        2 -> {
            print("Quantos watts seu pc consome? (é possível consultar na Etiqueta de Especificação do Hardware): ")
           println(servguard.energiaConsumida(watts = readln().toDouble()))
        }
            3 -> {
                println(servguard.listarComponente())

                print("Digite a posição que deseja visualizar a descrição: ")
                val posicao = readln().toInt()

                println(servguard.listarDescricao(posicao))
            }
        4 -> break
            else -> println("Não é possível selecionar essa opção.")
        }
        Thread.sleep(3000)
    }
}