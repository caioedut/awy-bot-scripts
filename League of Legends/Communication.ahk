; Pre-defined hotkeys:
; Numpad0 Enable/Disable chat
; Numpad1 Top MIA
; Numpad2 Mid MIA
; Numpad3 Bot MIA
; Numpad4 Push
; Numpad5 Back
; Numpad6 Reset
; Numpad7 Dragon
; Numpad8 Herald
; Numpad9 Baron

;;;;;;;;;;;;;;;;;;;;;;;
; DO NOT CHANGE BELOW ;
;;;;;;;;;;;;;;;;;;;;;;;

#InstallKeybdHook
#UseHook
Return

Numpad0::
Chat("/mute all")
Return

Numpad1::
Chat("Top MIA")
Return

Numpad2::
Chat("Mid MIA")
Return

Numpad3::
Chat("Bot MIA")
Return

Numpad4::
Chat("Push")
Return

Numpad5::
Chat("Back")
Return

Numpad6::
Chat("Reset")
Return

Numpad7::
Chat("Dragon")
Return

Numpad8::
Chat("Herald")
Return

Numpad9::
Chat("Baron")
Return

Chat(message) {
    Send, {Enter}
    Sleep, 50
    Send, %message%
    Sleep, 50
    Send, {Enter}
}
