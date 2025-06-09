*** Settings ***
#Importação da Bibilioteca do Selenium para executar as funções no robot
Library     SeleniumLibrary     timeout=3s


*** Variables ***
# Armazenamento dos XPaths de campos e botões utilizados nos testes
${input_usuario}                //*[@id="usuario:usuario:inputId"]
${input_senha}                  //*[@id="password:inputId"]
${input_nome_paciente}          //*[@id="nome:nome:inputId"]
${input_data_nasc}              //*[@id="data_nasc:data_nasc:inputId_input"]
${input_nome_mae}               //*[@id="nomeMae:nomeMae:inputId"]
${btn_detalhar}                 //*[@id="tabelaPacientes:resultList:0:j_idt108:link"]

*** Keywords ***
# Abre o navegador no ambiente de testes e mximiza a janela para melhor visualização  
abrir navegador
    open Browser           https://treinamento.libertyti.com.br/aghu/pages/casca/casca.xhtml    chrome
    Maximize Browser Window

# Preenchimento de usuário e senha e clique no botão de entrar
fazer login
    Input Text                                   ${input_usuario}               sghx
    Input Text                                   ${input_senha}                 123
    Click Element                                //*[@id="entrar"]/span

# Navegação até o módulo de pacientes -> Pesquisar Pacientes
acessar modulo de pacientes
    Wait Until Element Is Visible                //span[text()='Pacientes']             timeout=10s
    Click Element                                //span[text()='Pacientes']
    Wait Until Element Is Visible                //span[text()='Pesquisar Pacientes']   timeout=10s
    Click Element                                //span[text()='Pesquisar Pacientes']

# Troca o iframe para pesquisar pacientes para que o robot
trocar frame
    Select Frame                                //*[@id="i_frame_pesquisar_pacientes"]

# Preenchimento dos dados do paciente (nome, data de nascimento e nome da mãe)
preencher nome do paciente
    [Arguments]                                 ${nome}
   Input Text                                   ${input_nome_paciente}              ${nome}   

preencher data de nascimento
    [Arguments]                                 ${data}
    Input Text                                  ${input_data_nasc}                  ${data}     

preencher nome da mae
    [Arguments]                                 ${nome_mae}
    Input Text                                  ${input_nome_mae}                   ${nome_mae}

# Clique na opção de pesquisa fonética (busca local no sistema)
clicar em Pesquisa fonetica
    Click Element                              //*[@id="btnPesquisaFonetica:button"]/span[2]

#clica na opção de buscar via SIGA
clicar em pesquisa SIGA
    Wait Until Element Is Visible              //*[@id="bt_paciente_siga:button"]
    Click Element                              //*[@id="bt_paciente_siga:button"]

# Inicia a busca via SIGA
clicar em pesquisar SIGA
    Wait Until Element Is Visible              //*[@id="bt_pesquisar_paciente_siga:button"]
    Click Element                              //*[@id="bt_pesquisar_paciente_siga:button"]

# Rola até o fim da tela, clica em voltar e aguarda o carregamento da lista novamente
clicar em voltar 
    Press Keys    NONE    END
    Wait Until Element Is Visible             //*[@id="bt_cancelar_cadastro:button"]                    timeout=10s
    Click Element                             //*[@id="bt_cancelar_cadastro:button"]
    Wait Until Element Is Visible             //*[@id="tabelaPacientes:resultList:0:outputTextNome"]    timeout=5s

# Aguarda o resultado do SIGA por até 10 segundos
# Se o botão de detalhar não aparecer, considera que o SIGA está indisponível
validar indisponibilidade do SIGA
    Sleep    10s
    ${detalhar_existe}=    Run Keyword And Return Status    Element Should Be Visible    ${btn_detalhar}

# Encerra o navegador ao final de cada cenário
fechar navegador
    Close Browser

*** Test Cases ***
# Cenário de sucesso: paciente é localizado com pesquisa fonética (internamente no sistema)
Cenário 1: paciente localizado localmente
    abrir navegador
    fazer login
    acessar modulo de pacientes  
    trocar frame               
    preencher nome do paciente                  MARIA TESTE
    preencher data de nascimento                22/03/1997
    preencher nome da mae                        MAE TESTE
    clicar em Pesquisa fonetica
    clicar em voltar
    fechar navegador

# Cenário de falha: paciente não encontrado localmente e SIGA está indisponível
cenario 2: Paciente não localizado localmente e SIGA indisponivel
    abrir navegador
    fazer login
    acessar modulo de pacientes  
    trocar frame               
    preencher nome do paciente                  JOAO VITOR LIMA FERREIRA
    preencher data de nascimento                07/07/2003
    preencher nome da mae                       VALDELINA
    clicar em Pesquisa fonetica
    clicar em pesquisa SIGA
    clicar em pesquisar SIGA
    validar indisponibilidade do SIGA
    fechar navegador