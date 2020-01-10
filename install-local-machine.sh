#!/bin/bash

echo Atualizando repositórios..
if ! apt-get update
then
    echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi
echo "Atualização feita com sucesso"

echo "Atualizando pacotes já instalados"
if ! apt-get dist-upgrade -y
then
    echo "Não foi possível atualizar pacotes."
    exit 1
fi
echo "Atualização de pacotes feita com sucesso"

# instalacao de pacotes
if ! apt-get install telnet net-tools curl tilix vim -y
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

if ! snap install code --classic
then
    echo "Não foi possível instalar o vscode"
fi

# instalando o docker
if ! curl -fsSL https://get.docker.com | bash -
then
    echo "Não foi possível instalar o docker"
    exit 1
fi
echo "Instalação do Docker finalizada"

# instalacao do chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
