General:
	vim.SetAction("<down>","向下移动")
	vim.SetAction("<up>","向上移动")
	vim.SetAction("<left>","向左移动")
	vim.SetAction("<right>","向右移动")
	vim.SetAction("<home>","热键home")
	vim.SetAction("<end>","热键End")
	vim.SetAction("<pageup>","向下翻页")
	vim.SetAction("<pagedown>","向上翻页")
	vim.SetAction("<Gen_InsertMode>","插入模式")
	vim.SetAction("<Gen_NormalMode>","浏览模式")
	vim.SetAction("<Gen_Toggle>","启用/禁用热键")
	vim.SetAction("<Gen_CopyWin>","复制General热键到当前窗口")
	vim.SetAction("<Reload>","重新加载")
	vim.SetAction("<Exit>","重新加载")
	vim.SetAction("<msgbox>","test")

	vim.SetMode("normal")
	;vim.map("<w-z>","<reload>")
	vim.map("<c-esc>","<Gen_copywin>")
	;vim.map("<w-tab>dddd","<msgbox>")


	vim.SetWin("General","")


	vim.Map("j","<down>","General")
	vim.Map("k","<up>","General")
	vim.Map("h","<right>","General")
	vim.Map("l","<left>","General")
	vim.Map("gw","<down>","General")
	vim.map("i","<Gen_InsertMode>","General")
	;vim.Map("<super><c-esc>","HotkeyToggle","General")
return

<Gen_InsertMode>:
	vim.SetMode("Insert",vim.CheckWin())
return
<Gen_NormalMode>:
	vim.SetMode("Normal",vim.CheckWin())
return
<Gen_Toggle>:
	vim.Toggle(vim.CheckWin())
return
<Gen_copywin>:
	WinGetClass,C,A
	vim.copy("General",c,c)
return

<msgbox>:
	msgbox 是否是这个效果？
return
<reload>:
	reload
return
<Exit>:
	ExitApp
return
<down>:
	send,{down}
return
<up>:
	send,{up}
return
<left>:
	send,{left}
return
<right>:
	send,{right}
return
<home>:
	send,{home}
return
<end>:
	send,{end}
return
<pageup>:
	send,{pgup}
return
<pagedown>:
	send,{pgdown}
return
