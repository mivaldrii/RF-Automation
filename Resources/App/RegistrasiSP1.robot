*** Settings ***
Resource      ../PO/RegistrasiSP1.robot
# Resource      ../PO/LoginSP1.robot  

*** Keywords ***
User Navigate To Registration Menu
    Click Dropdown College    

User Fill Sign In Data
    [Arguments]                     ${password}     ${confirmPas} 
    Input Email                     
    Input Password                  ${password}  
    Input Confirm Password          ${confirmPas}

User Choose SP1
    Chooose Specialist

User Should See Form For SP1
    Verify Form SP1

User Fill Profile Data
    [Arguments]                     ${asalFK}       ${tahunLulus}       ${tempatLahir}      ${tanggalLahir}     ${alamat}       ${handphone}        ${ipS1}
    Input NPA                       
    Input Tanggal Lahir             ${tanggalLahir}
    Select Asal FK                  ${asalFK}
    Select Tahun Lulus              ${tahunLulus}
    Input Nama Lengkap              
    Input Tempat Lahir              ${tempatLahir}
    Input Alamat                    ${alamat}
    Input Nomor Handphone           ${handphone}
    Input IP S1                     ${ipS1}

User Fill Optional Registration Data SP1
    [Arguments]                     ${ipProfesi}    ${ipKumulatif}     ${gelarD}       ${gelarB}
    Input Gelar Depan               ${gelarD}
    Input Gelar Belakang            ${gelarB}
    Input IP Profesi                ${ipProfesi}
    Input IP Komulatif              ${ipKumulatif}

User Select Faculty
    [Arguments]                     ${fakultasKedokteran}       
    Select Fakultas Kedokteran      ${fakultasKedokteran}

User Select Exams Period
    [Arguments]                     ${psdBulan}     ${psdTahun}
    Select Bulan                    ${psdBulan}
    Select Tahun                    ${psdTahun}

User Verify Registrastion Success
    Verify

User Click Button Register
    Click Button Register

User Click Ok
    Click Ok
