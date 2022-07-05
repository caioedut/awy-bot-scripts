; Settings
Hotkey_Run = x

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

wandIcon := GetFile("Medivia\Icons\inventory.png")

Hotkey, ~$%Hotkey_Run%, UseWand, On
Return

UseWand:
{
    ImageSearch, wandPosX, wandPosY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *60 *TransWhite %wandIcon%

    wandPosX += 20
    wandPosY += 80

    MouseGetPos, PosX, PosY
    MouseClick, right, %wandPosX%, %wandPosY%, 1, 0
    MouseClick, left, %PosX%, %PosY%, 1, 0

    Sleep, 200
    Return
}
