*** Settings ***
Resource    ../PO/VerifyPPDS.robot
Resource    ../../Variables/Auth.robot

***Keywords***
User Navigate To Login Menu
    Navigate to Log In Menu
    Verify User In Login Page

User Login As An Admin Collegium
    [Arguments]     ${emailAdminCollegium}      ${passwordAdmin}
    Input Valid Admin Collegium Email           ${emailAdminCollegium}
    Input Valid Admin Collegium Password        ${passwordAdmin}
    Click Login Button

Admin Search PPDS1 Candidate
    Go To Registrasi SP1 Menu
    Search SP1 Candidate

Admin Verify Payment Proof PPDS1 Candidate
    Go To SP1 Details
    Go To SP1 Info Tab
    Verify Payment Proof SP1

Admin Acc PPDS1 Participant
    Click Terima Button

Admin Search PPDS1 Participant
    Go To PPDS1 Menu
    Search SP1 Participant
    
Admin Pass PPDS1 Participant As A Member
    Go To SP1 Participant Details
    Go To SP1 Participant Info Tab
    Pass Participant As A Member

    