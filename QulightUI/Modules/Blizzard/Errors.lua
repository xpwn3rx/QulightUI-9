local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	Clear UIErrorsFrame(module from Kousei by Haste)
----------------------------------------------------------------------------------------
if C.general.error_filter == "WHITELIST" or C.general.error_filter == "BLACKLIST" then
	local frame = CreateFrame("Frame")
	frame:RegisterEvent("UI_ERROR_MESSAGE")
	frame:SetScript("OnEvent", function(_, _, messageType, text)
		if C.general.error_filter == "WHITELIST" then
			if T.white_list[text] then
				UIErrorsFrame:TryDisplayMessage(messageType, text, RED_FONT_COLOR:GetRGB())
			else
				L_INFO_ERRORS = text
			end
		elseif C.general.error_filter == "BLACKLIST" then
			if T.black_list[text] then
				L_INFO_ERRORS = text
			else
				UIErrorsFrame:TryDisplayMessage(messageType, text, RED_FONT_COLOR:GetRGB())
			end
		end
	end)

	UIErrorsFrame:UnregisterEvent("UI_ERROR_MESSAGE")
end

SlashCmdList.ERROR = function()
	UIErrorsFrame:AddMessage(L_INFO_ERRORS, 1, 0, 0)
end
SLASH_ERROR1 = "/error"

----------------------------------------------------------------------------------------
--	Clear all UIErrors frame in combat
----------------------------------------------------------------------------------------
if C.general.error_filter == "COMBAT" then
	local frame = CreateFrame("Frame")
	local OnEvent = function(self, event, ...) self[event](self, event, ...) end
	frame:SetScript("OnEvent", OnEvent)
	local function PLAYER_REGEN_DISABLED()
		UIErrorsFrame:Hide()
	end
	local function PLAYER_REGEN_ENABLED()
		UIErrorsFrame:Show()
	end
	frame:RegisterEvent("PLAYER_REGEN_DISABLED")
	frame["PLAYER_REGEN_DISABLED"] = PLAYER_REGEN_DISABLED
	frame:RegisterEvent("PLAYER_REGEN_ENABLED")
	frame["PLAYER_REGEN_ENABLED"] = PLAYER_REGEN_ENABLED
end