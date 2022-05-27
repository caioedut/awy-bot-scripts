; Put the "Revive" in a hotkey of the icon bar and change the usage to:
; "Switch to quick use", then enter the hotkey below:

; Coloque o "Revive" numa hotkey da barra de ícones e mude o uso para:
; "Trocar para uso rápido", depois informe a hotkey abaixo:

; Settings
Hotkey = F1

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0

Hotkey, $%Hotkey%, Revive, On
Return

Revive:
{
    MouseLock()
    MouseBackup()

    Click, 35, 70
    Sleep, 100
    Send, {%Hotkey%}
    Sleep, 100
    Click, 35, 70

    MouseRestore()
    MouseRelease()

    Return
}
