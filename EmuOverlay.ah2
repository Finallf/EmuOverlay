#SingleInstance force
#Warn
#Persistent
#InstallMouseHook

SetTitleMatchMode 3
SendMode "Input"
CoordMode "Mouse", "Client"
SetWorkingDir A_ScriptDir
Thread "interrupt", 0

MyIcon := "EmuOverlay.ico"
If FileExist(MyIcon)
	TraySetIcon(MyIcon)

Global Imagens := "snes.png"
Global ExeName := "snes9x-x64.exe"

Global FirTime := 0
Global AhkName := "ahk_exe" ExeName
Global Emus := ""

SetTimer "OverShow", 100
SetTimer "CheckWin", 1000

if FileExist("Emus.ini"){
	Emus := IniRead("emus.ini", "Emus")
} else {
	IniWrite "
	(
	NES
	SNES
	N64
	GC
	Wii
	WiiU
	Switch
	GB
	VB
	GBC
	GBA
	DS
	DSi
	3DS
	)", "emus.ini", "Emus"
}


Global teste := IniRead("config.ini")

MsgBox teste

#Include "Readwriteini.ahk"

if (WinExist("ahk_exe" IniRead("config.ini", "SNES", "ExeName"))){
	ExeName := IniRead("config.ini", "SNES", "ExeName")
	Imagens := IniRead("config.ini", "SNES", "Imagens")
	AhkName := "ahk_exe" ExeName
	MsgBox "ExeName e Imagens é: " ExeName ", " Imagens " e " AhkName
	
} else If (WinExist("ahk_exe" IniRead("config.ini", "GC", "ExeName"))){
	ExeName := IniRead("config.ini", "GC", "ExeName")
	Imagens := IniRead("config.ini", "GC", "Imagens")
	AhkName := "ahk_exe" ExeName
	MsgBox "ExeName e Imagens é: " ExeName ", " Imagens " e " AhkName
	
} else {
	MsgBox "ExeName, Imagens e AhkName são: " ExeName ", " Imagens " e " AhkName " Valores Originais "
}

Global Overlay := Gui.New()
Overlay.Opt("+LastFound")
Overlay.MarginX := 0
Overlay.MarginY := 0
Overlay.Add("Picture", "h-1", Imagens)
Overlay.BackColor := "00FF00"
WinsetTranscolor "00FF00"
Overlay.Opt("+AlwaysOnTop -Caption -Border -Sysmenu +ToolWindow +E0x20")

OverShow() {
	if WinActive(AhkName) {
		WinGetClientPos ,,W,H,AhkName
		if (W >= A_ScreenWidth ) && (H >= A_ScreenHeight){
			Overlay.Show("NA")
			FirTime := 1
		} else {
			Overlay.Hide()
		}
	}
}

CheckWin() {
	if ((!WinExist(AhkName) && FirTime = 1) or (!WinExist(AhkName) && !WinWait(AhkName,, 5)))
		ExitApp
}