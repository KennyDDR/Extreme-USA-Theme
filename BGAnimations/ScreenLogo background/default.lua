local outColor = color("#00326B")

return Def.ActorFrame{

LoadActor( "CARD_0168" )..{
		OnCommand=cmd(play);
		OffCommand=cmd(stop);
	};

	Def.Quad{
		Name="LeftSide";
		InitCommand=cmd(x,SCREEN_CENTER_X-320;CenterY;diffuse,outColor;halign,1;zoomto,SCREEN_CENTER_X,SCREEN_HEIGHT);
	};
	Def.Quad{
		Name="RightSide";
		InitCommand=cmd(x,SCREEN_CENTER_X+320;CenterY;diffuse,outColor;halign,0;zoomto,SCREEN_CENTER_X,SCREEN_HEIGHT);
	};
	-- should've been 854x480, but I'll take what I can get.
	LoadActor("bg")..{ InitCommand=cmd(Center;); };
}
