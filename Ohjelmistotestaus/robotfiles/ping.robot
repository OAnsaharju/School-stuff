*** Settings ***
Library    String
Library    OperatingSystem
Library    Process
Library    Collections

*** Variables ***
${INPUT_FILE}=    C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\webpages.txt
${OUTPUT_FILE}=   C:\\Users\\oansa\\Desktop\\Koulu\\Ohjelmistotestaus\\robotfiles\\pingResult.txt

*** Keywords ***
Ping Website
    [Documentation]    Pings a website and captures the output.
    [Arguments]    ${website}
    ${result}    Run Process    ping    ${website}    stdout=YES
    RETURN    ${result.stdout}

Get IP Address
    [Arguments]    ${ping_result}
    ${line_with_ip}    Get Lines Containing String    ${ping_result}    Reply from
    ${ip}    Extract Ip    ${line_with_ip}
    RETURN    ${ip}

Extract Ip
    [Arguments]    ${line_with_ip}
    ${ip}    Split String    ${line_with_ip}
    ${ip}    Split String    ${ip[2]}    :
    RETURN    ${ip[0]}

Get Response Time
    [Arguments]    ${ping_result}
    ${line_with_time}    Get Lines Containing String    ${ping_result}    Average =
    ${avg_time}    Split String    ${line_with_time}    Average =
    ${avg_time}    Split String    ${avg_time[1]}    ms
    RETURN    ${avg_time[0].strip()}

Write to File
    [Arguments]    ${OUTPUT_FILE}    ${results}
    Remove File    ${OUTPUT_FILE}
    FOR    ${result}    IN    @{results}     
        Append To File    ${OUTPUT_FILE}    Ping result: ${result} -ms average response time \n    
    END 

Test Ms in Ping
    [Arguments]    ${time}
    ${reference_time}    Set Variable    int(50)
    
    IF    ${time} < ${reference_time}
        RETURN    ${True} 
    ELSE
        RETURN    ${False}   
    END



*** Test Cases ***
Ping Website And Write Data To A File
    ${file_content}    Get File    ${INPUT_FILE}
    @{websites}    Split String    ${file_content}
    @{results}    Create List    
    
    
    FOR    ${website}    IN    @{websites}
        ${ping_result}    Ping Website    ${website}
        ${ip}    Get IP Address    ${ping_result}
        ${avg_time}    Get Response Time    ${ping_result}
        ${result_line}    Set Variable   ${ip} ${avg_time}
        ${ms_result}    Test Ms in Ping    ${avg_time}
        IF    ${ms_result} == $True
            Log    Ping average time was under 50ms!
        ELSE
            Log    Ping average time was over 50ms
        END

            
        Append To List    ${results}    ${result_line}
    END
    
    Log    ${results}
    Write to File    ${OUTPUT_FILE}    ${results}
    
