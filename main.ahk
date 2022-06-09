#NoEnv
#SingleInstance Force
#Include keyboard_layout.ahk

IniRead, practitioner_name, data_key.ini, key, practitioner
IniRead, vac_lot, data_key.ini, key, lot
IniRead, equip_name, data_key.ini, key, equip

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
;BlockInput, On
FullAutomate()
;BlockInput, Off
return

#IfWinActive

#Include functions.ahk