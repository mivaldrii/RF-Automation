*** Settings ***
Documentation    Auth
Library          Selenium2Library
Library          String

*** Keywords ***
# Verify User In Login Page
#     Title Should Be                PABOI
#     Page Should Contain Element    //*[text()="login"]

Input Valid Email
    [Arguments]    ${email}
    Input Text     //input[@name="emailID"]    ${email}

# Input Valid ID Paboi
#     [Arguments]    ${idpaboi}
#     Input Text     //input[@name="emailID"]    ${idpaboi}

Input Valid Password
    [Arguments]    ${password}
    Input Text     //input[@name="password"]    ${password}

Click Login Button
    Click Element    //*[@id="root"]/div[2]/div[2]/div/form/div[3]/button

Verify User Name Displayed Correctly
    [Arguments]               ${name}       ${role}
    Verify Alert Success Text Showed Correctly      Selamat Datang ${role}
    Element Text Should Be          //*[@id="root"]/div[2]/div/div[2]/div[1]/div[2]/div[1]/span[1]    ${name}

Verify User Position Displayed Correctly
    [Arguments]               ${role}
    Element Text Should Be    //*[@id="root"]/div[2]/div/div[2]/div[1]/div[2]/div[1]/span[2]    ${role}

Click Logout Button
    Click Element       //*[@id="root"]/div[2]/div/div[2]/div[1]/div[2]/div[3]/div
    Click Element       //*[text()="Logout"]

Verfiy Alert Error Showed
    Verify Alert Error Text Showed Correctly          Login Gagal!

Verify Password Field Must Be Filled
    Element Text Should Be    //*[@id="root"]/div[2]/div[2]/div/form/div[2]/div[2]    Password tidak boleh kosong

Verify Email Field Must Be Filled
    Element Text Should Be    //*[@id="root"]/div[2]/div[2]/div/form/div[1]/div[2]    Email atau ID PABOI tidak boleh kosong

Verify Email Password Field Must Be Filled
    Verify Email Field Must Be Filled
    Verify Password Field Must Be Filled

Go To Site
    Execute Javascript      window.open('${url}');
    Switch Window           locator=NEW