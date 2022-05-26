FillPractitionerOnDiagScreen(){
    ;SetDefaultKeyboard(0x041e)
    Send, %practitioner_name%
    ;{Enter}จำหน่ายกลับบ้าน{Enter}
    ;SetDefaultKeyboard(0x0409)
    return
}

FillDiagnosis(){
    Send, Z251{Enter 2}
    return
}

FillMedication(){
    ;SetDefaultKeyboard(0x041e)
    Send, {Backspace}%equip_name%
    Sleep, 200
    Send, {Enter 3}
    ;SetDefaultKeyboard(0x0409)
    return
}

FillOperation(){
    ;SetDefaultKeyboard(0x041e)
    Sleep, 100
    Send, %practitioner_name%
    Sleep, 200
    Send, {Enter 2}IM{Enter 8}
    ;SetDefaultKeyboard(0x0409)
    return
}

FillVaccine(){
    ;SetDefaultKeyboard(0x041e)
    Send, วัคซีนไข้หวัดใหญ่
    Sleep, 200
    Send, {Enter 2}%vac_lot%{Enter}
    Sleep, 200
    Send, {Enter 2}%practitioner_name%
    Sleep, 200
    Send, {Enter 2}
    ;SetDefaultKeyboard(0x0409)
    return
}

FullAutomate(){
    ; 1 screen
    MouseClick, Left, 117, 497, 1
    FillDiagnosis()
    ; To ICD10 1 Screen
    MouseClick, Left, 97, 575, 1
    ; From 1 to 2
    MouseClick, Left, 111, 468, 1
    FillMedication()
    ; From 2 to 3
    MouseClick, Left, 181, 456, 1
    MouseClick, Left, 111, 510, 1
    FillOperation()
    Sleep, 1000
    ; From 3 to Vaccine
    MouseClick, Left, 666, 456, 2
    MouseClick, Left, 86, 509, 1
    FillVaccine()
    ; From Vaccine to 1
    MouseClick, Left, 44, 461, 1
    MouseClick, Left, 105, 491, 1
    FillPractitionerOnDiagScreen()
    ; To Save Button
    MouseClick, Left, 895, 982, 1
    return
}