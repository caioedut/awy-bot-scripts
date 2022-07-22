; Set the right ring name below
; Settings
Ring := "Ring of Healing"

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

StringLower, RingFile, Ring
RingFile := StrReplace(RingFile, " ", "_")

invIcon := GetFile("Medivia\Icons\inventory.png")
ringIcon := GetFile("Medivia\Icons\Ring\" RingFile ".png")

SetTimer, AutoRing, 2000
Return

AutoRing:
{
    ImageSearch, slotX, slotY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %invIcon%

    If (ErrorLevel = 1) {
        Notify("Open your inventory.")
        Return
    }

    slotX += 5
    slotY += 112
    endX := slotX + 30
    endY := slotY + 30

    ImageSearch, ringX, ringY, %slotX%, %slotY%, %endX%, %endY%, *25 *TransWhite %ringIcon%

    If (!ErrorLevel) {
        Return
    }

    ImageSearch, ringX, ringY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %ringIcon%

    If (ErrorLevel = 1) {
        Notify(Ring " not found")
        Return
    }

    MouseLock()
    MouseBackup()
    MouseClickDrag, left, ringX, ringY, slotX, slotY, 0
    MouseRestore()
    MouseRelease()

    Return
}
