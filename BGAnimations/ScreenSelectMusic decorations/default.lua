local t = LoadFallbackB();

t[#t+1] = LoadActor("circle")..{ 
	InitCommand=cmd(draworder,10;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+90);
}

t[#t+1] = LoadActor("_diff")..{ 
	InitCommand=cmd(draworder,10;x,SCREEN_CENTER_X;y,SCREEN_CENTER_Y+90);
	
}

t[#t+1] = LoadActor( "p1_cursor" )..{
         InitCommand=cmd(draworder,10;x,SCREEN_CENTER_X-110;y,SCREEN_CENTER_Y+40);
		 
 }  

t[#t+1] = LoadActor("left")..{ 
	InitCommand=cmd(draworder,10;x,SCREEN_CENTER_X-189;y,SCREEN_CENTER_Y-92);
	--OnCommand=cmd(bounce;effectmagnitude,8,0,0;effectclock,'beatnooffset');
	OffCommand=cmd(sleep,0.15;linear,0.15;diffusealpha,0);
	NextSongMessageCommand=cmd(stoptweening;linear,0;x,SCREEN_CENTER_X-189+10;accelerate,0.1;x,SCREEN_CENTER_X-189);
} 

t[#t+1] = LoadActor("right")..{ 
	InitCommand=cmd(draworder,10;x,SCREEN_CENTER_X+189;y,SCREEN_CENTER_Y-92);
	--OnCommand=cmd(bounce;effectmagnitude,-8,0,0;effectclock,'beatnooffset');
	OffCommand=cmd(sleep,0.15;linear,0.15;diffusealpha,0);
	PreviousSongMessageCommand=cmd(stoptweening;linear,0;x,SCREEN_CENTER_X+189-10;accelerate,0.1;x,SCREEN_CENTER_X+189);
}

t[#t+1] = StandardDecorationFromFile("BannerFrame","BannerFrame")

return t