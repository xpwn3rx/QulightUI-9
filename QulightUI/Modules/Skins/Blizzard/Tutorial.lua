<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/Tutorial.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/Tutorial.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Tutorial skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	TutorialFrame:StripTextures()
	TutorialFrame:CreateBackdrop("Transparent")
	TutorialFrame.backdrop:SetPoint("TOPLEFT", 6, 0)
	TutorialFrame.backdrop:SetPoint("BOTTOMRIGHT", 0, -6)
	T.SkinNextPrevButton(TutorialFrameNextButton)
	T.SkinNextPrevButton(TutorialFramePrevButton)
	TutorialFrameOkayButton:SkinButton()
	TutorialFrameOkayButton:ClearAllPoints()
	TutorialFrameOkayButton:SetPoint("LEFT", TutorialFrameNextButton, "RIGHT", 10, 0)
	T.SkinCloseButton(TutorialFrameCloseButton, TutorialFrame.backdrop)
end

tinsert(T.SkinFuncs["QulightUI"], LoadSkin)