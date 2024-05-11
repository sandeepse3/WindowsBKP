#Requires AutoHotkey v2.0
#SingleInstance Force ; Only launch 1 instance of this script.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode "Input" ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir A_ScriptDir ; Ensures a consistent starting directory.
SetCapsLockState "AlwaysOff"
SetTitleMatchMode 2 ; Set title match mode to 2 (substring match)
Hotstring("EndChars", ";") ; Hotstring will be triggered only triggered when EndChar is Space
; Ctrl (^), Shift (+), Alt (!), WIN (#)

; Windows Key Bindings using WIN Key
	#q::SendInput("!{F4}")
	#Tab::SendInput("^!{Tab}")
	#Up::WinMaximize("A")
	#`::#+Right
	#s::#i
	#p::
	{
		SendInput("^c")
		Sleep(10)
		Run('git-bash.exe -c "/c/Users/sande/main/Scripts/python.exe /c/Users/sande/SANDEEPFORAI/AI/APPS/NotesHelper.py && exit"')
		Sleep(1900)
		;WinActivate("OneNote")
		WinActivate("Sublime Text (UNREGISTERED)")
		Sleep(10)
		SendInput("^n")
		Sleep(10)
		SendInput("^v")
	}
	; Toggle Front App Visible Hide All Others
	#.::#Home
	#+i::Run('chrome.exe --profile-directory="Profile 1" "https://www.bing.com/search?q=Bing+AI&showconv=1&FORM=hpcodx"')
	#i::Run('chrome.exe --profile-directory="Profile 1" "https://gemini.google.com/"')
	#!i::Run('chrome.exe --profile-directory="Profile 1" "https://www.perplexity.ai/"')
	;#y::Run('chrome.exe --profile-directory="Profile 1" "https://www.youtube.com/"')
	;#+y::Run('chrome.exe --profile-directory="Default" "https://www.youtube.com/"')
	;#u::Run('chrome.exe --profile-directory="Profile 1" "https://www.udemy.com/"')
	#g::
	{
		clipboard := ""
		SendInput("^c")
		ClipWait(5)
		WinMinimize("A")
		if not WinExist("ahk_exe chrome.exe")
		{
			Run("chrome.exe --profile-directory='Profile 1' 'https://www.google.com/search?q=%clipboard%'")
			Sleep(5)
			WinActivate("Google Chrome")
		}
		else
		{
			WinActivate("Google Chrome")
			SendInput("^t")
			SendInput("^k")
			Sleep(5)
			SendInput("^v`n")
		}
	}

	#+g::
	{
		clipboard := ""
			SendInput("^c")
			ClipWait(2)
			Run("chrome.exe --profile-directory='Profile 1' 'https://gemini.google.com/'")
			Sleep(5)
			WinActivate("Google Chrome")
	}
	#b::Run("ms-settings:bluetooth")
	#w::Run("C:\Users\sande\Downloads")

	; Key Bindings using F1-F12 Keys
	#F1::
	{
		DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 1, "Int", 0)
	}

	; Turn Monitor Off #F2 controlled by Twinkle Tray App
	#F3::Shutdown(1)

	#F4::Run("DisplaySwitch.exe /external")

	#F5::Run("DisplaySwitch.exe /internal")

	#F6::Run("DisplaySwitch.exe /extend")

	; Windows Key Bindings using Ctrl (^) and Alt (!) Key
	^!t::Run("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git Bash.lnk")

	; Key Bindings using Numpad with Numlock OFF and Mouse Keys OFF
	; /
	NumpadDiv::
	{
		if GetKeyState("NumLock", "T") = 1
			Send("{/}")
		else
			Run("C:\Windows\System32\calc.exe")
	}

	; Find
	NumpadMult::
	{
		if GetKeyState("NumLock", "T") = 1
			Send("{*}")
		else
			SendInput("{LButton}{LButton}")
			Sleep(5)
			SendInput("^a")
			Sleep(5)
			SendInput("^c")
	}

	; Save
	NumpadSub::
	{
		if GetKeyState("NumLock", "T") = 1
			SendInput("{-}")
		else
			SendInput("^f")
	}

	; Full Screen for Videos
	NumpadAdd::
	{
		if GetKeyState("NumLock", "T") = 1
		{
			SendInput("{+}")
		}
		else
		{
			SendInput("^{Enter}")
		}
	}

	; 0
	NumpadIns::^v

	; Voice Typing
	NumpadDel::#h

	; 1 Copy
	NumpadEnd::^c

	; 2 Cut
	NumpadDown::^x

	; 3 Select line and Copy
	NumpadPgDn::^a
	;{
	;	SendInput("{End}")
	;	Sleep(5)
	;	SendInput("+{Home}")
	;	Sleep(5)
	;	SendInput("^c")
	;}

	; 4 Left
	NumpadLeft::Left

	; 5 Space
	NumpadClear::Space

	; 6 Right
	NumpadRight::Right

	; 7 Undo
	NumpadHome::^z

	; 8 Redo
	NumpadUp::^y

	; 9 Select All and Copy
	NumpadPgUp::
	{
		SendInput("^a")
		;SendInput("{LButton}{LButton}")
		Sleep 3
		SendInput("^c")
	}

	; HOTSTRINGS ACROSS
	:c*:a@::sandeepforai@gmail.com ; 'c' means case-sensitive
	:c*:s@::sandeepse3@gmail.com
	:c*:p@::psandeep.dwh@gmail.com
	:c*:m@::9885917890
	:o:pr::print(){Left 1}
	:o:ol::ollama{Space}
	:o:cl::clear`n
	:o:ex::exit`n
	:o:py::python{Space}
	:o:re::redis-server`n
	:o:rt::python C:\Users\sande\SANDEEPFORAI\AI\APPS\rtables.py`n
	:o:st::python C:\Users\sande\SANDEEPFORAI\AI\APPS\stables.py`n
	:o:nh::python C:\Users\sande\SANDEEPFORAI\AI\APPS\NotesHelper.py`n
	;:o:jul::jupyter lab`n

	; PrintScreen if pressed alone, PrintScreen + Any Key combined shortcut
	PrintScreen::
	{
		Send("{PrintScreen Down}")
		KeyWait("PrintScreen")
	}
	PrintScreen Up::
	{
		Send("{PrintScreen Up}")
		if (A_PriorKey = "PrintScreen")
			{
				SendInput("#+s")
			}
	}

	; Key Bindings using CapsLock Key
	CapsLock::Escape
	ScrollLock::CapsLock

	; CapsLock and Color Picker for Laptop
	;#c::
	;{
	;	if GetKeyState("Shift", "P")
	;		Send("#+{c}")
	;	else
	;		; Toggles CapsLock to its opposite state
	;		SetCapsLockState % !GetKeyState("CapsLock", "T")
	;}

	; Go to End and Enter
	CapsLock & Enter::
	{
		Send("{End}")
		Send("{Enter}")
	}

	; Create Bullet Point
	CapsLock & 8::
	{
		Send("{Alt Down}{Numpad0}{Numpad1}{Numpad4}{Numpad9}{Alt Up}{Space}")
	}

	; Home,Left,Down,Up,Right,End,Delete,PageUp,PageDown => h,k,i,l,;,',u,n See all Windows and Desktops
	CapsLock & i::
	{
		if GetKeyState("Ctrl", "P")
			Send("^{Up}")
		else if GetKeyState("Alt", "P")
			Send("!{Up}")
		else if GetKeyState("Shift", "P")
			Send("+{Up}")
		else
			Send("{Up}")
	}

	CapsLock & j::
	{
		if GetKeyState("Ctrl", "P")
			Send("^{Left}")
		else if GetKeyState("Alt", "P")
			Send("!{Left}")
		else if GetKeyState("Shift", "P")
			Send("+{Left}")
		else
			Send("{Left}")
	}

	CapsLock & k::
	{
		if GetKeyState("Ctrl", "P")
			Send("^{Down}")
		else if GetKeyState("Alt", "P")
			Send("!{Down}")
		else if GetKeyState("Shift", "P")
			Send("+{Down}")
		else
			Send("{Down}")
	}

	CapsLock & l::
	{
		if GetKeyState("Ctrl", "P")
			Send("^{Right}")
		else if GetKeyState("Alt", "P")
			Send("!{Right}")
		else if GetKeyState("Shift", "P")
			Send("+{Right}")
		else
			Send("{Right}")
	}

	CapsLock & h::
	{
		if GetKeyState("Ctrl", "P")
			Send("^{Home}")
		else if GetKeyState("Alt", "P")
			Send("!{Home}")
		else if GetKeyState("Shift", "P")
			Send("+{Home}")
		else
			Send("{Home}")
	}

	CapsLock & `;::
	{
		if GetKeyState("Ctrl", "P")
			Send("^{End}")
		else if GetKeyState("Alt", "P")
			Send("!{End}")
		else if GetKeyState("Shift", "P")
			Send("+{End}")
		else
			Send("{End}")
	}

	CapsLock & '::
	{
		if GetKeyState("Shift", "P")
			Send("+{Delete}")
		else
			Send("{Delete}")
	}

	CapsLock & u::
	{
		if GetKeyState("Ctrl", "P")
			Send("^{PgUp}")
		else if GetKeyState("Alt", "P")
			Send("!{PgUp}")
		else if GetKeyState("Shift", "P")
			Send("+{PgUp}")
		else if (GetKeyState("Ctrl", "P") & GetKeyState("Shift", "P"))
			Send("^+{PgUp}")
		else
			Send("{PgUp}")
	}

	CapsLock & n::
	{
		if GetKeyState("Ctrl", "P")
			Send("^{PgDn}")
		else if GetKeyState("Alt", "P")
			Send("!{PgDn}")
		else if GetKeyState("Shift", "P")
			Send("+{PgDn}")
		else
			Send("{PgDn}")
	}

	; Create Desktop
	CapsLock & d::
	{
		SendInput("^#d")
	}

	; Close Desktop similar to win + q
	CapsLock & q::
	{
		SendInput("^#{F4}")
	}

	; Go to Left Desktop
	CapsLock & a::
	{
		SendInput("^#{Left}")
	}

	; Go to Right Desktop
	CapsLock & s::
	{
		SendInput("^#{Right}")
	}

	; Show all Windows and Desktops
	CapsLock & w::
	{
		if GetKeyState("Shift", "P")
			SendInput("#+{Tab}")
		else
			SendInput("#{Tab}")
	}

	; Toggle Focus / Mouse Pointer between Monitors (Customizable)
	CapsLock & Space::
	{
		; mouse coordinates relative to the screen
		CoordMode("Mouse","Screen")
		mousePos := MouseGetPos(&xpos, &ypos)
		if (xpos > A_ScreenWidth)
		{
			; Left Monitor
			MouseMove(-A_ScreenWidth, 0, 0, "R")
			SendInput("{LButton}")
		}
		else
		{
			; Right Monitor
			MouseMove(A_ScreenWidth, 0, 0, "R")
			SendInput("{LButton}")
		}
	}

	; Terminal Hotstrings
	#HotIf WinActive("ahk_exe ubuntu.exe")
	{
		:o:so::source .venv/bin/activate`n
		:o:som::source main/bin/activate`n
	}

	; Git-Bash Hotstrings
	;#HotIf WinActive("ahk_exe mintty.exe")
	;return

	; Sublime Text
	#HotIf WinActive("ahk_exe sublime_text.exe")
	{
		Pause::^k
	}

	#HotIf WinActive("ahk_exe Code.exe") or WinActive("ahk_exe mintty.exe")
	{
		:o:ju::jupyter notebook`n
		:o:de::deactivate`n
		:o:ac::activate`n
		:o:so::source .venv/Scripts/activate`n
		:o:som::source main/Scripts/activate`n
	}

	; Visual Studio Code
	#HotIf WinActive("ahk_exe Code.exe")
	{
		; Escape if pressed alone, Insert combined with other Keys
		Escape::
		{
			Send("{Insert Down}")
			KeyWait("Escape")
		}
		Escape Up::
		{
			Send("{Insert Up}")
			if (A_PriorKey = "Escape")
				{
					SendInput("{Escape}")
				}
		}

		Pause::Insert
		; Ctrl + K if pressed alone, Ctrl combined with other Keys
		Insert::
		{
			Send("{Ctrl Down}")
			KeyWait("Insert")
		}
		Insert Up::
		{
			Send("{Ctrl Up}")
			if (A_PriorKey = "Insert")
				{
					SendInput("^{k}")
				}
		}
		CapsLock & t::
		{
			Send("^k")
			Send("^l")
		}

		CapsLock & f::
		{
			SendInput("^!f")
		}

		CapsLock & c::
		{
			Send("^c")
			Send("^2")
			Send("{Escape}")
			Send("^v")
		}

		CapsLock & r::
		{
			Send("^s")
			Sleep(500)
			Send("^2")
			Sleep(500)
			Send("{Ctrl Down}{F4}{Ctrl Up}")
			Sleep(1000)
			Send("{F4}")
		}

		CapsLock & 7::^+PgUp

		CapsLock & 8::^+PgDn

		CapsLock & 9::^PgUp

		CapsLock & 0::^PgDn

		CapsLock & [::^!Left

		CapsLock & ]::^!Right

		CapsLock & \::!+0

		:o:ce::
		{
			SendInput("{#} `%`%")
		}

		:o:ca::
		{
			Send("{Home}")
			Sleep(50)
			Send("{Enter}")
			Sleep(50)
			Send("{Up}")
			Send("{#} `%`%")
		}
		:o:cb::
		{
			Send("{End}")
			Sleep(50)
			Send("{Enter}")
			Sleep(50)
			Send("{Home}")
			Sleep(50)
			Send("{#} `%`%")
			Send("^+`n")
		}
		:o:cu::
		{
			Send("{#} `%`%`n")
		}
		:o:cd::
		{
			Send("{Home}")
			Sleep(50)
			Send("{#} `%`%")
			Send("^+`n")
		}

		; Close Terminal and Run Ctrl + F5 Again
		^F5::
		{
			Send("{Insert}{k}")
			Sleep(5)
			Send("^{F5}")
		}

		; Restart the  Python File
		;^+F5::
		;{
		;	Send("{Alt Down}")
		;	Sleep(50)
		;	Send("+{r}")
		;	Sleep(50)
		;	Send("+{r}")
		;	Sleep(50)
		;	Send("{Alt Up}")
		;}

		;:o:db::pineconedb
		:o:fi::{#} FIXME:{Space}
		:o:to::{#} TODO:{Space}
		:o:ve::{#} VERSION:{Space}
		:o:im::{#} IMP
		:o:imp::{#} IMP:{Space}
		:o:no::{#} NOTE:{Space}
		:o:le::{#} LEARN
		:o:lea::{#} LEARN:{Space}
		:o:co::{#} COMBAK:{Space}
		:o:ti::{#} TITLE:{Space}
		:o:re::{#} REFERENCES:{Space}
		:o:bu::{#} BUG:{Space}
		:o:cp::{#} COPYPASTE
		:o:cop::{#} COPYPASTE:{Space}
		:o:en::{#} *************************************************************************`n
	}

	; OneNote Word Excel
	#HotIf WinActive("ahk_exe ONENOTE.EXE") or WinActive("ahk_exe WINWORD.EXE") or WinActive("ahk_exe EXCEL.EXE") or WinActive("ahk_exe POWERPNT.EXE") or WinActive("ahk_exe anki.exe")
	{
		'::SendInput("''{Left 1}")
		!'::SendInput("''''''{Left 3}")
		!+'::SendInput("+'+'+'+'+'+'{Left 3}")
		+9::SendInput("`(`){Left 1}")
		[::SendInput("[]{Left 1}")
		{::SendInput("+[+]{Left 1}")
		"::SendInput("+'+'{Left 1}")
	}

	; Python Turtle Graphics Window
	; Restart the Python File
	#HotIf WinActive("ahk_exe python.exe")
	{
		^+F5::
		{
			WinMinimize("Python Turtle Graphics")
			Sleep(50)
			WinActivate("Visual Studio Code")
			Sleep(50)
			SendInput("{Alt Down}")
			Sleep(50)
			SendInput("+r")
			Sleep(50)
			SendInput("+r")
			Sleep(50)
			SendInput("{Alt Up}")
		}
	}

	; Google Chrome Tab Specific Shortcut Keys
	#HotIf WinActive("Jupyter Notebook - Google Chrome")
	{
		NumpadUp::
		{
			SendInput("^{Enter}")
		}

		NumpadDown::
		{
			SendInput("+{Enter}")
		}
	}

	#HotIf WinActive("Visual Workspace for Innovation - Google Chrome")
	{
		^y::^+z
		NumpadSub::^+z
		NumpadPgUp::^a
	}
	;	^w::
	;	{
	;		 SendInput !{w}
	;	}
	;	F13::
	;	{
	;		 SendInput ^{Tab}
	;		 Sleep(10)0
	;		 SendInput {F11}
	;		 Sleep(10)0
	;		 SendInput ^+{Tab}
	;	}
	;	F14::SendInput ^+q


	; Websites Hotstrings
	#HotIf WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe msedge.exe")
	{
		^0::^9
		:o:au::https://www.audible.in`n
		:o:mi::https://miro.com/app/dashboard/`n
		:o:mu::https://music.amazon.in/`n
		:o:av::https://courses.analyticsvidhya.com/enrollments`n ;`n is Enter
		:o:ang::https://learn.deeplearning.ai/`n
		:o:bi::https://www.bing.com/search?q=Bing+AI&showconv=1&FORM=hpcodx`n
		:o:ca::https:/canva.com/`n
		:o:ch::https://chat.openai.com/`n
		:o:co::https://colab.research.google.com`n
		:o:ty::https://www.tynker.com`n
		:o:am::https://www.amazon.in`n
		:o:fl::https://www.flipkart.com`n
		:o:yo::https://www.youtube.com`n
		:o:wh::https://web.whatsapp.com`n
		:o:gm::https://gmail.com`n
		:o:gem::https://gemini.google.com/`n
		:o:gi::https://github.com/`n
		:o:dr::https://drive.google.com/drive/my-drive`n
		:o:re::https://readalong.google.com/`n
		:o:drp::https://www.dropbox.com/home`n
		:o:sp::https://www.speedtypingonline.com/typing-lessons`n
		:o:spt::https://speedtest.net`n
		:o:hd::https://www.hdfcbank.com/`n
		:o:hu::https://huggingface.co/docs/transformers/main_classes/pipelines`n
		:o:on::https://www.onlinesbi.sbi/`n
		:o:ud::https://www.udemy.com/`n
		:o:ai::http://localhost:8888/tree/SANDEEPFORAI/AI/`n
		:o:pyt::http://localhost:8888/tree/SANDEEPFORAI/AI/PyTorch/`n
		:o:pa::https://pastebin.com/hzkvcJ72`n
		:o:pe::https://www.perplexity.ai/`n
		:o:ri::http://localhost:8888/tree/SANDEEPFORAI/AI/Rishith`n
		:o:play::http://localhost:8888/tree/SANDEEPFORAI/AI/Rishith/Playground.ipynb`n
		:o:do::https://docs.google.com/`n
		:o:ke::https://keep.google.com/`n
		:o:sh::https://shoppinglist.google.com/`n
		:o:ac::https://myactivity.google.com/myactivity/`n
		:o:ar::https://artsandculture.google.com/play`n
		:o:me::https://messages.google.com/web/conversations`n
		:o:pyn::https://pynative.com/python-basic-exercise-for-beginners/`n
	}

	#HotIf WinActive("Udemy - Google Chrome")  ; Adjust window title as needed
	{
		F13::SendInput("{Left}")
		F14::SendInput("{Right}")
	}

	#HotIf WinActive("YouTube - Google Chrome")  ; Adjust window title as needed
	{
		F13::SendInput("{Left}")
		F14::SendInput("{Right}")
	}

	#HotIf WinActive("ahk_class SciTEWindow")
	{
		^r::
		{
			SendInput("^s")
			Sleep(5)
			SendInput("{F5}")
		}
	}

	#HotIf WinActive("ahk_exe explorer.exe")
	{
		^o::Edit ; This will edit this script
	}

	#HotIf WinActive("ahk_exe vlc.exe")
	{
		F13::SendInput("{Left}")
		F14::SendInput("{Right}")
	}

	; Show/Hide Hidden Files Refresh Explorer
	#HotIf WinActive("ahk_class CabinetWClass ahk_exe explorer.exe")
	{
		^+.::
		{
			hidden := RegRead("HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden")  ; Get if Files Hidden Or Shown
			if (hidden=1)  ; if Files NOT Hidden
			{
				RegWrite(2, "REG_DWORD", "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden") ; Hide Hidden Files
			}
			else  ; else Files Hidden
			{
				RegWrite(1, "REG_DWORD", "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced", "Hidden")  ; Show Hidden Files
			}
			windows := WinGetList("ahk_exe explorer.exe")  ; Get List Explorer Windows
			for index, id in windows
			{
				title := WinGetTitle("ahk_id " . id)  ; title
				getclass := WinGetClass("ahk_id " . id)  ; class
				MsgBox(getclass)
				exe := WinGetPID("ahk_id " . id)  ; exe
				ControlSend("DirectUIHWND2", "{F5}", title " ahk_class " . getclass " ahk_exe " . exe)  ; Refresh All Explorer Windows
			}
			Sleep(500)
			SendInput("{F5}")
			return
		}
	}