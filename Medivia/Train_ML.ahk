Hotkey_Spell = {F11}

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#Persistent

icon := GetFile("Medivia\Icons\life_window.png")

SetTimer, AutoRune, 2000
Return

AutoRune:
{
    Sleep, 500

    ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %icon%

    If (ErrorLevel = 1) {
        Notify("Open your life/mana panel.")
        Return
    }

    If (ErrorLevel = 2) {
        Notify("Could not conduct the search.")
        Return
    }

    iniX := iconX
    iniY := iconY + 26
    endX := iniX + 160
    endY := iniY + 18

    manaText := GetText(iniX, iniY, endX, endY)
    slashPos := InStr(manaText, "/")

    If (!slashPos) {
        Return
    }

    currentMana := RegExReplace( SubStr(manaText, 1, slashPos), "[^\d]+" )
    totalMana := RegExReplace( SubStr(manaText, slashPos), "[^\d]+" )

    If (!currentMana) {
        Return
    }

    percent := currentMana / totalMana * 100

    If (percent < 90 || percent > 100) {
        Return
    }

    ; Use spell
    Send, %Hotkey_Spell%

    Return
}
