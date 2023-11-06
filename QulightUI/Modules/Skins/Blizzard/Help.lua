local T, C, L = unpack(QulightUI)
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Help skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = _G.HelpFrame
	frame:StripTextures()
	frame:CreateBackdrop('Transparent')
	T.SkinCloseButton(HelpFrame.CloseButton, frame.backdrop)

	local browser = _G.HelpBrowser
	browser.BrowserInset:StripTextures()
end

tinsert(T.SkinFuncs["QulightUI"], LoadSkin)