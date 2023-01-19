#!/usr/bin/env bash

# Verificar se existe o diretório chinchila para seguir ou não com o script
if test -e "/home/alpha7/chinchila-online-arquivos/"; then
	while [[ ! "$refaz1" =~ [snSN] ]]; do
	echo -n "O arquivo ou diretório já existe, deseja proseguir com o script? [S/N] "
	read refaz1
	done

	if [[ "$refaz1" =~ [sS] ]]; then
		rm -r /home/alpha7/chinchila-online-arquivos/ && rm -r /home/alpha7/imprimeEtiquetaAtendimento
	fi

	if [[ "$refaz1" =~ [nN] ]]; then
		exit 0
	fi
fi
# Caso tenha selecionado S, será dado sequência com o script do painel
cd /home/alpha7
mkdir chinchila-online-arquivos && cd chinchila-online-arquivos
wget -q <logo-link>
# Selecionar o tema do painel de senhas, sempre é bom verificar com o cliente qual a rede do mesmo
while [[ ! "$css" =~ [1234] ]]; do
	echo -n "=================================================================
(1)Padrão
(2)Maxi Popular
(3)Ultra Popular
(4)Escuro
Baixar Painel: "
read css
done
# Como o arquivo CSS não é de minha autoria não deixei o mesmo salvo no repositório
# De alguma forma os links do discord duram por muito tempo, optei por então usar eles para baixar o arquivo css
case $css in
	1)
		echo "Baixado Painel Padrão"
		wget -q <link1>
		;;
	2)
		echo "Baixado Painel Maxi Popular"
		wget -q <link2>
		;;
	3)
		echo "Baixado Painel Ultra Popular"
		wget -q <link3>
		;;
	4)
		echo "Baixado Painel Escuro"
		wget -q <link4>
		;;	
esac
cd -
touch imprimeEtiquetaAtendimento
chmod u+x imprimeEtiquetaAtendimento
# Configurar em como será feito a impressão do cupom de atendimento, este pode ser feito por tablet e computador
# Caso seja um tablet windows pode ser usado a opção de computador
echo "=================================================================
Dado Permissão de Execução ao Arquivo: imprimeEtiquetaAtendimento"
while [[ ! "$var" =~ [12] ]]; do
echo -n "=================================================================
(1)Tablet
(2)Computador
Será configurado: "
read var
done
case $var in
	1)
		echo "================================================================="
		echo "                    Configurando para Tablet"
		echo -n "Digite o IP do Tablet: "
		read IP_DO_TABLET
		echo "cat "\"\${1}\"" | nc -w 5 $IP_DO_TABLET 3333" >> imprimeEtiquetaAtendimento
		;;
	2)
		echo "================================================================="
		echo "                   Configurando para Computador"
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
# Finalização da configuração do painel de senhas, caso preenchido alguma informação incorreta pode ser cancelado o mesmo
while [[ ! "$refaz" =~ [snSN] ]]; do
echo -n "=================================================================
Desfazer configuração do Painel de Senhas? [S/N] "
read refaz
done
if [[ "$refaz" =~ [sS] ]]; then
	rm -r chinchila-online-arquivos && rm imprimeEtiquetaAtendimento
fi
if [[ "$refaz" =~ [nN] ]]; then
	echo "Configuração Completa"
fi
