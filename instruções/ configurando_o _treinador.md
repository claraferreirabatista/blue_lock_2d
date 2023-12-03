# Configurando o treinador

### SampleTrainer

Assim como o técnico (sample_coach) e o jogador (sample_player), existe uma classe sample_trainer. Basicamente, esta classe carrega os 11 jogadores e a equipe do técnico. No entanto, você pode permitir que os jogadores não façam nada ou executem tarefas específicas que estão no método actionImpl.

A classe SampleTrainer estende a classe TrainerAgent e é recomendado que você analise o código-fonte do librcsc e verifique os arquivos trainer_agent.cpp e trainer_agent.h. Os métodos estão documentados e são fáceis de entender apenas analisando o código-fonte. Alguns métodos interessantes desta classe são:

```cpp
bool doMoveBall( const Vector2D & pos, const Vector2D & vel )
bool doMovePlayer( const std::string & teamname, const int unum, const Vector2D & pos )
bool doRecover()
bool doChangeMode( const PlayMode mode )
bool doChangePlayerType( const std::string & teamname, const int unum, const int type )
```

Abra o arquivo sample_trainer.cpp e encontre o método actionImpl. Ele é algo parecido com isto:

```cpp
void
SampleTrainer::actionImpl()
{
    [...]
    //////////////////////////////////////////////////////////////////
    // Add your code here.

    //sampleAction();
    //recoverForever();
    //doSubstitute();
    //doKeepaway();
}
```


- sampleAction(): se um jogador estiver controlando a bola (se estiver na área de chute), então o treinador colocará a bola no centro do campo, soltando-a com uma velocidade aleatória.
- recoverForever(): chama doRecover() a cada 50 ciclos (recupera a energia dos jogadores).
- doSubstitute(): muda o tipo dos jogadores. (Para ver o tipo dos jogadores, pressione Ctrl+H no monitor durante uma partida).

Se você deseja usar esses métodos, apenas descomente as linhas. O primeiro método não é útil se você quiser treinar sua equipe em situações de jogo específicas. Este método é adequado quando um estado de jogo desejado é executado e você quer executá-lo novamente.
Mesmo se você quiser chamar sampleAction(), abra sua implementação e mude o valor da variável s_state de 0 para 1 (se não fizer isso, o treinador não fará nada além de iniciar um jogador que esteja na área de chute).
A implementação do método consiste em uma máquina de estados finitos que usa um switch e a variável s_state para armazenar o estado atual.

### Configurando o treinador

Vá para o diretório scr da equipe e abra o arquivo train.sh.

- Formação

Localize esta linha:


```bash
config_dir="${DIR}/formations-train"
```

