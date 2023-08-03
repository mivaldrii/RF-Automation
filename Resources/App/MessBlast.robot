*** Settings ***
Resource    ../PO/MessBlast.robot
# Resource    ../../Variables/MBVar.robot

***Keywords***
user navigate to message blast menu
    Navigate To Message Blast Menu

user click send message button
    Click Send Message Blast Button

user search existing member
    [Arguments]             ${searchText}
    Search Member           ${searchText}
    Verify Search Result    ${searchText}

user choose member to send a message
    Select Member        

user input message details
    [Arguments]     ${title}        ${link}     ${fileUpload}
    Input Message Title             ${title}
    Input Message Description      
    Input File Link                 ${link}
    Input File                      ${fileUpload}

user click send button
    Click Send Button

user should see alert that message sent successfeully
    Verify Message Blast Broadcast Success

user should see warning field must be filled
    Verify Title Should Be Filled
    Verify Description Should Be Filled
    Verify File Link Should Be Filled
    Verify File Should Be Uploaded