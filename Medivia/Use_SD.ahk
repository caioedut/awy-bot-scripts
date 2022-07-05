; Settings
Hotkey_Run = x

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

sdIcon := GetFile("Medivia\Icons\auto_sd.png")

Hotkey, $%Hotkey_Run%, UseSD, On
Return

UseSD:
{
    ImageSearch, sdPosX, sdPosY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *60 *TransWhite %sdIcon%

    MouseGetPos, PosX, PosY
    MouseClick, right, %sdPosX%, %sdPosY%, 1, 0
    MouseClick, left, %PosX%, %PosY%, 1, 0

    Sleep, 2000

    Return
}
