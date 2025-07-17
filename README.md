# Robot Test Automation Practice
Este repositório tem como objetivo a prática e o aprimoramento de automação de testes utilizando o Robot Framework, com ênfase em aplicações web e integração de bibliotecas complementares.

## Requisitos
- Python 3.12 ou superior
- Node.js 22 ou superior
- Git
- Playwright

## Instalação das Dependências do Playwright
Execute o comando abaixo para instalar as dependências necessárias do Playwright:

    npx playwright install-deps

## Configuração do Ambiente Virtual
Instale o módulo para criação de ambientes virtuais:

    sudo apt install python3.12-venv

## Crie o ambiente virtual:
    
    python3 -m venv .venv

## Ative o ambiente virtual (Linux):

    source .venv/bin/activate

## Instalação das Dependências do Projeto
As dependências do projeto estão listadas no arquivo requirements.txt. Para instalá-las, utilize:

    pip install -r requirements.txt

## Inicialização da Browser Library
Após instalar as dependências, inicialize a biblioteca do Browser:

    rfbrowser init

## Execução dos Testes Automatizados
Para executar todos os testes, utilize o comando:

    robot -d reports test/

## Geração de Relatório Customizado
Para gerar um relatório customizado utilizando o Robot Metrics:

    robotmetrics --input reports/ --output output.xml

Observações

- Certifique-se de que todas as dependências estejam corretamente instaladas antes de executar os testes.
- Consulte a documentação oficial do [Robot Framework](https://robotframework.org/) para mais informações sobre sintaxe e boas práticas.