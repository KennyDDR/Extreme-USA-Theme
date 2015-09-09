-- 01 GalleryMode.lua: functions for Gallery Mode-related stuff

-- galleryItems - the complete list of items.
galleryItems = {
	-- 001: DDR 1st PSX boxart
	-- 002: ???
	-- 003: DDR 2nd ReMIX Append Club Version 1 boxart
	-- 004: DDR 2nd ReMIX Append Club Version 2 boxart
	-- 005: DDR 3rd Mix boxart
	-- 006: DDR Best Hits boxart
	-- 007: ???
	-- 008: DDR 4th Mix boxart
	-- 009: ???
	-- 010: ???
	-- 011: ???
	-- 012: ???
	-- 013: ???
	-- 014: DDR 3rd Mix title
	-- 015: DDR 3rd ReMIX title
	-- 016: DDR 3rd Mix SSR title
	-- 017: DDR Best Hits title
	-- 018: ???
	-- 019: DDR 4th Mix title
	-- 020: DDR Extra Mix title 1
	-- 021: DDR Extra Mix title 2
	-- 022: DDR poster 1
	-- 023: DDR poster 2
	-- 024: DDR 2nd ReMIX poster
	-- 025: ???
	-- 026: DDR 3rd Mix poster
	-- 027: ???
	-- 028: DDR Arrange (Afro & Lady)
	-- 029: [need more info]
	-- 030: [need more info]
	-- 031: [need more info]
	-- 032: ???
	-- 033: ???
	-- 034: Dance Globe
	-- 035: Super Candy
	-- 036: ???
	-- 037: the language of flowers
	-- 038: stars running down side [need more info]
	-- 039: frogs with crowns [need more info]
	-- 040: blue thing [need more info]
	-- 041: male/female symbols
	-- 042: red with white stripes [need more info]
	-- 043: ska two tone
	-- 044: paranoia guy
	-- 045: fare away
	-- 046: ???
	-- 047: long long ago
	-- 048: "shall we?"
	-- 049: flying people
	-- 050: buttons
	-- 051: ???
	-- 052: ???
	-- 053: red bg dancer
	-- 054: pills
	-- 055: dance yellow balls [need more info]
	-- 056: open your head
	-- 057: dance funny glasses [need more info]
	-- 058: nothing but dancing
	-- 059: pop! the spy in the cab
	-- 060: Let's Move
	-- 061: euro
	-- 062: ???
	-- 063: Dance graffitti
	-- 064: I'm walkin' around the world
	-- 065: hip-hop
	-- 066: green stuff [need more info]
	-- 067: ORIGINAL STEP
	-- 068: ???
	-- 069: robot gear filmstrip
	-- 070: ddr tape [need more info]
	-- 071: ???
	-- 072: ???
	-- 073: ???
	-- 074: Jewely Box
	-- 075: ddr pop art [need more info]
	-- 076: dance dance revolution flowers
	-- 077: dance dance dance [need more info]
	-- 078: digital sound thing [need more info]
	-- 079: dissolve
	-- 080: work from my speed [need more info]
	-- 081: digital clock thing
	-- 082: DDR machine (crashes)
	-- 083: B4U
	-- 084: 
	-- 085: 
	-- 086: 
	-- 087: 
	-- 088: ???
	-- 089: 
	-- 090: 
	-- 091: 
	-- 092: ???
	-- 093: 
	-- 094: ???
	-- 095: 
	-- 096: 
	-- 097: 
	-- 098: 
	-- 099: 
	-- 100: 
	-- 101: 
	-- 102: 
	-- 103: 
	-- 104: 
	-- 105: 
	-- 106: 
	-- 107: ???
	-- 108: 
	-- 109: 
	-- 110: 
	-- 111: 
	-- 112: ???
	-- 113: 
	-- 114: 
	-- 115: 
	-- 116: ???
	-- 117: 
	-- 118: 
	-- 119: 
	-- 120: 
	-- 121: ???
	-- 122: ???
	-- 123: 
	-- 124: 
	-- 125: 
	-- 126: 
	-- 127: 
	-- 128: 
	-- 129: 
	-- 130: ???
	-- 131: 
	-- 132: 
	-- 133: ???
	-- 134: devil-zukin
	-- 135: disk-beings
	-- 136: zukin twins
	-- 137: ???
	-- 138: rage & emi
	-- 139: johnny & jenny 1
	-- 140: izam & ni-na
	-- 141: ni-na & izam
	-- 142: johnny
	-- 143: johnny & jenny 2
	-- 144: akira & yuni
	-- 145: robo2000 & maid-zukin
	-- 146: konsento:03/2 & devil-zukin
	-- 147: ???
	-- 148: maid-zukin
	-- 149: ni-na
	-- 150: ???
	-- 151: boldo
	-- 152: yuni
	-- 153: robo2001
	-- 154: baby-lons
	-- 155: maho/emi pic
	-- 156: memory card screen from 5th mix AC
	-- 157: ddr cd case
	-- 158: ddr caps
	-- 159: ???
	-- 160: ???
	-- 161: ddr lanyards?
	-- 162: afro action figure
	-- 163: ???
	-- 164: ddr wallets 1
	-- 165: ddr sunglasses
	-- 166: ddr original goods
	-- 167: ddr pink bag
	-- 168: lady action figure
	-- 169: ddr wireframe shirt
	-- 170: ddr lady t-shirt 1
	-- 171: ddr afro t-shirt 1
	-- 172: ddr wallets 2
	-- 173: ddr cooler bag
	-- 174: keychains
	-- 175: ???
	-- 176: ddr mini speaker
	-- 177: konami arcade model
	-- 178: ddr pin collection
	-- 179: ???
	-- 180: ddr black hat
	-- 181: sticker thing [need more info]
	-- 182: afro shirt 2
	-- 183: lady shirt 2
	-- 184: ddr guidebook series
	-- 185: bemani original memory card case
	-- 186: ddr finger step
	-- 187: ddr hello kitty
	-- 188: ddr dear daniel
	-- 189: ???
	-- 190: ddr pad with color sides
	-- 191: spike on the beach
	-- 192: ddr original sticker
	-- 193: ???
	-- 194: ???
	-- 195: 3rd mix cardboard pop
	-- 196: 3rd mix watch
	-- 197: konami ddr thing
	-- 198: ???
	-- 199: red bg ddr dancer
	-- 200: black and white street
	-- 201: ???
	-- 202: you can play let's enjoy [need more info]
	-- 203: you can play let's enjoy [need more info]
	-- 204: [need more info]
	-- 205: you can play let's enjoy [need more info]
	-- 206: ???
	-- 207: ???
	-- 208: afro in three colors
	-- 209: can you feel it? ddr
	-- 210: dancer ddr
	-- 211: 3rd mix opening movie storyboard
	-- 212: ddr ice cube room
	-- 213: likely 3rd mix opening movie other 1
	-- 214: ???
	-- 215: ???
	-- 216: 3rd mix opening movie other 3
	-- 217: ???
	-- 218: ???
	-- 219: ???
	-- 220: 3rd mix opening movie other 4
	-- 221: 3rd mix opening movie other 5
	-- 222: 3rd mix opening movie other 6
	-- 223: 3rd mix opening movie other 7
	-- 224: BeForU group shot
	-- 225: Yoma Komatsu
	-- 226: Shiyuna Maeahara
	-- 227: Riyu Kosaka
	-- 228: Noria Shiraishi
};

