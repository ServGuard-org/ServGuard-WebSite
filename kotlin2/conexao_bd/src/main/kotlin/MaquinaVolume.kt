class MaquinaVolume {

    private var idMaquinaVolume: Int = 0
    private var fkMaquina: Int = 0
    private var fkVolume: Int = 0

    // Capturando todos os dados das variavéis com o GET!!

    fun getIdMaquinaVolume():Int{
        return idMaquinaVolume
    }

    fun getfkMaquina():Int{
        return fkMaquina
    }

    fun getfkVolume():Int{
        return fkVolume
    }

    // Configurando todas variavéis com SET!!

    fun setIdMaquinaVolume(novaMaquinaVolume: Int){
        this.idMaquinaVolume = novaMaquinaVolume
    }

    fun setfkMaquina(novaMaquina:Int){
        this.fkMaquina = novaMaquina
    }

    fun setfkVolume(novoVolume: Int){
        this.fkVolume = novoVolume

    }


}