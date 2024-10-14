*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String

*** Test Cases ***
Test Second Link (www.kuluttajariita.fi)
    Open Browser    https://www.jimms.fi/fi/Info/Terms    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window
    ${test_link}    Get Element Attribute    xpath:/html/body/main/div[2]/div/div[2]/div/div/ul[7]/li[3]/a    href
    Go To    ${test_link}
    Sleep    1
    ${current_url}    Get Location
    Page Should Contain    Kuluttajariitalautakunta
    Close all Browsers

Test Second Link (www.kuluttajaneuvonta.fi)
    Open Browser    https://www.jimms.fi/fi/Info/Terms    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window
    ${test_link}    Get Element Attribute    xpath:/html/body/main/div[2]/div/div[2]/div/div/ul[7]/li[4]/a    href
    Go To    ${test_link}
    Sleep    1
    ${current_url}    Get Location
    Page Should Contain    Kilpailu- ja kuluttajavirasto
    Close all Browsers