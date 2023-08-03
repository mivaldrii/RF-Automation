*** Settings ***
Resource    ../PO/Auth.robot
Resource    ../../Variables/Auth.robot

*** Keywords ***
user logged in as central admin with valid credential
    Go To Site                                                 
    user is in login page
    user input email                                                    ${emailCA}
    user input password                                                 ${passwordCA} 
    user click login
    the information of user logged in should be displayed in profile    ${nameCA}         ${roleCA}

user is in login page
    Verify User In Login Page

user input email
    [Arguments]          ${email}
    Input Valid Email    ${email}

# user input idpaboi
#     [Arguments]             ${idpaboi}
#     Input Valid idpaboi    ${idpaboi}

user input password
    [Arguments]             ${password}
    Input Valid Password    ${password}

user click login
    Click Login Button

the information of user logged in should be displayed in profile
    [Arguments]                                 ${name}       ${role}
    Verify User Name Displayed Correctly        ${name}       ${role}
    Verify User Position Displayed Correctly    ${role}

user click logout
    Click Logout Button

user should be redirect to login page
    Verify User In Login Page

user should see error alert login failed
    Verfiy Alert Error Showed

user should stay in login page
    Verify User In Login Page

user should see warning password field must be filled
    Verify Password Field Must Be Filled

user should see warning email field must be filled
    Verify Email Field Must Be Filled

user should see warning email password field must be filled
    Verify Email Password Field Must Be Filled


