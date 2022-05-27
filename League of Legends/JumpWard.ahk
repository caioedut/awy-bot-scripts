; Settings
Hotkey_Run = XButton1
Hotkey_Ward = 4
Hotkey_Jump = w

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, $%Hotkey_Run%, JumpWard, On
Return

JumpWard:
{
    Send, %Hotkey_Ward%
    Send, %Hotkey_Jump%
    Return
}
