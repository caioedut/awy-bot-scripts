; Settings (Optional)
SlotX = 0
SlotY = 0

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

^+!RButton::
{
    MouseGetPos, SlotX, SlotY
    Notify("X: " SlotX " | Y: " SlotY, 80)
    Return
}

MButton::
{
    If (SlotX <= 0 || SlotY <= 0) {
        Notify("First press CTRL + ALT + SHIFT + RIGHT CLICK to set the position for LAST SLOT of backpack.", 400)
        Return
    }

    MouseGetPos, PosX, PosY
    MouseClickDrag, left, PosX, PosY, SlotX, SlotY, 0

    Sleep 100
    Return
}
