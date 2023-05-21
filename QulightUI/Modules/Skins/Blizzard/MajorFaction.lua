<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/MajorFaction.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/MajorFaction.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Major Factions skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = _G.MajorFactionRenownFrame

	T.SkinFrame(frame)
	frame.Background:SetAlpha(0)
end

T.SkinFuncs["Blizzard_MajorFactions"] = LoadSkin