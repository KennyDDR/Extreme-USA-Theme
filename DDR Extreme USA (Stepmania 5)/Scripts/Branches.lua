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

