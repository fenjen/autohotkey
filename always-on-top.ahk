#Requires AutoHotkey v2.0
; Ctrl+Shift+Space toggles "Always on top" for the active window.

^+Space:: {
    activeTitle := WinGetTitle("A")
    ; WS_EX_TOPMOST = 0x00000008
    wasTopmost := (WinGetExStyle("A") & 0x00000008) != 0

    ; Set explicitly instead of "Toggle"
    WinSetAlwaysOnTop(!wasTopmost, "A")

    if wasTopmost
        msg := 'The window "' . activeTitle . '" is no longer always on top.'
    else
        msg := 'window "' . activeTitle . '" is now always on top.'

    TrayTip("Always-on-top", msg)
    Sleep 3000
    TrayTip() ; hide
}
