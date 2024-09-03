import psutil


#Percentual da CPU
print(psutil.cpu_percent(interval=1))



#Uso de memória 
def memory_usage():
    mem = psutil.virtual_memory()
    return mem.percent

print(f"Uso da Memória: {memory_usage()}%")


#Uso do disco
def disk_usage(path='/'):
    disk = psutil.disk_usage(path)
    return disk.percent

print(f"Uso do Disco: {disk_usage()}%")




# MONITORAMENTO DE REDE
def network_io():
    net_io = psutil.net_io_counters()
    return net_io.bytes_sent, net_io.bytes_recv

bytes_sent, bytes_recv = network_io()
print(f"Bytes Enviados: {bytes_sent}, Bytes Recebidos: {bytes_recv}")



#Faz o monitoramento da atividade de rede
def uptime():
    return psutil.boot_time()

import datetime
boot_time = uptime()
now = datetime.datetime.now().timestamp()
uptime_duration = now - boot_time
print(f"Tempo de Atividade: {str(datetime.timedelta(seconds=uptime_duration))}")




# LARGURA DA BANDA DE REDE
import time

def network_bandwidth(interval=1):
    net_io_start = psutil.net_io_counters()
    time.sleep(interval)
    net_io_end = psutil.net_io_counters()
    
    bytes_sent = net_io_end.bytes_sent - net_io_start.bytes_sent
    bytes_recv = net_io_end.bytes_recv - net_io_start.bytes_recv
    
   
    mb_sent = bytes_sent / (1024 * 1024)
    mb_recv = bytes_recv / (1024 * 1024)
    
    return mb_sent, mb_recv

mb_sent, mb_recv = network_bandwidth()
print(f"Taxa de Envio: {mb_sent:.2f} MB/s")
print(f"Taxa de Recepção: {mb_recv:.2f} MB/s")









