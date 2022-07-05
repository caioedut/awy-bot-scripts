; Use "chat off" mode

; Settings
Hotkey_Run = x
Weapon_PosX = 227
Weapon_PosY = 442

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

Hotkey, $%Hotkey_Run%, AutoAttack, On
Return

AutoAttack:
{
    MouseGetPos, PosX, PosY
    MouseClick, right, %Weapon_PosX%, %Weapon_PosY%, 1, 0
    MouseClick, left, %PosX%, %PosY%, 1, 0

    Sleep, 200

    Return
}
