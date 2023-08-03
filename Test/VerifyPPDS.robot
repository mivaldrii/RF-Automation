*** Settings ***
Test Setup       Begin Web Test
Test Teardown    End Web Test
Resource         ../Resources/Common.robot
Resource         ../Resources/App/Auth.robot
Resource         ../Variables/Auth.robot
Resource         ../Resources/App/VerifyPPDS.robot
Resource         ../Variables/VerifyPPDS.robot

*** Test Cases ***

Logged as an admin kolegium verified registered PPDS
    Given user logged in as central admin with valid credential
    And admin verify ppds

    












   
