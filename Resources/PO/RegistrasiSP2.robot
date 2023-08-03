*** Settings ***
Documentation    Registrasi PPDS 1
Library          Selenium2Library
Library          String

*** Keywords ***
Click Dropdown College
    Click Element    //*[@id="layout-nav"]/div/div[4]/ul/li[5]/a
    Click Element    //*[@id="layout-nav"]/div/div[4]/ul/li[5]/ul/li[7]/a

Input Email
    ${rand}                 Generate Random String      3               0123456789
    ${email}                Catenate                    SEPARATOR=      manbo       ${rand}     @gmail.com
    Input Text              id:email                    ${email}
    Set Global Variable     ${email}
    Set Global Variable     ${rand}

Input Password
    [Arguments]            ${password}
    Input Text             id:password    ${password}
    Set Global Variable    ${password}

Input Confirm Password
    [Arguments]    ${confirmPas}
    Input Text     id:konfirmasi    ${confirmPas}

Chooose Specialist
    Click Element    //input[@id="spesialis"]

Verify Form SP1
    Page Should Contain Element     id:npa
    Page Should Contain Element     //*[@id="select2-idAsalFK-container"]
    Page Should Contain Element     //*[@id="select2-tahunLulus-container"]
    Page Should Contain Element     id:nama 
    Page Should Contain Element     id:tempatlahir
    Page Should Contain Element     id:tanggallahir
    Page Should Contain Element     id:handphone 
    Page Should Contain Element     id:ip_s1
    Page Should Contain Element     id:ip_profesi  
    Page Should Contain Element     id:ip_kumulatif
    Page Should Contain Element     name:PSD_Bulan
    Page Should Contain Element     name:PSD_Tahun

Input NPA
    ${npa}                 Catenate    SEPARATOR=                             256000000    ${rand}
    Input Text             id:npa      ${npa}
    Set Global Variable    ${rand}

Select Asal FK
    [Arguments]      ${asalFK}
    Click Element    //*[@id="select2-idAsalFK-container"]
    Sleep            2
    Input Text       xpath:/html/body/span/span/span[1]/input    ${asalFK}
    Press Keys       xpath:/html/body/span/span/span[1]/input    ENTER

Select Tahun Lulus
    [Arguments]         ${tahunLulus}
    Click Element       //*[@id="select2-tahunLulus-container"]
    Sleep   2
    Input Text          xpath:/html/body/span/span/span[1]/input        ${tahunLulus}
    Press Keys          xpath:/html/body/span/span/span[1]/input        ENTER

Input Nama Lengkap
    ${name}       Catenate    SEPARATOR=    Sebastian Lee T    ${rand}
    Input Text    id:nama     ${name}
    Set Global Variable    ${name}
    Set Global Variable    ${rand}      

Input Tempat Lahir
    [Arguments]    ${tempatLahir}
    Input Text     id:tempatlahir    ${tempatLahir}
    Scroll Down

Input Tanggal Lahir
    [Arguments]    ${tanggalLahir}
    Input Text     id:tanggallahir    ${tanggalLahir}

Input Alamat
    [Arguments]    ${alamat}
    Input Text     id:alamat    ${alamat}

Input Nomor Handphone
    [Arguments]    ${handphone}
    Input Text     id:handphone    ${handphone}

Input IP S1
    [Arguments]    ${ip_s1}
    Input Text     id:ip_s1    ${ip_s1}

Input IP Profesi
    [Arguments]    ${ip_profesi}
    Input Text     id:ip_profesi    ${ip_profesi}

Input IP Komulatif
    [Arguments]    ${ip_kumulatif}
    Input Text     id:ip_kumulatif    ${ip_kumulatif}
    Scroll Down

Select Fakultas Kedokteran
    [Arguments]      ${fakultasKedokteran}
    Click Element    //*[@id="select2-idFakultas-container"]
    Input Text       xpath:/html/body/span/span/span[1]/input    ${fakultasKedokteran}
    Press Keys       xpath:/html/body/span/span/span[1]/input    ENTER

Select Bulan
    [Arguments]                  ${psdBulan}
    Select From List By Value    name:PSD_Bulan    ${psdBulan}  
    # //ini value

