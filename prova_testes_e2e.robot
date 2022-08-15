*** Settings ***
Documentation    Essa suite testa os filtros da sessão imóveis dentro da interna do correto.
Resource         prova_resources.robot
Test Teardown    Printar o resultado

*** Test Cases ***
Caso de Teste 01 - Acessar o site
    [Documentation]  Esse teste acessa a URL para início dos casos de teste.
    [Tags]           acesso_site
    Abrir o navegador
    Acessar a URL https://portal.dev.cloud.aocubo.com/
    Carregar a página de destino corretamente

Caso de Teste 02 - Realizar Login
    [Documentation]  Esse teste acessa a tela de login e realiza o mesmo até a interna do corretor.
    [Tags]           login
    Já acessando o site, clique em Login no canto superior direito da tela
    Deve ser direcionado a tela de login
    Na tela de login insira o Email e Senha
    Clique em Fazer Login
    Deve ser direcionado a tela interna do corretor

Caso de Teste 03 - Efetuar Busca 1 - Todos
    [Documentation]  Esse teste assume todos os filtros passados na história de usuário, caso 1.
    [Tags]           filtros_pesquisa
    Acessar o menu imóveis
    Deve abrir a sessão para busca de imóveis e demonstração de seu resultado
    Pesquisa pelo nome: Imóvel teste automatizado robot
    Pesquisar pela Incorporadora: BKO
    Pesquisar pelo Preço: R$ 1.134.667,00 até 1.140.000,00
    Pesquisar pelo Estágio da obra: Pronto
    Todos devem retornar como resultado o imóvel: “Imóvel teste automatizado robot"

Caso de Teste 04 - Efetuar Busca 2 - Todos
    [Documentation]  Esse teste assume todos os filtros passados na história de usuário, caso 2.
    [Tags]           filtros_pesquisa
    Acessar o menu imóveis
    Deve abrir a sessão para busca de imóveis e demonstração de seu resultado
    Pesquisa pela Cidade: São Paulo
    Pesquisa pelo Bairro: Jardim Triana
    Todos devem retornar como resultado o imóvel: “Imóvel teste automatizado robot"
