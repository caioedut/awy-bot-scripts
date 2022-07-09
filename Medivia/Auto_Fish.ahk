; Eat food every 60 seconds. Does not eat on Protect Zones.

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#Persistent
SetMouseDelay, -1

rodIcon := GetFile("Medivia\Icons\Fishing\wooden.png")

SetTimer, Fish, 1000
Return

Fish:
{
    ImageSearch, iconX, iconY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *25 *TransWhite %rodIcon%

    MouseGetPos, targetX, targetY
    MouseClick, right, %iconX%, %iconY%, 1, 0
    MouseClick, left, %targetX%, %targetY%, 1, 0

    Return
}
