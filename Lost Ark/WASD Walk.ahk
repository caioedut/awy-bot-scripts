SetTimer, Movement, 100

$w::
$a::
$s::
$d::
If (!IsActive()) {
    Send, %A_ThisHotkey%
}
Return

Movement:
{
    If (!IsActive()) {
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

    MouseClick, left, targetX, targetY

    Return
}
