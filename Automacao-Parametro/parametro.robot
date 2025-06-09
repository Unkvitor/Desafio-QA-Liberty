*** Settings ***
#Importação da Bibilioteca do Selenium para executar as funções no robot
Library     SeleniumLibrary     timeout=3s

*** Variables ***
# XPath dos campos utilizados nos testes
${input_usuario}                //*[@id="usuario:usuario:inputId"]
${input_senha}                  //*[@id="password:inputId"]
${input_parametro}              //*[@id="nome:nome:inputId"]
${input_valor}                  //*[@id="vlrTexto:vlrTexto:inputId"]
${msg_sucesso}                  //span[contains(text(), 'alterado com sucesso')]


*** Keywords ***
# Abre o navegador no ambiente de treinamento liberty
abrir navegador
    open Browser           https://treinamento.libertyti.com.br/aghu/pages/casca/casca.xhtml    chrome

# Maximiza a janela do navegador para melhor visualização
maximizar janela
    Maximize Browser Window

# Preenche os campos de login com usuário e senha
colocar login
    Input Text                                   ${input_usuario}               sghx
    Input Text                                   ${input_senha}                 123

# Clica no botão de Entrar após o digitar o login e a senha
clicar em entrar
    Click Element                                //*[@id="entrar"]/span

# Fecha o navegador ao final do teste
fechar navegador
    close Browser

# Acessa o menu Outros Módulos no sistema
clicar em outros modulos
    Wait Until Element Is Visible                //span[text()='Indicadores']
    Scroll Element Into View                     //span[text()='Indicadores']
    Click Element                                //span[text()='Outros Módulos']

# Acessa o submenu Configuração
clicar em configuracoes
    Scroll Element Into View                     //span[text()='Configuração']
    Click Element                                //span[text()='Configuração']

# Acessa o submenu Sistema
clicar em sistema                   
    Scroll Element Into View                     //span[text()='Sistema']
    Click Element                                //span[text()='Sistema']

# Acessa a opção Parâmetros de Sistema
clicar em parametros do sistema     
    Scroll Element Into View                     //span[text()='Parâmetros de Sistema']
    Click Element                                //span[text()='Parâmetros de Sistema']

# Troca o iframe para parametros para que o robot consiga efetuar as ações
trocar frame para parametros
    Select Frame                                 //*[@id="i_frame_parâmetros_de_sistema"]

 # Preenche o campo com o nome do parâmetro a ser pesquisado
inserir nome do parametro
    Wait Until Element Is Visible                ${input_parametro}
    Input Text                                   ${input_parametro}        P_FLUXO_CERTIFICADO_DIGITAL_EMERGENCIA

# Clica no botão de Pesquisar para localizar o parâmetro
clicar em Pesquisar
    Click Element                               //*[@id="bt_pesquisar:button"]/span[2]

# Clica na opção Editar do parâmetro encontrado
clicar em editar
    Click Element                               //*[@id="tabelaResult:resultList:0:tabelaResult_link_editar:link"]
    Wait Until Element Is Visible               ${input_valor}          5s

# Altera o valor do parâmetro para S
alterar valor texto
    sleep       1s
    Input Text                                  ${input_valor}          S

# Clica no botão de Gravar para salvar a alteração    
clicar em gravar
    Wait Until Element Is Visible               //*[@id="bt_confirmar:button"]
    Scroll Element Into View                    //*[@id="bt_confirmar:button"]
    Click Element                               //*[@id="bt_confirmar:button"]

# Verifica se o valor do parâmetro já está como S antes de editar
verificar valor atual do parametro
    ${valor_atual}=    Get Text    //*[@id="tabelaResult:resultList_data"]/tr/td[6]
    Log    Valor atual do parâmetro: ${valor_atual}
    Run Keyword If    '${valor_atual}' == 'S'    Log    Nenhuma alteração necessária.
    Run Keyword If    '${valor_atual}' == 'S'    Pass Execution    Valor já está como S.
    fechar navegador

# Valida que o valor foi realmente alterado para 'S' após a gravação
validar alteracao
    Wait Until Element Is Visible               xpath=//*[@id="tabelaResult:resultList_data"]/tr/td[6][normalize-space(text()) = 'S']    timeout=3s

*** Test Cases ***
# Realiza login no sistema com as credenciais fornecidas
Cenário 1: realizar login no sistema
    abrir navegador
    maximizar janela
    colocar login
    clicar em entrar    
    
# Navega até o menu de Parâmetros do Sistema    
Cenário 2: Acessar outros modulos -> configuracoes -> sistema -> parametros de sistema
    clicar em outros modulos
    clicar em configuracoes
    clicar em sistema
    clicar em parametros do sistema

# Preenche e pesquisa o parâmetro no formulário
Cenário 3: Inserir o nome do parametro -> pesquisar
    trocar frame para parametros
    inserir nome do parametro
    Clicar em Pesquisar
    
# Verifica o valor atual do parâmetro, edita se necessário e valida alteração   
Cenário 4: Alterar parâmetro quando valor atual é 'N'
    verificar valor atual do parametro
    clicar em editar
    alterar valor texto
    clicar em gravar
    validar alteracao
    fechar navegador