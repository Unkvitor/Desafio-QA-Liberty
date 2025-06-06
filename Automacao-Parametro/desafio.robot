*** Settings ***
Library     SeleniumLibrary     timeout=3s

*** Variables ***
${input_usuario}             //*[@id="usuario:usuario:inputId"]
${input_senha}              //*[@id="password:inputId"]
${input_parametro}          //*[@id="nome:nome:inputId"]
${input_valor}              //*[@id="vlrTexto:vlrTexto:inputId"]


*** Keywords ***  
abrir navegador
    open Browser           https://treinamento.libertyti.com.br/aghu/pages/casca/casca.xhtml    chrome

maximizar janela
    Maximize Browser Window

colocar login
    Input Text                                   ${input_usuario}               sghx
    Input Text                                   ${input_senha}                 123

clicar em entrar
    Click Element                                //*[@id="entrar"]/span

fechar navegador
    close Browser

clicar em outros modulos
    Wait Until Element Is Visible                //*[@id="nav-scroll"]/ul/li[11]/a
    Scroll Element Into View                     //*[@id="nav-scroll"]/ul/li[11]/a
    Click Element                                //*[@id="nav-scroll"]/ul/li[14]/a/span

clicar em configuracoes
    Scroll Element Into View                     //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/a/span
    Click Element                                //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/a/span

clicar em sistema                   
    Scroll Element Into View                     //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/ul/li[1]/a
    Click Element                                //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/ul/li[1]/a

clicar em parametros do sistema     
    Scroll Element Into View                     //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/ul/li[1]/ul/li[1]/a/span
    Click Element                                //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/ul/li[1]/ul/li[1]/a/span

trocar frame para parametros
    Select Frame                                 //*[@id="i_frame_parâmetros_de_sistema"]   

inserir nome do parametro
    Input Text                                   ${input_parametro}        P_FLUXO_CERTIFICADO_DIGITAL_EMERGENCIA

clicar em Pesquisar
    Click Element                               //*[@id="bt_pesquisar:button"]/span[2]

clicar em editar
    Click Element                               //*[@id="tabelaResult:resultList:0:tabelaResult_link_editar:link"]
    sleep       1s

alterar valor texto
    Input Text                                  ${input_valor}      S

clicar em gravar
    Wait Until Element Is Visible               //*[@id="bt_confirmar:button"]
    Scroll Element Into View                    //*[@id="bt_confirmar:button"]
    Click Element                               //*[@id="bt_confirmar:button"]

*** Test Cases ***
Cenário 1: Abrir navegador colocar login e senha e clicar em entrar
    abrir navegador
    maximizar janela
    colocar login
    clicar em entrar    
    clicar em outros modulos
    
Cenário 2: Acessar outros modulos → configuracoes → sistema → parametros de sistema
    clicar em configuracoes
    clicar em sistema
    clicar em parametros do sistema

Cenário 3: Inserir o nome do parametro e pesquisar
    trocar frame para parametros
    inserir nome do parametro
    Clicar em Pesquisar

   
Cenário 4: Clicar em Editar, alterar valor texto e clicar em gravar
    clicar em editar
    alterar valor texto
    clicar em gravar