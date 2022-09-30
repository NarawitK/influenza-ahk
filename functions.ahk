FillPractitionerOnDiagScreen(){
    global practitioner_name
    SetDefaultKeyboard(0x041e)
    Send, %practitioner_name%{Tab 1}
    SetDefaultKeyboard(0x0409)
    return
}

FillRTBOnDiagScreen(){
    SetDefaultKeyboard(0x041e)
    Send, จำหน่ายกลับบ้าน{Enter 1}
    SetDefaultKeyboard(0x0409)
    return
}

FillDiagnosis(){
    SetDefaultKeyboard(0x0409)
    Send, Z251{Enter 2}
    return
}

FillMedication(){
    global equip_name
    SetDefaultKeyboard(0x0409)
    Send, {Backspace 2}%equip_name%
    Sleep, 200
    Send, {Enter 4}
    return
}

FillOperation(){
    global practitioner_name
    SetDefaultKeyboard(0x041e)
    Sleep, 100
    Send, %practitioner_name%
    Sleep, 200
    Send, {Enter 2}IM{Enter 8}
    SetDefaultKeyboard(0x0409)
    Sleep, 50
    return
}

FillVaccine(){
    global practitioner_name, vac_lot
    SetDefaultKeyboard(0x041e)
    Send, วัคซีนไข้หวัดใหญ่
    Sleep, 200
    Send, {Enter 2}%vac_lot%{Enter}
    Sleep, 200
    Send, {Enter 2}%practitioner_name%
    Sleep, 200
    Send, {Enter 2}
    SetDefaultKeyboard(0x0409)
    return
}

ReturnToHN(){
    MouseMove, 721, 175
}

FullAutomate(){
    global practitioner_name, vac_lot, equip_name
    IniRead, practitioner_name, data_key.ini, key, practitioner
    IniRead, vac_lot, data_key.ini, key, lot
    IniRead, equip_name, data_key.ini, key, equip
    ; 1 screen
    MouseClick, Left, 92, 569, 1
    FillDiagnosis()
    ; To ICD10 1 Screen
    MouseClick, Left, 105, 465, 1
    ; From 1 to 2
    MouseClick, Left, 70, 510, 1
    FillMedication()
    ; From 2 to 3
    MouseClick, Left, 172, 462, 1
    MouseClick, Left, 101, 510, 1
    FillOperation()
    Sleep, 1000
    ; From 3 to Vaccine
    MouseClick, Left, 658, 462, 1
    MouseClick, Left, 87, 511, 1
    FillVaccine()
    ; From Vaccine to 1
    MouseClick, Left, 38, 463, 1
    MouseClick, Left, 102, 491, 1
    FillPractitionerOnDiagScreen()
    FillRTBOnDiagScreen()
    ; To Save Button
    MouseClick, Left, 1835, 990, 1
    ReturnToHN()
    return
}