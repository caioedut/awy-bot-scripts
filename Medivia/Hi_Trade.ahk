; Use "chat off" mode

; Settings
Hotkey_Run = g

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

chatOffIcon := GetFile("Medivia\Icons\chat_off.png")

Hotkey, ~$%Hotkey_Run%, HiTrade, On
Return

HiTrade:
{
    ImageSearch, chatPosX, chatPosY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *60 *TransWhite %chatOffIcon%
    If (ErrorLevel = 1) {
        Return
    }

    Send, {Enter}
    Sleep, 150
    Send, Hi
    Send, {Enter}
    Sleep, 200

    If (!GetKeyState("g", "P")) {
        Return
    }

    Send, {Enter}
    Sleep, 150
    Send, Trade
    Send, {Enter}

    Sleep, 500

    Return
}
