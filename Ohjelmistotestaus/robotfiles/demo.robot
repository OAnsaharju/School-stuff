*** Settings ***
Library    String
Library    Dialogs
Library    Collections
Library    OperatingSystem
Test Setup    Create Data For Tests

*** Variables ***
${one}    Donald
${two}    Duck
@{list}    1    2    3    4


*** Keywords ***
Create Data For Tests
    ${names}=    Create List    Simo    Matti    Esko    Rami
    Set Test Variable    ${names}
    

Check value from list
    ${number}=    Set Variable    ${list}[2]
    Should Be Equal    ${number}    3


*** Test Cases ***
Add value to list
    @{list}=    Copy List    ${list}
    ${addition}=    Set Variable    333
    Append To List    ${list}    ${addition}
    Log    ${list}
    Should Be Equal    ${list}[4]    ${addition}

*** Test Cases ***
Test list length
    ${length}=    Get Length    ${list}
    ${expectedResult}=    Convert To Integer    4
    Should Be Equal    ${length}    ${expectedResult}


*** Test Cases ***
Put list in alphabetical order
    Log    ${names}
    Sort List    ${names}
    Log    ${names}
    Reverse List    ${names}
    Log    ${names}
    Should Be Equal    ${names}[0]    Scrooge


*** Test Cases ***
Remove from list
    Remove From List    ${names}    0
    Should Be Equal    ${names}[0]    Matti


*** Test Cases ***
Loop the list
    FOR    ${name}    IN    @{names}
        Log    ${name}
        
    END


*** Test Cases ***
Make a new directory
    Create Directory    C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\Testing
    Directory Should Exist    C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\Testing


*** Test Cases ***
Create a new text file
    ${path}=    Set Variable    C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\Testing
    Create File    ${path}\\example.txt    This is Fun!
    File Should Exist    ${path}\\example.txt
    File Should Not Be Empty    ${path}\\example.txt

*** Test Cases ***
Append text into file
    ${path}=    Set Variable    C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\Testing
    Append To File    ${path}\\example.txt    \nor is this


*** Test Cases ***
Clean files and directories
    ${path}=    Set Variable    C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\Testing
    Remove File    ${path}\\example.txt
    Directory Should Be Empty    ${path}
    Remove Directory    ${path}


*** Test Cases ***
ping web page and read ping time
    ${output}=    Run And Return Rc And Output    ping www.google.com
    Log    ${output}

*** Test Cases ***
Read test file and find word student
    ${data}=    Get File    C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\example_text.txt
    ${removedData}=    Remove String  ${data}    .    ,
    @{wordlist}=    Split String    ${removedData}
    ${word}=    Get Index From List    ${wordlist}    students
    ${wordIndex}=    Convert To Integer    ${word}
    Should Be Equal    ${wordIndex}    ${24}
    ${wordIndex}=    Evaluate    
