*** Settings ***

Resource                            ../resource/amazonBuscaProduto.robot
Suite Setup                         amazonBuscaProduto.Abrir Navegador

*** Test Cases ***
CARREGA SITE AMAZON
    [Documentation]       test zup clarissa
            DADO QUE Acesso amazon
            QUANDO busco o @{produto1}
            E valido o carrinho
