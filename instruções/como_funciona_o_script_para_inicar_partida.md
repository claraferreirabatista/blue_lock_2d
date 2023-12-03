# Rodando uma partida de futebol em 2D

Para seguir este tutorial, é essencial ter lido o [tutorial anterior](https://github.com/claraferreirabatista/blue_lock_2d/blob/main/como_instalar_o_servidor_e_o_monitor.md).


## Simulação de Partida de Futebol em Ambiente 2D

Este script shell simula uma partida de futebol entre dois times na RoboCup em um ambiente 2D. Para executá-lo, abra o terminal e navegue até o diretório onde o script está localizado.

Certifique-se de estar no caminho correto, por exemplo:

```bash
/caminho/do/seu/diretorio/robocup2d_server_tutorial/script
```

Substitua `/caminho/do/seu/diretorio/` pelo caminho real no seu sistema onde os arquivos estão armazenados. Este é o local onde você precisa estar no terminal antes de executar o script.

## Pré-requisitos

- **rcssserver:** Verifique se o `rcssserver` está instalado. Se não estiver, utilize o comando a seguir para instalar:
  ```bash
  sudo apt-get install rcssserver
  ```

- **rcssmonitor:** É necessário o `rcssmonitor` para a visualização. Confirme se está instalado na sua máquina. Caso contrário, instale-o com o comando:
  ```bash
  sudo apt-get install rcssmonitor
  ```

## Execução

Execute o script com o seguinte comando:

```bash
bash script_futebol_2d.sh NomeDoTime1 NomeDoTime2
```

Substitua `NomeDoTime1` e `NomeDoTime2` pelos nomes dos times que irão competir.

### Exemplo:

```bash
bash script_futebol_2d.sh Bahia Vitória
```

Agora, os dois times estão no campo. Use Ctrl+K para iniciar a partida.