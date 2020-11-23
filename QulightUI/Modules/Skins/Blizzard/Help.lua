local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Help skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	if T.beta == 90002 then
		local frame = _G.HelpFrame
		frame:StripTextures()
		frame:CreateBackdrop('Transparent')
		T.SkinCloseButton(_G.HelpFrameCloseButton, frame.backdrop)
	
		local browser = _G.HelpBrowser
		browser.BrowserInset:StripTextures()
	else
	local frames = {
		"HelpFrameLeftInset",
		"HelpFrameMainInset",
		"HelpFrameKnowledgebase",
		"HelpFrameKnowledgebaseErrorFrame",
		"HelpFrame"
	}

	local buttons = {
		"HelpFrameAccountSecurityOpenTicket",
		"HelpFrameOpenTicketHelpOpenTicket",
		"HelpFrameKnowledgebaseSearchButton",
		"HelpFrameKnowledgebaseNavBarHomeButton",
		"HelpFrameCharacterStuckStuck",
		"HelpFrameGM_ResponseNeedMoreHelp",
		"HelpFrameGM_ResponseCancel",
		"HelpFrameSubmitSuggestionSubmit",
		"HelpFrameReportBugSubmit",
		"HelpFrameButton16",
		"GMChatOpenLog"
	}

	-- Main frames
	for i = 1, #frames do
		if _G[frames[i]] then
			_G[frames[i]]:StripTextures(true)
			_G[frames[i]]:CreateBackdrop("Overlay")
		end
	end

	--local frame = _G.HelpFrame
	--frame:StripTextures()
	--frame:CreateBackdrop("Overlay")
end
end

tinsert(T.SkinFuncs["QulightUI"], LoadSkin)