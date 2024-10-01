import org.apache.commons.dbcp2.BasicDataSource
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.queryForObject

class VolumeRepositorio {

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
            CREATE TABLE IF NOT EXISTS Volume(
            idVolume INT NOT NULL AUTO_INCREMENT,
            tipo VARCHAR(50) NOT NULL,
            capacidade VARCHAR(50) NOT NULL
            )
        """.trimIndent())
    }

    fun inserir(novoValor:Volume):Boolean{
        return jdbcTemplate.update("""
            INSERT INTO Volume (idVolume, tipo, capacidade) VALUES (?,?)
        """,
            novoValor.getTipo(),
            novoValor.getCapacidade()
            ) > 0
    }

    fun listar():List<Volume>{
        return jdbcTemplate.query("SELECT * FROM Volume", BeanPropertyRowMapper(Volume::class.java))
    }

    fun existirPorId(id:Int):Boolean{
        return jdbcTemplate.queryForObject("""
            SELECT COUNT(*) FROM Volume WHERE id = ?
        """,
            Int::class.java,
            id
            ) >  0
    }

    fun buscarPorId(id:Int): Volume? {
        return jdbcTemplate.queryForObject("""
            SELECT * FROM Volume WHERE id = ? 
        """,
            BeanPropertyRowMapper(Volume::class.java),
            id
            )
    }

    fun deletarPorId(id:Int):Boolean{
        return jdbcTemplate.update("""
            DELETE FROM Volume WHERE id = ?
        """,
            id
            ) > 0
    }

    fun atualizarPorId(id:Int, volumeparaAtualizar: Volume): Boolean{
        return jdbcTemplate.update("""
            UPDATE Volume SET tipo = ?, capacidade = ?
        """,
            volumeparaAtualizar.getTipo(),
            volumeparaAtualizar.getCapacidade(),
            id
            ) > 0
    }

}