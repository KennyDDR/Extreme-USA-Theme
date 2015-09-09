return Def.ActorFrame{
	LoadActor("Options BG")..{ InitCommand=cmd(Center); };
	LoadActor("Options Side header")..{ InitCommand=cmd(Center); };
	LoadActor("ScreenOptions header")..{ InitCommand=cmd(x,307;y,51); };
	LoadActor("_options explain")..{ InitCommand=cmd(x,317;y,433); };
};