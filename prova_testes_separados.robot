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

Caso de Teste 03 - Efetuar Busca - Nome
    [Documentation]  Esse teste assume todos o filtro nome passado na história de usuário, caso 1.
    [Tags]           filtros_pesquisa_nome
    Acessar o menu imóveis
    Deve abrir a sessão para busca de imóveis e demonstração de seu resultado
    Pesquisa pelo nome: Imóvel teste automatizado robot

Caso de Teste 04 - Efetuar Busca - Incorporadora
    [Documentation]  Esse teste assume todos o filtro Incorporadora passados na história de usuário, caso 1.
    [Tags]           filtros_pesquisa_incorporadora
    Acessar o menu imóveis
    Deve abrir a sessão para busca de imóveis e demonstração de seu resultado
    Pesquisar pela Incorporadora: BKO

Caso de Teste 05 - Efetuar Busca - Preco
    [Documentation]  Esse teste assume todos o filtro Preço passados na história de usuário, caso 1.
    [Tags]           filtros_pesquisa_preco
    Acessar o menu imóveis
    Deve abrir a sessão para busca de imóveis e demonstração de seu resultado
    Pesquisar pelo Preço: R$ 1.134.667,00 até 1.140.000,00

Caso de Teste 06 - Efetuar Busca - Estagio
    [Documentation]  Esse teste assume todos o filtro Estagio passados na história de usuário, caso 1.
    [Tags]           filtros_pesquisa_estagio
    Acessar o menu imóveis
    Deve abrir a sessão para busca de imóveis e demonstração de seu resultado
    Pesquisar pelo Estágio da obra: Pronto

Caso de Teste 07 - Efetuar Busca - Cidade
    [Documentation]  Esse teste assume todos o filtro Cidade passados na história de usuário, caso 2.
    [Tags]           filtros_pesquisa_cidade
    Deve abrir a sessão para busca de imóveis e demonstração de seu resultado
    Pesquisa pela Cidade: São Paulo

Caso de Teste 08 - Efetuar Busca - Bairro
    [Documentation]  Esse teste assume todos o filtro bairro passados na história de usuário, caso 2.
    [Tags]           filtros_pesquisa_bairrp
    Pesquisa pelo Bairro: Jardim Triana
