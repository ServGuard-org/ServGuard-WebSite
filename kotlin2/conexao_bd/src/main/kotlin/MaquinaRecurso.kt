class MaquinaRecurso {

    private var idMaquinaRecurso: Int = 0
    private var fkMaquina: Int = 0
    private var fkRecurso: Int = 0
    private var max: Double? = 0.0

    // Capturando todos os dados das variavéis com o GET!!

    fun getIdMaquinaRecurso():Int{
        return idMaquinaRecurso
    }

    fun getfkMaquina():Int{
        return fkMaquina
    }

    fun getfkRecurso():Int{
        return fkRecurso
    }

    fun getMax():Double?{
        return max
    }

    // Configurando todas variavéis com SET!!

    fun setIdMaquinaRecurso(novaMaquinaRecurso: Int){
        this.idMaquinaRecurso
    }

    fun setfkMaquina(novaMaquina: Int){
        this.fkMaquina
    }

    fun setfkRecurso(novoRecurso:Int){
        this.fkRecurso
    }

    fun setMax(novoMax:Double?){
        this.max
    }

}