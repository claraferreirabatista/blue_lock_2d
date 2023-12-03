# Tutorial de Simulação de Futebol RoboCup2D (NÃO OFICIAL)

> :warning: **AVISO** :warning:
> 
> Estes tutoriais não são oficiais e algumas seções ainda estão faltando.
>
> Eu traduzi o [repositório](https://github.com/herodrigues/robocup2d-tutorial/tree/master) afim de organizar todas as informações que pude reunir e compartilhar com outros desenvolvedores da minha equipe.
>
> Não há garantia de que tudo funcionará corretamente no seu sistema operacional. Por favor, esteja ciente disso!
>
> Para o guia oficial da RoboCup 2D e o código-fonte, acesse https://rcsoccersim.github.io/ e https://github.com/rcsoccersim.

Este repositório contém uma série de tutoriais sobre a Simulação de Futebol RoboCup2D.

Este tutorial está disponível aqui: https://github.com/herodrigues/robocup2d-tutorial/tree/master

**NOTA**:
- É preferível usar sua distribuição Linux em inglês. Alguns problemas foram relatados ao executar o simulador quando o idioma do sistema usa a vírgula como separador decimal, por exemplo, no idioma português.

# Simulador de Futebol RoboCup

## Sobre o Simulador de Futebol RoboCup

O Simulador de Futebol RoboCup é uma ferramenta de pesquisa e educação para sistemas multiagentes e inteligência artificial. Ele possibilita que duas equipes de 11 jogadores robóticos autônomos simulados joguem futebol.

## Visão Geral da Liga

Sem a necessidade de manter qualquer hardware de robô, o foco da Liga de Simulação RoboCup envolve inteligência artificial e estratégia de equipe.

Na Liga de Simulação 2D, duas equipes de onze programas de software autônomos (chamados agentes) jogam futebol em um estádio virtual bidimensional representado por um servidor central, chamado [SoccerServer](https://github.com/rcsoccersim/). Esse servidor sabe tudo sobre o jogo, ou seja, a posição atual de todos os jogadores e da bola, a física e assim por diante. O jogo depende da comunicação entre o servidor e cada agente. Por um lado, cada jogador recebe entradas relativas e ruidosas de seus sensores virtuais (visuais, acústicos e físicos) e, por outro lado, pode executar alguns comandos básicos (como correr, virar ou chutar) para influenciar seu ambiente.

O grande desafio na Liga de Simulação é concluir, a partir de todos os possíveis estados do mundo (derivados da entrada do sensor ao calcular uma visão do mundo o mais absoluta e livre de ruído possível), a melhor ação possível a ser executada. Como um jogo é dividido em 6000 ciclos, essa tarefa deve ser concluída em um intervalo de tempo de 100 ms (o comprimento de cada ciclo). 

## Download

- [Servidor](https://github.com/rcsoccersim/rcssserver/releases)
- [Monitor](https://github.com/rcsoccersim/rcssmonitor/releases)
- [Arquivo de Log e Binário](https://archive.robocup.info/Soccer/Simulation/2D/)

### Documentação

- [Manual do Usuário](https://rcsoccersim.readthedocs.io/en/latest/)

## Comunidade

Por favor, junte-se à [comunidade de Simulação de Futebol 2D](https://discord.gg/yFxkCcatGe), onde você pode perguntar como desenvolver suas equipes e discutir as regras do jogo e, é claro, o futuro da liga! Você também pode receber informações úteis dos organizadores dos eventos (como a Competição Mundial, RoboCup Ásia-Pacífico (RCAP) e outros eventos locais, incluindo Brasil, China, Irã, Japão e Portugal) e as últimas atualizações do simulador de futebol.

Recomendamos que você se inscreva na [lista de discussão do RoboCup Soccer Simulation](https://lists.robocup.org/mm/lists/robocup-sim.lists.robocup.org/) para se manter atualizado e postar dúvidas e pedir ajuda da comunidade para iniciar uma nova equipe.

Naturalmente, as páginas da web oficiais também ajudam você a se manter atualizado. Verifique as [páginas da web da Liga de Simulação de Futebol RoboCup](https://ssim.robocup.org/) periodicamente.

- [Site oficial da Federação RoboCup](https://www.robocup.org/)

### Artigos presentes no [repositório do @herodrigues](https://github.com/herodrigues/robocup2d-tutorial/tree/master)

- Tutoriais
    - [Instalando o simulador](sections/installing-the-soccer-simulator.md)
    - [Executando uma partida com agent2d](sections/running-a-match-with-agent2d.md)
    - [Configurando o treinador](sections/configuring-the-trainer.md)
    - [Criando formações com fedit](sections/formations-with-fedit.md)

- Utilidade
    - [Tutorial do Autotools](sections/autotools-tutorial.md)
    - [Script para executar servidor, monitor e equipes simultaneamente](sections/script-for-running-server-and-match.md)
    - [SoccerWindow2 como depurador](sections/soccerwindow2-debugger.md)

- Desenvolvimento de Equipes
    - [Posicionamento dinâmico](sections/dynamic-positioning.md)

**agent2D**
- Ações encadeadas
    - [ActionGenerator](sections/ActionGenerator.md)
    - [ActionStatePair](sections/ActionStatePair.md)
    - [CooperativeAction](sections/CooperativeAction.md)
    - [FieldAnalyzer](sections/FieldAnalyzer.md)
    - [PredictState](sections/PredictState.md)
- Comportamentos
    - [Bhv_BasicMove](sections/Bhv_BasicMove.md)
    - [Bhv_BasicOffensiveKick](sections/Bhv_BasicOffensiveKick.md)
    - [Bhv_BasicTackle](sections/Bhv_BasicTackle.md)
    - [Bhv_GoToStaticBall](sections/Bhv_GoToStaticBall.md)
- Funções
    - [Funções](sections/Roles.md)
- Outros
    - [Estratégia](sections/Strategy.md)

**librcsc**
   - Geometria
     - [AngleDeg](sections/AngleDeg.md)
     - [Line2D](sections/Line2D.md)
     - [Matrix2D](sections/Matrix2D.md)
     - [Ray2D](sections/Ray2D.md)
     - [Triangulação](sections/Triangulation.md)
     - [Vector2D](sections/Vector2D.md)
     - [Diagrama de Voronoi](sections/VoronoiDiagram.md)
   - Jogador
     - [BallObject](sections/BallObject.md)
     - [PlayerObject](sections/PlayerObject.md)
     - [PlayerAgent](sections/PlayerAgent.md)
     - [SoccerAction](sections/SoccerAction.md)
     - [Localização](sections/Localization.md)
     - [SeeState](sections/SeeState.md)
     - [InterceptTable](sections/InterceptTable.md)
   - Outros
     - [MathUtil](sections/MathUtil.md)
     - [SoccerMath](sections/SoccerMath.md)
