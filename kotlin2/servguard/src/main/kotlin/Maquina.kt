class Maquina {
    private var idMaquina: Int = 0
    private var fkEmpresa: Int = 0
    private var nome: String = ""
    private var rack: String? = null
    private var modeloCPU: String = ""
    private var qtdNucleosFisicos: Int = 0
    private var qtdNucleosLogicos: Int = 0
    private var capacidadeRAM: Double = 0.0
    private var MACAddress: String = ""
    private var isAtiva: Boolean = true


    // Capturando todos os dados das variavéis com o GET!!

    fun getIdMaquina():Int{
        return idMaquina
    }

    fun getfkEmpresa():Int{
        return fkEmpresa
    }

    fun getNome():String{
        return nome
    }

    fun getRack():String?{
        return rack
    }

    fun getModeloCPU():String{
        return modeloCPU
    }

    fun getNucleosFisicos():Int{
        return qtdNucleosFisicos
    }

    fun getNucleosLogicos():Int{
        return qtdNucleosLogicos
    }

    fun getCapacidadeRAM():Double{
        return capacidadeRAM
    }

    fun getMACAddress():String{
        return MACAddress
    }

    fun getIsAtiva():Boolean{
        return isAtiva
    }

    // Configurando todas variavéis com SET!!

    fun setIdMaquina(novoId: Int){
        this.idMaquina = novoId
    }

    fun setfkEmpresa(novafkEmpresa: Int){
        this.fkEmpresa = novafkEmpresa
    }

    fun setNome(novoNome: String){
        this.nome = novoNome
    }

    fun setRack(novoRack: String?){
        this.rack = novoRack
    }

    fun setmodeloCPU(novoModelo: String){
        this.modeloCPU = novoModelo
    }

    fun setqtdNucleosFisicos(novaQTD: Int){
        if (novaQTD > 0){
            this.qtdNucleosFisicos = novaQTD
        } else {
            print("Quantidade de núcleos inválida!!")
        }

    }

    fun setqtdNucleosLogicos(novaQTD: Int){
        if (novaQTD > 0){
            this.qtdNucleosLogicos = novaQTD
        } else {
            print("Quantidade de núcleos lógicos inválida!")
        }
    }

    fun setCapacidadeRAM(novaCapacidade: Double){
        if (novaCapacidade > 0){
            this.capacidadeRAM = novaCapacidade
        } else {
            print("Capacidade inválida de RAM! Deve ser maior que zero")
        }
    }

    fun setMACAddress(novoMAC:String){
        if (novoMAC.matches(Regex("^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})\$"))) {
            this.MACAddress = novoMAC
        } else {
            println("MAC Address inválido!")
        }
    }

    fun setisATiva(novoEstado:Boolean){
        this.isAtiva = novoEstado
    }



}