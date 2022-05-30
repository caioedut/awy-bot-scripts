; Set game interface to lowest size (0)
; Set "Multiplier" below, you can find it using mouse over "attack speed" status on game.

; Settings
Hotkey_Run = x
Multiplier := 0.625

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#MaxThreads 20
#InstallKeybdHook
#UseHook

Process, Priority, , A
SetKeyDelay, 10, -1
SetDefaultMouseSpeed, 0

atkSpeed := 0
atkDelay := 0

atkPosX := 0
atkPosY := 0
atkSpeedIcon := GetFile("League of Legends\Icons\attack_speed_icon.png")

SetTimer, RefreshAttackSpeed, 100
Hotkey, $%Hotkey_Run%, KiteBack, On
Gosub, RefreshAttackSpeed
Return

KiteBack:
{
    If (!atkSpeed) {
        Return
    }

    Send, {Space down}

    Send, +{RButton}
    Sleep, % atkDelay * 2
    Send, {RButton}
    Sleep, % atkDelay * 3

    Send, {Space up}

    Return
}

RefreshAttackSpeed:
{
    If (!atkPosX || !atkPosY) {
        ImageSearch, atkPosX, atkPosY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *60 *TransWhite %atkSpeedIcon%
    }

    atkSpeedTxt := GetText(atkPosX + 12, atkPosY, atkPosX + 40, atkPosY + 20)
    atkSpeedTxt := StrReplace(atkSpeedTxt, " ", "")

    If (RegExMatch(atkSpeedTxt, "^\d+\.\d+$")) {
        atkSpeed := atkSpeedTxt
        atkSpeed += 0.0
        atkDelay := 1000 / (atkSpeed - 0.1) / (Multiplier * 10)
    }

    Return
}
