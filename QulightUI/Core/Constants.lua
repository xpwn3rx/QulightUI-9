﻿local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	QulightUI variables
----------------------------------------------------------------------------------------
T.dummy = function() return end
T.name = UnitName("player")
T.class = select(2, UnitClass("player"))
T.level = UnitLevel("player")
T.client = GetLocale()
T.realm = GetRealmName()
T.color = (CUSTOM_CLASS_COLORS or RAID_CLASS_COLORS)[T.class]
<<<<<<< HEAD:QulightUI/Core/Constants.lua
T.version = GetAddOnMetadata("QulightUI", "Version")
=======
T.version = C_AddOns.GetAddOnMetadata("ShestakUI", "Version")
>>>>>>> d9e25ac60 (Cleanup.):ShestakUI/Core/Constants.lua
T.screenWidth, T.screenHeight = GetPhysicalScreenSize()
T.newPatch = select(4, GetBuildInfo()) >= 100100

-- BETA
GetContainerItemInfo = function(bagIndex, slotIndex)
	local info = C_Container.GetContainerItemInfo(bagIndex, slotIndex)
	if info then
		return info.iconFileID, info.stackCount, info.isLocked, info.quality, info.isReadable, info.hasLoot, info.hyperlink, info.isFiltered, info.hasNoValue, info.itemID, info.isBound
	end
end