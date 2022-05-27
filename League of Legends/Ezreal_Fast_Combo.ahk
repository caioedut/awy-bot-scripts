; Settings
Hotkey_Run = x

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#InstallKeybdHook
#UseHook

If (!A_IsAdmin) {
    MsgBox, Ezreal_Fast_Combo: Run Awy Bot has Administrator
}

Process, Priority, , A

Hotkey, $%Hotkey_Run%, Combo, On
Return

Combo:
{
    MouseLock()

    Send, {e}
    Sleep, 300

    Send, {w}
    Send, {q}

    Sleep, 500
    MouseRelease()

    Return
}
