import database as db
import capturaDados as cd
import os
import time
from dotenv import load_dotenv, set_key

# Carrega as variáveis de ambiente do arquivo .env
load_dotenv()
# Setando globalmente o caminho até o arquivo .env e,
# A chave para buscar o id da empresa dona desta máquina:
caminho_env = '.env'
chave_empresa = 'ID_EMPRESA'

def main():
    # Buscando o ID da empresa no .env
    idEmpresa = os.getenv(chave_empresa)

    # Se não houver ID no .env, executa a configuração inicial
    if idEmpresa is None:
        mac = cd.capturaMAC()
        # Verifica se a máquina já está cadastrada no banco de dados
        # existe recebe o valor de uma expressão booleana, algo como:
        # "O tamanho do retorno deste select é maior que 0?", ou então:
        # "Esta máquina com esse MACAddress? existe no banco de dados?"
        existe = len(db.executarSelect(f"SELECT * FROM Maquina WHERE MACAddress = '{mac}';")) > 0

        if not existe:
            # Configuração inicial, obtém o e seta ID da empresa no .env e cadastra a máquina
            setupInicial(mac)
        elif existe:
            # Caso a máquina exista no BD,
            idEmpresa = db.executarSelect(f"SELECT fkEmpresa FROM Maquina WHERE MACAddress = '{mac}';")[0][0]
            # Pega o id da empresa dona,
            # seta o id da empresa no .env
            set_key(caminho_env, chave_empresa, str(idEmpresa))
            # e, inicia a captura de dados
            capturarDados(idEmpresa, mac)
    elif idEmpresa.isdigit():
        # caso exista e for um número mesmo,
        # captura o MAC Address
        mac = cd.capturaMAC()
        # e, inicia a captura de dados
        capturarDados(idEmpresa, mac)


def setupInicial(mac):
    # Função que faz o setup inicial da máquina:
    print('''Olá! Parece que essa Máquina ainda não está cadastrada...
          Faremos a configuração inicial agora...''')

    idEmpresa = None

    # Loop até que um ID de empresa válido seja fornecido
    while True:
        idEmpresa = input("Informe o id da empresa dona desta máquina: ")

        # Verificar se o ID fornecido é numérico
        if not idEmpresa.isdigit():
            print("Por favor, insira um número válido.")
            continue

        # Verificar se o ID existe no banco de dados
        existe = len(db.executarSelect(f"SELECT * FROM Empresa WHERE idEmpresa = {idEmpresa};")) > 0
        if existe:
            break
        else:
            print("ID não encontrado na nossa base de dados! Tente novamente.")

    # Salvar o ID da empresa no arquivo .env
    # "str(idEmpresa)" garante que é uma string para colocar no .env, para evitar erros.
    set_key(caminho_env, chave_empresa, str(idEmpresa))

    # Capturando informações da máquina
    modeloCPU = cd.capturaModeloCPU()
    qtdNucleosFisicos = cd.capturaQtdNucleos(logicos=False)
    qtdNucleosLogicos = cd.capturaQtdNucleos(logicos=True)
    capacidadeRAM = cd.capturaQtdRAM()

    # Executando a inserção da máquina no banco de dados
    query = f"""
    INSERT INTO Maquina 
    (nome, fkEmpresa, modeloCPU, qtdNucleosFisicos, qtdNucleosLogicos, capacidadeRAM, MACAddress)
    VALUES ('Nova Maquina', {idEmpresa}, '{modeloCPU}', {qtdNucleosFisicos}, {qtdNucleosLogicos}, {capacidadeRAM}, '{mac}');
    """
    db.executarQuery(query)
    # Chama a função que inscreve a máquina nas capturas
    inscreverCapturas(mac)

def inscreverCapturas(mac):
    print("Inscrevendo máquina nos monitoramentos de: CPU, RAM, Disco (Usado), Disco (Livre)...")

    # Obtendo o id de recurso para cada um dos recursos que monitoramos:
    idRecursoCPU = db.executarSelect("SELECT idRecurso FROM Recurso WHERE nome = 'usoCPU';")[0][0]
    idRecursoRAM = db.executarSelect("SELECT idRecurso FROM Recurso WHERE nome = 'usoRAM';")[0][0]
    idRecursoUsadoDisco = db.executarSelect("SELECT idRecurso FROM Recurso WHERE nome = 'usadoDisco';")[0][0]
    idRecursoLivreDisco = db.executarSelect("SELECT idRecurso FROM Recurso WHERE nome = 'livreDisco';")[0][0]

    # Setando uma lista para fazer de forma mais rápida a inscrição
    listaRecursos = [idRecursoCPU, idRecursoRAM, idRecursoUsadoDisco, idRecursoLivreDisco]

    # obtendo o id da máquina através do MAC Address
    idMaquina = db.executarSelect(f"SELECT idMaquina FROM Maquina WHERE MACAddress = '{mac}'")[0][0]

    # Inserindo a inscrição da máquina para capturar cada recurso
    for recurso in listaRecursos:
        query = f"INSERT INTO MaquinaRecurso (fkMaquina, fkRecurso) VALUES ({idMaquina}, {recurso})"
        db.executarQuery(query)

