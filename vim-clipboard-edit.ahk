#o::
{
	IfWinExist, Edit Clipboard
	{
		WinActivate, Edit Clipboard
	}
	else {
		Run "C:\Program Files (x86)\Vim\vim82\gvim.exe" -n -U "C:\d\ahk\vim-clipboard-edit.vim"
		WinWait, Edit Clipboard,, 1
		if (ErrorLevel = 0)
		{
			WinActivate, Edit Clipboard
		}
	}
}
