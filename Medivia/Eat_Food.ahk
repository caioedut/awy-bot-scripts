; Eat food every 60 seconds. Does not eat on Protect Zones.

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

SetMouseDelay, -1

icons := ["brown_mushroom", "fire_mushroom", "green_mushroom", "white_mushroom", "ham", "meat", "herring", "egg", "apple", "blueberry", "bread", "carrot", "cheese", "corncob", "dragon_ham", "grape", "honeycomb", "orange", "roll"]
pzIcon := GetFile("Medivia\Icons\Status\protect.png")

SetTimer, EatFood, 60000
Gosub, EatFood
Return

EatFood:
{
    ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %pzIcon%
    If (ErrorLevel = 0) {
        Return
    }

    For key, value in icons
    {
        icon := GetFile("Medivia\Icons\Food\" value ".png")

        ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %icon%

        If (ErrorLevel > 0) {
            Continue
        }

        MouseBackup()
        Click, %iconX% %iconY% 1 Right
        MouseRestore()

        Break
    }

    Return
}
