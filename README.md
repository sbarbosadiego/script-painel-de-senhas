# Script de Instalação - Painel de Senhas

Este script em Bash foi desenvolvido para uso na empresa **Alpha7 Software** e automatiza a configuração de um painel de senhas para estabelecimentos como farmácias, clínicas e outros. Ele realiza o download de arquivos, configura o estilo visual do painel e define o método de impressão de etiquetas de atendimento (via tablet ou computador).

---

## 📂 Estrutura Criada

O script realiza as seguintes ações:

- Verifica a existência de diretórios anteriores:
  - `/home/alpha7/chinchila-online-arquivos/`
  - `/home/alpha7/imprimeEtiquetaAtendimento`
- Pergunta ao usuário se deseja continuar mesmo que os diretórios já existam.
- Cria um novo diretório e baixa os arquivos necessários.
- Permite escolher um tema visual do painel.
- Configura o método de impressão (Tablet ou Computador).
- Gera o script de impressão `imprimeEtiquetaAtendimento` com base nas escolhas do usuário.
- Oferece a opção de desfazer tudo no final da execução.

---

## ▶️ Como Usar

1. **Permissão de execução**:
   Antes de executar, torne o script executável:
   ```bash
   chmod +x nome-do-script.sh
   ```

2. **Execução**:
   Execute o script:
   ```bash
   ./nome-do-script.sh
   ```

3. **Responda aos prompts**:
   Durante a execução, o script solicitará algumas informações como:
   - Deseja prosseguir mesmo que os arquivos existam?
   - Qual tema deseja baixar?
   - Deseja configurar para **Tablet** ou **Computador**?
   - IPs, nomes de compartilhamento e credenciais de acesso à impressora, conforme o caso.

---

## 🎨 Temas Disponíveis

O painel oferece quatro opções de tema visual:

1. Padrão  
2. Maxi Popular  
3. Ultra Popular  
4. Escuro  

---

## 🖨️ Métodos de Impressão

- **Tablet**:
  - Utiliza `nc` (netcat) para enviar dados diretamente para o IP do tablet na porta `3333`.

- **Computador**:
  - Utiliza `smbclient` para imprimir através de compartilhamento de rede Samba.

---

## ⚠️ Observações Importantes

- **Certifique-se** de ter o `wget`, `nc` e `smbclient` instalados no sistema.
- **Evite erros de digitação** nos IPs, nomes de compartilhamento e senhas, pois não há validação automática.
- **Use com permissões apropriadas** (pode ser necessário `sudo` dependendo do ambiente).
- Os links de download devem ser substituídos pelos reais (`<link1>`, `<link2>`, etc.).

---

## 🚫 Cancelamento

Ao final da configuração, é possível desfazer tudo com a opção:
```
Desfazer configuração do Painel de Senhas? [S/N]
```

Essa ação removerá todos os arquivos e diretórios criados.

---
