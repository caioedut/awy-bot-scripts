; Use "chat off" mode

; Settings
Hotkey_Run = g

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

MiddlePosY := A_ScreenHeight // 2
chatOnIcon := GetFile("Medivia\Icons\chat_on.png")

Hotkey, $%Hotkey_Run%, HiTrade, On
Return

HiTrade:
{
    ImageSearch, chatPosX, chatPosY, 0, 0, %A_ScreenWidth%, %MiddlePosY%, *60 *TransWhite %chatOnIcon%
    If (chatPosX > 0 && chatPosY > 0) {
        xSend(A_ThisHotkey)
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

    Sleep, 1000

    Return
}
