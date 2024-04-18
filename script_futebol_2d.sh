#!/usr/bin/env bash

# Matar processos em segundo plano.
trap "kill 0" EXIT

# Estrutura de verificação para nomes dos times, garante que o script seja rodado com os times ao mesmo tempo.
if [[ -z $1 || -z $2 ]]
then
    echo "Dê um nome para os dois times."
    exit 1
fi

# Verifica se o rcssserver está instalado.
if ! command -v rcssserver &> /dev/null
then
    echo "O programa rcssserver não está instalado."
    exit 1
fi
# Verifica se o rcssmonitor está instalado.
if ! command -v rcssmonitor &> /dev/null
then
    echo "O programa rcssmonitor não está instalado."
    exit 1
fi

# Roda o server e o monitor em segundo plano.
rcssserver &
rcssmonitor &

# Inicia execução dos times previamente nomeados em segundo plano.
pushd "agent2d-3.1.1/src"
./start.sh -t $1 &
./start.sh -t $2 &

wait
