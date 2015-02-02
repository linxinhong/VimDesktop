Global vim := class_vim()
Global ini := class_EasyINI(A_ScriptDir "\vimd.ini")
;vim.Debug(true)
Menu,Tray,NoStandard
Menu,Tray,Add,查看热键(&K),<vc_Keymap>
Menu,Tray,Add,查看插件(&P),<vc_Plugin>
Menu,Tray,Add,
Menu,Tray,Add,重启(&R),<Reload>
Menu,Tray,Add,退出(&X),<Exit>
CheckPlugin()
CheckHotKey()
return
CheckPlugin()
{
	ps := ini.GetKeys("Plugin")
	Loop,Parse,ps,`n
		vim.LoadPlugin(A_LoopField)
}
CheckHotKey()
{
	secs := ini.GetSections()
	Loop,Parse,secs,`n
	{
		If RegExMatch(A_LoopField,"i)^((config)|(exclude)|(plugin))|(global)$")
			Continue
		Else
		{
			win   := A_LoopField
			class := ini[win]["set class"]
			timeout := ini[win]["set timeout"]
			maxcount := ini[win]["set maxcount"]
			info := ini[win]["set info"]
			infoshow := ini[win]["set infoshow"]
			infohide := ini[win]["set infohide"]
			winObj := vim.SetWin(win,class)
			strlen(info) ? winObj.SetInfo(info)
			strlen(infoshow) ? winObj.SetShowInfo(infoshow)
			strlen(infohide) ? winObj.SetHideInfo(infoHide)
			strlen(timeout) ? vim.SetTimeOut(timeout,win)
			strlen(maxcount) ? vim.SetMaxCount(maxcount,win)
			ps := ini.GetKeys(win)
			Loop,Parse,ps,`n
			{
				If RegExMatch(A_LoopField,"i)^SET\s")
					Continue
				val:=ini[win][A_LoopField]
				If RegExMatch(val,"\[\=(.*)?\]",m)
				{
					If Strlen(m1)
						vim.SetMode(m1,win)
					val := Trim(RegExReplace(val,"\[=(.*)?\]"))
				}
				vim.map(A_LoopField,val,win)
			}
		}
	}
}
#Include %A_ScriptDir%\lib\class_EasyINI.ahk
#Include %A_ScriptDir%\lib\class_vim.ahk
#Include %A_ScriptDir%\lib\acc.ahk
#Include %A_ScriptDir%\lib\dock.ahk
#Include %A_ScriptDir%\lib\gdip.ahk
#Include %A_ScriptDir%\plugins\plugins.ahk
