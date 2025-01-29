*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    ${EXECDIR}${/}ChromeForTesting${/}chrome.exe
${CHROME_DRIVER_PATH}     ${EXECDIR}${/}ChromeForTesting${/}chromedriver.exe
${URL}    http://localhost:7272/Form.html

*** Keywords ***
Input firstname
    Input Text    firstname    ${firstname}

Input lastname
    Input Text    lastname    ${lastname}

Input destination
    Input Text    destination    ${destination}

Input contactperson
    Input Text    contactperson    ${contactperson}

Input relationship
    Input Text    relationship    ${relationship}

Input email
    Input Text    email    ${email}

Input phone
    Input Text    phone    ${phone}


*** Test Cases ***
Start Chrome For Testing
    ${chrome_options}    Evaluate   sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}   Set Variable    ${CHROME_BROWSER_PATH}
    ${service}   Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}

Submit Contact Information with Valid Data
    [Tags]    SubmitContact 
    Input Text    id:firstname    Somsong
    Input Text    id:lastname    Sandee
    Input Text    id:destination   Europe
    Input Text    id:contactperson    Sodsai Sandee
    Input Text    id:relationship      Mother
    Input Text    id:email    somsong@kkumail.com
    Input Text    id:phone    081-111-1234
    Sleep    15s  
    Close Browser