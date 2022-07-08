; Settings
Hotkey_Run = MButton

; Optional Settings
SlotX = 0
SlotY = 0

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#Persistent
SetMouseDelay, -1

Hotkey, $%Hotkey_Run%, AutoLoot, On
Return

^+!RButton::
{
    MouseGetPos, SlotX, SlotY
    Notify("X: " SlotX " | Y: " SlotY, 100)
    Return
}

AutoLoot:
{
    If (SlotX <= 0 || SlotY <= 0) {
        Notify("First press CTRL + ALT + SHIFT + RIGHT CLICK to set the position for LAST SLOT of backpack.", 500)
        Return
    }

    MouseBackup()
    MouseGetPos, PosX, PosY
    MouseClickDrag, left, PosX, PosY, SlotX, SlotY, 0
    MouseRestore()

    Sleep 100
    Return
}
