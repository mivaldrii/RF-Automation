*** Settings ***
Test Setup       Begin Web Test
Test Teardown    End Web Test
Resource         ../Resources/Common.robot
Resource         ../Resources/App/Login.robot
Resource         ../Resources/App/MessBlast.robot
Resource         ../Variables/LoginVar.robot
Resource         ../Variables/MBVar.robot

*** Test Cases ***
Logged in user as central admin can send message blast to selected members
    [Tags]                                            positive
    Given user logged in as central admin with valid credential         
    Then user navigate to message blast menu
    And user click send message button
    And user search existing member       ${searchText}
    And user choose member to send a message
    And user input message details          ${title}         ${link}     ${fileUpload}
    When user click send button
    Then user should see alert that message sent successfeully

Logged in user as central admin can send message blast to some members
    [Tags]                                            positive
    Given user logged in as central admin with valid credential         
    Then user navigate to message blast menu
    And user click send message button
    And user choose member to send a message
    And user input message details          ${title}         ${link}     ${fileUpload}
    When user click send button
    Then user should see alert that message sent successfeully

Logged in user as central admin can not send message blast with empty credentials
    [Tags]                                            negative
    Given user logged in as central admin with valid credential         
    Then user navigate to message blast menu
    And user click send message button
    And user search existing member       ${searchText}
    And user choose member to send a message
    When user click send button
    Then user should see warning field must be filled