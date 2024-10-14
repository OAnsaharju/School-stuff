*** Settings ***
Library    String
Library    OperatingSystem
Library    C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\lib\\maxFromList.py

*** Keywords ***
Split text
    [Arguments]    ${text}    ${index}
    @{list}=    Split String    ${text}
    ${word}=    Set Variable    ${list}[${index}]
    RETURN    ${word}

*** Test Cases ***
New Test
    ${text}=    Set Variable    Red roses and beautiful sky
    ${word}=    Split text    ${text}    1
    Should Be Equal    ${word}    roses


*** Test Cases ***
Find Max Value From List
    @{list}=    Create List    1    4    5    7    8
    ${value}=    Get Max From List    ${list}
    Log    ${value}