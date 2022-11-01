#!/usr/bin/env bash

mkdir chinchila-online-arquivos && cd chinchila-online-arquivos
wget -q <link>
echo -n "===================================================
(1)Padrão
(2)Maxi Popular
(3)Ultra Popular
(4)Escuro
Baixar Painel: "
read css
case $css in
	1)
		echo "Baixado Painel Padrão"
		wget -q <link>
		;;
	2)
		echo "Baixado Painel Maxi Popular"
		wget -q <link>
		;;
	3)
		echo "Baixado Painel Ultra Popular"
		wget -q <link>
		;;
	4)
		echo "Baixado Painel Escuro"
		wget -q <link>
		;;	
esac
cd -
touch imprimeEtiquetaAtendimento
chmod u+x imprimeEtiquetaAtendimento
echo "Dado Permissão de Execução ao Arquivo: imprimeEtiquetaAtendimento"
echo -n "===================================================
(1)Tablet
(2)Computador
Será configurado: "
read var
case $var in
	1)
		echo "Configurando para Tablet"
		echo -n "Digite o IP do Tablet: "
		read IP_DO_TABLET
		echo "cat "\"\${1}\"" | nc -w 5 $IP_DO_TABLET 3333" >> imprimeEtiquetaAtendimento
		;;
	2)
		echo "Configurando para Computador"
		echo -n "Digite o IP do Computador: "
		read IP_COMPUTADOR_INSTALACAO
		echo -n "Digite o Nome de Compartilhamento da Impressora: "
		read NOME_COMPARTILHAMENTO_IMPRESSORA
		echo -n "Usuário Terminal: "
		read USUARIO
		echo -n "Digite a senha do Terminal: "
		read SENHA
		echo "#!/bin/bash" >> imprimeEtiquetaAtendimento
		echo "smbclient //$IP_COMPUTADOR_INSTALACAO/$NOME_COMPARTILHAMENTO_IMPRESSORA -U "\"$USUARIO%$SENHA\"" -c "\"print "\${1}\"" >> imprimeEtiquetaAtendimento
		;;
esac
echo -n "===================================================
(1) Sim
(2) Não
Desfazer configuração do Painel de Senhas? "
read refaz
case $refaz in
	1)
		rm -r chinchila-online-arquivos && rm imprimeEtiquetaAtendimento
		;;
	2)
		echo "Configuração Completa"
	 	;;
esac