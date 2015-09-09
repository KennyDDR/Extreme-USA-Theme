Branch.GetInitialScreen = function()
	-- perform any housekeeping (e.g. gallery, information modes) here

	local coinMode = GAMESTATE:GetCoinMode()
	if coinMode == 'CoinMode_Home' then
		return "ScreenCautionHome"
	end

	return "ScreenInit"
end

Branch.AfterInit = function()
	local coinMode = GAMESTATE:GetCoinMode()
	if coinMode == 'CoinMode_Home' then
		return "ScreenTitleMenu"
	else
		return "ScreenLogo"
	end
end

Branch.StartGame = function()
	return PREFSMAN:GetPreference("ShowCaution") and "ScreenCaution" or "ScreenSelectStyle"
end

Branch.StartDiet = function()
	return PREFSMAN:GetPreference("ShowCaution") and "ScreenCautionDiet" or "ScreenDietMenu"
end

hasChars = function()
	return CHARMAN:GetAllCharacters() ~= nil
end;

function ScreenNetSelectPlayMode()
	if IsNetSMOnline() then return SMOnlineScreen() end
	if IsNetConnected() then return "ScreenNetSelectMusic" end
	return "ScreenSelectMusic"
end;

Branch.AfterProfileLoad = function()
	-- if online, ignore character check and move straight to online
	if IsNetConnected() then ReportStyle() end;
	if IsNetSMOnline() or IsNetConnected() then
		GAMESTATE:ApplyGameCommand("playmode,regular");
		return ScreenNetSelectPlayMode()
	end

	return hasChars and "ScreenSelectCharacter" or "ScreenSelectMusic"
end

-- xxx: work on this
Branch.AfterSummary = function()
	return "ScreenProfileSaveSummary"
end

Branch.AfterSaveSummary = function()
	return GAMESTATE:AnyPlayerHasRankingFeats() and "ScreenNameEntry" or "ScreenGameOver"
end

Branch.InformationPage = function()
	local nextScreen = getenv("NextInfoScreen");
	return nextScreen or "ScreenInformation"
end

Branch.AfterSMOLogin = SMOnlineScreen()