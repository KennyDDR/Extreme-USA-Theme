-- ScreenRecords overlay

-- this is a two part menu:
-- 1) pick a group
-- 2) go through songs and check shit out.

-- possible menu states: 'Menustate_GroupList', 'Menustate_SongList'
local MenuState = 'Menustate_GroupList'
local curSongGroup = ""
local curIndex = 1;
local oldIndex = curIndex;

local songGroups = SONGMAN:GetSongGroupNames();

local function MakeGroupItem(groupName,idx)
	return Def.ActorFrame{
		Name="Group"..idx;
		LoadActor("_entry bg");
		LoadFont("_2070polyester round 24px")..{
			Text=SONGMAN:ShortenGroupName(groupName);
			InitCommand=cmd(x,-64;halign,0;zoom,0.6667;maxwidth,192;);
			BeginCommand=function(self)
				self:playcommand(idx == curIndex and "GainFocus" or "LoseFocus")
			end;
			GainFocusCommand=cmd(diffuse,color("1,1,0,1");strokecolor,color("0.35,0.35,0,1"));
			LoseFocusCommand=cmd(diffuse,color("1,1,0,0.5");strokecolor,color("0.35,0.35,0,0.5"));
			MoveScrollerMessageCommand=function(self,param)
				if curIndex == idx then
					self:playcommand("GainFocus")
				elseif oldIndex == idx then
					self:playcommand("LoseFocus")
				end
			end;
		};
		Def.ActorFrame{
			Name="GroupStats";
			LoadFont("_2070polyester square 24px")..{
				InitCommand=cmd(halign,0;x,128;zoom,12/24);
				BeginCommand=function(self)
					local groupSongs = SONGMAN:GetSongsInGroup(groupName)
					local numSongs = #groupSongs
					groupSongs = nil -- get the fuck out of my memory (this can be big)
					local text = numSongs.." song"
					if numSongs ~= 1 then text = text.."s" end
					self:settext(text)
				end;
			};
		};
	};
end;

local groupList = {};
for i=1,#songGroups do
	groupList[#groupList+1] = MakeGroupItem(songGroups[i],i)
end;

local t = Def.ActorFrame{
	Def.Actor{
		Name="InputHandler";
		MenuUpP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Up", }); end;
		MenuUpP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Up", }); end;
		MenuDownP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Down", }); end;
		MenuDownP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Down", }); end;
		MenuStartP1MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_1, Input = "Start", }); end;
		MenuStartP2MessageCommand=function(self) MESSAGEMAN:Broadcast("MenuInput", { Player = PLAYER_2, Input = "Start", }); end;
		CodeMessageCommand=function(self,param)
			MESSAGEMAN:Broadcast("MenuInput", { Player = param.PlayerNumber, Input = param.Name, })
		end;

		MenuInputMessageCommand=function(self,param)
			if param.Input == "Start" then
				-- only handle it in GroupList.
				if MenuState == 'Menustate_GroupList' then
					-- set the group and move to song list
				end
			else
				-- direction
				oldIndex = curIndex
				if param.Input == "Up" then
					if curIndex > 1 then
						curIndex = curIndex-1
					end
				elseif param.Input == "Down" then
					if curIndex < #groupList then
						curIndex = curIndex+1
					end
				end
				MESSAGEMAN:Broadcast("MoveScroller",{Input = param.Input});
			end
		end;
	};

	Def.Quad{
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-164;valign,1;zoomto,SCREEN_WIDTH,100;MaskSource);
	};
	Def.ActorScroller{
		Name="ListScroller";
		SecondsPerItem=0;
		NumItemsToDraw=14;
		InitCommand=cmd(x,SCREEN_CENTER_X-150;y,SCREEN_CENTER_Y-146;MaskDest);
		TransformFunction=function(self,offset,itemIndex,numItems)
			self:y(offset * 29);
		end;
		children = groupList;
		MoveScrollerMessageCommand=function(self,param)
			-- scroll if the time is right.
			local curScrollerItem = self:GetCurrentItem()
			if curIndex <= 4 and curScrollerItem - 4 <= 0 then
				self:SetCurrentAndDestinationItem(0)
			else
				if curIndex+3 >= #groupList then
					self:SetCurrentAndDestinationItem(#groupList-7)
				else
					self:SetCurrentAndDestinationItem(curIndex-4)
				end
			end
		end
	};

	LoadActor(THEME:GetPathB("_missing","overlay"));
};

return t;