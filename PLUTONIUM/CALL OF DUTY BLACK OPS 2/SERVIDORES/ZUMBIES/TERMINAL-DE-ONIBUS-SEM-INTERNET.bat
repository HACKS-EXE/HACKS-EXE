@SETLOCAL ENABLEEXTENSIONS
@CD /D "%~dp0"
@echo off
::-------------------Título do servidor --------------------------::
   Title Plutonium T6: Servidor Dedicado de Zombies : MistorGamex
::----------------------------------------------------------------::
set Dono=MistorGamex

::--------------------------------------------------------------------------------------------------------------------------------------------------------------::
::As pastas das configurações dos mapas, fica nas pastas main, na pagina principal do servidor.. (config_dos_servidor/main: Die_Rise.cfg)                       ::
::--------------------------------------------------------------------------------------------------------------------------------------------------------------::
:: Especifique o arquivo de configuração do servidor (que está no "t6r\data" pasta) < Esse é outro local possivel para colocar as configurações dos servidores. ::
::--------------------------------------------------------------------------------------------------------------------------------------------------------------::
::Mapas para o servidores: TranZit.cfg, Town.cfg, Origins.cfg, Nuketown.cfg, Mob_of_the_Dead.cfg, Farm.cfg, Die_Rise.cfg, Bus_Depot.cfg, Buried.cfg             ::
::--------------------------------------------------------------------------------------------------------------------------------------------------------------::
set ServerCFG=Bus_Depot.cfg
::--------------------------------------------------------------------------------------------------------------------------------------------------------------::

::-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------::
:: Portas do servidor                                                                                                                                                                                  ::
::-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------::
:: O sistema de portas pode ser de 0 a 65535 numeros de portas, escolha qual você quer.                                                                                                                ::
::-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------::
:: Para que seu servidor seja público na lista de servidores do plutonium, é necessário ter acesso ao roteador e habilitar o DMZ, ou abrir as Portas solicitada pelo servidor, abertas individualmente.::
::-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------::
:: Caso abre as portas individualmente, o protocolo deve ser UDP.                                                                                                                                      ::
::-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------::
set GamePort=4982
::-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------::

::---------------------------------------------------------------::
::Atenção: Não mexa nisso para não desconfigurar seus servidores.::
::---------------------------------------------------------------::
set gamepath=%cd%
::---------------------------------------------------------------::

::--------------------------------------------------------------------------::
::Atenção: As opções abaixo são configurações de informações dos servidores.::
::--------------------------------------------------------------------------::

