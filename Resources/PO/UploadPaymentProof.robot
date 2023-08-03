*** Settings ***
Documentation  Login SP1
Library  Selenium2Library
Library  String

*** Variables ***
${urlSignin}                https://dev.paboi.bigio.id/collegium-registration-sign-in

*** Keywords ***

Navigate to Sign In Menu
    Execute Javascript      window.open('${urlSignin}');
    Switch Window           locator=NEW

Verify User in Sign In Page
    Title Should Be         Indonesian Orthopedic Association - Registration

Input Valid Email
    Input Text              id:m_email      ${email}

Input Valid Password
    [Arguments]            ${password}
    Input Text             id:m_pass        ${password}

Click Sign In
    Click Element           //*[@id="webform"]/div[4]/div/button
    # Sleep   2

Click Tab Unggah Berkas
    Click Element           id:unggah_berkas

Upload Payment
    Choose File             id:payment_proof  E:/PKL/ROBOT/PABOI/paboi-test/Assets/paymentproof.jpeg

Submit
    Click Element           //*[@id="step-2"]/div[2]/center/div[2]/div/button
    Sleep   2

Confirm Submit File
    Click Element           //*[@id="modal_success_register"]/div/div/div/center/a

