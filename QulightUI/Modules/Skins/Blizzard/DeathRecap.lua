<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/DeathRecap.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/DeathRecap.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	DeathRecap skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	DeathRecapFrame:StripTextures()
	DeathRecapFrame:SetTemplate("Transparent")
	DeathRecapFrame.CloseButton:SkinButton(true)
	T.SkinCloseButton(DeathRecapFrame.CloseXButton)

	for i = 1, NUM_DEATH_RECAP_EVENTS do
		local recap = DeathRecapFrame["Recap"..i].SpellInfo
		recap.IconBorder:Hide()
		recap.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		recap:CreateBackdrop("Default")
		recap.backdrop:SetPoint("TOPLEFT", recap.Icon, "TOPLEFT", -2, 2)
		recap.backdrop:SetPoint("BOTTOMRIGHT", recap.Icon, "BOTTOMRIGHT", 2, -2)
	end
end

T.SkinFuncs["Blizzard_DeathRecap"] = LoadSkin