::--------------------------------------------------------------------::
:: Visibilidade do Servidor = 1 para modo local, 2 para o modo online.::
:: 1 - GameDSM=1 Servidor Privado                                     ::
:: 2 - GameDSM=2 Servidor Público                                     ::
::--------------------------------------------------------------------::
set GameDSM=1
::--------------------------------------------------------------------::
if "%GameDSM%"=="1" (
::Opção: 1 Deixa o servidor no Modo local.
    set DSV=Privado
    set DSM=-lan
) else if "%GameDSM%"=="2" (
::Opção: 2 Deixa o servidor no Modo online.
    set DSV=Publico
    set DSM=
)
::----------------------------------------------------------------------------------------------------------::
:: Visibilidade da Chave, 1 para o modo local, 2 para o modo online.                                        ::
:: 1 - ServerKey=1 Esconder a Chave.                                                                        ::
:: 2 - ServerKey=2 Mostra a Chave.                                                                          ::
:: 3 - Caso não tenha a sua chave para o online acesse o site https://platform.plutonium.pw/serverkeys      ::
::----------------------------------------------------------------------------------------------------------::
set ServerKey=2
set key=Seu servidor continua privado, coloque uma Chave de acesso nele
::----------------------------------------------------------------------------------------------------------::
if "%ServerKey%"=="1" (
::Opção: 1 é para Esconder a Chave do servidor.
    set Chave=Chave de acesso Ocultada
) else if "%ServerKey%"=="2" (
::Opção: 2 Mostra a Chave.
    set Chave=%Key%
)
::---------------------------------------------------------------------------------------------------::
:: Visibilidade do IP do Servidor, 1 para Esconder o IP do servidor, 2 para Colocar o IP customizado.::
:: 1 - GameIP=1 Esconder o IP                                                                        ::
:: 2 - GameIP=2 IP customizado                                                                       ::
:: 3 - IP Padrão, localhost, 127.0.0.1 ou 0.0.0.0                                                    ::
::---------------------------------------------------------------------------------------------------::
set GameIP=1
::---------------------------------------------------------------------------------------------------::
if "%GameIP%"=="1" (
::Opção: 1 é para Esconder o IP do servidor.
    set IPLOCAL=Ip Oculto
) else if "%GameIP%"=="2" (
::Opção: 2 Coloque o IP desejado.
    set IPLOCAL=127.0.0.1
    set IP=
)
::--------------------------------------------------------------------::
:: Visibilidade do Servidor = 1 para modo local, 2 para o modo online.::
:: 1 - CD=1 Esconder local instalado do servidor                      ::
:: 2 - CD=2 Mostra local instalado do servidor                        ::
::--------------------------------------------------------------------::
set CD=1
::--------------------------------------------------------------------::
if "%CD%"=="1" (
::Opção: 1 é para Esconder o local instalado do servidor.
    set Servidores=Local instalado ocultado
) else if "%CD%"=="2" (
::Opção: 2 Mostra o local instalado.
    set Servidores=%gamepath%
)
::-------------------------------------------::
:: Troque as cores do painel das informações.::
::-------------------------------------------::
:: 0 = Preto        8 = Cinza                ::
:: 1 = Azul         9 = Azul claro           ::
:: 2 = Verde        A = Verde claro          ::
:: 3 = Verde-água   B = Verde-água claro     ::
:: 4 = Vermelho     C = Vermelho claro       ::
:: 5 = Roxo         D = Lilás                ::
:: 6 = Amarelo      E = Amarelo claro        ::
:: 7 = Branco       F = Branco brilhante     ::
::-------------------------------------------::
color 0b
echo ::--------------------------------Detalhes do Servidor-----------------------------------------------::
echo.
echo :: Data                      : %date% ::
echo ::---------------------------------------------------------------------------------------------------::
echo :: Horas                     : %time% ::
echo ::---------------------------------------------------------------------------------------------------::
echo :: Dono do Servidor          : %Dono% ::
echo ::---------------------------------------------------------------------------------------------------::
echo :: Visibilidade do Server    : %DSV% ::
echo ::---------------------------------------------------------------------------------------------------::
echo :: Porta do Server           : %GamePort% ::
echo ::---------------------------------------------------------------------------------------------------::
echo :: Mapa do Servidor          : %ServerCFG% ::
echo ::---------------------------------------------------------------------------------------------------::
echo :: Ip do Servidor            : %IPLOCAL% ::
echo ::---------------------------------------------------------------------------------------------------::
echo :: Chave do servidor         : %Chave% ::
echo ::---------------------------------------------------------------------------------------------------::
echo :: Local dos Servidores      : %Servidores% ::
echo ::...................................................................................................::
echo.
echo.
echo Iniciando o Servidor Dedicado..........
:Renicio
cd /D %LOCALAPPDATA%\Plutonium
echo.
echo.
start /wait /abovenormal .\bin\plutonium-bootstrapper-win32.exe t6zm "%gamepath%" -dedicated %DSM% +set key %Key% +set net_ip %IP% +set net_port %GamePort% +sv_config %ServerCFG%
echo.
echo.
echo ---------------------------------------------------------------
echo AVISO: O servidor parou...........[%date% - %time%]
echo Reiniciando Servidor..........[%date% - %time%] 
echo ---------------------------------------------------------------
goto Renicio
