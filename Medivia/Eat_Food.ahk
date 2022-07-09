; Eat food every 60 seconds. Does not eat on Protect Zones.

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#Persistent
SetMouseDelay, -1

icons := ["ham", "meat", "fish"]
pzIcon := GetFile("Medivia\Icons\Status\protect.png")

SetTimer, EatFood, 60000
Gosub, EatFood
Return

EatFood:
{
    ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %pzIcon%

    If (ErrorLevel = 0) {
        Return
    }

    For key, value in icons
    {
        icon := GetFile("Medivia\Icons\Food\" value ".png")

        ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %icon%

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
