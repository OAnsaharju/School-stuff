# Oton hommat

#1. Onko kaikilla tuotealueilla landing page.

#2. Asiakastilin luontilomakkeen input kenttien toimivuus.

#3. Takuu ja toimitusehdot sivulla olevien sivulta ulos ohjaavien linkkien toimivuus.

# kaksi itse keksimää testitapausta  ja niille testiraportit

*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    String

*** Variables ***
${file_path}    C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\selenium\\projekti\\landingpage_xpaths.txt

*** Test Cases ***
Loop Through XPaths and Click Links
    [Documentation]    This test reads a list of XPaths from a file and checks if the page
    ...    redirects to a dedicated landing page. The test logs all the URLs and fails if the addresses dont match
    Open Browser    http://jimms.fi    Chrome
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Maximize Browser Window
    Sleep    1
    ${xpaths}    Read XPaths From File    ${file_path}
        FOR    ${xpath}    IN    @{xpaths}
            ${expected_href}    Get Element Attribute    xpath:${xpath}    href
            Log    ${expected_href}
            Go To    ${expected_href}
            Sleep    1
            ${current_url}    Get Location
            Log    Current URL: ${current_url}
            Sleep    1
            Verify Page After Click    ${current_url}    ${expected_href}
        END
    Close Browser

*** Keywords ***
Read Xpaths From File
    [Arguments]    ${path}
    ${file_content}    Get File    ${path}
    ${xpaths_list}    Split String    ${file_content}    \n
    RETURN    ${xpaths_list}

Verify Page After Click
    [Arguments]    ${current_url}    ${expected_href}
    Log    Verifying the current page: ${current_url}
    Log    Expected href: ${expected_href}
    Should Be Equal As Strings    ${current_url}    ${expected_href}
    Run Keyword If    '${current_url}' == '${expected_href}'    Log    "Correct page loaded"


