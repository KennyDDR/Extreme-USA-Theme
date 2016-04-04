local t = LoadFallbackB();

t[#t+1] = LoadActor("circle")..{ 
	InitCommand=cmd(draworder,10;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+90);
}

t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")

return t