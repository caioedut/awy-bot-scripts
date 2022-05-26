SetTimer, Movement, 100

global lastKey := 0

$w::
$a::
$s::
$d::
lastKey := StrReplace(A_ThisHotkey, "$", "")
Return

$w up::
$a up::
$s up::
$d up::
If (lastKey == StrReplace(StrReplace(A_ThisHotkey, "$", ""), " up", "")) {
    lastKey := 0
}
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

    key := 0

    If (wPressed && aPressed) {
        key := "NumpadHome"
    } Else If (wPressed && dPressed) {
        key := "NumpadPgUp"
    } Else If (sPressed && aPressed) {
        key := "NumpadEnd"
    } Else If (sPressed && dPressed) {
        key := "NumpadPgDn"
    } Else If (lastKey) {
        key := lastKey
    } Else If (wPressed) {
        key := "w"
    }  Else If (aPressed) {
        key := "a"
    } Else If (sPressed) {
        key := "s"
    } Else If (dPressed) {
        key := "d"
    }

    If (key) {
        Send, {Blind}{%key%}
    }

    Return
}
