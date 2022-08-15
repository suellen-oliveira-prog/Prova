*** Settings ***
Library    SeleniumLibrary
Library    Screenshot

*** Variables ***  
${URL}                    https://portal.dev.cloud.aocubo.com/
${BTNLOGIN}               //a[@href='/login'][contains(.,'Login')]
${BTNFAZERLOGIN}          //button[contains(@data-testid,'login-button')]
${CAMPOEMAIL}             //input[contains(@data-testid,'email-input')]
${EMAIL}                  vsantos.lvieira@gmail.com
${CAMPOSENHA}             //input[contains(@data-testid,'password-input')]
${SENHA}                  Lopo@2812
${LOGO}                   //img[contains(@src,'next/static/media/logo.39d248ad.svg')]
${MENUIMOVEIS}            //a[@href='/dashboard/imoveis'][contains(.,'Imóveis')]
${INPUTBUSCA}             //input[contains(@data-testid,'search-by-name')]
${BTNBUSCAR}              //button[@type='submit'][contains(.,'BUSCAR')]
${RESULTADO}              (//img[contains(@alt,'Imóvel teste automatizado robot (não excluir nem alterar)')])[2]
${INCORPORADORA}          //div[@class='styles__HeaderFieldItem-sc-1f6rqub-10 gWWghp'][contains(.,'Incorporadora')]
${BUSCARINCORPORADORA}    //input[contains(@name,'searchCorp')]
${BKO}                    //div[contains(@class,'styles__CorpItem-sc-1f6rqub-26 jeehYK')]   
${PRECO}                  //div[@class='styles__FieldItem-sc-1f6rqub-13 fSuMjk'][contains(.,'PreçoFaixa de PreçoatéLimpar FiltrosAplicar Filtros')] 
${PRECOINICIAL}           //input[contains(@name,'priceFrom')]
${PRECOFINAL}             //input[contains(@name,'priceUntil')]
${APLICARPRECO}           (//button[@data-testid='filter-button'][contains(.,'Aplicar Filtros')])[2]
${ESTAGIODAOBRA}          //div[@class='styles__FieldItem-sc-1f6rqub-13 fSuMjk'][contains(.,'Estágio da Obra Estágio da ObraLançamentoEm ObrasProntoLimpar FiltrosAplicar Filtros')]
${ESTAGIORADIO}           (//label[@class='styles__Container-sc-qwfn59-0 crlxLX'][contains(.,'Pronto')])[2]
${APLIACARESTAGIO}        (//button[@data-testid='filter-button'][contains(.,'Aplicar Filtros')])[4]
${CIDADEOUBAIRRO}         //div[@data-testid='city-or-neighborhood-button'][contains(.,'Cidade ou bairro')]
${CIDADE}                 //input[contains(@placeholder,'Cidade')]
${SAOPAULO}               //button[@type='button'][contains(.,'São Paulo - SP')]
${BAIRRO}                 //input[contains(@placeholder,'Bairro')]
${JARDIMTRIANA}           //button[@type='button'][contains(.,'Jardim Triana')]

*** Keywords ***
Abrir o navegador
    Open Browser  browser=chrome
    Maximize Browser Window

Printar o resultado   
    Set Screenshot Directory    path=./results
    Capture Page Screenshot

Acessar a URL https://portal.dev.cloud.aocubo.com/
    Go To    url=${URL}

Carregar a página de destino corretamente
    Wait Until Element Is Visible    locator=${BTNLOGIN}

Já acessando o site, clique em Login no canto superior direito da tela
    Click Element    locator=${BTNLOGIN}

Deve ser direcionado a tela de login
    Wait Until Element Is Visible    locator=${BTNFAZERLOGIN}

Na tela de login insira o Email e Senha
    Input Text        locator=${CAMPOEMAIL}     text=${EMAIL}
    Input Password    locator=${CAMPOSENHA}     password=${SENHA}

Clique em Fazer Login
    Click Element    locator=${BTNFAZERLOGIN}

Deve ser direcionado a tela interna do corretor
    Wait Until Element Is Visible    locator=${LOGO}

Acessar o menu imóveis
    Click Element    locator=${MENUIMOVEIS}

Deve abrir a sessão para busca de imóveis e demonstração de seu resultado
    Wait Until Element Is Visible    locator=${INPUTBUSCA}

Pesquisa pelo nome: Imóvel teste automatizado robot
    Input Text                       locator=${INPUTBUSCA}    text=Imóvel teste automatizado robot
    Click Element                    locator=${BTNBUSCAR} 
    Wait Until Element Is Visible    locator=${RESULTADO}

Pesquisar pela Incorporadora: BKO
    Click Element                    locator=${INCORPORADORA}
    Input Text                       locator=${BUSCARINCORPORADORA}    text=BKO
    Click Element                    locator=${BKO}
    Wait Until Element Is Visible    locator=${RESULTADO}

Pesquisar pelo Preço: R$ 1.134.667,00 até 1.140.000,00
    Click Element                    locator=${PRECO}
    Input Text                       locator=${PRECOINICIAL}   text=113466700
    Input Text                       locator=${PRECOFINAL}     text=114000000
    Click Element                    locator=${APLICARPRECO} 
    Wait Until Element Is Visible    locator=${RESULTADO}

Pesquisar pelo Estágio da obra: Pronto
    Click Element                    locator=${ESTAGIODAOBRA} 
    Click Element                    locator=${ESTAGIORADIO}
    Click Element                    locator=${APLIACARESTAGIO} 
    Wait Until Element Is Visible    locator=${RESULTADO}

Todos devem retornar como resultado o imóvel: “Imóvel teste automatizado robot"
    Wait Until Element Is Visible    locator=${RESULTADO}

Pesquisa pela Cidade: São Paulo
    Click Element                    locator=${CIDADEOUBAIRRO}
    Click Element                    locator=${CIDADE}
    Click Element                    locator=${SAOPAULO}
    Wait Until Element Is Visible    locator=${RESULTADO}

Pesquisa pelo Bairro: Jardim Triana
    Click Element    locator=${BAIRRO}
    Click Element    locator=${JARDIMTRIANA}  #Drop de bairro não está funcionando no firefox
    Wait Until Element Is Visible    locator=${RESULTADO}
