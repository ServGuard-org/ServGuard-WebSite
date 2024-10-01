class Recurso {

    private var idRecurso: Int = 0
    private var nome: String = ""
    private var unidadeMedida: String = ""


    // Capturando todos os dados das variavéis com o GET!!

    fun getIdRecurso():Int{
        return idRecurso
    }

    fun getNomeRecurso():String{
        return nome
    }

    fun getUnidadeMedida():String{
        return unidadeMedida
    }

    // Configurando todas variavéis com SET!!

    fun setIdRecurso(novoId: Int){
        this.idRecurso = novoId
    }

    fun setNomeRecurso(novoNome: String){
        this.nome = novoNome
    }

    fun setUnidadeMedida(novaMedida:String){
        this.unidadeMedida = novaMedida

    }


}