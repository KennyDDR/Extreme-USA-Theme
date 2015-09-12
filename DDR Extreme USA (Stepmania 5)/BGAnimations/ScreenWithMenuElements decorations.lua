local t = Def.ActorFrame{};

-- used on most menu element screens
t[#t+1] = StandardDecorationFromFileOptional("Header","Header");
t[#t+1] = StandardDecorationFromFileOptional("Footer","Footer");
--t[#t+1] = StandardDecorationFromFileOptional("StyleIcon","StyleIcon");
t[#t+1] = StandardDecorationFromFileOptional("Help", "Help");

-- only used on a few screens (namely SelMusic and Evaluation)
t[#t+1] = StandardDecorationFromFileOptional("StageDisplay", "StageDisplay");

t[#t+1] = Def.ActorFrame {
	InitCommand=cmd(sleep,1.22);

	LoadActor("_black")..{
		InitCommand=cmd(CenterX;y,SCREEN_BOTTOM;scaletoclipped,SCREEN_WIDTH,32);
	};
	LoadActor("_black")..{
		InitCommand=cmd(CenterX;y,SCREEN_TOP;scaletoclipped,SCREEN_WIDTH,32);
	};
}
return t