Ao fazer isso, você estará utilizando suas próprias formações. Se você não souber como criar e editar formações, leia o tutorial [Criando formações com o fedit](https://github.com/RoboCup2D/tutorial/blob/master/sections/formations-with-fedit.md).
Obviamente, você pode usar as formações na pasta formations-dt. No entanto, como o objetivo aqui é utilizar sua própria estratégia, é recomendado que você crie suas formações.

Localize esta linha:

```bash
trainer="${DIR}/helios_trainer"
```
Put the desired trainer executable name of your team.

- Players

The following code loads the player and the trainer. The original code loads a single player:
```bash
OPT="-h ${host} -t ${teamname}"
OPT="${OPT} --player-config ${config} --config_dir ${config_dir}"
OPT="${OPT} ${debugopt}"

#if [ $number -gt 0 ]; then
#  $player ${OPT} -g &
#  $sleepprog $goaliesleep
#fi

#for (( i=2; i<=${number}; i=$i+1 )) ; do
  $player ${OPT} -n 11 &
  $sleepprog $sleeptime
#done

#if [ "${usecoach}" = "true" ]; then
#  $coach -h $host -t $teamname &
#fi

$trainer -h $host -t $teamname &
```
Replace the lines above with the following lines:

```bash
opt="--player-config ${config} --config_dir ${config_dir}"
opt="${opt} -h ${host} -p ${port} -t ${teamname}"
opt="${opt} ${fullstateopt}"
opt="${opt} --debug_server_host ${debug_server_host}"
opt="${opt} --debug_server_port ${debug_server_port}"
opt="${opt} ${offline_logging}"
opt="${opt} ${debugopt}"

ping -c 1 $host

# Loads the goalkeeper
if [ $number -gt 0 ]; then
  offline_number=""
  if  [ X"${offline_mode}" != X'' ]; then
    offline_number="--offline_client_number 1"
    if [ $unum -eq 0 ]; then
      $player ${opt} -g ${offline_number} &
      $sleepprog $goaliesleep
    elif [ $unum -eq 1 ]; then
      $player ${opt} -g ${offline_number} &
      $sleepprog $goaliesleep
    fi
  else
    $player ${opt} -g &
    $sleepprog $goaliesleep
  fi
fi

# Loads the number - 1 players 
i=2
while [ $i -le ${number} ] ; do
  offline_number=""
  if  [ X"${offline_mode}" != X'' ]; then
    offline_number="--offline_client_number ${i}"
    if [ $unum -eq 0 ]; then
      $player ${opt} ${offline_number} &
      $sleepprog $sleeptime
    elif [ $unum -eq $i ]; then
      $player ${opt} ${offline_number} &
      $sleepprog $sleeptime
    fi
  else
    $player ${opt} &
    $sleepprog $sleeptime
  fi

  i=`expr $i + 1`
done

# Loads the coach
if [ "${usecoach}" = "true" ]; then
  coachopt="--coach-config ${coach_conf}"
  coachopt="${coachopt} -h ${host} -p ${coach_port} -t ${teamname}"
  coachopt="${coachopt} ${team_graphic}"
  coachopt="${coachopt} --debug_server_host ${debug_server_host}"
  coachopt="${coachopt} --debug_server_port ${debug_server_port}"
  coachopt="${coachopt} ${offline_logging}"
  coachopt="${coachopt} ${debugopt}"


  if  [ X"${offline_mode}" != X'' ]; then
    offline_mode="--offline_client_mode"
    if [ $unum -eq 0 ]; then
      $coach ${coachopt} ${offline_mode} &
    elif [ $unum -eq 12 ]; then
      $coach ${coachopt} ${offline_mode} &
    fi
  else
    $coach ${coachopt} &
  fi
fi

$trainer -h $host -t $teamname &
```
Se você não quer carregar o goleiro, comente as linhas relacionadas a ele acima e altere a variável i antes do carregamento dos jogadores para i=1.
Você pode carregar quantos jogadores quiser apenas alterando o valor da variável número.

### Executando o treinador

Antes de executar o treinador, você deve iniciar o servidor no modo técnico (coach mode) (também é possível desativar a regra do impedimento):

```bash
$ rcssserver server::coach_w_referee=on server::use_offside=false
```

Para saber mais sobre as opções do servidor:

```bash
$ rcssserver server::help
```

Rode o monitor

```bash
$ rcssmonitor &
```
ou
```bash
$ soccerwindow2 &
```
Agora, execute o arquivo train.sh que você modificou.

```bash
$ ./train.sh
```
**Você não precisa executar o sample_trainer, pois isso já está feito no script train.sh.**

Também é possível especificar algumas opções personalizadas:

```bash
$ ./train.sh --help
Usage: ./train.sh [options]
  -h, --host HOST           specifies server host
  -t, --teamname TEAMNAME   specifies team name
```
O host padrão é localhost e o nome da equipe é HELIOS_base. É possível alterar isso usando:

```bash
$ ./train.sh -t Barcelona
```
Para adicionar outra equipe no campo, execute o script start.sh no diretório da equipe oponente em scr.

```bash
$ ./start.sh -t opponent_team_name
```

Agora você pode treinar sua equipe contra outra equipe para testar situações específicas!