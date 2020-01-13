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
if ! apt-get install telnet net-tools curl tilix vim vlc virtualbox -y
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
docker=$(dpkg --get-selections | grep "docker-ce" )
if ![ -n "$docker" ]
then
    if ! curl -fsSL https://get.docker.com | bash -
        echo "Instalação do Docker finalizada"
    then
        echo "Não foi possível instalar o docker"
        exit 1
    fi
else
     echo "Docker ja instalado"
fi

# instalacao do chrome
chrome=$(dpkg --get-selections | grep "chrome" )
if ![ -n "$chrome" ]
then
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb
    rm google-chrome-stable_current_amd64.deb
    echo "Instalação do Chrome finalizada"
else
     echo "Chrome ja instalado"
fi

dropbox=$(dpkg --get-selections | grep "dropbox" )
if ![ -n "$dropbox" ]
then
    wget -O /usr/local/bin/dropbox "https://www.dropbox.com/download?dl=packages/dropbox.py"
    chmod +x /usr/local/bin/dropbox
    dropbox autostart y
    echo "Instalação do DropBox finalizada"
else
     echo "Dropbox ja instalado"
fi

