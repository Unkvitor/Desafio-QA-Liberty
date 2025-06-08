# Automação de Testes - SGHx

Este projeto contém duas automações de teste funcionais desenvolvidas com Robot Framework e SeleniumLibrary.

## Objetivo

Automatizar e testar os seguintes fluxos funcionais no ambiente de treinamento da Liberty:

1. Alteração de parâmetro no módulo de Outros Módulos se estiver com o valor "N".
2. Pesquisa de Pacientes e Verificação da Disponibilidade do SIGA Saúde.

## Estrutura do Projeto

```
.
├── Automacao-Parametro/
│   └── parametro.robot
├── Automacao-Pesquisa-Siga/
│   └── siga.robot
├── .gitignore


## Pré-requisitos

- Python 3.8 ou superior
- Google Chrome instalado
- ChromeDriver compatível com a versão do navegador
- Instalar as bibliotecas:

```bash
pip install robotframework
pip install robotframework-seleniumlibrary
```

## Como executar os testes

1. Clone este repositório:

```bash
git clone https://github.com/Unkvitor/Desafio-QA-Liberty.git
cd "DESAFIO QA"
```

2. Execute os testes conforme a necessidade:

### Executar apenas o teste de parâmetros:
```bash
robot Automacao-Parametro/parametro.robot
```

### Executar apenas o teste de pesquisa de pacientes (SIGA):
```bash
robot Automacao-Pesquisa-Siga/siga.robot
```

### Executar todos os testes:
```bash
robot Automacao-Parametro/ Automacao-Pesquisa-Siga/
```

## Observações

- Ambiente de testes:
  https://treinamento.libertyti.com.br/aghu/pages/casca/casca.xhtml

- Credenciais:
  - Usuário: SGHX
  - Senha: qualquer caractere

- Os testes geram os seguintes relatórios após a execução:
  - `report.html` — resumo geral da execução
  - `log.html` — detalhamento passo a passo das ações realizadas
