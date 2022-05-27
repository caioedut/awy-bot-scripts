; To use with Nunu, Cho'Gath, Kalista and more

; Settings
Hotkey_Run = XButton1
Hotkey_Smite = d
Hotkey_Skill = q

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, $%Hotkey_Run%, SmiteCombo, On
Return

SmiteCombo:
{
    Send, %Hotkey_Skill%
    Sleep, 200
    Send, %Hotkey_Smite%
    Return
}
