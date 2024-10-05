#!/bin/bash

echo '========================================================================================================='
echo 'Iniciando script de automação' 
echo '========================================================================================================='

sudo apt upgrade && sudo apt update -y

echo '========================================================================================================='
echo 'Iniciando alteracoes de senha'
echo '========================================================================================================='

echo 'Ubuntu:urubu100' | sudo chpasswd

echo 'Root:urubu100' | sudo chpasswd

echo '========================================================================================================='
echo 'Instalando Git'
echo '========================================================================================================='

sudo apt install git 

echo '========================================================================================================='
echo 'Verificando versao do Git'
git --version
echo '========================================================================================================='

echo '========================================================================================================='
echo 'Instalando Docker'
echo '========================================================================================================='

sudo apt install docker.io -y

echo '========================================================================================================='
echo 'Verificando versao do Docker'
docker --version
echo '========================================================================================================='

echo '========================================================================================================='
echo 'iniciando e ativando servicos Docker'
echo '========================================================================================================='

sudo systemctl start docker

sudo systemctl enable docker

echo '========================================================================================================='
echo 'Clonando repositorio no github: ServGuard'
echo '========================================================================================================='

git clone https://github.com/EduardoAAzevedo/ServGuard.git

echo '========================================================================================================='
echo 'Mudando de diretorio'
echo '========================================================================================================='

cd /home/ubuntu/ServGuard/setup/

echo '========================================================================================================='
echo 'Buildando as duas imagens, a partir dos dockerfiles'
echo '========================================================================================================='

sudo docker build -f /home/ubuntu/ServGuard/setup/dockerfile-node -t servguard-server-image .
sudo docker build -f /home/ubuntu/ServGuard/setup/dockerfile-mysql -t servguard-database-image .

echo '========================================================================================================='
echo 'Verificando se as imagens foram criadas'
sudo docker images
echo '========================================================================================================='

echo '========================================================================================================='
echo 'Criando os dois containers, a partir das imagens'
echo '========================================================================================================='

sudo docker run -d --name servguard-server -p 8080:8080 servguard-server-image

sudo docker run -d --name servguard-database -p 3306:3306 servguard-database-image

echo '========================================================================================================='
echo 'Verificando se os containers foram criados'
sudo docker ps -a
echo '========================================================================================================='