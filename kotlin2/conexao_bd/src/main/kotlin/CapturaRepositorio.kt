import org.apache.commons.dbcp2.BasicDataSource
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.queryForObject


class CapturaRepositorio {

    lateinit var  jdbcTemplate: JdbcTemplate

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
            CREATE TABLE IF NOT EXISTS Captura(
            IdCaptura INT NOT NULL AUTO_INCREMENT,
            fkMaquinaRecurso INT NOT NULL,
            registro DECIMAL(8,3) NOT NULL,
            dthCriacao DATETIME DEFAULT CURRENT_TIMESTAMP NOT NULL
            )
        """.trimIndent())

    }

    fun inserir(novoValor: Captura):Boolean{
        return jdbcTemplate.update("""
            INSERT INTO Captura (fkMaquinaRecurso, registro, dthCriacao) VALUES (?,?,?)
        """,
           novoValor.getfkMaquinaRecurso(),
           novoValor.getRegistro(),
           novoValor.getDTHCriacao()
            ) > 0
    }

    fun listar():List<Captura>{
        return jdbcTemplate.query("SELECT * FROM Captura", BeanPropertyRowMapper(Captura::class.java))
    }

    fun existePorId(id: Int):Boolean{
        return jdbcTemplate.queryForObject("SELECET COUNT(*) FROM Captura WHERE id = ?",
            Int::class.java,
            id
            ) > 0

    }

    fun buscarPorid(id: Int): Captura?{
        return jdbcTemplate.queryForObject("SELECT * FROM Captura WHERE id = ?",
            BeanPropertyRowMapper(Captura::class.java),
            id
            )
    }

    fun deletarPorId(id: Int):Boolean{
        return jdbcTemplate.update("DELETE FROM Captura WHERE id = ?",
            id
            ) > 0

    }

    fun atualizarPorId(id:Int, capturaParaAtualizar:Captura):Boolean{
        return jdbcTemplate.update("""
            UPDATE Captura SET fkMaquinaRecurso = ?, registro = ?, dthCriacao = ?
        """,
            capturaParaAtualizar.getfkMaquinaRecurso(),
            capturaParaAtualizar.getRegistro(),
            capturaParaAtualizar.getDTHCriacao(),
            id
            ) > 0
    }

}


