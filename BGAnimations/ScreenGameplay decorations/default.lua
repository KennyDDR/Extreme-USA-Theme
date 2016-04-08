local t = LoadFallbackB();
  
  
	t[#t+1] = LoadActor("_lifebar")..{
  InitCommand=cmd(draworder,10;x,SCREEN_CENTER_X+3;y,SCREEN_TOP+29)
  }
  
  return t