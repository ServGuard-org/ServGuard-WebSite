import org.apache.commons.dbcp2.BasicDataSource
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate

class UsuarioRepositorio {


    lateinit var jdbcTemplate: JdbcTemplate

    fun configurar(){
        val datasource = BasicDataSource()
        datasource.driverClassName = "com.mysql.cj.jdbc.Driver"
        datasource.url = "jdbc:mysql://localhost:3306/ServGuard"
        datasource.username = "seu_usuario"
        datasource.password = "sua_senha"

        jdbcTemplate = JdbcTemplate(datasource)
    }

    fun criarTabela(){
        jdbcTemplate.execute("""
            CREATE TABLE IF NOT EXISTS ServGuard.Usuario(
            idUsuario INT NOT NULL AUTO_INCREMENT,
            fkEmpresa INT NOT NULL,
            nome VARCHAR(70) NOT NULL,
            email VARCHAR(255) UNIQUE NOT NULL,
            senha VARCHAR(255) NOT NULL,
            isAdm TINYINT NOT NULL,
            isAtivo TINYINT NOT NULL DEFAULT 1,

            CONSTRAINT fkEmpresaUsuario FOREIGN KEY (fkEmpresa) REFERENCES ServGuard.Empresa(idEmpresa),
            PRIMARY KEY (idUsuario, fkEmpresa)
            )
        """.trimIndent())
    }

    fun inserir(novoValor: Usuario):Boolean{
        return jdbcTemplate.update("""
            INSERT INTO Usuario (fkEmpresa, nome, email, senha, isAdm, isAtivo) VALUES (?, ?, ?, ?, ?, ?)
        """,
            novoValor.getfkEmpresa(),
            novoValor.getNomeUsuario(),
            novoValor.getEmail(),
            novoValor.getSenha(),
            novoValor.getIsADM(),
            novoValor.getIsAtivo()
        ) > 0
    }


    fun listar():List<Usuario>{
        return jdbcTemplate.query("SELECT * FROM Usuario", BeanPropertyRowMapper(Usuario::class.java))
    }

    fun existePorId(id: Int):Boolean{
        return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM Usuario WHERE id = ?",
            Int::class.java,
            id
        ) > 0
    }

    fun buscarPorId(id: Int): Usuario? {
        return jdbcTemplate.queryForObject("SELECT * FROM Usuario WHERE id = ?",
            BeanPropertyRowMapper(Usuario::class.java),
            id
        )
    }

    fun deletarPorId(id:Int): Boolean{
        return jdbcTemplate.update("DELETE FROM Usuario WHERE id = ?",
            id
        ) > 0
    }

    fun atualizarPorId(id:Int, usuarioParaAtualizar: Usuario): Boolean{
        return jdbcTemplate.update("""
            UPDATE Usuario SET fkEmpresa = ?, nome = ?, email = ?, senha = ?, isAdm = ?, isAtivo = ? 
        """,
            usuarioParaAtualizar.getfkEmpresa(),
            usuarioParaAtualizar.getNomeUsuario(),
            usuarioParaAtualizar.getEmail(),
            usuarioParaAtualizar.getSenha(),
            usuarioParaAtualizar.getIsADM(),
            usuarioParaAtualizar.getIsAtivo(),
            id
        ) > 0
    }

}