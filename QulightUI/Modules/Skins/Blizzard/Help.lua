<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/Help.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/Help.lua
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