<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/ItemText.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/ItemText.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	ItemText skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	ItemTextFrame:StripTextures(true)
	ItemTextFrameInset:StripTextures()
	ItemTextScrollFrame:StripTextures()
	ItemTextFrame:CreateBackdrop("Transparent")
	ItemTextFrame.backdrop:SetPoint("TOPLEFT", 0, 0)
	ItemTextFrame.backdrop:SetPoint("BOTTOMRIGHT", 0, 0)
	T.SkinCloseButton(ItemTextFrameCloseButton, ItemTextFrame.backdrop)
	T.SkinNextPrevButton(ItemTextPrevPageButton)
	T.SkinNextPrevButton(ItemTextNextPageButton)
	T.SkinScrollBar(ItemTextScrollFrame.ScrollBar)
	ItemTextPageText:SetTextColor("P", 1, 1, 1)
	ItemTextPageText.SetTextColor = T.dummy
end

tinsert(T.SkinFuncs["QulightUI"], LoadSkin)