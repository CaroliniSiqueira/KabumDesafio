*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://www.kabum.com.br/
${BROWSER}        gc
${CAMPO_EMAIL}    css=input.MuiInputBase-input.MuiOutlinedInput-input
${TODOS_DEP}      css=button.sc-kafWEX.fediYQ
${BTN_COMPRAR}    css=.sc-dEoRIm.eZdBGc.offerProductFooter
${LINK_LOGIN}     id=linkLoginHeader
${BTN_LOGIN}      id=botaoLogin
${BTN_BUSCAR}     id=input-busca
${CAMPO_BUSCA}    id=input-busca
${BTN_FILTRAR}    class=.sc-dNLxif.eFRWEq
${BOTAO_COMPRAR}  css=.sc-gZMcBi.kqbbWo

*** Keywords ***
#CENARIO 1
Acessar o site KaBuM
  Open Browser  url=${URL}  browser=${BROWSER}
  Maximize Browser Window
  Title Should Be   KaBuM! | Maior E-commerce de Tecnologia e Games da América Latina

Clicar em "Login"
   Click Element    id=linkLoginHeader

Preencher campo com o e-mail "${EMAIL_INVALIDO}"
   Input Text    ${CAMPO_EMAIL}    ${EMAIL_INVALIDO}

Preencher campo senha com "${SENHA_INVALIDA}"
   Press Keys    ${CAMPO_EMAIL}    TAB  ${SENHA_INVALIDA}

Clicar no botão entrar
   Click Button  ${BTN_LOGIN}

Verificar se a mensagem "${MENSAGEM_DADOS_INVALIDOS}" é exibida
    Page Should Contain   text=Identificação

#CENARIO 2
Digitar "${PESQUISA_IPHONE}" na pesquisa
   Input text   ${CAMPO_BUSCA}   ${PESQUISA_IPHONE}

Efetuar pesquisa
    Press Keys   ${CAMPO_BUSCA}   ENTER

Verificar se o produto é exibido na lista de resultados com base na mensagem "${RESULT_PESQUISA}"
    Page Should Contain   text=${RESULT_PESQUISA}

#CENARIO 3
Clicar no botão "TODOS OS DEPARTAMENTOS"
  Click Button    ${TODOS_DEP}

Entrar na opção "Hardware"
  Click Link    Hardware

Clicar no item
  Click Image    https://images.kabum.com.br/produtos/fotos/85197/85197_index_m.jpg

Clicar no botão ir para o carrinho
    Click Button   ${BOTAO_COMPRAR}
