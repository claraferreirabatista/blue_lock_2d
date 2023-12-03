# Editor de Formações

**Instalando o fedit**

Baixe o fedit no repositório oficial do RoboCup [aqui](http://en.sourceforge.jp/projects/rctools/downloads/48791/fedit2-0.0.0.tar.gz/).

Abra um terminal (CTRL+ALT+T), extraia os arquivos e execute:

> tar -xvpf fedit2-0.0.0.tar.gz
> cd fedit2-0.0.0

Em seguida:

> ./configure
> make
> sudo make install

Por fim:

> fedit2

**Solução de Problemas**:

> opção de linha de comando não reconhecida ‘-pthread-lQtGui’

Abra o arquivo **configure**, localize a linha abaixo e coloque um espaço entre $PKG_CONFIG e as variáveis, ficando assim:

> QT4_LDADD="$($PKG_CONFIG --static --libs-only-other $QT4_REQUIRED_MODULES) $($PKG_CONFIG --static --libs-only-l $QT4_REQUIRED_MODULES)"

Fonte: http://askubuntu.com/a/892432/664657

> erro ao carregar bibliotecas compartilhadas: librcsc_agent.so.7

Execute

> sudo ldconfig -v


Fonte: http://stackoverflow.com/questions/33506751/start-sh-dosent-work-in-agent2d-robocup