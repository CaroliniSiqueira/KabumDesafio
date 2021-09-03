*** Settings ***
Resource  resource.robot

*** Test Cases ***
Cenario 1:Fazer validação de um usuário inválido
  Acessar o site KaBuM
  Clicar em "Login"
  Preencher campo com o e-mail "emailinvalid@teste.com"
  Preencher campo senha com "1234testando"
  Clicar no botão entrar
  Verificar se a mensagem "Dados inválidos, tente novamente!" é exibida


Cenario 2: acessar site e pesquisar por iphone
  Digitar "Iphone" na pesquisa
  Efetuar pesquisa
  Verificar se o produto é exibido na lista de resultados com base na mensagem "Iphone"


Cenario 3: Selecionar uma categoria no menu de “Departamento” e adiciona um produto no carrinho
  Clicar no botão "TODOS OS DEPARTAMENTOS"
  Entrar na opção "Hardware"
  Clicar no item
  Clicar no botão ir para o carrinho
  Fechar navegador
