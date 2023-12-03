#!/usr/bin/env bash

trap "kill 0" EXIT

if [[ -z $1 || -z $2 ]]
then
    echo "Dê um nome para os dois times"
    exit 1
fi

if ! command -v rcssserver &> /dev/null
then
    echo "O programa rcssserver não está instalado."
    exit 1
fi

if ! command -v rcssmonitor &> /dev/null
then
    echo "O programa rcssmonitor não está instalado."
    exit 1
fi

rcssserver &
rcssmonitor &

pushd "/home/clara/Área de Trabalho/blue_lock_2d/agent2d-3.1.1/src"
./start.sh -t $1 &
./start.sh -t $2 &

wait