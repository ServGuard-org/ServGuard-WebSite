class Volume {

    private var idVolume: Int = 0
    private var tipo: Int = 0
    private var capacidade: Double = 0.0

    // Capturando todos os dados das variavéis com o GET!!

    fun getIdVolume():Int{
        return idVolume
    }

    fun getTipo():Int{
        return tipo
    }

    fun getCapacidade():Double{
        return capacidade
    }

    // Configurando todas variavéis com SET!!

    fun setIdVolume(novoVolume:Int){
        this.idVolume = novoVolume
    }

    fun setTipo(novoTipo:Int){
        this.tipo = novoTipo
    }

    fun setCapacidade(novaCapaciade:Double){
        this.capacidade = novaCapaciade
    }


}