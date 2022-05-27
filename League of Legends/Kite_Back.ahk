; Set correct AtkSpeed and Multiplier below, you can find it on client.
; AtkSpeed varies on each level and bought item

; Settings
Hotkey_Run = x
AtkSpeed := 0.70
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
