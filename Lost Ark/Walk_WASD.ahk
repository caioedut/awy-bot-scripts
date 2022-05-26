SetTimer, Movement, 100

$w::
$a::
$s::
$d::
Return

Movement:
{
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
