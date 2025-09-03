#o:: {
	if WinExist("Edit Clipboard") {
		WinActivate("Edit Clipboard")
	}
	else {
		Run('"C:\Program Files\Vim\vim91\gvim.exe" -n -U "C:\d\scripts\vim-clipboard-edit.vim"')
			if WinWait("Edit Clipboard", , 1)
				WinActivate("Edit Clipboard")
	}
}
