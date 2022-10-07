:: 关闭命令的回显
@echo off
:: 设置hosts文件路径
set HOSTS=C:\Windows\System32\drivers\etc\hosts
:: 判断当前路径是否存在 hosts.init 文件, 不存在则备份
if not exist %HOSTS%.init (
    copy /y %HOSTS% %HOSTS%.init && echo 系统hosts文件备份完成!
)

:: %date%=2021年07月07日
:: %time%= 9:12:38:96
:: 年 yyyy = %date:~0,4% 表示指针从左到右偏移 0 位, 然后提取 4 字符
:: 月 mm   = %date:~5,2% 表示指针从左到右偏移 5 位, 然后提取 2 字符
:: 日 dd   = %date:~8,2% 表示指针从左到右偏移 8 位, 然后提取 2 字符
set yyyymmdd=%date:~0,4%-%date:~5,2%-%date:~8,2%
:: 时 hh   = %time:~0,2% 表示指针从左到右偏移 0 位, 然后提取 2 字符
:: 分 mm   = %time:~3,2% 表示指针从左到右偏移 3 位, 然后提取 2 字符
:: 秒 ss   = %time:~6,2% 表示指针从左到右偏移 6 位, 然后提取 2 字符
set hh=%time:~0,2%
set mm=%time:~3,2%
set ss=%time:~6,2%
:: 当 hh 小于等于 9 时, 在前面补 0
if %hh% leq 9 (set hh=0%hh:~1,1%)

GOTO MENU
:MENU
ECHO.
ECHO.############################## 修改系统hosts解析文件 ##############################
ECHO.#
ECHO.# 1.添加域名解析
ECHO.#
ECHO.# 2.编辑hosts文件
ECHO.#
ECHO.# 3.备份hosts文件
ECHO.#
ECHO.# 4.还原hosts文件
ECHO.#
ECHO.# 5.刷新dns缓存并退出
ECHO.#
ECHO.############################### %yyyymmdd% %hh%:%mm%:%ss% ###############################
set /p="请输入您要操作的序号："<nul
@set /p  sel=
if "%sel%"=="1"  goto add_ipdomain
if "%sel%"=="2"  goto edit_hosts
if "%sel%"=="3"  goto backup_hosts
if "%sel%"=="4"  goto reset_hosts
if "%sel%"=="5"  goto refresh_dns
PAUSE
:add_ipdomain
set /p="请输入IP地址和域名（中间以空格分隔）:"<nul
@set /p  ip_domain=
type %HOSTS% |findstr /v "^#"| findstr /i "%ip_domain%\>"
if %errorlevel% == 0 ( 
  echo %ip_domain% 已存在,请重新添加！&& goto MENU 
 ) else ( 
  echo.%ip_domain% >> %HOSTS% && echo %ip_domain% 添加成功,请按任意键返回菜单！&& pause >nul 
 ) 
goto MENU
:edit_hosts
title 编辑hosts本地域名解析文件
notepad %HOSTS%
echo 按任意键返回菜单！
pause >nul
goto MENU
:backup_hosts
title 备份hosts文件
set yyyymmdd=%date:~0,4%%date:~5,2%%date:~8,2%
copy /y %HOSTS% %HOSTS%.%yyyymmdd%%hh%%mm%
echo ("%HOSTS%.%yyyymmdd%%hh%%mm%") 备份完毕,按任意键返回菜单！
pause >nul
goto MENU
pause
:reset_hosts
title 还原hosts文件
copy /y %HOSTS%.init %HOSTS%
echo hosts文件已还原至初始状态,按任意键返回菜单！
pause >nul
goto MENU
:refresh_dns
title 刷新本地dns缓存并退出
echo 查看修改后的hosts文件内容,5秒后退出!
type "%HOSTS%" |findstr /v "^#"|findstr "[0-9]"
ping -n 5 127.0.0.1>nul
ipconfig /flushdns
echo 刷新本地缓存成功，即将退出!
ping -n 3 127.0.0.1>nul
echo.
exit
