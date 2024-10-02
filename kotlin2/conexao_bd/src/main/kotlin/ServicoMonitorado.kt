import java.net.URL

class ServicoMonitorado {

    private var idServicoMonitorado: Int = 0
    private var fkEmpresa: Int = 0
    private var nome: String = ""
    private var URL: String = ""

    // Capturando todos os dados das variavéis com o GET!!


    fun getIdServicoMonitorado():Int{
        return idServicoMonitorado
    }

    fun getfkEmpresa():Int{
        return fkEmpresa
    }

    fun getNomeServico():String{
        return nome
    }

    fun getURL():String{
        return URL
    }

    // Configurando todas variavéis com SET!!

    fun setIdServicoMonitorado(novoServico: Int){
        this.idServicoMonitorado = novoServico
    }

    fun setfkEmpresa(novaFK: Int){
        this.fkEmpresa = novaFK
    }

    fun setNomeServico(novoNome: String){
        this.nome = novoNome
    }

    fun setURL(novaURL:String){
        this.URL = novaURL
    }


    
}