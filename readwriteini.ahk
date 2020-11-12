if FileExist("config.ini"){
	IniRead("config.ini", "General", "SetOverShow")
	IniRead("config.ini", "General", "SetCheckWin")
	
	IniRead("config.ini", "NES", "ExeName")
	IniRead("config.ini", "NES", "Imagens")
	
	IniRead("config.ini", "SNES", "ExeName")
	IniRead("config.ini", "SNES", "Imagens")
	
	IniRead("config.ini", "N64", "ExeName")
	IniRead("config.ini", "N64", "Imagens")
	
	IniRead("config.ini", "GC", "ExeName")
	IniRead("config.ini", "GC", "Imagens")
	
	IniRead("config.ini", "Wii", "ExeName")
	IniRead("config.ini", "Wii", "Imagens")	

	IniRead("config.ini", "WiiU", "ExeName")
	IniRead("config.ini", "WiiU", "Imagens")
	
	IniRead("config.ini", "Switch", "ExeName")
	IniRead("config.ini", "Switch", "Imagens")
	
	IniRead("config.ini", "GB", "ExeName")
	IniRead("config.ini", "GB", "Imagens")

	IniRead("config.ini", "VB", "ExeName")
	IniRead("config.ini", "VB", "Imagens")

	IniRead("config.ini", "GBC", "ExeName")
	IniRead("config.ini", "GBC", "Imagens")
	
	IniRead("config.ini", "GBA", "ExeName")
	IniRead("config.ini", "GBA", "Imagens")
	
	IniRead("config.ini", "DS", "ExeName")
	IniRead("config.ini", "DS", "Imagens")

	IniRead("config.ini", "DSi", "ExeName")
	IniRead("config.ini", "DSi", "Imagens")

	IniRead("config.ini", "3DS", "ExeName")
	IniRead("config.ini", "3DS", "Imagens")

} else {
	IniWrite  "100", "config.ini", "General", "SetOverShow"
	IniWrite "1000", "config.ini", "General", "SetCheckWin"
	
	IniWrite      "Mesen.exe", "config.ini", "NES", "ExeName"
	IniWrite        "nes.png", "config.ini", "NES", "Imagens"
	
	IniWrite "snes9x-x64.exe", "config.ini", "SNES", "ExeName"
	IniWrite       "snes.png", "config.ini", "SNES", "Imagens"
	
	IniWrite  "Project64.exe", "config.ini", "N64", "ExeName"
	IniWrite        "n64.png", "config.ini", "N64", "Imagens"
	
	IniWrite     "Dolphi.exe", "config.ini", "GC", "ExeName"
	IniWrite         "gc.png", "config.ini", "GC", "Imagens"
	
	IniWrite     "Dolphi.exe", "config.ini", "Wii", "ExeName"
	IniWrite        "wii.png", "config.ini", "Wii", "Imagens"
	
	IniWrite       "Cemu.exe", "config.ini", "WiiU", "ExeName"
	IniWrite       "wiiu.png", "config.ini", "WiiU", "Imagens"
	
	IniWrite       "Yuzu.exe", "config.ini", "Switch", "ExeName"
	IniWrite     "switch.png", "config.ini", "Switch", "Imagens"
	
	IniWrite         "GB.exe", "config.ini", "GB", "ExeName"
	IniWrite         "gb.png", "config.ini", "GB", "Imagens"
	
	IniWrite         "VB.exe", "config.ini", "VB", "ExeName"
	IniWrite         "vb.png", "config.ini", "VB", "Imagens"
	
	IniWrite        "GBC.exe", "config.ini", "GBC", "ExeName"
	IniWrite        "gbc.png", "config.ini", "GBC", "Imagens"
	
	IniWrite        "GBA.exe", "config.ini", "GBA", "ExeName"
	IniWrite        "gba.png", "config.ini", "GBA", "Imagens"
	
	IniWrite         "DS.exe", "config.ini", "DS", "ExeName"
	IniWrite         "ds.png", "config.ini", "DS", "Imagens"
	
	IniWrite        "DSi.exe", "config.ini", "DSi", "ExeName"
	IniWrite        "dsi.png", "config.ini", "DSi", "Imagens"
	
	IniWrite        "3DS.exe", "config.ini", "3DS", "ExeName"
	IniWrite        "3ds.png", "config.ini", "3DS", "Imagens"
}