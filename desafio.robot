*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${input_usuario}             //*[@id="usuario:usuario:inputId"]
${input_senha}              //*[@id="password:inputId"]



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


*** Test Cases ***
cenário 1: abrir navegador colocar login e senha e clicar em entrar
    abrir navegador
    colocar login
    clicar em entrar
        


