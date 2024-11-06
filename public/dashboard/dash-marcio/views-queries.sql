-- QUERIES E VIEWS - MARCIO

CREATE OR REPLACE VIEW vista_semanas_captura AS
SELECT DISTINCT
    YEAR(c.dthCriacao) AS ano,
    WEEK(c.dthCriacao, 0) AS numero_semana,
    DATE_FORMAT(
        DATE_SUB(c.dthCriacao, INTERVAL (DAYOFWEEK(c.dthCriacao) - 1) DAY), 
        '%Y-%m-%d'
    ) AS inicio_semana,
    DATE_FORMAT(
        DATE_ADD(
            DATE_SUB(c.dthCriacao, INTERVAL (DAYOFWEEK(c.dthCriacao) - 1) DAY),
            INTERVAL 6 DAY
        ),
        '%Y-%m-%d'
    ) AS fim_semana,
    COUNT(DISTINCT c.idCaptura) AS total_capturas,
    COUNT(DISTINCT mr.fkMaquina) AS total_maquinas_monitoradas
FROM 
    ServGuard.Captura c
    JOIN ServGuard.MaquinaRecurso mr ON c.fkMaquinaRecurso = mr.idMaquinaRecurso
GROUP BY 
    YEAR(c.dthCriacao),
    WEEK(c.dthCriacao, 0),
    DATE_FORMAT(
        DATE_SUB(c.dthCriacao, INTERVAL (DAYOFWEEK(c.dthCriacao) - 1) DAY), 
        '%Y-%m-%d'
    ),
    DATE_FORMAT(
        DATE_ADD(
            DATE_SUB(c.dthCriacao, INTERVAL (DAYOFWEEK(c.dthCriacao) - 1) DAY),
            INTERVAL 6 DAY
        ),
        '%Y-%m-%d'
    )
ORDER BY 
    ano DESC, 
    numero_semana DESC;