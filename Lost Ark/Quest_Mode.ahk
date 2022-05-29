; Use Scroll Lock to turn quest mode on/off

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

keys := ["$w", "$a", "$s", "$d"]
MiddlePosX := A_ScreenWidth // 2
MiddlePosY := A_ScreenHeight // 2

questMode := GetKeyState("ScrollLock", "T")
SetTimer, Movement, 200
Return

~ScrollLock::
{
    questMode := GetKeyState("ScrollLock", "T")
    Notify("Quest Mode " (questMode ? "On" : "Off"))

    For index, value in keys
        Hotkey, %value%, BlockKeys, questMode ? "Off" : "On"

    Return
}

BlockKeys:
Return

Movement:
{
    If (!questMode) {
        Return
    }

    wPressed := GetKeyState("w", "P")
    aPressed := GetKeyState("a", "P")
    sPressed := GetKeyState("s", "P")
    dPressed := GetKeyState("d", "P")

    If (!wPressed && !aPressed && !sPressed && !dPressed) {
        Return
    }

    base := 200
    targetX := MiddlePosX
    targetY := MiddlePosY

    If (wPressed) {
        targetY -= base
    }

    If (sPressed) {
        targetY += base
    }

    If (aPressed) {
        targetX -= base
    }

    If (dPressed) {
        targetX += base
    }

    If (targetX != MiddlePosX || targetY != MiddlePosY) {
        MouseClick, left, targetX, targetY
    }

    Return
}
