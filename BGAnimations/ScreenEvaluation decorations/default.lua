local t = LoadFallbackB();


  
t[#t+1] = LoadActor("header")..{
  InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+73)
  }
  
  
  
  t[#t+1] = LoadActor("score")..{
  InitCommand=cmd(x,SCREEN_CENTER_X;y,SCREEN_TOP+31)
  }
  
  t[#t+1] = LoadActor("p1")..{
  InitCommand=cmd(x,SCREEN_CENTER_X-250;y,SCREEN_TOP+60)
  
			
			
  }
  
  t[#t+1] = LoadActor("p2")..{
  InitCommand=cmd(x,SCREEN_CENTER_X+250;y,SCREEN_TOP+63)
  
  
			
  
			
  }
  
  
t[#t+1] = LoadActor("back")..{
  InitCommand=cmd(draworder,10;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+27)
  }
  
  return t