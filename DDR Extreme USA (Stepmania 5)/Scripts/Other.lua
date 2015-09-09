function LoadStepsDisplayGameplayFrame(self,player)
	local difficultyStates = {
		Difficulty_Beginner	 = 0,
		Difficulty_Easy		 = 1,
		Difficulty_Medium	 = 2,
		Difficulty_Hard		 = 3,
		Difficulty_Challenge = 4,
		Difficulty_Edit		 = 5,
	};
	local selection;
	if GAMESTATE:IsCourseMode() then
		selection = GAMESTATE:GetCurrentTrail(player);
	else
		selection = GAMESTATE:GetCurrentSteps(player);
	end;
	local state = difficultyStates[selection:GetDifficulty()] or 5;
	return state;
end;

-- tiles
-- function by shakesoda
local function GetAspect()
	return math.floor(PREFSMAN:GetPreference("DisplayAspectRatio") * 10) / 10;
end;

local AspectRatios = {
	FourThree = { X = 4, Y = 3 },
	SixteenTen = { X = 16, Y = 10 },
	SixteenNine = { X = 16, Y = 9 },
};

function GetTileCoordX()
	local squareCoord = 4;
	local aspectType;
	-- 16/9
	if GetAspect() >= 1.7 then aspectType = "SixteenNine";
	-- 16/10
	elseif GetAspect() == 1.6 then aspectType = "SixteenTen";
	-- assume 4/3 otherwise
	else aspectType = "FourThree";
	end;

	squareCoord = AspectRatios[aspectType].X

	return squareCoord;
end;

function GetTileCoordY()
	local squareCoord = 4;
	local aspectType;
	-- 16/9
	if GetAspect() >= 1.7 then aspectType = "SixteenNine";
	-- 16/10
	elseif GetAspect() == 1.6 then aspectType = "SixteenTen";
	-- assume 4/3 otherwise
	else aspectType = "FourThree";
	end;

	squareCoord = AspectRatios[aspectType].Y

	return squareCoord;
end;
-- end tiles

-- GetCharAnimPath(sPath)
-- Easier access to Characters folder (taken from ScreenHowToPlay.cpp)
function GetCharAnimPath(sPath) return "/Characters/"..sPath end

-- GetGraphicType()
-- Used for picking Arcade/Home mode graphics based on current settings.
function GetGraphicType() return GAMESTATE:GetCoinMode() == 'CoinMode_Home' and "CS" or "AC" end

