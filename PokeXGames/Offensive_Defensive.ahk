; Settings
Hotkey_PokeOrder = MButton
Hotkey_Defensive = Delete
Hotkey_Offensive = Insert

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, ~%Hotkey_PokeOrder%, Defensive, On
Return

; Moves
~1::
~2::
~3::
~4::
~5::
~6::
~7::
~8::
~9::
~0::
~F1::
~F2::
~F3::
~F4::
~F5::
~F6::
~F7::
~F8::
~F9::
~F10::
~F11::
~F12::
{
    Send, {%Hotkey_Offensive%}
    SetTimer, Defensive, 2000
    Return
}

Defensive:
{
    Send, {%Hotkey_Defensive%}
    SetTimer, Defensive, Off
    Return
}