-- galleryPages - 12 items at a time
galleryPages = {};

-- gallery logic: there is a folder Graphics/_gallery
-- there are thumb/%03i.png and full/%03i.png files. The end.

local galleryData = nil
local galleryDataPath = "Save/DDR5th/Gallery.ini"
galleryNeedsSave = false

function InitGalleryData(data,bLoadFromDisk)
	if not IniFile then Warn( GetString("IniFileMissing") ) end

	if bLoadFromDisk then
		if not LoadGalleryData() then return false end
	end

	galleryData["Gallery"] = galleryData["Gallery"] and galleryData["Gallery"] or {}

	--[[
	for k,entry in pairs(data) do
		if not galleryData["Gallery"][k] then
			galleryData["Gallery"][k] = tostring(entry)
		end
	end
	--]]
end

function LoadGalleryData()
	if not IniFile then return false end
	galleryData = IniFile.ReadFile(galleryDataPath)
	return true
end

function SaveGalleryData()
	if not IniFile then return false end
	if not galleryNeedsSave then return end
	galleryNeedsSave = false
	IniFile.WriteFile(galleryDataPath, galleryData)
end

function ForceSaveGalleryData()
	if not IniFile then return false end
	galleryNeedsSave = false
	IniFile.WriteFile(galleryDataPath, galleryData)
end

function GetGalleryEntry(num)
	-- find shit
end

function SetGalleryEntry(num,status)
	-- find shit
	-- set shit
	--galleryNeedsSave = true
end