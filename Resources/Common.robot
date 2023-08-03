*** Settings ***
Library    Selenium2Library

*** Variables ***
${delay}            0.2
${url}              https://dev.paboi.bigio.id/
${browser}          Chrome

*** Keywords ***
Begin Web Test
    ${chrome_options}=                      Evaluate             sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method                             ${chrome_options}    add_argument                                         test-type
    Call Method                             ${chrome_options}    add_argument                                         --no-sandbox
    # Call Method                             ${chrome_options}    add_argument                                         --headless
    Call Method                             ${chrome_options}    add_argument                                         --disable-dev-shm-usage
    Call Method                             ${chrome_options}    add_argument                                         --disable-extensions
    Call Method                             ${chrome_options}    add_argument                                         --disable-gpu
    Call Method                             ${chrome_options}    add_argument                                         start-maximized
    Open Browser                            ${url}               ${browser}                                           options=${chrome_options}
    Register Keyword To Run On Failure      NONE
    # Set Window Size                         ${1920}              ${1080}
    Set Selenium Speed                      ${delay}
    Set Selenium Timeout                    10s

End Web Test
    Run Keyword If Test Failed              Capture Page Screenshot
    Close Browser

Verify Alert Success Text Showed Correctly
    [Arguments]                             ${message}
    Wait Until Element Is Visible           //*[contains(@class, "toast")]
    ${alert}                                Get Text                                                                   //*[contains(@class, "Toastify__toast-body")]
    Wait Until Element Is Visible           //*[contains(@class, "toast--success")]
    Wait Until Element Is Visible           //*[contains(@class, "Toastify__toast-body") and (text()="${message}")]

Verify Alert Error Text Showed Correctly
    [Arguments]                             ${message}
    Wait Until Element Is Visible           //*[contains(@class, "toast")]
    ${alert}                                Get Text                                                                   //*[contains(@class, "Toastify__toast-body")]
    Wait Until Element Is Visible           //*[contains(@class, "toast--error")]
    Wait Until Element Is Visible           //*[contains(@class, "Toastify__toast-body") and (text()="${message}")]

Scroll Down
    Press Keys    NONE        TAB     # this is the Page Up key
    Sleep         1