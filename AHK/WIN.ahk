#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
#SingleInstance, Force ; Only launch 1 instance of this script.
SetCapsLockState, AlwaysOff
SetTitleMatchMode, 2 ; Set title match mode to 2 (substring match)
Hotstring("EndChars", ";") ; Hotstring will be triggered only triggered when EndChar is Space

	; Ctrl (^), Shift (+), Alt (!), WIN (#)
	; Windows Key Bindings using WIN Key

	#q::Send !{F4}
	#Tab::Send ^!{Tab}
	#Up::WinMaximize, A
	#`::#+Right
	#s::#i
	;#p::
	;	Send ^{c}
	;	sleep, 10
	;	Run, cmd.exe /k "cd /d C:\Users\sande\ && C:\Users\sande\anaconda3\Scripts\activate.bat && 	pythonw.exe C:\Users\sande\SANDEEPFORAI\AI\APPS\NotesHelper.py && exit"
	;	sleep, 1900
	;	;WinActivate, OneNote
	;	WinActivate, Sublime Text (UNREGISTERED)
	;	sleep, 10
	;	SendInput, ^n
	;	sleep, 10
	;	SendInput, ^v
	;return
	#+i::Run, chrome.exe --profile-directory="Profile 1" "https://gemini.google.com/"
	#i::Run, chrome.exe --profile-directory="Profile 1" "https://www.bing.com/search?q=Bing+AI&showconv=1&FORM=hpcodx"
	#!i::Run, chrome.exe --profile-directory="Profile 4" "https://gemini.google.com/"
	;#y::Run, chrome.exe --profile-directory="Profile 1" "https://www.youtube.com/"
	;#+y::Run, chrome.exe --profile-directory="Default" "https://www.youtube.com/"
	;#u::Run, chrome.exe --profile-directory="Profile 1" "https://www.udemy.com/"
	#g::
		clipboard := ""
		SendInput, ^c
		ClipWait, 5
		WinMinimize, A
		IfWinNotExist, ahk_exe chrome.exe
		{
			Run, chrome.exe --profile-directory="Profile 1" "https://www.google.com/search?q=%clipboard%"
			sleep, 5
			WinActivate, Google Chrome
		}
		Else
		{
			WinActivate, Google Chrome
			SendInput, ^t
			SendInput, ^k
			sleep, 5
			SendInput, ^v`n
		}
	return

	#+g::
		clipboard := ""
		SendInput, ^c
		ClipWait, 2
		Run, chrome.exe --profile-directory="Profile 1" "https://gemini.google.com/"
		sleep, 5
		WinActivate, Google Chrome
	return
	#b::Run, ms-settings:bluetooth
	#w::Run, C:\Users\sande\Downloads

	; Key Bindings using F1-F12 Keys
	#F1::
		DllCall("PowrProf\SetSuspendState", "Int", 0, "Int", 1, "Int", 0)
	return

	; Turn Monitor Off #F2 controlled by Twinkle Tray App
	#F3::Shutdown, 1

	#F4::Run, DisplaySwitch.exe /external

	#F5::Run, DisplaySwitch.exe /internal

	#F6::Run, DisplaySwitch.exe /extend

	; Windows Key Bindings using Ctrl (^) and Alt (!) Key
	^!t::Run, "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git Bash.lnk"

	; Escape if pressed alone, Insert combined with other Keys
	Escape::
		Send {Insert Down}
		KeyWait, Escape
	return
	Escape Up::
		Send {Insert Up}
		If (A_PriorKey = "Escape")
			{
				Send {Escape}
			}
	return

	; PrintScreen if pressed alone, PrintScreen + Any Key combined shortcut
	PrintScreen::
		Send {PrintScreen Down}
		KeyWait, PrintScreen
	return
	PrintScreen Up::
		Send {PrintScreen Up}
		If (A_PriorKey = "PrintScreen")
			{
				Send #+{s}
			}
	return

	; Key Bindings using CapsLock Key
	CapsLock::Escape
	ScrollLock::CapsLock

	; CapsLock and Color Picker for Laptop
	;#c::
	;	If GetKeyState("Shift", "P")
	;		Send #+{c}
	;	Else
	;		; Toggles CapsLock to its opposite state
	;		SetCapsLockState % !GetKeyState("CapsLock", "T")
	;return

	; Go to End and Enter
	CapsLock & Enter::
		Send {End}
		Send {Enter}
	return

	; Create Bullet Point
	CapsLock & 8::
		Send {Alt Down}{Numpad0}{Numpad1}{Numpad4}{Numpad9}{Alt Up}{Space}
	return

	; Home,Left,Down,Up,Right,End,Delete,PageUp,PageDown => h,k,i,l,;,',u,n See all Windows and Desktops
	CapsLock & i::
		If GetKeyState("Ctrl", "P")
			Send ^{Up}
		Else If GetKeyState("Alt", "P")
			Send !{Up}
		Else If GetKeyState("Shift", "P")
			Send +{Up}
		Else
			Send {Up}
	return

	CapsLock & j::
		If GetKeyState("Ctrl", "P")
			Send ^{Left}
		Else If GetKeyState("Alt", "P")
			Send !{Left}
		Else If GetKeyState("Shift", "P")
			Send +{Left}
		Else
			Send {Left}
	return

	CapsLock & k::
		If GetKeyState("Ctrl", "P")
			Send ^{Down}
		Else If GetKeyState("Alt", "P")
			Send !{Down}
		Else If GetKeyState("Shift", "P")
			Send +{Down}
		Else
			Send {Down}
	return

	CapsLock & l::
		If GetKeyState("Ctrl", "P")
			Send ^{Right}
		Else If GetKeyState("Alt", "P")
			Send !{Right}
		Else If GetKeyState("Shift", "P")
			Send +{Right}
		Else
			Send {Right}
	return

	CapsLock & h::
		If GetKeyState("Ctrl", "P")
			Send ^{Home}
		Else If GetKeyState("Alt", "P")
			Send !{Home}
		Else If GetKeyState("Shift", "P")
			Send +{Home}
		Else
			Send {Home}
	return

	CapsLock & `;::
		If GetKeyState("Ctrl", "P")
			Send ^{End}
		Else If GetKeyState("Alt", "P")
			Send !{End}
		Else If GetKeyState("Shift", "P")
			Send +{End}
		Else
			Send {End}
	return

	CapsLock & '::
		If GetKeyState("Shift", "P")
			Send +{Delete}
		Else
			Send {Delete}
	return

	CapsLock & u::
		If GetKeyState("Ctrl", "P")
			Send ^{PgUp}
		Else If GetKeyState("Alt", "P")
			Send !{PgUp}
		Else If GetKeyState("Shift", "P")
			Send +{PgUp}
		Else If (GetKeyState("Ctrl", "P") & GetKeyState("Shift", "P"))
			Send ^+{PgUp}
		Else
			Send {PgUp}
	return

	CapsLock & n::
		If GetKeyState("Ctrl", "P")
			Send ^{PgDn}
		Else If GetKeyState("Alt", "P")
			Send !{PgDn}
		Else If GetKeyState("Shift", "P")
			Send +{PgDn}
		Else
			Send {PgDn}
	return

	; Create Desktop
	CapsLock & d::
		Send ^#{d}
	return

	; Close Desktop similar to win + q
	CapsLock & q::
		Send ^#{F4}
	return

	; Go to Left Desktop
	CapsLock & a::
		Send ^#{Left}
	return

	; Go to Right Desktop
	CapsLock & s::
		Send ^#{Right}
	return

	; Show all Windows and Desktops
	CapsLock & w::
		If GetKeyState("Shift", "P")
			Send #+{Tab}
		Else
			Send #{Tab}
	return

	; Toggle Focus / Mouse Pointer between Monitors (Customizable)
	CapsLock & Space::
		CoordMode Mouse, Screen ; mouse coordinates relative to the screen
		MouseGetPos MouseX, MouseY
		if (MouseX > A_ScreenWidth) {
			; Left Monitor
			MouseMove, -A_ScreenWidth, 0, 0, R
			Send {LButton}
		} else {
			; Right Monitor
			MouseMove A_ScreenWidth, 0, 0, R
			Send {LButton}
		}
	return

	; Key Bindings using NumPad with NumLock OFF and Mouse Keys OFF
	; /
	NumpadDiv::
		If GetKeyState("NumLock", "T") = 1
			Send {/}
		Else
			Run, C:\Windows\System32\calc.exe
	return

	; Find
	NumpadMult::
		If GetKeyState("NumLock", "T") = 1
			Send {*}
		Else
			Send {LButton}{LButton}
			Sleep 5
			Send ^{a}
			Sleep 5
			Send ^{c}
	return

	; Save
	NumpadSub::
		If GetKeyState("NumLock", "T") = 1
			Send {-}
		Else
			Send ^{f}
	return

	; Full Screen for Videos
	NumpadAdd::
		If GetKeyState("NumLock", "T") = 1
			Send {+}
		Else
			CoordMode Mouse, Screen ; mouse coordinates relative to the screen
				MouseGetPos MouseX, MouseY
				if (MouseX > A_ScreenWidth) {
					; Left Monitor
					MouseMove, -A_ScreenWidth, 0, 0, R
					Send {LButton}
				} else {
					; Right Monitor
					MouseMove A_ScreenWidth, 0, 0, R
					Send {LButton}
				}
	return

	; 0
	NumpadIns::^v

	; Voice Typing
	NumpadDel::#h

	; 1 Copy
	NumpadEnd::^c

	; 2 Cut
	NumpadDown::^x

	; 3 Select line and Copy
	NumpadPgDn::
		Send {End}
		sleep, 5
		Send +{Home}
		sleep, 5
		Send ^{c}
	return

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
		Send ^{a}
		Sleep 5
		Send ^{c}
	return

	; HOTSTRINGS ACROSS
	:c*:a@::sandeepforai@gmail.com ; 'c' means case-sensitive
	:c*:s@::sandeepse3@gmail.com
	:c*:p@::psandeep.dwh@gmail.com
	:c*:m@::9885917890
	:o:pr::print(){Left 1}
	:o:py::python{Space}
	:o:rt::python C:\Users\sande\SANDEEPFORAI\AI\APPS\rtables.py`n
	:o:st::python C:\Users\sande\SANDEEPFORAI\AI\APPS\stables.py`n
	:o:nh::python C:\Users\sande\SANDEEPFORAI\AI\APPS\NotesHelper.py`n
	:o:cl::clear`n
	:o:ex::exit`n
	;:o:jul::jupyter lab`n
	:o:ju::jupyter notebook`n
	:o:de::deactivate`n
	:o:ac::activate`n
	:o:so::source .venv/bin/activate`n
	:o:sow::source .venv/Scripts/activate`n
	:o:som::source main/Scripts/activate
	:o:red::redis-server`n

	; Terminal Hotstrings
	#IfWinActive ahk_exe ubuntu.exe
		:o:som::source main/bin/activate
	return

	; Git-Bash Hotstrings
	;#IfWinActive ahk_class mintty
	;return

	; Sublime Text
	#IfWinActive ahk_exe sublime_text.exe
		Pause::^k
	return

	; Visual Studio Code
	#IfWinActive ahk_exe Code.exe
		Pause::^k
		CapsLock & t::
			Send ^k
			Send ^l
		return

		CapsLock & f::
			Send ^!f
		return

		CapsLock & c::
			Send ^c
			Send ^2
			Send {Escape}
			Send ^v
		return

		CapsLock & r::
			Send ^s
			sleep, 500
			Send ^2
			sleep, 500
			Send {Ctrl Down}{F4}{Ctrl Up}
			sleep, 1000
			Send {F4}
		return

		CapsLock & 7::^+PgUp

		CapsLock & 8::^+PgDn

		CapsLock & 9::^PgUp

		CapsLock & 0::^PgDn

		CapsLock & [::^!Left

		CapsLock & ]::^!Right

		CapsLock & \::!+0

		:o:ce::
			Send {#} `%`%
		return

		:o:ca::
			Send {Home}
			sleep, 50
			Send {Enter}
			sleep, 50
			Send {Up}
			Send {#} `%`%
		return
		:o:cb::
			Send {End}
			sleep, 50
			Send {Enter}
			sleep, 50
			Send {Home}
			sleep, 50
			Send {#} `%`%
			Send ^+`n
		return
		:o:cu::
			Send {#} `%`%`n
		return
		:o:cd::
			Send {Home}
			sleep, 50
			Send {#} `%`%
			Send ^+`n
		return

		; Close Terminal and Run Ctrl + F5 Again
		^F5::
			Send {Insert}{k}
			sleep, 5
			Send ^{F5}
		return

		; Restart the  Python File
		;^+F5::
		;	Send {Alt Down}
		;	sleep, 50
		;	Send +{r}
		;	sleep, 50
		;	Send +{r}
		;	sleep, 50
		;	Send {Alt Up}
		;return

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
	return

	; OneNote
	#IfWinActive ahk_exe ONENOTE.EXE
	; Eraser
		^!+1::
			Send !d
			sleep, 5
			Send {g}
			sleep, 5
			Send {Enter}
		return
	; Black Pen
		^!+2::
			Send !d
			sleep, 5
			Send {t}
			sleep, 5
			Send !d
			sleep, 5
			Send {g}{Right}{Right}
			sleep, 5
			Send {Enter}
		return
	; Red Pen
		^!+3::
			Send !d
			sleep, 5
			Send {t}
			sleep, 5
			Send !d
			sleep, 5
			Send {g}{Right}{Right}{Right}
			sleep, 5
			Send {Enter}
		return
	; Green Pen
		^!+4::
			Send !d
			sleep, 5
			Send {t}
			sleep, 5
			Send !d
			sleep, 5
			Send {g}{Right}{Right}{Right}{Right}
			sleep, 5
			Send {Enter}
		return
	; Highlighter
		^!+5::
			Send !d
			sleep, 5
			Send {t}
			sleep, 5
			Send !d
			sleep, 5
			Send {g}{Right}{Right}{Right}{Right}{Right}
			sleep, 5
			Send {Enter}
		return
	return

	; Python Turtle Graphics Window
	; Restart the Python File
	#IfWinActive ahk_exe python.exe
		^+F5::
			WinMinimize, Python Turtle Graphics
			sleep, 50
			WinActivate, Visual Studio Code
			sleep, 50
			Send {Alt Down}
			sleep, 50
			Send +{r}
			sleep, 50
			Send +{r}
			sleep, 50
			Send {Alt Up}
		return
	return

	; Google Chrome Tab Specific Shortcut Keys
	#IfWinActive, Jupyter Notebook - Google Chrome
		NumpadUp::
			Send, ^{Enter}
		return

		NumpadDown::
			Send, +{Enter}
		return
	return

	#IfWinActive, Visual Workspace for Innovation - Google Chrome
		^y::^+z
		NumpadSub::^+z
		NumpadPgUp::^a
	return
	;	^w::
	;		 SendInput !{w}
	;	return
	;	F13::
	;		 SendInput ^{Tab}
	;		 sleep, 100
	;		 SendInput {F11}
	;		 sleep, 100
	;		 SendInput ^+{Tab}
	;	return
	;	F14::SendInput ^+q


	; Websites Hotstrings
	#IfWinActive ahk_exe chrome.exe

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
		:o:ri::http://localhost:8888/tree/SANDEEPFORAI/AI/Rishith`n
		:o:play::http://localhost:8888/tree/SANDEEPFORAI/AI/Rishith/Playground.ipynb`n
		:o:do::https://docs.google.com/`n
		:o:ke::https://keep.google.com/`n
		:o:sh::https://shoppinglist.google.com/`n
		:o:ac::https://myactivity.google.com/myactivity/`n
		:o:ar::https://artsandculture.google.com/play`n
		:o:me::https://messages.google.com/web/conversations`n
		:o:pyn::https://pynative.com/python-basic-exercise-for-beginners/`n
	return

	#IfWinActive, Udemy - Google Chrome ; Adjust window title as needed
		F13::Send {Left}
		F14::Send {Right}
	return

	#IfWinActive, YouTube - Google Chrome ; Adjust window title as needed
		F13::Send {Left}
		F14::Send {Right}
	return

	#IfWinActive ahk_class SciTEWindow
		^r::
			SendInput ^s
			sleep, 50
			SendInput {F5}
		return
	return

	#IfWinActive ahk_exe explorer.exe
		^o::Edit ; This will edit this script
	return

	#IfWinActive ahk_exe vlc.exe
		F13::Send {Left}
		F14::Send {Right}
	return

	; Show/Hide Hidden Files Refresh Explorer
	#IfWinActive ahk_class CabinetWClass ahk_exe explorer.exe
		^+.::
			RegRead, hidden, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden  ; Get If Files Hidden Or Shown
			If hidden contains 1  ; IF Files NOT Hidden
			{
				RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 2  ; Hide Hidden Files
			}
			else  ; ELSE Files Hidden
			{
				RegWrite, REG_DWORD, HKCU, Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced, Hidden, 1  ; Show Hidden Files
			}
			WinGet, windows, List, ahk_exe explorer.exe  ; Get List Explorer Windows
			Loop, %windows%
			{
				id := windows%A_Index%  ; id
				WinGetTitle, title, ahk_id %id%  ; title
				WinGetClass, class, ahk_id %id%  ; class
				WinGet, exe, ProcessName, ahk_id %id%  ; exe
				ControlSend, DirectUIHWND2, {F5}, %title% ahk_class %class% ahk_exe %exe%  ; Refresh All Explorer Windows
			}
			sleep, 500
			SendInput {F5}
			return
	return