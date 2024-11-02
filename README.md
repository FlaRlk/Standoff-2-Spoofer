# Spoofer para Standoff 2

Este Spoofer foi criado para facilitar a vida de quem tomou banimento UID do Standoff 2, economizando nosso tempo.

## Pré-requisitos
- **Termux** instalado no Android
- **Permissões de root**

## Como Usar
### Passo 1: Instale o Termux
Se ainda não tiver o Termux, baixe-o [aqui](https://f-droid.org/packages/com.termux/).

### Passo 2: Para executar o script diretamente no Termux, copie e cole o comando abaixo no terminal:
```sh
bash <(curl -s https://raw.githubusercontent.com/FlaRlk/Standoff-2-Spoofer/main/SpooferSo2.sh)
````

### Observações
- *Se você utilizou o spoofer e está enfrentando o seguinte erro:*
  ```
  CANNOT LINK EXECUTABLE "curl": cannot locate symbol "SSL_set_value_uint" referenced by "/data/data/com.termux/files/usr/lib/libcurl.so"
  ```
  *Siga as instruções abaixo.*

- **Limpeza dos dados do Termux:**
  É necessário limpar os dados do Termux para resolver esse problema.

### Comando para limpar os dados do Termux
Você pode limpar todos os dados do Termux usando o seguinte comando:

```bash
rm -rf ~/storage ~/.bashrc ~/.bash_logout ~/.bash_profile ~/.profile
```

**Atenção:** Este comando irá remover todos os dados do Termux, incluindo arquivos, aplicativos instalados e configurações personalizadas. Após executar o comando, reinicie o Termux para que as alterações tenham efeito.
