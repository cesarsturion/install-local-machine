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
if ! apt-get install -y telnet net-tools curl tilix vim vlc zsh obs-studio
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

# if ! snap install code --classic
# then
#     echo "Não foi possível instalar o vscode"
# fi

# instalando o docker
docker=$(dpkg --get-selections | grep "docker-ce" )
if ![ -n "$docker" ]
then
    if ! curl -fsSL https://get.docker.com | bash -
        usermod -aG docker $USER
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
    dropbox start -i
    echo "Instalação do DropBox finalizada"
else
     echo "Dropbox ja instalado"
fi

# sublime=$(dpkg --get-selections | grep "sublime" )
# if ![ -n "$sublime" ]
# then
#     wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add - 
#     echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#     apt update && apt install sublime-text
#     echo "Instalação do Sublime finalizada"
# else
#      echo "Sublime ja instalado"
# fi

# instalacao do Oh-my-zsh!
zsh=$(dpkg --get-selections | grep "zsh" )
if ![ -n "$zsh" ]
then
    sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hack.zip
    mkdir ~/.fonts && cd ~/.fonts
    unzip ~/projetos/install-local-machine/Hack.zip
    source ~/.zshrc
    echo "Instalação do Oh-my-zsh! finalizada"
else
     echo "Oh-my-zsh! ja instalado"
fi

