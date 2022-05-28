; Set "Multiplier" below, you can find it using mouse over "attack speed" status on game.

; Settings
Hotkey_Run = x
global Multiplier := 0.568

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#InstallKeybdHook
#UseHook

Process, Priority, , A
SetDefaultMouseSpeed, 0

global atkSpeed := 0
global atkDelay := 0
RefreshAttackSpeed()

SetTimer, RefreshAttackSpeed, 100
Hotkey, $%Hotkey_Run%, KiteBack, On
Return

KiteBack()
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

RefreshAttackSpeed() {
    If (!GetKeyState(%Hotkey_Run%, "P")) {
        Sleep, 2000
    }

    ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *60 *TransWhite C:\AwyBotFiles\Kite_Back\attack_speed_icon.png
    atkSpeedTxt := GetText(foundX + 12, foundY, foundX + 40, foundY + 20)

    If (RegExMatch(atkSpeedTxt, "(\d+(?:\.\d+)?)")) {
        atkSpeed := atkSpeedTxt
        atkSpeed += 0.0
        atkDelay := 1000 / (atkSpeed - 0.1) / (Multiplier * 10)
    }
}
