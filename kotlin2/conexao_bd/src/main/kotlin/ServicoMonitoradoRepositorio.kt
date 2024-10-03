import org.apache.commons.dbcp2.BasicDataSource
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.queryForObject

class ServicoMonitoradoRepositorio {

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
            CREATE TABLE IF NOT EXISTS ServGuard.ServicoMonitorado(
            idServicoMonitorado INT NOT NULL AUTO_INCREMENT,
            fkEmpresa INT NOT NULL,
            nome VARCHAR(50) NOT NULL,
            URL VARCHAR(255) NOT NULL,

            CONSTRAINT fkEmpresaServicoMonitorado FOREIGN KEY (fkEmpresa) REFERENCES ServGuard.Empresa(idEmpresa),
            PRIMARY KEY (idServicoMonitorado, fkEmpresa)
            )
        """.trimIndent())

    }

    fun inserir(novoValor: ServicoMonitorado):Boolean{
        return jdbcTemplate.update("""
            INSERT INTO ServicoMonitorado (fkEmpresa, nome, URL) VALUES (?,?,?)
        """,
            novoValor.getfkEmpresa(),
            novoValor.getNomeServico(),
            novoValor.getURL()
            ) > 0
    }

    fun listar():List<ServicoMonitorado>{
        return jdbcTemplate.query("SELECT * FROM ServicoMonitorado",
            BeanPropertyRowMapper(ServicoMonitorado::class.java))
    }

    fun existirPorId(id:Int):Boolean{
        return jdbcTemplate.queryForObject("""
            SELECT COUNT(*) FROM ServicoMonitorado WHERE id = ?
        """,
            Int::class.java,
            id
            ) > 0
    }

    fun buscarPorid(id:Int):ServicoMonitorado?{
        return jdbcTemplate.queryForObject("SELECT * FROM ServicoMonitorado WHERE id = ?",
            BeanPropertyRowMapper(ServicoMonitorado::class.java),
            id
            )
    }

    fun deletarPorId(id:Int): Boolean{
        return jdbcTemplate.update("DELETE FROM ServicoMonitorado WHERE id = ?",
            id
        ) > 0

    }

    fun atualizarPorId(id:Int, servicoParaAtualizar: ServicoMonitorado): Boolean{
        return jdbcTemplate.update("""
            UPDATE ServicoMonitorado SET fkEmpresa = ?, nome = ?, URL = ?
        """,
            servicoParaAtualizar.getfkEmpresa(),
            servicoParaAtualizar.getNomeServico(),
            servicoParaAtualizar.getURL(),
            id
        ) > 0
    }




}