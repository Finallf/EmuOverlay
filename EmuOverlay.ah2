#SingleInstance force
#Warn
#Persistent
SetTitleMatchMode 3
SetWorkingDir A_ScriptDir
Thread "interrupt", 0
#Include "Readwriteini.ahk"

Global Overlay := ""
Global Imagens := ""
Global ExeName := ""
Global ExtTime := 0
Global chckimg := 0
Global OldName := ""
Global FirTime := 1
Global CtrName := ""

MyIcon := "EmuOverlay.ico"
If FileExist(MyIcon) {
	TraySetIcon(MyIcon)
}

SetTimer "OverShow", 50

Global DebugGui := Gui.New()
DebugGui.Add("Edit","w320 r3 ReadOnly vDebugView","")
DebugGui.Show("NoActivate")

GuiOShow() {
	Overlay := Gui.New()
	Overlay.Opt("+LastFound")
	Overlay.MarginX := 0
	Overlay.MarginY := 0
	Overlay.Add("Picture", "h-1", "imgs\" Imagens "")
	Overlay.BackColor := "00FF00"
	WinsetTranscolor "00FF00"
	Overlay.Opt("+AlwaysOnTop -Border -Caption -Sysmenu +ToolWindow +E0x20")
	Overlay.Show("NA")
}
OverShow() {
	For v In StrSplit(IniRead("config.ini"), "`n") {
		if WinExist("ahk_exe" IniRead("config.ini", v, "ExeName", "")) {
			FirTime := 1
			CtrName := IniRead("config.ini", v, "ExeName", "")
			if WinActive("ahk_exe" IniRead("config.ini", v, "ExeName", "")) {
				ExeName := IniRead("config.ini", v, "ExeName", "")
				Imagens := IniRead("config.ini", v, "Imagens", "")
			} else {
				ExeName := ""
				Imagens := ""
			}
		}
	}

	DebugGui['DebugView'].Value := FirTime " " ExeName " " CtrName " " ExtTime

	if ExtTime <= 5 and ExeName = "" and FirTime = 0 {
		Sleep 1000
		ExtTime++
		Return
	}

	AhkExeN := "ahk_exe" ExeName
	if WinActive(AhkExeN) {
		WinGetClientPos ,,W,H,AhkExeN
		DetectHiddenText 0
		TextLen := WinGetText()
		if W >= A_ScreenWidth && H >= A_ScreenHeight {
			if chckimg = 0 And StrLen(TextLen) = 0 {
				GuiOShow()
				chckimg := 1
				OldName := ExeName
			} else if chckimg = 1 And StrLen(TextLen) > 0 or chckimg = 1 And OldName != ExeName {
				Overlay.Destroy()
				chckimg := 0
				OldName := ExeName
			}
		} else if chckimg = 1 {
			Overlay.Destroy()
			chckimg := 0
		}
	}
	if !WinExist(AhkExeN) And FirTime = 0 or !WinExist(AhkExeN) And ExtTime > 5 {
		ExitApp
	}
}