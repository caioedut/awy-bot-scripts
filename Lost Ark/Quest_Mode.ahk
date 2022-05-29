; Use Scroll Lock to turn quest mode on/off

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

MiddlePosX := A_ScreenWidth // 2
MiddlePosY := A_ScreenHeight // 2

questMode := GetKeyState("ScrollLock", "T")
SetTimer, Movement, 200
Return

~ScrollLock::
{
    questMode := GetKeyState("ScrollLock", "T")
    Notify("Quest Mode " (questMode ? "On" : "Off"))
    Return
}

$w::
$a::
$s::
$d::
{
    If (!questMode) {
        xSend(A_ThisHotkey)
    }

    Return
}

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
        Send, {g}
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
