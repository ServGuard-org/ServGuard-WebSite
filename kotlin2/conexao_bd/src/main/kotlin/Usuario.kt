class Usuario {

    private var idUsuario: Int = 0
    private var fkEmpresa: Int = 0
    private var nome: String = ""
    private var email: String = ""
    private var senha: String = ""
    private var isAdm: Int = 0
    private var isAtivo: Int = 0


    // Capturando todos os dados das variavéis com o GET!!

    fun getIdUsuario():Int{
        return idUsuario
    }

    fun getfkEmpresa():Int{
        return fkEmpresa
    }

    fun getNomeUsuario():String{
        return nome
    }

    fun getEmail():String{
        return email
    }

    fun getSenha():String{
        return senha
    }

    fun getIsADM():Int{
        return isAdm
    }

    fun getIsAtivo():Int{
        return isAtivo
    }

    // Configurando todas variavéis com SET!!

    fun setIdUsuario(novoUsuario:Int){
        this.idUsuario = novoUsuario
    }

    fun setNomeUsuario(novoNome:String){
        this.nome = novoNome
    }

    fun setEmail(novoEmail:String){
        this.email = novoEmail
    }

    fun setSenha(novaSenha:String){
        this.senha = novaSenha
    }

    fun setIsADM(novoIsADM:Int){
        if(isAdm == 0 || isAdm == 1){
            this.isAdm = novoIsADM
        } else {
            print("Erro! Esse campo está inválido! Deve estar entre 0 e 1")
        }
    }

    fun setIsAtivo(novoIsAtivo:Int){
        if(isAtivo == 0 || isAtivo == 1){
            this.isAtivo = novoIsAtivo
        } else {
            print("Erro! Esse campo está inválido! Deve estar entre 0 e 1")
        }
    }


}