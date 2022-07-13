; Set hotkey to use item on cursor position.

; Settings
Hotkey_Run = XButton1

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#Persistent
SetMouseDelay, -1

itemIcon := GetFile("Medivia\Icons\Rune\uh.png")

Hotkey, ~$%Hotkey_Run%, UseItem, On
Return

UseItem:
{
    ImageSearch, itemX, itemY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %itemIcon%

    If (ErrorLevel = 1) {
        Notify("UH not found.")
        Return
    }

    MouseGetPos, targetX, targetY
    MouseClick, right, %itemX%, %itemY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0

    Sleep, 500
    Return
}
