Everything:
	vim.SetPlugin("Everything","Array","0.1","用于Everything")
	vim.SetAction("EverythingToggle","启用/禁止Everything vim热键")
	vim.SetWin("Everything","EVERYTHING")
	vim.SetMode("normal","Everything")
	vim.map("1","<1>","Everything")
	vim.map("2","<2>","Everything")
	vim.map("3","<3>","Everything")
	vim.map("4","<4>","Everything")
	vim.map("5","<5>","Everything")
	vim.map("6","<6>","Everything")
	vim.map("7","<7>","Everything")
	vim.map("8","<8>","Everything")
	vim.map("9","<9>","Everything")
	vim.map("0","<0>","Everything")
	vim.map("j","<down>","Everything")
	vim.map("k","<up>","Everything")
	vim.map("<super><alt>","EverythingToggle","Everything")
	Toggle := True
return
EverythingToggle:
	Toggle := Toggle ? False : True
	vim.control(Toggle,"Everything")
return