Select Tahun
    [Arguments]                  ${psdTahun}
    Select From List By Value    name:PSD_Tahun    ${psdTahun}    

Click Button Register
    Sleep            2s
    Click Element    //*[@id="register-button"]

Click Ok
    Sleep             2s
    Click Element    //*[@id="modal_success_register"]/div/div/div/center/a

Input New NPA
    Click Element    xpath:/html/body/section/div[3]/div/div/div/center/a
    Sleep            2s
    Input NPA

Verify 
    Wait Until Page Contains Element   //*[@id="modal_success_register"]/div/div/div
    Sleep             2s
    Element Text Should Be      //*[@id="modal_success_register"]/div/div/div/div/h3                        Registrasi Peserta PPDS Berhasil

    # ${isExist}        Run Keyword And Return Status    Page Should Contain Element    //*[text()="Registrasi Peserta PPDS Berhasil"]
    # Run Keyword If    '${isExist}'=='False'            Input New NPA                  
    # ...               ELSE                             Click Element                  xpath:/html/body/section/div[3]/div/div/div/center/a 

# --------------------------------------------------------------------------------------------------------------------------------------------------------------




# #Negatives for email
# Verify Alert for Email Field Empty
#     # Element Should Be Visible   
#     # Element Text Should Be        
#     Wait Until Page Contains                            Please fill out this field.

# Input Invalid Email without @
#     Input Text              id:email                    manbo

# Verify Alert Email without @
#     Wait Until Page Contains                            Please fill out this field.

# Input Invalid Email without .
#     Input Text              id:email                    manbo@
#     # verif
# Verify Alert Email without .
#     Wait Until Page Contains                            Please fill out this field.

# Input Invalid Email without Domain
#     Input Text              id:email                    manbo@gmail.
#     # verif

# Verify Alert Email without Domain
#     Wait Until Page Contains                            Please fill out this field.

Input Email That Has Been registered
# How to get email that has been registereed from admin page (get data)
# For now just use this one (this email has been registered but havent upload payment proof so user couldnt use this email to register another)
    Input Text              id:email                    manbo@gmail.com
    # verif

# #Negatives for password
# Input Password Less Than 8
#     [Arguments]             ${invpass}
#     ${invpass}              Generate Random String      7               0123456789
#     Input Text              id:password                 ${invpass}

# Input New NPA
#     Click Element    xpath:/html/body/section/div[3]/div/div/div/center/a
#     Sleep            2s
#     #nanti disini ditambahin lg stepnya habis input npa baru dia click register dan ok lagi

# # Negatives for confirmation pass
# Input Invalid Confirm password
# # SEbenernya ga dirandom jg gak masalah
#     [Arguments]             ${password}
#     Input Text              id:password    ${password}

#     ${invconf}              Generate Random String      8               0123456789
#     Input Text              id:konfirmasi               ${invconf}
# # can we check this two random isnt the same with one and another, (if's ?) 

# Input NPA IDI 3rd
# # this one we need to go to the admin page and get the email that has been registered 2 times (its gonna be challenging) -> yang ada catatan pendaftaran kedua kali (susah)


# # Go To Site
# #     Execute Javascript      window.open('${url}');
# #     Switch Window           locator=NEW

# # if using tags positive then verify title (variable) = Registrasi Peserta PPDS Berhasil else tags negative then verify title (variable) = Registrasi PPDS Gagal

# Input Invalid IP S1
#     [Arguments]             ${_invalid_ip_s1}
#     Input Text              id:ip_s1                    ${ip_s1}
# # verif

# Input Invalid IP Profesi
#     [Arguments]             ${invalid_ip_profesi}
#     Input Text              id:ip_profesi               ${ip_profesi}
# # verif

# Input Invalid IP Kumulatif
#     [Arguments]             ${invalid_ip_kumulatif}
#     Input Text              id:ip_kumulatif             ${ip_kumulatif}
# # verif

# Register but emptied the mandatory field
# # fill all the optional field then check for the alert then fill the mandatory till the end to see if all the alert is good.

