import java.time.LocalDateTime
class Captura {

    private var idCaptura: Int = 0
    private var fkMaquinaRecurso: Int = 0
    private var registro: Double = 0.0
    private var dthCriacao: LocalDateTime = LocalDateTime.now()

    // Capturando todos os dados das variavéis com o GET!!

    fun getIdCaptura():Int{
        return idCaptura
    }

    fun getfkMaquinaRecurso():Int{
        return fkMaquinaRecurso
    }

    fun getRegistro():Double{
        return registro
    }

    fun getDTHCriacao():LocalDateTime{
        return dthCriacao
    }

    // Configurando todas variavéis com SET!!


    fun setIdCaptura(novaCaptura:Int){
        this.idCaptura = novaCaptura
    }

    fun setfkMaquinaRecurso(novaMaquinaRecurso:Int){
        this.fkMaquinaRecurso = novaMaquinaRecurso
    }

    fun setRegistro(novoRegistro:Double){
        this.registro
    }

    fun setDTHCriacao(novoDTH:LocalDateTime){
        this.dthCriacao = novoDTH
    }


}