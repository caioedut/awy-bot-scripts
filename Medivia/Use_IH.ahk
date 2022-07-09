; Settings
Hotkey_Run = XButton1

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#Persistent
SetMouseDelay, -1

runeIcon := GetFile("Medivia\Icons\use_ih.png")

Hotkey, $%Hotkey_Run%, UseRune, On
Return

UseRune:
{
    ImageSearch, runePosX, runePosY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %runeIcon%

    MouseGetPos, PosX, PosY
    MouseClick, right, %runePosX%, %runePosY%, 1, 0
    MouseClick, left, %PosX%, %PosY%, 1, 0

    Sleep, 500
    Return
}
