# Deprecated.
# Hit Alt+Up instead.
backspace_up_instead_of_back() {
    ControlGetFocus focused, A
    if (focused = "DirectUIHWND2")
    or (focused = "DirectUIHWND3")
    or (focused = "SysTreeView321")
        SendInput, !{Up}
    else
        SendInput, {Backspace}
}

#IfWinActive, ahk_class CabinetWClass
$Backspace::
    backspace_up_instead_of_back()
    return
#IfWinActive
