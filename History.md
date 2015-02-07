## 计划完成的功能

1. 增加Dock支持

2. 增加一个简单的配置界面

3. 迁移TC插件

4. ~迁移Everything插件~

## 历史记录

* 2015-02-07 17:49:20

> ++ 增加对老版本的vimd插件的支持（可以直接迁移）

> ++ 增加在映射的热键的时候，Action无效的错误处理（直接添加vim.SetAction）。

> ** 修复<C-Esc>无法复制Genral模式的问题

> ** 其它若干Bug处理

* 2015-02-07 10:50:44

> ** 修复CapsLock判断的错误

> ** 修复class_vim 的几个逻辑错误


* 2015-02-05 16:44:11

> ** 修复增加新特性后，TC插件无法使用的BUG

> ** 修复TC64位与32位不正确的BUG

> ** 修复按下[Count]后，不执行afterActionDo对应的函数


* 2015-02-05 11:09:11

> ++ 增加Example.ahk示例

> ++ 增加SetWin时，使用ahk_exe判断，如: vim.setwin("记事本","Notepad","notepad.exe")

> ** 修复vim.GetMore()不显示Count的Bug

* 2015-02-03

> 初始化 