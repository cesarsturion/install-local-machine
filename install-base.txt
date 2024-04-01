#!/bin/bash

echo Atualizando repositórios..
sudo apt-get update && sudo apt-get upgrade -y

# instalacao de pacotes
sudo apt-get install -y curl vim

# instalacao do Docker
sudo curl -fsSL https://get.docker.com | bash -
sudo usermod -aG docker $USER
