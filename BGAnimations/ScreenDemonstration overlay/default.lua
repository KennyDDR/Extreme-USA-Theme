return Def.ActorFrame {
	LoadActor( "overlay" )..{
		InitCommand=cmd(FullScreen);
	};
}