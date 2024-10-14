*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String



*** Test Cases ***
Test Account Creation input
    Open Browser    https://www.jimms.fi    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window
    Click Element    xpath:/html/body/header/div/div[3]/jim-customer-dropdown-nav/div/div/a
    Sleep    1
    Click Element    xpath:/html/body/main/div/div[1]/div/div/div/div[2]/input
    Sleep    1
    Input Text    xpath://input[@id="pf-EmailAddress"]    Simo@sukka.test

    Input Text    xpath://input[@id="pf-Password"]    Testword

    Input Text    xpath://input[@id="pf-ConfirmPassword"]    Testword

    Input Text    xpath://input[@id="pf-FirstName"]    Simo

    Input Text    xpath://input[@id="pf-LastName"]    Sukka

    Input Text    xpath://input[@id="pf-Address"]    Testitie 123

    Input Text    xpath://input[@id="pf-PostalCode"]    12345

    Input Text    xpath://input[@id="pf-City"]    Sukkala

    Input Text    xpath://input[@id="pf-Phone"]    1234567891
    Sleep    1
    Click Element    xpath:/html/body/main/div/div[2]/div[2]/div/div/div/form/div[8]/div/input
    Sleep    3
    Close Browser


     

