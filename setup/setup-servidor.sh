#!/bin/bash

# "Iniciando sript de automação" 

sudo apt upgarde && sudo apt update -y

echo 'Iniciando alterações de senha'
echo 'Ubuntu:urubu100' | sudo chpasswd

echo 'Root:urubu100' | sudo chpasswd

sudo apt install git 

echo '====================='
echo 'Verificando versão do Git'
git --version
echo '====================='

sudo apt install docker.io

echo '====================='
echo 'Verificando versão do Docker'
docker --version
echo '====================='
sudo systemctl start docker

sudo systemctl enable docker

git clone https://github.com/EduardoAAzevedo/ServGuard.git

cd /ServGuard/setup/

sudo docker build -f ./dockerfile-node -t servguard-server-image .
sudo docker build -f ./dockerfile-mysql -t servguard-database-image .

echo '====================='
echo 'Verificando se as imagens foram criadas'
sudo docker images
echo '====================='

sudo docker run -d --name servguard-server -p 8080:8080 servguard-server-image

sudo docker run -d --name servguard-database -p 3306:3306 servguard-database-image


