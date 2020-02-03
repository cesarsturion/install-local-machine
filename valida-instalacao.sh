#!/bin/bash
#Criado por: Jonathan Wolff Andrade - 2012
###Metodo que verifica/instala pacote
echo "Este script verifica se o pacote esta ou nao
instalado,posteriormente instala o mesmo se necessario"
echo
echo -n "Informe o nome do Pacote: "
read nome
pacote=$(dpkg --get-selections | grep "$nome" )
echo
echo -n "Verificando se o Pacote $nome esta instalado."
sleep 2
if [ -n "$pacote" ] ;
then echo
     echo "Pacote $nome ja instalado"
else echo
     echo "Pacote $nome Necessario-> Nao instalado"
     echo "Instalando Automaticamente Pacote Dialog..."
     #sudo apt-get install $nome
fi
echo -n "Pressione qualquer tecla para sair..."
read
exit
#Observação - > sem Acentos para não rodar "bugado" com usuários
iniciantes que não configuraram corretamente o Terminal utilizado.
