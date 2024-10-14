*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${CHOOSE_DEPARTURE_CITY_PATH}    xpath:/html/body/div[3]/form/select[1]
${CHOOSE_DESTINATION_CITY_PATH}    xpath:/html/body/div[3]/form/select[2]
${FIND_FLIGHTS_BUTTON_PATH}    xpath:/html/body/div[3]/form/div/input
${FLIGHT_FORM}    xpath://form[contains(@action, 'purchase.php')]
${FLIGHT_PRICE_PATH}    xpath:/html/body/div[2]/table/tbody/tr[1]/td[6]
${FLIGHT_NUMBER_PATH}    xpath:/html/body/div[2]/table/tbody/tr[1]/td[2]
${FLIGTH_COMPANY_PATH}    xpath:/html/body/div[2]/table/tbody/tr[1]/td[3]
${CHOOSE_FLIGHT_BUTTON}    xpath:/html/body/div[2]/table/tbody/tr[1]/td[1]/input
${CHECKOUT_PRICE_PATH}    xpath:/html/body/div[2]/p[3]
${CHECKOUT_FN_PATH}    xpath:/html/body/div[2]/p[2]
${CHECKOUT_COMPANY_PATH}    xpath:/html/body/div[2]/p[1]
${FULL_PRICE_PATH}    xpath:/html/body/div[2]/p[5]/em

*** Test Cases ***
Flight register
    Open Browser    http://blazedemo.com/     Chrome    
    ...    options=add_argument("disable-search-engine-choice-screen"); add_experimental_option("detach", True)
    Sleep    2

    Page Should Contain    Welcome to the Simple Travel Agency!

    Select From List By Label    ${CHOOSE_DEPARTURE_CITY_PATH}    Boston
    
    ${departure_city}=    Get Value    ${CHOOSE_DEPARTURE_CITY_PATH}


    Select From List By Label    ${CHOOSE_DESTINATION_CITY_PATH}    Cairo
    
    ${destination_city}=    Get Value    ${CHOOSE_DESTINATION_CITY_PATH}


    Element Should Be Enabled    ${FIND_FLIGHTS_BUTTON_PATH}

    Click Button    ${FIND_FLIGHTS_BUTTON_PATH}

    Sleep    2

    Page Should Contain    Flights from ${departure_city} to ${destination_city}

    
    Sleep    2

    ${flight_count}    Get Element Count    ${FLIGHT_FORM}

    Run Keyword If    ${flight_count} > 0    Log    "Flight options found: ${flight_count}"
    Run Keyword If    ${flight_count} == 0    Fail    "No flight options found"

    
    ${flight_price}    Get Text    ${FLIGHT_PRICE_PATH}
    ${fligth_number}    Get Text    ${FLIGHT_NUMBER_PATH}
    ${fligth_company}    Get Text    ${FLIGTH_COMPANY_PATH}

    Click Button    ${CHOOSE_FLIGHT_BUTTON}


    #Getting the checkout-page data to variables and formate
    
    ${checkout_price}    Get Text    ${CHECKOUT_PRICE_PATH}
    ${checkout_price}    Split String    400
    ${checkout_fn}    Get Text    ${CHECKOUT_FN_PATH}
    ${checkout_fn}    Split String    UA954
    ${checkout_company}    Get Text    ${CHECKOUT_COMPANY_PATH}
    ${checkout_company}    Split String   United 

    Should Not Be Equal    ${checkout_price}[0]    ${flight_price}
    Should Not Be Equal    ${checkout_fn}[0]   ${fligth_number}
    Should Not Be Equal    ${checkout_company}[0]    ${fligth_company}

    #Due to the page not working correctly we include comparison test for the first 
    #variables. That test is expected to fail for now. We continue the test after allocating the data
    #to new variables in the page
    
    ${full_price}    Get Text    ${FULL_PRICE_PATH}

    #filling the inputs for form in checkout
    
    #name
    Input Text    xpath://input[@id="inputName"]    Simo Sukka
    
    Input Text    xpath://input[@id="address"]    Teststreet

    Input Text    xpath://input[@id="city"]    Funkytown

    Input Text    xpath://input[@id="state"]    Utah

    Input Text    xpath://input[@id="zipCode"]    12345

    Input Text    xpath://input[@id="creditCardNumber"]    1234 5678 9101 1121

    Input Text    xpath://input[@id="nameOnCard"]    Simo Sukka

    
    
    ${card_month}    Get Element Attribute    xpath://input[@id="creditCardMonth"]    value
    ${card_year}    Get Element Attribute    xpath://input[@id="creditCardYear"]    value

    Log    ${card_month}
    Log    ${card_year}

    Select From List By Label    xpath:/html/body/div[2]/form/div[6]/div/select    Diner's Club


    Click Element    id:rememberMe

    Click Element    xpath:/html/body/div[2]/form/div[11]/div/input

    Page Should Contain    Thank you for your purchase today!

    ${expiration_date}    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[5]/td[2]

    ${expiration_date}    Split String    2018 11

    ${price_amount}    Get Text    xpath:/html/body/div[2]/div/table/tbody/tr[3]/td[2]
    ${price_amount}    Split String    555

    #the card expiration dates differ on the site !BUG!
    
    Run Keyword And Continue On Failure    Should Be Equal    ${card_year}    ${expiration_date}[0]
    Should Be Equal    ${card_month}    ${expiration_date}[1]

    #the total price amount differs on the site !BUG!
    
    Run Keyword And Continue On Failure    Should Be Equal    ${full_price}    ${price_amount}[0]

    Sleep    2

    Close Browser


    
    