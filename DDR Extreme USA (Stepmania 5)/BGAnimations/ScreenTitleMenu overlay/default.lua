local counter = 0;
local t = Def.ActorFrame{
	LoadActor("warning")..{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y*1.83);
	};
};

return t;