#NoEnv
#SingleInstance Force
#Include keyboard_layout.ahk

IniRead, practitioner_name, data_key.ini, key, practitioner, ศราทิพย์ ห้วยหงษ์ทอง
IniRead, vac_lot, data_key.ini, key, lot, A13
IniRead, equip_name, data_key.ini, key, equip, INFLUENZA 2022

CoordMode, Mouse , Window

#IfWinActive ahk_class TMainForm
^1::
BlockInput, On
FillPractitionerOnDiagScreen()
BlockInput, Off
return

^2::
BlockInput, On
FillDiagnosis()
BlockInput, Off
return

^3::
BlockInput, On
FillMedication()
BlockInput, Off
return

^4::
BlockInput, On
FillOperation()
BlockInput, Off
return

^5::
BlockInput, On
FillVaccine()
BlockInput, Off
return

^F::
BlockInput, On
FullAutomate()
BlockInput, Off
return

#IfWinActive

;#Include functions.ahk
FillPractitionerOnDiagScreen(){
    global practitioner_name
    Send, %practitioner_name%
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
    Send, {Enter 3}
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

FullAutomate(){
    ; 1 screen
    MouseClick, Left, 100, 571, 1
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
