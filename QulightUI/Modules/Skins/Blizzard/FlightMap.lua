<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/FlightMap.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/FlightMap.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Flight Map skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	FlightMapFrame:CreateBackdrop("Transparent")
	FlightMapFrame.BorderFrame:StripTextures()
	FlightMapFramePortrait:Kill()

	FlightMapFrame.ScrollContainer:ClearAllPoints()
	FlightMapFrame.ScrollContainer:SetPoint("TOPLEFT")
	FlightMapFrame.ScrollContainer:SetPoint("BOTTOMRIGHT")

	T.SkinCloseButton(FlightMapFrameCloseButton)
end

T.SkinFuncs["Blizzard_FlightMap"] = LoadSkin