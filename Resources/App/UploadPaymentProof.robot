*** Settings ***
Resource      ../PO/UploadPaymentProof.robot
# Resource      ../PO/LoginSP1.robot  

*** Keywords ***
User Navigate To Sign In Menu
    Navigate to Sign In Menu  
    Verify User in Sign In Page

User Sign In
    [Arguments]     ${password}
    Input Valid Email
    Input Valid Password    ${password}

User Click Sign In
    Click Sign In

User Click Tab Unggah Berkas
    Click Tab Unggah Berkas

User Upload Payment Proof
    Upload Payment

User Submit Payment Proof
    Submit
    Confirm Submit File