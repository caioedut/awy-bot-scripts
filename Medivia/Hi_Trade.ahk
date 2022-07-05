; Settings
Hotkey_Run = g

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

Hotkey, $%Hotkey_Run%, HiTrade, On
Return

HiTrade:
{
    Send, {Enter}
    Sleep, 150
    Send, Hi
    Send, {Enter}
    Sleep, 500

    If (GetKeyState("g", "P")) {
        Send, {Enter}
        Sleep, 150
        Send, Trade
        Send, {Enter}
    }

    Sleep, 2000

    Return
}
