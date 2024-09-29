import os
from dotenv import load_dotenv
from mysql.connector import connect, Error

# Arquivo de Configuração do Banco de Dados
''' Serve Duas Funções:
    - executarQuery(): Executa Qualquer Coisa que Não seja SELECT
    - executarSelect(): Executa APENAS SELECTs
 '''

# Carrega as variáveis de ambiente do arquivo .env
load_dotenv()

# Dicionário de Configuração do banco de dados, usado nas duas funções
config = {
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "host": os.getenv("HOST"),
    "database": os.getenv("DATABASE")
}


def executarQuery(script):
    """
    Função responsável por inserir os dados no banco.
    Recebe uma query SQL como parâmetro e a executa, usando as credenciais específicas.
    """
    db = None
    cursor = None
    try:
        db = connect(**config)
        if db.is_connected():
            db_info = db.get_server_info()
            print('Connected to MySQL server version -', db_info)

            cursor = db.cursor()
            print(f"Executando a query: {script}")
            cursor.execute(script)
            db.commit()  # Confirma a transação no banco de dados
            print("Dados inseridos com sucesso!")

    except Error as e:
        print('Erro do MySQL (NAO-SELECT) -', e)

    finally:
        if cursor:
            cursor.close()
        if db:
            db.close()


def executarSelect(script):
    """
    Função responsável por executar uma query SELECT no banco de dados.
    Recebe uma query SQL como parâmetro e retorna os resultados.
    """
    db = None
    cursor = None
    rows = None
    try:
        db = connect(**config)
        if db.is_connected():
            db_info = db.get_server_info()
            print('Connected to MySQL server version -', db_info)

            cursor = db.cursor()
            print(f"Executando o select: {script}")
            cursor.execute(script)
            rows = cursor.fetchall()

    except Error as e:
        print('Error do MySQL (SELECT) -', e)

    finally:
        if cursor:
            cursor.close()
        if db:
            db.close()

    return rows
