Menu,Tray,Icon,%A_ScriptDir%\viatc.ico
Menu,Tray,NoStandard
Menu,Tray,Add,查看热键(&K),<vc_Keymap>
Menu,Tray,Add,查看插件(&P),<vc_Plugin>
Menu,Tray,Add,
Menu,Tray,Add,重启(&R),<Reload>
Menu,Tray,Add,退出(&X),<Exit>
iniWrite,%A_ScriptHwnd%,%A_Temp%\vimd_auto.ini,auto,hwnd
Global vim := class_vim()
Global ini := class_EasyINI(A_ScriptDir "\vimd.ini")
;vim.Debug(true)
CheckPlugin()
CheckHotKey()
OnMessage(0x4a, "Receive_WM_COPYDATA")
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
; Receive_WM_COPYDATA(wParam, lParam) {{{2
Receive_WM_COPYDATA(wParam, lParam){
    StringAddress := NumGet(lParam + 2*A_PtrSize)  ; 获取 CopyDataStruct 的 lpData 成员.
    AHKReturn := StrGet(StringAddress)  ; 从结构中复制字符串.
	If RegExMatch(AHKReturn,"i)reload")
  {
		Settimer,VIMD_Reload,500
    return true
  }
}
VIMD_Reload:
  Reload
return

#Include %A_ScriptDir%\lib\class_EasyINI.ahk
#Include %A_ScriptDir%\lib\class_vim.ahk
#Include %A_ScriptDir%\lib\acc.ahk
#Include %A_ScriptDir%\lib\dock.ahk
#Include %A_ScriptDir%\lib\gdip.ahk
#Include %A_ScriptDir%\Lib\VIMD_plugins.ahk
