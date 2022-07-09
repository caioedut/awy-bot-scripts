; Settings
; Use on mouse position:
Hotkey_Run = x
; Use on first creature in battle list:
Hotkey_Auto = v

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#Persistent
SetMouseDelay, -1

global wandIcon := GetFile("Medivia\Icons\inventory.png")
global battleIcon := GetFile("Medivia\Icons\Window\battle.png")

Hotkey, ~$%Hotkey_Run%, UseOnCursor, On
Hotkey, ~$%Hotkey_Auto%, UseOnBattle, On
Return

UseOnCursor:
{
    MouseGetPos, cursorX, cursorY
    UseWand(cursorX, cursorY)

    Sleep, 500
    Return
}

UseOnBattle:
{
    ImageSearch, battleX, battleY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *60 *TransWhite %battleIcon%

    If (ErrorLevel = 1) {
        MsgBox, Open battle list first.
        Return
    }

    If (ErrorLevel = 2) {
        MsgBox, Could not conduct the search.
        Return
    }

    battleY += 50
    UseWand(battleX, battleY)

    Sleep, 500
    Return
}

UseWand(targetX, targetY) {
    ImageSearch, wandX, wandY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *60 *TransWhite %wandIcon%

    If (ErrorLevel = 1) {
        MsgBox, Open your inventory first.
        Return
    }

    If (ErrorLevel = 2) {
        MsgBox, Could not conduct the search.
        Return
    }

    wandX += 20
    wandY += 80

    MouseBackup()
    MouseClick, right, %wandX%, %wandY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0
    MouseRestore()
}