def capturarDados(idEmpresa, mac):
    # Função principal do sistema, captura de dados

    # Obtendo o id de recurso de cada componente
    idRecursoCPU = db.executarSelect("SELECT idRecurso FROM Recurso WHERE nome = 'usoCPU';")[0][0]
    idRecursoRAM = db.executarSelect("SELECT idRecurso FROM Recurso WHERE nome = 'usoRAM';")[0][0]
    idRecursoUsadoDisco = db.executarSelect("SELECT idRecurso FROM Recurso WHERE nome = 'usadoDisco';")[0][0]
    idRecursoLivreDisco = db.executarSelect("SELECT idRecurso FROM Recurso WHERE nome = 'livreDisco';")[0][0]

    # Obtendo o id da máquina no BD
    idMaquina = db.executarSelect(f"SELECT idMaquina FROM Maquina WHERE MACAddress = '{mac}';")[0][0]

    # Verificando se max existe antes de acessar
    # Uma vez que o máximo de cada recurso deve ser definido pelo usuário via dashboard
    maxCPU = db.executarSelect(f"SELECT max FROM MaquinaRecurso WHERE fkMaquina = {idMaquina} AND fkRecurso = {idRecursoCPU}")
    maxCPU = maxCPU[0][0] if maxCPU else None  # Usando None se não houver resultado

    maxRAM = db.executarSelect(f"SELECT max FROM MaquinaRecurso WHERE fkMaquina = {idMaquina} AND fkRecurso = {idRecursoRAM}")
    maxRAM = maxRAM[0][0] if maxRAM else None

    maxUsadoDisco = db.executarSelect(f"SELECT max FROM MaquinaRecurso WHERE fkMaquina = {idMaquina} AND fkRecurso = {idRecursoUsadoDisco}")
    maxUsadoDisco = maxUsadoDisco[0][0] if maxUsadoDisco else None

    maxLivreDisco = db.executarSelect(f"SELECT max FROM MaquinaRecurso WHERE fkMaquina = {idMaquina} AND fkRecurso = {idRecursoLivreDisco}")
    maxLivreDisco = maxLivreDisco[0][0] if maxLivreDisco else None

    # Obtendo os ids de relacionamento da máquina com cada recurso, para usar mais a frente
    idMaquinaRecursoCPU = db.executarSelect(f"SELECT idMaquinaRecurso FROM MaquinaRecurso WHERE fkMaquina = {idMaquina} AND fkRecurso = {idRecursoCPU};")[0][0]
    idMaquinaRecursoRAM = db.executarSelect(f"SELECT idMaquinaRecurso FROM MaquinaRecurso WHERE fkMaquina = {idMaquina} AND fkRecurso = {idRecursoRAM};")[0][0]

    idMaquinaRecursoUsadoDisco = db.executarSelect(f"SELECT idMaquinaRecurso FROM MaquinaRecurso WHERE fkMaquina = {idMaquina} AND fkRecurso = {idRecursoUsadoDisco};")[0][0]
    idMaquinaRecursoLivreDisco = db.executarSelect(f"SELECT idMaquinaRecurso FROM MaquinaRecurso WHERE fkMaquina = {idMaquina} AND fkRecurso = {idRecursoLivreDisco};")[0][0]

    # Capturando todos os discos da máquina
    discos = cd.capturaTodosDiscos()

    # Contador para diferenciar a captura de disco
    counter = 0

    while True:
        usoCPU = cd.capturaUsoCPU()
        # Implementar disparo de alerta aqui verificando se é >= ao max deste recurso
        query = f"INSERT INTO Captura (fkMaquinaRecurso, registro) VALUES ({idMaquinaRecursoCPU}, {usoCPU});"
        db.executarQuery(query)

        usoRAM = cd.capturaUsoRAM()
        # Implementar disparo de alerta aqui verificando se é >= ao max deste recurso
        query = f"INSERT INTO Captura (fkMaquinaRecurso, registro) VALUES ({idMaquinaRecursoRAM}, {usoRAM});"
        db.executarQuery(query)

        # Só insere novos dados de disco caso seja a primeira vez desde que o sistema foi iniciado OU
        # Se o resto de contador / 60 for 0, ou seja,
        # dado um time.sleep de 30s, isso é:
        # monitoramento a cada 30 minutos
        if counter == 0 or counter % 60 == 0:
            for disco in discos:
                pontoMontagem = disco.mountpoint
                dadosDisco = cd.capturaUsoDisco(pontoMontagem)
                usadoDisco = dadosDisco['usado']
                livreDisco = dadosDisco['livre']

                # Inserindo uso de disco usado
                query = f"INSERT INTO Captura (fkMaquinaRecurso, registro) VALUES ({idMaquinaRecursoUsadoDisco}, {usadoDisco})"
                # Implementar disparo de alerta aqui verificando se é >= ao max deste recurso
                db.executarQuery(query)

                # Inserindo qtd livre de disco
                query = f"INSERT INTO Captura (fkMaquinaRecurso, registro) VALUES ({idMaquinaRecursoLivreDisco}, {livreDisco})"
                # Implementar disparo de alerta aqui verificando se é <= ao max deste recurso
                db.executarQuery(query)
        counter += 1

        # Pausa por 30 segundos
        time.sleep(30)


if __name__ == "__main__":
    main()
