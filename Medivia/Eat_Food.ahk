;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#Persistent

icons := ["ham", "meat", "fish"]

SetTimer, EatFood, 30000
Gosub, EatFood
Return

EatFood:
{
    For key, value in icons
    {
        icon := GetFile("Medivia\Icons\Food\" value ".png")

        ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %icon%

        If (ErrorLevel > 0) {
            Continue
        }

        Click, %iconX% %iconY% 1 Right
        Break
    }

    Return
}