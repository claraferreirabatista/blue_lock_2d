# Rodando uma partida

Para realizar este tutorial, você deve ter lido o [tutorial anterior](https://github.com/claraferreirabatista/blue_lock_2d/blob/main/como_instalar_o_servidor_e_o_monitor.md).


# Simulador de Jogo de Futebol 2D

Este script shell permite simular uma partida de futebol entre dois times no ambiente 2D.

## Pré-requisitos

- **rcssserver:** Certifique-se de ter o `rcssserver` instalado. Caso contrário, o programa não funcionará corretamente. Se necessário, instale utilizando o seguinte comando:
  ```bash
  # Comando de instalação para rcssserver
  sudo apt-get install rcssserver
  ```

- **rcssmonitor:** O `rcssmonitor` também é necessário para visualização. Verifique se está instalado na sua máquina. Caso contrário, instale-o da seguinte maneira:
  ```bash
  # Comando de instalação para rcssmonitor
  sudo apt-get install rcssmonitor
  ```

## Execução

Execute o script utilizando o comando:

```bash
bash script_futebol_2d.sh NomeDoTime1 NomeDoTime2
```

Substitua `NomeDoTime1` e `NomeDoTime2` pelos nomes desejados para os dois times que irão competir.

### Exemplo:

```bash
bash script_futebol_2d.sh TimeA TimeB
```

Agora você tem dois times no campo. Use Ctrl+K para iniciar a partida.