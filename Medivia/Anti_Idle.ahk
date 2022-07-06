;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetTimer, AntiIdle, 200000
Gosub, AntiIdle
Return

AntiIdle:
{
    Sleep, 2000
    ControlSend, , ^{Up}, ahk_exe %WindowExe%
    Sleep, 500
    ControlSend, , ^{Down}, ahk_exe %WindowExe%

    Return
}
