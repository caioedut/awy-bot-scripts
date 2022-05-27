; Settings
Hotkey_Run = x
AtkSpeed := 2.50
Multiplier := 0.568

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#InstallKeybdHook
#UseHook

Process, Priority, , A

delay := 1000 / (AtkSpeed - 0.05) / (Multiplier * 10)

Hotkey, $%Hotkey_Run%, KiteBack, On
Return

KiteBack:
{
    Send, {Space down}

    Send, +{RButton}
    Sleep, % delay * 2
    Send, {RButton}
    Sleep, % delay * 3

    Send, {Space up}

    Return
}
