*** Settings ***
Test Setup       Begin Web Test
Test Teardown    End Web Test
Resource         ../Resources/Common.robot
Resource         ../Resources/App/Auth.robot
Resource         ../Variables/Auth.robot

*** Test Cases ***
Login As Central Admin With Valid Credential Using Email 
    [Tags]                                                                   positive           test       
    Given user is in login page
    And user input email                                                     ${emailCA}
    And user input password                                                  ${passwordCA}
    When user click login
    Then the information of user logged in should be displayed in profile    ${nameCA}        ${roleCA}
    When user click logout
    Then user should be redirect to login page

Login With Invalid Credential Wrong Email And Correct Password
    [Tags]                                negative
    Given user is in login page
    And user input email                  ${emailInvalid}
    And user input password               ${passwordCA}
    When user click login
    Then user should see error alert login failed
    And user should stay in login page

Login With Invalid Credential Correct Email And Wrong Password
    [Tags]                                negative
    Given user is in login page
    And user input email                  ${emailCA}
    And user input password               ${passwordInvalid}
    When user click login
    Then user should see error alert login failed
    And user should stay in login page

Login With Invalid Credential Wrong Email And Wrong Password
    [Tags]                                negative
    Given user is in login page
    And user input email                  ${emailInvalid}
    And user input password               ${passwordInvalid}
    When user click login
    Then user should see error alert login failed
    And user should stay in login page

Login With Invalid Credential Valid Email And Empty Password
    [Tags]                                                      negative
    Given user is in login page
    And user input email                                        ${emailCA}
    And user input password                                     ${EMPTY}
    When user click login
    Then user should see warning password field must be filled
    And user should stay in login page

Login With Invalid Credential Empty Email And Valid Password
    [Tags]                                                   negative
    Given user is in login page
    And user input email                                     ${EMPTY}
    And user input password                                  ${passwordCA}
    When user click login
    Then user should see warning email field must be filled
    And user should stay in login page

Login With Invalid Credential Empty Email And Empty Password
    [Tags]                                                            negative
    Given user is in login page
    And user input email                                              ${EMPTY}
    And user input password                                           ${EMPTY}
    When user click login
    Then user should see warning email password field must be filled
    And user should stay in login page
