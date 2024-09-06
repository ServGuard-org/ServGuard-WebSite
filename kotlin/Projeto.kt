class Projeto
    (
            var componente: String = "",
            var descricao: String = "",
            var watts: Double = 0.0
            ){

    val listaComponentes = mutableListOf<String>()
    val listaDescricao = mutableListOf<String>()

    fun adicionarComponente(componente: String): String {
        listaComponentes.add(componente)
        println("Componente ${componente} para monitorar adicionado com sucesso!")

        var componentes = "Componentes: "
        for (componentedaVez in listaComponentes) {
            componentes += "\n - $componentedaVez"
        }
        return componentes
    }

    fun adicionarDescricao(descricao: String){
        listaDescricao.add(descricao)
        println("Descrição adicionada com sucesso!")
    }

    fun energiaConsumida(watts: Double): String {
        val consumo = watts * 24
        val whDia = consumo / 1000.0

        val texto = "Seu servidor consome ${whDia}Watts diariamente."
        return texto
    }

    fun listarComponente():String{
        println("Qual componente deseja listar?")

        var n = 0
        var componentes = "Componentes: "
        for (componentedaVez in listaComponentes) {
            n++
            componentes += println(" $n - $componentedaVez")
        }

        print("Digite a posição que deseja visualizar a descrição: ")
        val posicao = readln().toInt()
        var texto = ""
        if (listaComponentes.indices.contains(posicao - 1)){
           texto = ("Descrição do componente selecionado:" +
                  "${listaDescricao[posicao - 1]}")
        } else {
            texto = ("Posição inválida")
        }
    return  texto
    }

}