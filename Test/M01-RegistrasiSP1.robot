*** Settings ***
Test Setup       Begin Web Test
Test Teardown    End Web Test

Resource         ../Resources/Common.robot
Resource         ../Resources/App/RegistrasiSP1.robot
Resource         ../Resources/App/UploadPaymentProof.robot
Resource         ../Resources/App/VerifyPPDS.robot
Resource         ../Variables/RegistrasiSP1.robot

*** Test Cases **
Logged as an user to register SP1
    [Tags]                                              positive        register        user
    GIVEN User Navigate To Registration Menu
    WHEN User Choose SP1
    AND User Should See Form For SP1
    AND User Fill Sign In Data      ${password}     ${confirmPas} 
    AND User Fill Profile Data      ${asalFK}       ${tahunLulus}       ${tempatLahir}      ${tanggalLahir}     ${alamat}       ${handphone}        ${ipS1}
    AND User Fill Optional Registration Data SP1        ${ipProfesi}        ${ipKumulatif}      ${gelarD}           ${gelarB}
    AND User Select Faculty         ${fakultasKedokteran}
    AND User Select Exams Period    ${psdBulan}     ${psdTahun}
    AND User Click Button Register
    AND User Verify Registrastion Success
    THEN User Click Ok

Sign in as an PPDS1 to upload payment proof
    [Tags]                                              positive        register        user
    GIVEN User Navigate To Sign In Menu
    AND User Sign In                ${password}
    AND User Click Sign In
    AND User Click Tab Unggah Berkas
    AND User Upload Payment Proof
    THEN User Submit Payment Proof

Login as an admin collegium to verify user
    [Tags]                                              positive        register
    GIVEN User Navigate To Login Menu
    AND User Login As An Admin Collegium        ${emailAdminCollegium}      ${passwordAdmin}
    AND Admin Search PPDS1 Candidate
    AND Admin Verify Payment Proof PPDS1 Candidate
    AND Admin Acc PPDS1 Participant
    AND Admin Search PPDS1 Participant
    THEN Admin Pass PPDS1 Participant As A Member
    

Logged as an user with invalid email
    [Tags]                                              negative
# without @ and . then check for the alert then empty the field
# using email without .
# if done then empty the field and input the email without @

check with if the email is the same with other email members
    [Tags]                                              negative
# how to get the email that has been registered?

Logged as an user with invalid password 
    [Tags]                                              negative
# less than 8 and verify the alert

Logged as an user with different confirmation password
    [Tags]                                              negative
# get the randomized password and check if its the same if its not then check or verify the alert (using if) 
# so what we are tryinh to do here is to randomize 2 varible with one and another

Logged as an user with NPA IDI's that has been used twice
    [Tags]                                              negative
# this one we need to go to the admin page and get the email that has been registered 2 times (its gonna be challenging)

Register with invalid IP's
    [Tags]                                              negative
# gonna randomize float number above 4.00

Register but emptied the mandatory field
    [Tags]                                              negative
# fill all the optional field then check for the alert then fill the mandatory till the end to see if all the alert is good.
