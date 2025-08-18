" Called when started or when the window is activated
fun Start()
	" Initiate/refresh content:
	" - delete buffer (for when coming back)
	" - clear info message
	" - set help text
	" - insert clipboard content
	" - set buffer to unmodified (no exit warning)
	%d _
	clear
	call setline(1, [
		\ 'Clipboard Tools',
		\ '===============',
		\ '',
		\ '	Tab          Toggle tabs and spaces',
		\ '	''            Toggle '' and "',
		\ '	',
		\ '	|            Show special characters',
		\ '	',
		\ '	Ctrl+Enter   Copy text to clipboard and exit',
		\ '	Esc          Exit (no clipboard changes)',
		\ '',
		\ '',
		\ 'Current Clipboard',
		\ '=================',
		\ ''
		\ ])
	" Paste and jump back to start
	normal GP
	call GotoText()
	set nomod
endfun

fun GotoText()
	execute "normal gg/Current Clipboard/+2\r"
endfun

fun CopyContent()
	call GotoText()
	normal vG$y
endfun

nmap <TAB> :call GotoText()<CR>:set expandtab!<CR>:,$retab!<CR>
nmap '     :call GotoText()<CR>:,$s/['"]/\=submatch(0)=='"' ? "'" : '"'/g<CR>
noremap \| <ESC>:set list!<CR>
noremap <ESC> :quit!<CR>
noremap <C-CR> <ESC>:call CopyContent()<CR>:q!<CR>

autocmd FocusGained * :call Start()

set titlestring=Edit\ Clipboard
set listchars=tab:→\ ,space:·
set nowrap
set nohls
