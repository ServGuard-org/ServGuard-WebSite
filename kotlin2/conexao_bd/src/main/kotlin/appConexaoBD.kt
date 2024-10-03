import com.github.britooo.looca.api.core.Looca

fun main() {
    val looca = Looca()
    println(looca.rede)
    println(looca.rede.grupoDeInterfaces.interfaces[1]) // Retorna uma lista de objetos do tipo Rede
    println(looca.rede.parametros)
}

