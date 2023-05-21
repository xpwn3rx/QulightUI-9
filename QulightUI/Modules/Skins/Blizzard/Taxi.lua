<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/Taxi.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/Taxi.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Taxi skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	TaxiFrame:StripTextures()
	TaxiFrame.TitleText:SetPoint("TOP", TaxiFrame, "TOP", -4, -25)
	TaxiRouteMap:CreateBackdrop("Default")
	T.SkinCloseButton(TaxiFrame.CloseButton)
	TaxiFrame.CloseButton:SetPoint("TOPRIGHT", -9, -26)
end

tinsert(T.SkinFuncs["QulightUI"], LoadSkin)