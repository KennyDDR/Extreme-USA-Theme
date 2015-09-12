return Def.ActorFrame{
	-- Information panel
	LoadActor("_info")..{
		InitCommand=cmd(x,SCREEN_CENTER_X-60;y,SCREEN_CENTER_Y-30;);
		AnimCommand=cmd(draworder,90;);
		OnCommand=function(self)
			if GAMESTATE:GetNumSidesJoined() == 1 then
				self:playcommand("Anim")
			end
		end;
		GainFocusCommand=cmd(stoptweening;diffusealpha,1);
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0);
		OffCommand=cmd(sleep,0.183;linear,0.066;zoomy,0.973;linear,0.083;zoomy,1.052;linear,0.1;zoomy,0.914;linear,0.1;zoomy,1.125;linear,0.25;zoomy,0.079;linear,0;diffusealpha,0);
	};
	
	-- Panel
	LoadActor("_panel")..{
		InitCommand=cmd(x,SCREEN_RIGHT-100;y,SCREEN_CENTER_Y-30;);
		AnimCommand=cmd(vertalign,top;);
		OnCommand=function(self)
			if GAMESTATE:GetNumSidesJoined() == 1 then
				self:playcommand("Anim")
			end
		end;
		GainFocusCommand=cmd(stoptweening;diffusealpha,1;);
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0;);
		OffCommand=cmd(sleep,0.264;accelerate,0.066;zoomy,1.16;decelerate,0.066;zoomy,1;linear,0.132;diffusealpha,0);
	};

	-- Picture
	LoadActor("_dancer")..{
		InitCommand=cmd(x,SCREEN_RIGHT-85;y,SCREEN_CENTER_Y+20;);
		AnimCommand=cmd(diffusealpha,0.9;vertalign,bottom;draworder,90);
		OnCommand=function(self)
			if GAMESTATE:GetNumSidesJoined() == 1 then
				self:playcommand("Anim")
			end
		end;
		GainFocusCommand=cmd(stoptweening;diffusealpha,0.9);
		LoseFocusCommand=cmd(stoptweening;diffusealpha,0);
		OffCommand=cmd(sleep,0.132;accelerate,0.066;zoomy,1.12;decelerate,0.066;zoomy,1;diffusealpha,0);
	};
	
};