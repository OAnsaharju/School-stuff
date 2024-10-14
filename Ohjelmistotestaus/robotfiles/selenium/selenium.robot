*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Facebook register
    Open Browser    http://www.facebook.com/r.php    Chrome    
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Sleep    2
    
    Click Element    xpath:/html/body/div[3]/div[2]/div/div/div/div/div[3]/div[2]/div/div[2]/div[1]/div

    Page Should Contain    Create a new account

    Click Element    name:firstname
    Input Text    name:firstname    Simo

    Click Element    name:lastname
    Input Text    name:lastname    Sukka

    Click Element    name:reg_email__
    Input Text    name:reg_email__    simo.sukka@example.com

    Click Element    name:reg_passwd__
    Input Password    name:reg_passwd__    Simonsukat!

    Click Element    is:month
    Select From List By Label    id:month    Jun

    Click Element    id:day
    Select From List By Label    id:day    16
    
    Click Element    id:year
    Select From List By Label    id:year    1989

    Select Radio Button    sex    2

    

*** Test Cases ***
Ny times
    Open Browser    https://www.nytimes.com    Chrome    
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    
    Sleep    2

    Maximize Browser Window

    Click Button    xpath://button[@data-testid="Reject all-btn"]

    ${count}    Get Element Count    xpath:/html/body/div[2]/div[2]/div[1]/div[2]/header/div[4]/nav/ul/li[*]/a

    Log To Console    ${count}

    ${referencePosition}    Get Vertical Position    xpath:/html/body/div[2]/div[2]/div[1]/div[2]/header/div[4]/nav/ul/li[1]/a

    FOR    ${counter}    IN RANGE    2    ${count}    
        Log    ${counter}
        ${testPosition}    Get Vertical Position    xpath:/html/body/div[2]/div[2]/div[1]/div[2]/header/div[4]/nav/ul/li[${counter}]/a
        Run Keyword And Continue On Failure    Should Be Equal    ${referencePosition}    ${testPosition}
        
    END

    Close Browser

    