-- NormalizeCharID(sCharID)
-- Normalizes a character ID by replacing '.' with '-'.
--[[ See this comment from sm-ssc\src\AttackDisplay.cpp:
"If we pass a period to THEME->GetPathTo, it'll think we're looking for a
specific file and not search." --]]
function NormalizeCharID(sCharID)
	return string.gsub(sCharID, "%.", "-")
end

function AnyPlayerUsingEdit()
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local steps = GAMESTATE:GetCurrentSteps(pn)
		if steps:GetDifficulty() == 'Difficulty_Edit' then return true end
	end
	return false
end

function PlayingSameEdit()
	-- only one human player? then yeah.
	if #GAMESTATE:GetHumanPlayers() < 2 then return true end

	local desc = {};
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		local steps = GAMESTATE:GetCurrentSteps(pn)
		if steps:GetDifficulty() == 'Difficulty_Edit' then
			desc[pn] = steps:GetDescription()
		end
	end
	return desc[PLAYER_1] == desc[PLAYER_2]
end

function HideSectionText()
	local sortOrder = GAMESTATE:GetSortOrder()
	if sortOrder == 'SortOrder_Title' or sortOrder == 'SortOrder_Artist' then
		return true
	end
	return false
end

-- summary evaluation banner handling (for 1-5 stages)
-- most of these values are made up and need to be checked for accuracy.
local summaryBannerX = {
	MaxStages1 = { SCREEN_CENTER_X },
	MaxStages2 = {
		SCREEN_CENTER_X+37,
		SCREEN_CENTER_X-37
	},
	MaxStages3 = {
		SCREEN_CENTER_X+64,
		SCREEN_CENTER_X,
		SCREEN_CENTER_X-64
	},
	MaxStages4 = {
		SCREEN_CENTER_X+64,
		SCREEN_CENTER_X+40,
		SCREEN_CENTER_X-40,
		SCREEN_CENTER_X-64
	},
	MaxStages5 = {
		SCREEN_CENTER_X+64,
		SCREEN_CENTER_X+32,
		SCREEN_CENTER_X,
		SCREEN_CENTER_X-32,
		SCREEN_CENTER_X-64
	}
}

local summaryBannerY = {
	MaxStages1 = { SCREEN_CENTER_Y-147 },
	MaxStages2 = {
		SCREEN_CENTER_Y-141,
		SCREEN_CENTER_Y-153
	},
	MaxStages3 = {
		SCREEN_CENTER_Y-135,
		SCREEN_CENTER_Y-147,
		SCREEN_CENTER_Y-159
	},
	MaxStages4 = {
		SCREEN_CENTER_Y-135,
		SCREEN_CENTER_Y-143,
		SCREEN_CENTER_Y-151,
		SCREEN_CENTER_Y-159
	},
	MaxStages5 = {
		SCREEN_CENTER_Y-135,
		SCREEN_CENTER_Y-141,
		SCREEN_CENTER_Y-147,
		SCREEN_CENTER_Y-153,
		SCREEN_CENTER_Y-159
	}
}

function GetSummaryBannerX(num)
	local maxStages = PREFSMAN:GetPreference('SongsPerPlay')

	-- check how many stages were played...
	local playedStages = STATSMAN:GetStagesPlayed()
	if playedStages < maxStages then
		-- long versions and/or marathons were involved.
		if playedStages == 1 then return summaryBannerX.MaxStages1[1]
		elseif playedStages == 2 then return summaryBannerX.MaxStages2[num]
		elseif playedStages == 3 then return summaryBannerX.MaxStages3[num]
		elseif playedStages == 4 then return summaryBannerX.MaxStages4[num]
		end
	else
		-- normal behavior
		if maxStages == 1 then return summaryBannerX.MaxStages1[1]
		elseif maxStages == 2 then return summaryBannerX.MaxStages2[num]
		elseif maxStages == 3 then return summaryBannerX.MaxStages3[num]
		elseif maxStages == 4 then return summaryBannerX.MaxStages4[num]
		elseif maxStages == 5 then return summaryBannerX.MaxStages5[num]
		end
	end
end

function GetSummaryBannerY(num)
	local maxStages = PREFSMAN:GetPreference('SongsPerPlay')

	-- check how many stages were played...
	local playedStages = STATSMAN:GetStagesPlayed()
	if playedStages < maxStages then
		-- long versions and/or marathons were involved.
		if playedStages == 1 then return summaryBannerY.MaxStages1[1]
		elseif playedStages == 2 then return summaryBannerY.MaxStages2[num]
		elseif playedStages == 3 then return summaryBannerY.MaxStages3[num]
		elseif playedStages == 4 then return summaryBannerY.MaxStages4[num]
		end
	else
		-- normal behavior
		if maxStages == 1 then return summaryBannerY.MaxStages1[1]
		elseif maxStages == 2 then return summaryBannerY.MaxStages2[num]
		elseif maxStages == 3 then return summaryBannerY.MaxStages3[num]
		elseif maxStages == 4 then return summaryBannerY.MaxStages4[num]
		elseif maxStages == 5 then return summaryBannerY.MaxStages5[num]
		end
	end
end

-- fuck fuck shit fuck god damnit
-- you fucking suck if you want to ignore the background's real aspect ratio
local you_fucking_suck = false

function Actor:scale_or_crop_background()
	if you_fucking_suck then
		self:cropto(SCREEN_WIDTH, SCREEN_HEIGHT)
	else
		local graphicAspect = self:GetWidth()/self:GetHeight()
		self:zoomto(SCREEN_HEIGHT*graphicAspect,SCREEN_HEIGHT)
	end
end