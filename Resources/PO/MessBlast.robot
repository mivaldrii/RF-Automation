*** Settings ***
Documentation    Message Blast
Library          Selenium2Library
Library          String

*** Keywords ***
Navigate To Message Blast Menu
    Click Element                    //*[@id="root"]/div[2]/div/div[1]/div/div/div[2]/div[5]/div[1]
    Click Element                    //a[@href="/message-blast"]
    Element Text Should Be           //*[@id="root"]/div[2]/div/div[2]/div[1]/div[1]/div[2]         Message Blast

Click Send Message Blast Button
    Click Element                    //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[1]/button
    Element Text Should Be           //*[@id="root"]/div[2]/div/div[2]/div[1]/div[1]/div[2]         Kirim Message Blast

Search Member
    [Arguments]     ${searchText}
    Click Element                   //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[2]/div[2]/div
    Input Text                      //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[2]/div[2]/div/input      ${searchText}
    Sleep   3
 
Verify Search Result
    [Arguments]       ${searchText}
    ${isExist}        Run Keyword And Return Status    Page Should Contain Element    //*[text()="Tidak ada data"]
    Run Keyword If    '${isExist}'=='True'             Element Text Should Be         //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[3]/div[2]/div/div/div/table/tbody/tr/td    Tidak ada data
    ...               ELSE                             Verify Existed Result          ${searchText}

Verify Existed Result
    [Arguments]               ${searchText} 
    ${totalRow}               Get Element Count                                       //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[3]/div[2]/div/div/div/table/tbody/tr/td[3]
    FOR                       ${i}                      IN RANGE                      ${totalRow}
    Element Should Contain    //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[3]/div[2]/div/div/div/table/tbody/tr[${${i}+1}]/td[3]                                  ${searchText} 
    END

Select Member
    ${totalRow}               Get Element Count                                       //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[3]/div[2]/div/div/div/table/tbody/tr/td[1]/span/span[1]/input
    FOR                       ${i}                      IN RANGE                      ${totalRow}
    Click Element                    //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[3]/div[2]/div/div/div/table/tbody/tr[${${i}+1}]/td[1]/span/span[1]/input
    END
    Click Element                    //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[2]/button
    
Input Message Title
    [Arguments]    ${title}
    Input Text     //input[@name="title"]    ${title}

Input Message Description
    Click Element       //*[@id="mui-rte-container"]/div[2]
    Sleep       1
    Press Keys          //*[@id="mui-rte-container"]/div[2]      Message sent from robot
    
Input File Link
    [Arguments]     ${link}
    Input Text          //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[5]/input     ${link}

Input File
    [Arguments]    ${fileUpload}
    Choose File    //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[7]/label/span[1]/input    ${fileUpload}
    
Click Send Button
    Click Element       //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[2]/button[2]
    Sleep       3

Verify Message Blast Broadcast Success
    Verify Alert Success Text Showed Correctly   Berhasil membroadcast pesan

Verify Title Should Be Filled
    Element Text Should Be      //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[2]       Judul tidak boleh kosong
    
Verify Description Should Be Filled
    Element Text Should Be      //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[4]       Deskripsi tidak boleh kosong
    
Verify File Link Should Be Filled
    Element Text Should Be      //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[6]       Link berkas tidak boleh kosong
    
Verify File Should Be Uploaded
    Element Text Should Be      //*[@id="root"]/div[2]/div/div[2]/div[2]/div/div[2]/div[1]/div[8]       Berkas tidak boleh kosong