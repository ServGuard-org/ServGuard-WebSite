import org.apache.commons.dbcp2.BasicDataSource
import org.springframework.jdbc.core.BeanPropertyRowMapper
import org.springframework.jdbc.core.JdbcTemplate


class MaquinaRepositorio{

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
            CREATE TABLE IF NOT EXISTS Maquina(
            idMaquina INT NOT NULL AUTO_INCREMENT,
            fkEmpresa INT NOT NULL,
            nome VARCHAR(50),
            rack VARCHAR(20),
            modeloCPU VARCHAR(50),
            qtdNucleosFisicos INT,
            qtdNucleosLogicos INT, 
            capacidadeRAM DECIMAL(8,3),
            MACAddress CHAR(17) UNIQUE NOT NULL,
            isAtiva TINYINT DEFAULT 1 NOT NULL
            )
        """.trimIndent())

    }

    fun inserir(novoValor: Maquina):Boolean{
        return jdbcTemplate.update("""
            INSERT INTO Maquina (fkEmpresa, nome, rack, modeloCPU, qtdNucleosFisicos, qtdNucleosLogicos, capacidadeRAM, MACAddres, isAtiva) 
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        """,
            novoValor.getIdMaquina(),
            novoValor.getNome(),
            novoValor.getRack(),
            novoValor.getModeloCPU(),
            novoValor.getNucleosFisicos(),
            novoValor.getNucleosLogicos(),
            novoValor.getCapacidadeRAM(),
            novoValor.getMACAddress(),
            novoValor.getIsAtiva()
            ) > 0
    }

    fun listar():List<Maquina>{
        return jdbcTemplate.query("SELECT * FROM Maquina", BeanPropertyRowMapper(Maquina::class.java))
    }

    fun existePorId(id: Int): Boolean{
        return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM Maquina WHERE id = ?",
            Int::class.java,
            id
        ) > 0
    }

    fun buscarPorId(id:Int): Maquina? {
        return jdbcTemplate.queryForObject("SELECT * FROM Maquina WHERE id = ?",
            BeanPropertyRowMapper(Maquina::class.java),
            id
        )
    }

    fun deletarPorId(id:Int):Boolean{
        return jdbcTemplate.update(
            "DELETE FROM Maquina WHERE id = ?",
            id
        ) > 0

    }

    fun atualizarPorId(id:Int, maquinaParaAtualizar:Maquina):Boolean{
        return jdbcTemplate.update(
            """ UPDATE Maquina SET fkEmpresa = ?, nome = ?, rack = ?, modeloCPU = ?, qtdNucleosFisicos = ?, qtdNucleosLogicos = ?, capacidadeRAM = ?, 
                MACAddress = ?, isAtiva = ?
            """,
            maquinaParaAtualizar.getfkEmpresa(),
            maquinaParaAtualizar.getNome(),
            maquinaParaAtualizar.getRack(),
            maquinaParaAtualizar.getModeloCPU(),
            maquinaParaAtualizar.getNucleosFisicos(),
            maquinaParaAtualizar.getNucleosLogicos(),
            maquinaParaAtualizar.getCapacidadeRAM(),
            maquinaParaAtualizar.getMACAddress(),
            maquinaParaAtualizar.getIsAtiva(),
            id
        ) > 0

    }
}