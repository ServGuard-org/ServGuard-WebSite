import psutil as ps
import cpuinfo as cpi
from getmac import get_mac_address

# Arquivo de Captura de Dados
'''
Abstrai o uso de bibliotecas externas, como psutil, cpuinfo e getmac
assim, utilizamos nossas funções sem precisar se preocupar com dependências externas
'''

def capturaMAC():
    """Captura o MAC address da máquina."""
    return get_mac_address()


def capturaUsoCPU():
    """Captura o percentual de uso da CPU."""
    return ps.cpu_percent()

def capturaModeloCPU():
    """Captura o modelo da CPU."""
    info_cpu = cpi.get_cpu_info()
    return info_cpu['brand_raw']

def capturaQtdNucleos(logicos: bool):
    """Captura os Núcleos da CPU: True = Lógicos, False = Físicos"""
    return ps.cpu_count(logicos)

def capturaUsoRAM():
    """Captura o percentual de uso da RAM."""
    return ps.virtual_memory().percent

def capturaQtdRAM():
    """Captura a quantidade total de RAM disponível no sistema."""
    memoria_total = ps.virtual_memory().total / (1024 ** 3)  # Converte para GB
    return memoria_total

def capturaTodosDiscos():
    """Captura todas as partições de disco."""
    return ps.disk_partitions(all=False)

def capturaUsoDisco(pontoMontagem):
    """Captura informações de uso de disco (total, usado, livre) em GB."""
    '''Estou usando try ... except pois pode ser buscado um ponto de
     montagem inexistente aqui, então evitamos que o programa quebre.'''
    try:
        uso = ps.disk_usage(pontoMontagem)
        return {
            'total': uso.total / (1024 ** 3), # Converte para GB
            'usado': uso.used / (1024 ** 3), # Converte para GB
            'livre': uso.free / (1024 ** 3), # Converte para GB
            'percent': uso.percent
        }
    except Exception as e:
        print(f"Erro ao acessar o ponto de montagem: {pontoMontagem}: {e}")
        return None