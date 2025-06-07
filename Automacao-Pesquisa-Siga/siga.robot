*** Settings ***
Library     SeleniumLibrary     timeout=3s

*** Variables ***
${input_usuario}                //*[@id="usuario:usuario:inputId"]
${input_senha}                  //*[@id="password:inputId"]

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

clicar em pacientes
    Click Element                                //span[text()='Pacientes']

clicar em pesquisar pacientes
    Wait Until Element Is Visible                //span[text()='Pesquisar Pacientes']
    Click Element                                //span[text()='Pesquisar Pacientes']

trocar frame para pesquisar pacientes
    Select Frame                                //*[@id="i_frame_pesquisar_pacientes"]




*** Test Cases ***
Cenário 1: Abrir navegador colocar login e senha e clicar em entrar
    abrir navegador
    maximizar janela
    colocar login
    clicar em entrar

Cenário 2: Acessar ao modulo de pacientes 
    clicar em pacientes
    clicar em pesquisar pacientes
    trocar frame para pesquisar pacientes