
local t = LoadFallbackB();

 t[#t+1] = LoadActor("BG")..{ 
	InitCommand=cmd(Center)
	};

 t[#t+1] = LoadActor("_rows")..{
 InitCommand=cmd(draworder,10;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+30);
}
t[#t+1] = StandardDecorationFromFile("Footer","Footer")
t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")

return t