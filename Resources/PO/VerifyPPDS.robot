*** Settings ***
Documentation    Verify PPDS
Library          Selenium2Library
Library          String

*** Variables ***
${urlLogin}                https://dev.admin.paboi.bigio.id/login

*** Keywords ***

Navigate to Log In Menu
    Execute Javascript      window.open('${urlLogin}');
    Switch Window           locator=NEW

Verify User In Login Page
    Title Should Be         PABOI

Input Valid Admin Collegium Email
    [Arguments]             ${emailAdminCollegium}
    Input Text              name:emailID        ${emailAdminCollegium}
   
Input Valid Admin Collegium Password
    [Arguments]            ${passwordAdmin}
    Input Text              name:password       ${passwordAdmin}

Click Login Button
    Click Element           //*[@id="root"]/div[2]/div[2]/div/form/div[3]/button/span[1]
    Sleep  7

Go To Registrasi SP1 Menu
    Click Element           xpath:/html/body/div[1]/div[2]/div/div[1]/div/div/div[2]/a[2]/div/div/span

Search SP1 Candidate
    # Input Text            id:nama         ${getName}
    Input Text              id:nama                     ${name}
    Sleep  5
    # Set Global Variable                                 ${name}

Go To SP1 Details
    Click Element           //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div/div[2]/div[2]/div/div/div/table/tbody/tr[1]/td[10]/div/button/span[1]
    Click Element           xpath:/html/body/div[3]/div[3]/ul/li
    Sleep  5

Go To SP1 Info Tab
    Click Element           //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div/div[1]/div/div[4]/span

Verify Payment Proof SP1
    Click Element           //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div/div[1]/div/div[5]/button[1]/span[1]
    
    ${randnum}              Generate Random String      3               0123456789
    ${randchar}             Generate Random String      1               ABCDEFGHIJKLMNOPQRSTUVWXYZ
    ${colnum}               Catenate                    SEPARATOR=-     ${randchar}     ${randnum}
    Input text              name:kolegium_no            ${colnum}           
    # verifikasi (manual)
    Sleep   5

Click Terima Button
    Click Element           //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div/div[2]/div/div[4]/span[2]/div/button[1]/span[1]
    # klik Ya (manual)
    Sleep   5
    
Go To PPDS1 Menu
    Click Element           //*[@id="root"]/div[2]/div/div[1]/div/div/div[2]/a[4]/div/div

Search SP1 Participant
    Click Element           //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[1]/div[2]/div[1]/div/div/input
    Input Text              //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[1]/div[2]/div[1]/div/div/input                     ${name}
    Sleep  5

Go To SP1 Participant Details
    Click Element           //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[2]/div/div/div/table/tbody/tr[1]/td[9]/div/button/span[1]
    Click Element           xpath:/html/body/div[3]/div[3]/ul/li
    Sleep  5

Go To SP1 Participant Info Tab
    Click Element           //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div/div[1]/div[3]/span    

Pass Participant As A Member
    Click Element           //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div/div[2]/div[5]/div[2]/button[1]/span[1]
    # nanti disini tambahiin tanggal kelulusannya
    # click submit
    
    Click Element           xpath:/html/body/div[3]/div/div/div[2]/div[2]/button/span[1]