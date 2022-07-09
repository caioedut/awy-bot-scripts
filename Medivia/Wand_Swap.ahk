; Settings
Hotkey_1 = NumpadDiv
Hotkey_2 = NumpadMult
Hotkey_3 = NumpadSub
Icon_1 := GetFile("Medivia\Icons\Wand\moonlight.png")
Icon_2 := GetFile("Medivia\Icons\Wand\serpent.png")
Icon_3 := GetFile("Medivia\Icons\Wand\fireweaver.png")

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#Persistent
SetMouseDelay, -1

global invIcon := GetFile("Medivia\Icons\inventory.png")

Hotkey, ~$%Hotkey_1%, SetWand1, On
Hotkey, ~$%Hotkey_2%, SetWand2, On
Hotkey, ~$%Hotkey_3%, SetWand3, On
Return

SetWand1:
SetWand(Icon_1)
Return

SetWand2:
SetWand(Icon_2)
Return

SetWand3:
SetWand(Icon_3)
Return

SetWand(icon) {
    ImageSearch, slotX, slotY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %invIcon%

    If (ErrorLevel = 1) {
        MsgBox, Open your inventory first.
        Return
    }

    If (ErrorLevel = 2) {
        MsgBox, Could not conduct the search.
        Return
    }

    slotX += 20
    slotY += 80

    Loop, 10
    {
        ImageSearch, wandX, wandY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %icon%

        If (ErrorLevel = 0) {
            MouseLock()
            MouseBackup()
            MouseClickDrag, left, wandX, wandY, slotX, slotY, 0
            MouseRestore()
            MouseRelease()

            Break
        }

        Sleep, 50
    }
}
