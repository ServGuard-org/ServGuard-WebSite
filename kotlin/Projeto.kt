class Projeto (var nomeEmpresa:String = "",var cnpj:String="",var numResgistro:Int=0,
                var cargo: String ="",var nomeFunc:String ="",
                var emailFunc:String ="", var senha:String="") {

    val listaComponentes = mutableListOf<String>()
    val listaEmpresa = mutableListOf<String>()


    fun cadastrarEmpresa(){

    }
    fun adicionarFuncionario(){}
    fun listarDados (){}

    fun adicionarComponente(componente: String): String {
        listaComponentes.add(componente)
        println("Componente para monitorar adicionado com sucesso!")

        var componentes = "Componentes: "
        for (componentedaVez in listaComponentes) {
            componentes += "\n - $componentedaVez"
        }

        return componentes
    }

    fun energiaConsumida(watts: Int): Double {
        val consumo = watts * 24
        val whDia = consumo / 1000.0

        return whDia
    }

    fun adicionarEmpresa(nomeEmpresa: String) {
        listaEmpresa.add(nomeEmpresa)
    }

}