; Settings
Hotkey_Run = MButton

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

runeIcon := GetFile("Medivia\Icons\use_gfb.png")

Hotkey, $%Hotkey_Run%, UseRune, On
Return

UseRune:
{
    ImageSearch, runePosX, runePosY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *60 *TransWhite %runeIcon%

    MouseGetPos, PosX, PosY
    MouseClick, right, %runePosX%, %runePosY%, 1, 0
    MouseClick, left, %PosX%, %PosY%, 1, 0

    Sleep, 200

    Return
}
