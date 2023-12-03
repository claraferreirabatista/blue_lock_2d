# Instalação

### Configurando o ambiente e instalando o servidor e monitor

Os seguintes passos foram testados e executados usando o Ubuntu Linux 12.04 e Debian Wheezy 7.

Abra um terminal e execute:

> sudo apt-get install g++ build-essential libboost-all-dev qt4-dev-tools libaudio-dev libgtk-3-dev libxt-dev bison flex

Extraia o arquivo rcssserver presente nesse repositório:

> tar -zxpf rcssserver-x.x.x.tar.gz

Configure e compile o rcssserver:

> cd rcssserver-x.x.x  
> ./configure && make  
> sudo make install

Para instalar o rcssmonitor, vá até o final deste artigo e siga os mesmos passos para instalar o monitor soccerwindow2.

---

### (Opcional) Usando um time base

Extraia as pastas presentes também nesse repositório:

> tar -zxpf librcsc-x.x.x.tar.gz  
> tar -zxpf agent2d-x.x.x.tar.gz

**OBSERVAÇÃO**: os nomes de todos os diretórios onde os arquivos do librcsc são salvos não devem conter espaços.

#### Instalando librcsc

**IMPORTANTE:** _As informações sobre todos os jogadores são escritas em um registro no qual o ponto (.) é usado como separador decimal. Algumas línguas, como o Português, usam a vírgula como separador decimal, causando um erro de I/O.
O idioma do seu sistema deve ser inglês. Se não for, execute o comando `export LC_NUMERIC="C"` em um terminal para evitar quaisquer problemas._

> cd librcsc-x.x.x/

Execute os comandos:

**Nota:** _Se você tiver problemas de permissão no primeiro passo, em vez de_ `./configure` _, execute_ `sh ./configure`.

> ./configure  
> make  
> sudo make install

#### Instalando agent2d

> cd agent2d-x.x.x/

Execute:

> ./configure  
> make  
> sudo make install

#### Solução de Problemas

O Agent2D é um projeto bastante antigo (última versão lançada foi em 2012) e você pode ter problemas com a versão do seu compilador C++.

1. Erros `constexpr`

`error: ‘constexpr’ needed for in-class initialization of static data member ‘const double {anonymous}::DeflectingEvaluator::not_shoot_ball_eval’ of non-integral type`

Soluções possíveis (cada item é uma solução separada):

- Execute `make` com a flag C++ `fpermissive`
- Mova `static const double not_shoot_ball_eval = 10000` em `src/chain_action/tackle_generator.cpp` (linha 71) para fora da estrutura `DeflectingEvaluator`. Você pode colocá-lo imediatamente após `const int ANGLE_DIVS = 40` (linha 64).

### (Opcional) Instalando o monitor soccerwindow2

Há outro monitor que fornece informações mais detalhadas sobre partidas e informações dos jogadores. Este monitor é usado na Copa do Mundo Robocup oficial. Se você deseja instalá-lo, apenas execute estes comandos:

No repositório RoboCup citado acima neste tutorial, baixe este [arquivo](https://osdn.net/projects/rctools/releases/p4886).

Abra um terminal e execute:

> tar -zxpf soccerwindow2-x.x.x.tar.gz  
> cd soccerwindow2-x.x.x.tar.gz  
> ./configure  
> make  
> sudo make install

**Solução de Problemas**:

Se você receber este erro (e provavelmente irá):

> unrecognized command line option ‘-pthread-lQtGui’

Abra o arquivo **configure**, localize a linha abaixo e coloque um espaço entre $PKG_CONFIG as variáveis, então ficará assim:

> QT4_LDADD="$($PKG_CONFIG --static --libs-only-other $QT4_REQUIRED_MODULES) $($PKG_CONFIG --static --libs-only-l $QT4_REQUIRED_MODULES)"

Fonte: http://askubuntu.com/a/892432/664657

### Conclusão

Com tudo feito, é hora de rodar uma partida e testar se tudo foi feito sem erros.
Veja o próximo tutorial [aqui](https://github.com/claraferreirabatista/blue_lock_2d/blob/main/script/como_funciona_o_script_para_inicar_partida.md).
