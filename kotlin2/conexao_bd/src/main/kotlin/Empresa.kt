class Empresa {

    private var idEmpresa: Int = 0
    private var nome: String = ""
    private var nomeReponsavel: String = ""
    private var emailReponsavel: String = ""
    private var CNPJ: String = ""

    // Capturando todos os dados das variavéis com o GET!!

    fun getIdEmpresa():Int{
        return idEmpresa
    }

    fun getNomeEmpresa():String{
        return nome
    }

    fun getNomeResponsavel():String{
        return nomeReponsavel
    }

    fun getEmailResponsavel():String{
        return emailReponsavel
    }

    fun getCNPJ():String{
        return CNPJ
    }

    // Configurando todas variavéis com SET!!

    fun setIdEmpresa(novaEmpresa: Int){
        this.idEmpresa = novaEmpresa
    }

    fun setNomeEmpresa(novoNome: String){
        this.nome = novoNome
    }

    fun setNomeResponsavel(novoResponsavel:String){
        this.nomeReponsavel = novoResponsavel
    }

    fun setEmailResponsavel(novoEmail:String){
        this.emailReponsavel = novoEmail
    }

    fun setCNPJ(novoCNPJ:String){
        this.CNPJ = novoCNPJ

    }

}