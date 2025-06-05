*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${input_usuario}             //*[@id="usuario:usuario:inputId"]
${input_senha}              //*[@id="password:inputId"]
${input_parametro}          //*[@id="nome:nome:inputId"]



*** Keywords ***  
abrir navegador
    open Browser    https://treinamento.libertyti.com.br/aghu/pages/casca/casca.xhtml    chrome

colocar login
    Input Text          ${input_usuario}        sghx
    Input Text          ${input_senha}          123

clicar em entrar
    Click Element       //*[@id="entrar"]/span

fechar navegador
    close Browser

clicar em outros modulos
    Scroll Element Into View         //*[@id="nav-scroll"]/ul/li[14]/a/span
    Click Element                   //*[@id="nav-scroll"]/ul/li[14]/a/span

clicar em configuracoes
    Scroll Element Into View        //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/a/span
    Click Element                   //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/a/span

clicar em sistema                   
    Scroll Element Into View        //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/ul/li[1]/a
    Click Element                   //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/ul/li[1]/a

clicar em parametros do sistema
    Scroll Element Into View        //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/ul/li[1]/ul/li[1]/a/span
    Click Element                   //*[@id="nav-scroll"]/ul/li[14]/ul/li[5]/ul/li[1]/ul/li[1]/a/span

trocar frame para parametros
    Select Frame    //*[@id="i_frame_parâmetros_de_sistema"]   

inserir nome do parametro
    Input Text          ${input_parametro}        P_FLUXO_CERTIFICADO_DIGITAL_EMERGENCIA

Clicar em Pesquisar
    Click Element                   //*[@id="bt_pesquisar:button"]/span[2]
 

*** Test Cases ***
cenário 1: abrir navegador colocar login e senha e clicar em entrar
    abrir navegador
    colocar login
    clicar em entrar
        
    clicar em outros modulos
cenario 2: Acessar outros modulos → configuracoes → sistema → parametros de sistema
    clicar em configuracoes
    clicar em sistema
    clicar em parametros do sistema

cenario 3: Inserir o nome do parametro e pesquisar
    trocar frame para parametros
    inserir nome do parametro
    Clicar em Pesquisar