Hotkey_Spell = F8
Mana = 80

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

icon := GetFile("Medivia\Icons\life_window.png")

SetTimer, EatFood, 60000
SetTimer, AutoRune, 2000
Gosub, EatFood
Return

EatFood:
{
    ; TODO
    Return
}

AutoRune:
{
    ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *60 *TransWhite %icon%

    If (ErrorLevel = 1) {
        MsgBox, Open your life/mana panel.
        Return
    }

    If (ErrorLevel = 2) {
        MsgBox, Could not conduct the search.
        Return
    }

    iniX := iconX
    iniY := iconY + 26
    endX := iniX + 160
    endY := iniY + 18

    manaText := GetText(iniX, iniY, endX, endY)
    slashPos := InStr(manaText, "/")

    If (!slashPos) {
        Continue
    }

    currentMana := RegExReplace( SubStr(manaText, 1, slashPos), "[^\d]+" )
    totalMana := RegExReplace( SubStr(manaText, slashPos), "[^\d]+" )

    If (!currentMana || currentMana < Mana) {
        Continue
    }

    ; Use spell
    Send, %Hotkey_Spell%

    ; Anti Kick
    Sleep, 1000
    ControlSend, , ^{Up}, ahk_exe %WindowExe%
    Sleep, 500
    ControlSend, , ^{Down}, ahk_exe %WindowExe%

    Return
}


;MouseMove, iniX, iniY
;Sleep, 1000
;MouseMove, endX, endY

Return
