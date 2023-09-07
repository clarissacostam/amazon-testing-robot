*** Settings ***
Library                             SeleniumLibrary

*** Variable ***
@{produto1}                          mulheres que correm com lobos
${BROWSER}                           Chrome
${urlAmazon}


*** Keywords ***

Abrir navegador

    Close All Browsers
    Open Browser                     about:blank                 ${BROWSER}
    Set Browser Implicit Wait        10s
    Set Window Size	                 1680                            900

Delete All Cookies
Fechar navegador
    Close Browser

DADO QUE Acesso amazon
    Sleep    2s
    Go To                            ${urlAmazon}

QUANDO busco o @{produto1}
    Sleep    2s
    Wait Until Element Is Visible     //*[@id="twotabsearchtextbox"]
    Input Text                        //*[@id="twotabsearchtextbox"]      @{produto1}
    Sleep    2s
    Press Keys                        //*[@id="twotabsearchtextbox"]      ENTER
    Element Text Should Be            //*[@id="search"]/div[1]/div[2]/div/span[3]/div[2]/div[1]/div/span/div/div/div[2]/div[2]/div/div[1]/div/div/div[1]/h2/a/span                Mulheres que correm com os lobos
    Capture Page Screenshot
    Execute Javascript                document.querySelector("#search > div.s-desktop-width-max.s-desktop-content.sg-row > div.sg-col-20-of-24.sg-col-28-of-32.sg-col-16-of-20.sg-col.sg-col-32-of-36.sg-col-8-of-12.sg-col-12-of-16.sg-col-24-of-28 > div > span:nth-child(4) > div.s-main-slot.s-result-list.s-search-results.sg-row > div:nth-child(1) > div > span > div > div > div:nth-child(2) > div.sg-col-4-of-12.sg-col-8-of-16.sg-col-16-of-24.sg-col-12-of-20.sg-col-24-of-32.sg-col.sg-col-28-of-36.sg-col-20-of-28 > div > div:nth-child(1) > div > div > div:nth-child(1) > h2 > a").click()
    Capture Element Screenshot        //*[@id="dp-container"]
    Select Frame                      //*[@id="bookDesc_iframe"]
    Wait Until Element Is Visible     //*[@id="iframeContent"]
    ${returnprod1}=   Get Text        //*[@id="iframeContent"]
    Set Global Variable               ${returnprod1}
    Log                               ${returnprod1}
    Unselect Frame
    Sleep    2s
    Set Focus To Element              //*[@id="add-to-cart-button"]
    Click Button                      //*[@id="add-to-cart-button"]
    Capture Page Screenshot
    Sleep    2s

E valido o carrinho com o produto indicado
    Wait Until Element Is Visible     //*[@id="huc-v2-order-row-inner"]
    Capture Element Screenshot        //*[@id="huc-v2-order-row-inner"]
    Sleep    3s
