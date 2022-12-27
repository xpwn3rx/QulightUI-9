local T, C, L, _ = unpack(select(2, ...))
if C.unitframe.enable ~= true then return end

----------------------------------------------------------------------------------------
--	UnitFrames based on oUF_Caellian(by Caellian)
----------------------------------------------------------------------------------------
local _, ns = ...
local oUF = ns.oUF

-- Party size
local party_width = C.raidframe.dps_party_width
local party_height = C.raidframe.dps_party_height + T.extraHeight
local party_power_height = C.raidframe.dps_party_power_height + C.unitframe.extra_power_height
local partytarget_width = party_height + 3
local partytarget_height = party_height
-- Raid size
local raid_width = C.raidframe.dps_raid_width
local raid_height = C.raidframe.dps_raid_height
local raid_power_height = C.raidframe.dps_raid_power_height
local tank_width = C.raidframe.heal_raid_width
local tank_height = C.raidframe.heal_raid_height

-- Create layout
local function Shared(self, unit)
	local unit = (self:GetParent():GetName():match("oUF_PartyDPS")) and "party"
	or (self:GetParent():GetName():match("oUF_RaidDPS")) and "raid"
	or (self:GetParent():GetName():match("oUF_MainTank")) and "tank" or unit

	local suffix = self:GetAttribute("unitsuffix")

	-- Set our own colors
	self.colors = T.oUF_colors

	-- Register click
	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)

	-- Backdrop for every units
	self:CreateBackdrop("Default")

	-- Health bar
	self.Health = CreateFrame("StatusBar", nil, self)
	self.Health:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0)
	self.Health:SetPoint("TOPRIGHT", self, "TOPRIGHT", 0, 0)
	if (suffix == "pet" or suffix == "target") and unit ~= "tank" then
		self.Health:SetHeight(party_height)
	elseif unit == "tank" then
		self.Health:SetHeight(tank_height - 3)
	elseif unit == "raid" then
		self.Health:SetHeight(raid_height - raid_power_height - (raid_power_height > 0 and 1 or 0))
	elseif unit == "party" then
		self.Health:SetHeight(party_height - party_power_height - (party_power_height > 0 and 1 or 0))
	else
		self.Health:SetHeight(17)
	end
	self.Health:SetStatusBarTexture(C.media.texture)

	self.Health.PostUpdate = function(health, unit)
		if not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit) then
			health:SetValue(0)
		end
	end

	self.Health.colorTapping = false
	self.Health.colorDisconnected = true
	self.Health.colorClassPet = false
	if C.unitframe.own_color == true then
		self.Health.colorReaction = false
		self.Health.colorClass = false
		self.Health:SetStatusBarColor(unpack(C.unitframe.uf_color))
	else
		self.Health.colorReaction = false
		self.Health.colorClass = false
		self.Health:SetStatusBarColor(.09,.09,.09,1)
	end

	-- Health bar background
	self.Health.bg = self.Health:CreateTexture(nil, "BORDER")
	self.Health.bg:SetAllPoints(self.Health)
	self.Health.bg:SetTexture(C.media.texture)
	if C.unitframe.own_color == true then
		self.Health.bg:SetVertexColor(unpack(C.unitframe.uf_color_bg), 0.9)
	else
		self.Health.bg.multiplier = 0.2
	end

	if not (suffix == "pet" or (suffix == "target" and unit ~= "tank")) then
		self.Health.value = T.SetFontString(self.Health, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		if unit == "tank" then
			self.Health.value:SetPoint("CENTER", self.Health, "CENTER", 0, -5)
		else
			self.Health.value:SetPoint("RIGHT", self.Health, "RIGHT", 1, 0)
		end
		self.Health.value:SetTextColor(1, 1, 1)

		if unit == "raid" and C.raidframe.hide_health_value then
			self.Health.value:SetAlpha(0)
		end

		self.Health.PostUpdate = T.PostUpdateRaidHealth

		-- Power bar
		self.Power = CreateFrame("StatusBar", nil, self)
		if unit == "raid" then
			self.Power:SetHeight(raid_power_height)
		elseif unit == "party" then
			self.Power:SetHeight(party_power_height)
		else
			self.Power:SetHeight(2)
		end
		self.Power:SetPoint("TOPLEFT", self.Health, "BOTTOMLEFT", 0, -1)
		self.Power:SetPoint("TOPRIGHT", self.Health, "BOTTOMRIGHT", 0, -1)
		self.Power:SetStatusBarTexture(C.media.texture)

		self.Power.frequentUpdates = true
		self.Power.colorDisconnected = true
		if C.unitframe.own_color == true then
			self.Power.colorClass = true
		else
			self.Power.colorPower = true
		end

		self.Power.PreUpdate = T.PreUpdatePower
		self.Power.PostUpdate = T.PostUpdatePower

		-- Power bar background
		self.Power.bg = self.Power:CreateTexture(nil, "BORDER")
		self.Power.bg:SetAllPoints(self.Power)
		self.Power.bg:SetTexture(C.media.texture)
		self.Power.bg:SetAlpha(1)
		self.Power.bg.multiplier = 0.2

		self.Power.value = T.SetFontString(self.Power, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
		if not (suffix == "pet" or suffix == "target") and unit ~= "tank" then
			self.Power.value:SetPoint("RIGHT", self.Power, "RIGHT", 0, 0)
			self.Power.value:SetJustifyH("RIGHT")
		end
	end

	-- Names
	self.Info = T.SetFontString(self.Health, C.font.unit_frames_font, C.font.unit_frames_font_size, C.font.unit_frames_font_style)
	if (suffix == "pet" or suffix == "target") and unit ~= "tank" then
		self.Info:SetPoint("CENTER", self.Health, "CENTER", 2, 0)
	elseif unit == "tank" then
		self.Info:SetPoint("CENTER", self.Health, "CENTER", 0, 4)
	else
		self.Info:SetPoint("LEFT", self.Health, "LEFT", 3, 0)
		self.Info:SetPoint("RIGHT", self.Health.value, "LEFT", 0, 0)
		self.Info:SetJustifyH("LEFT")
	end
	if suffix == "pet" or (suffix == "target" and unit ~= "tank") then
		self:Tag(self.Info, "[GetNameColor][NameArena]")
	else
		if unit == "party" and C.raidframe.icons_role ~= true then
			self:Tag(self.Info, "[LFD] [GetNameColor][NameShort]")
		else
			self:Tag(self.Info, "[GetNameColor][NameShort]")
		end
	end

	-- LFD role icons
	if C.raidframe.icons_role == true and not (suffix == "pet" or suffix == "target") then
		self.GroupRoleIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.GroupRoleIndicator:SetSize(12, 12)
		self.GroupRoleIndicator:SetPoint("TOPRIGHT", self.Health, 2, 5)
	end

	-- Leader/Assistant icons
	if C.raidframe.icons_leader == true and not (suffix == "target") then
		-- Leader icon
		self.LeaderIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.LeaderIndicator:SetSize(12, 12)
		self.LeaderIndicator:SetPoint("TOPLEFT", self.Health, -3, 8)

		-- Assistant icon
		self.AssistantIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.AssistantIndicator:SetSize(12, 12)
		self.AssistantIndicator:SetPoint("TOPLEFT", self.Health, -3, 8)
	end

	-- Aggro border
	if C.raidframe.aggro_border == true then
		self.ThreatIndicator = CreateFrame("Frame", nil, self)
		self.ThreatIndicator.PostUpdate = T.UpdateThreat
	end

	-- Raid marks
	if C.raidframe.icons_raid_mark == true then
		self.RaidTargetIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.RaidTargetIndicator:SetSize(12, 12)
		self.RaidTargetIndicator:SetPoint("CENTER", self.Health, "TOP")
	end

	-- Ready check icons
	if C.raidframe.icons_ready_check == true and not (suffix == "target") then
		self.ReadyCheckIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.ReadyCheckIndicator:SetSize(12, 12)
		self.ReadyCheckIndicator:SetPoint("BOTTOMRIGHT", self.Health, 2, -1)
	end

	-- Phase icons
	if C.raidframe.icons_phase == true and not (suffix == "target") then
		self.PhaseIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.PhaseIndicator:SetSize(18, 18)
		self.PhaseIndicator:SetPoint("BOTTOMLEFT", self.Health, -5, -10)
	end

	-- Summon icons
	if C.raidframe.icons_sumon == true and not (suffix == "target") then
		self.SummonIndicator = self.Health:CreateTexture(nil, "OVERLAY")
		self.SummonIndicator:SetSize(24, 24)
		self.SummonIndicator:SetPoint("BOTTOMRIGHT", self.Health, 6, -5)
	end

	if unit == "party" and (not (suffix == "target")) and (not (suffix == "pet")) then
		self.Debuffs = CreateFrame("Frame", self:GetName().."Debuffs", self)
		self.Debuffs:SetPoint("TOPLEFT", self, "BOTTOMLEFT", -2, -5)
		self.Debuffs:SetHeight(18)
		self.Debuffs:SetWidth(144)
		self.Debuffs.size = T.Scale(18)
		self.Debuffs.spacing = T.Scale(3)
		self.Debuffs.initialAnchor = "LEFT"
		self.Debuffs.num = 7
		self.Debuffs["growth-y"] = "DOWN"
		self.Debuffs["growth-x"] = "RIGHT"
		self.Debuffs.PostCreateButton = T.PostCreateIcon
		self.Debuffs.PostUpdateButton = T.PostUpdateIcon
	end

	-- Debuff highlight
	self.DebuffHighlight = self.Health:CreateTexture(nil, "OVERLAY")
	self.DebuffHighlight:SetAllPoints(self.Health)
	self.DebuffHighlight:SetTexture(C.media.highlight)
	self.DebuffHighlight:SetVertexColor(0, 0, 0, 0)
	self.DebuffHighlight:SetBlendMode("ADD")
	self.DebuffHighlightAlpha = 1
	self.DebuffHighlightFilter = true

	-- Incoming heals and heal/damage absorbs
	if C.raidframe.plugins_healcomm == true then
		T.CreateHealthPrediction(self)
	end

	-- Range alpha
	if C.raidframe.show_range == true and (not (suffix == "target")) then
		self.Range = {insideAlpha = 1, outsideAlpha = C.raidframe.range_alpha}
	end

	-- Smooth bars
	if C.unitframe.plugins_smooth_bar == true then
		self.Health.Smooth = true
		if not (suffix == "pet" or suffix == "target") then
			self.Power.Smooth = true
		end
	end

	if T.PostCreateDPSRaidFrames then
		T.PostCreateDPSRaidFrames(self, unit)
	end

	return self
end

----------------------------------------------------------------------------------------
--	Default position of QulightUI unitframes
----------------------------------------------------------------------------------------
oUF:Factory(function(self)
	if C.raidframe.layout ~= "DPS" and C.raidframe.layout ~= "AUTO" then return end

	oUF:RegisterStyle("QulightDPS", Shared)
	oUF:SetActiveStyle("QulightDPS")
	if C.raidframe.show_party == true then
		-- Party
		local party = self:SpawnHeader("oUF_PartyDPS", nil, "custom [@raid6,exists] hide;show",
			"oUF-initialConfigFunction", [[
				local header = self:GetParent()
				self:SetWidth(header:GetAttribute("initial-width"))
				self:SetHeight(header:GetAttribute("initial-height"))
			]],
			"initial-width", T.Scale(party_width),
			"initial-height", T.Scale(party_height),
			"showSolo", C.raidframe.solo_mode,
			"showPlayer", C.raidframe.player_in_party,
			"groupBy", C.raidframe.by_role and "ASSIGNEDROLE",
			"groupingOrder", C.raidframe.by_role and "TANK,HEALER,DAMAGER,NONE",
			"sortMethod", C.raidframe.by_role and "NAME",
			"showParty", true,
			"showRaid", true,
			"yOffset", T.Scale(28),
			"point", "BOTTOM"
		)
		_G["PartyDPSAnchor"]:SetSize(T.Scale(party_width), T.Scale(party_height) * 5 + T.Scale(28) * 4)
		party:SetPoint("BOTTOMLEFT", _G["PartyDPSAnchor"])

		-- Party targets
		if C.raidframe.show_target then
			local partytarget = self:SpawnHeader("oUF_PartyTargetDPS", nil, "custom [@raid6,exists] hide;show",
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
					self:SetAttribute("unitsuffix", "target")
				]],
				"initial-width", T.Scale(partytarget_width),
				"initial-height", T.Scale(partytarget_height),
				"showSolo", C.raidframe.solo_mode,
				"showPlayer", C.raidframe.player_in_party,
				"groupBy", C.raidframe.by_role and "ASSIGNEDROLE",
				"groupingOrder", C.raidframe.by_role and "TANK,HEALER,DAMAGER,NONE",
				"sortMethod", C.raidframe.by_role and "NAME",
				"showParty", true,
				"showRaid", true,
				"yOffset", T.Scale(28),
				"point", "BOTTOM"
			)
			_G["PartyTargetDPSAnchor"]:SetSize(T.Scale(partytarget_width), T.Scale(partytarget_height) * 5 + T.Scale(28) * 4)
			partytarget:SetPoint("BOTTOMLEFT", _G["PartyTargetDPSAnchor"])
		end

		-- Party pets
		if C.raidframe.show_pet then
			local partypet = self:SpawnHeader("oUF_PartyPetDPS", nil, "custom [@raid6,exists] hide;show",
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
					self:SetAttribute("useOwnerUnit", "true")
					self:SetAttribute("unitsuffix", "pet")
				]],
				"initial-width", T.Scale(partytarget_width),
				"initial-height", T.Scale(partytarget_height),
				"showSolo", C.raidframe.solo_mode,
				"showPlayer", C.raidframe.player_in_party,
				"groupBy", C.raidframe.by_role and "ASSIGNEDROLE",
				"groupingOrder", C.raidframe.by_role and "TANK,HEALER,DAMAGER,NONE",
				"sortMethod", C.raidframe.by_role and "NAME",
				"showParty", true,
				"showRaid", true,
				"yOffset", T.Scale(28),
				"point", "BOTTOM"
			)
			_G["PartyPetDPSAnchor"]:SetSize(T.Scale(partytarget_width), T.Scale(partytarget_height) * 5 + T.Scale(28) * 4)
			partypet:SetPoint("BOTTOMLEFT", _G["PartyPetDPSAnchor"])
		end
	end

	if C.raidframe.show_raid == true then
		-- Raid
		local raid = {}
		for i = 1, C.raidframe.raid_groups do
			local raidgroup = self:SpawnHeader("oUF_RaidDPS"..i, nil, "custom [@raid6,exists] show;hide",
				"oUF-initialConfigFunction", [[
					local header = self:GetParent()
					self:SetWidth(header:GetAttribute("initial-width"))
					self:SetHeight(header:GetAttribute("initial-height"))
				]],
				"initial-width", T.Scale(raid_width),
				"initial-height", T.Scale(raid_height),
				"showRaid", true,
				"yOffset", T.Scale(-7),
				"point", "TOPLEFT",
				"groupFilter", tostring(i),
				"groupBy", C.raidframe.by_role and "ASSIGNEDROLE",
				"groupingOrder", C.raidframe.by_role and "TANK,HEALER,DAMAGER,NONE",
				"sortMethod", C.raidframe.by_role and "NAME",
				"maxColumns", 5,
				"unitsPerColumn", 1,
				"columnSpacing", T.Scale(7),
				"columnAnchorPoint", "TOP"
			)
			if i == 1 then
				_G["RaidDPSAnchor"..i]:SetPoint(unpack(C.position.unitframes.raid_dps))
				raidgroup:SetPoint("TOPLEFT", _G["RaidDPSAnchor"..i])
			elseif i == 5 then
				_G["RaidDPSAnchor"..i]:SetPoint("TOPLEFT", _G["RaidDPSAnchor1"], "TOPRIGHT", 7, 0)
				raidgroup:SetPoint("TOPLEFT", _G["RaidDPSAnchor"..i])
			else
				_G["RaidDPSAnchor"..i]:SetPoint("TOPLEFT", _G["RaidDPSAnchor"..i-1], "BOTTOMLEFT", 0, -7)
				raidgroup:SetPoint("TOPLEFT", _G["RaidDPSAnchor"..i])
			end
			raid[i] = raidgroup
		end
	end

	if C.raidframe.raid_tanks == true then
		-- Tanks
		local raidtank = self:SpawnHeader("oUF_MainTankDPS", nil, "raid",
			"oUF-initialConfigFunction", ([[
				self:SetWidth(%d)
				self:SetHeight(%d)
			]]):format(tank_width, tank_height),
			"showRaid", true,
			"yOffset", T.Scale(-7),
			"groupFilter", "MAINTANK",
			"template", C.raidframe.raid_tanks_tt and "oUF_MainTankTT" or "oUF_MainTank"
		)
		_G["RaidTankDPSAnchor"]:SetSize(tank_width, tank_height)
		raidtank:SetPoint("BOTTOMLEFT", _G["RaidTankDPSAnchor"])
	end
end)

-- Create anchors
for i = 1, C.raidframe.raid_groups do
	local raid = CreateFrame("Frame", "RaidDPSAnchor"..i, UIParent)
	raid:SetSize(raid_width, T.Scale(raid_height) * 5 + T.Scale(7) * 4)
end

local party = CreateFrame("Frame", "PartyDPSAnchor", UIParent)
party:SetPoint(unpack(C.position.unitframes.party_dps))

local party_target = CreateFrame("Frame", "PartyTargetDPSAnchor", UIParent)
party_target:SetPoint("TOPLEFT", party, "TOPRIGHT", 7, 0)

local party_pet = CreateFrame("Frame", "PartyPetDPSAnchor", UIParent)
party_pet:SetPoint("BOTTOMLEFT", party, "BOTTOMRIGHT", partytarget_width + 14, 0)

local raidtank = CreateFrame("Frame", "RaidTankDPSAnchor", UIParent)
if C.threat.enable then
	raidtank:SetPoint(C.position.unitframes.tank[1], C.position.unitframes.tank[2], C.position.unitframes.tank[3], C.position.unitframes.tank[4] + C.threat.width + 6, C.position.unitframes.tank[5])
else
	if C.actionbar.split_bars then
		raidtank:SetPoint(C.position.unitframes.tank[1], SplitBarRight, C.position.unitframes.tank[3], C.position.unitframes.tank[4], C.position.unitframes.tank[5])
	else
		raidtank:SetPoint(unpack(C.position.unitframes.tank))
	end
end

----------------------------------------------------------------------------------------
--	Auto change raid frame layout
----------------------------------------------------------------------------------------
if C.raidframe.layout == "AUTO" then
	local function CheckSpec(self, event, unit)
		if T.IsHealerSpec() then
			-- Disable DPS
			for _, party in pairs({oUF_PartyDPS, oUF_PartyTargetDPS, oUF_PartyPetDPS}) do
				party:SetAttribute("showSolo", false)
				party:SetAttribute("showParty", false)
				party:SetAttribute("showRaid", false)
			end

			for i = 1, C.raidframe.raid_groups do
				if _G["oUF_RaidDPS"..i] then
					_G["oUF_RaidDPS"..i]:SetAttribute("showRaid", false)
				end
			end

			if oUF_MainTankDPS then
				oUF_MainTankDPS:SetAttribute("showRaid", false)
			end

			-- Enable Heal
			for _, party in pairs({oUF_Party, oUF_PartyTarget, oUF_PartyPet}) do
				party:SetAttribute("showSolo", C.raidframe.solo_mode)
				party:SetAttribute("showParty", true)
				party:SetAttribute("showRaid", true)
			end

			for i = 1, C.raidframe.raid_groups do
				if _G["oUF_RaidHeal"..i] then
					_G["oUF_RaidHeal"..i]:SetAttribute("showRaid", true)
				end
			end

			if oUF_MainTank then
				oUF_MainTank:SetAttribute("showRaid", true)
			end
		else
			-- Enable DPS
			for _, party in pairs({oUF_PartyDPS, oUF_PartyTargetDPS, oUF_PartyPetDPS}) do
				party:SetAttribute("showSolo", C.raidframe.solo_mode)
				party:SetAttribute("showParty", true)
				party:SetAttribute("showRaid", true)
			end

			for i = 1, C.raidframe.raid_groups do
				if _G["oUF_RaidDPS"..i] then
					_G["oUF_RaidDPS"..i]:SetAttribute("showRaid", true)
				end
			end

			if oUF_MainTankDPS then
				oUF_MainTankDPS:SetAttribute("showRaid", true)
			end

			-- Disable Heal
			for _, party in pairs({oUF_Party, oUF_PartyTarget, oUF_PartyPet}) do
				party:SetAttribute("showSolo", false)
				party:SetAttribute("showParty", false)
				party:SetAttribute("showRaid", false)
			end

			for i = 1, C.raidframe.raid_groups do
				if _G["oUF_RaidHeal"..i] then
					_G["oUF_RaidHeal"..i]:SetAttribute("showRaid", false)
				end
			end

			if oUF_MainTank then
				oUF_MainTank:SetAttribute("showRaid", false)
			end
	end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

local frame = CreateFrame("Frame")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:RegisterUnitEvent("PLAYER_SPECIALIZATION_CHANGED", "player")
	frame:SetScript("OnEvent", CheckSpec)
end

----------------------------------------------------------------------------------------
--	Test RaidFrames
----------------------------------------------------------------------------------------
do
	local frames = {}
	local moving = false
	SlashCmdList.TEST_RAID_DPS = function()
		if InCombatLockdown() then print("|cffffff00"..ERR_NOT_IN_COMBAT.."|r") return end
		if not moving then
			oUF_RaidDPS1:Show()
			local raid = {}
			local raid_j = {}
			if #frames == 0 then
				for j = 1, C.raidframe.raid_groups do
					for i = 1, 5 do
						local frame = CreateFrame("Frame", nil, UIParent)
						frame:SetSize(raid_width, raid_height)
						if j == 1 then
							if i == 1 then
								frame:SetPoint("TOPLEFT", oUF_RaidDPS1, "TOPLEFT", 0, 0)
							else
								frame:SetPoint("TOP", raid[i-1], "BOTTOM", 0, -7)
							end
						elseif j == 5 then
							if i == 1 then
								frame:SetPoint("TOPLEFT", oUF_RaidDPS1, "TOPRIGHT", 7, 0)
							else
								frame:SetPoint("TOP", raid[i-1], "BOTTOM", 0, -7)
							end
						else
							if i == 1 then
								frame:SetPoint("TOPLEFT", raid_j[j-1], "BOTTOMLEFT", 0, -7)
							else
								frame:SetPoint("TOP", raid[i-1], "BOTTOM", 0, -7)
							end
						end
						if i == 5 then
							raid_j[j] = frame
						end
						frame:CreateBackdrop("Overlay")
						frame.backdrop.overlay:SetVertexColor(0.1, 0.9 - (j * 0.08) , 0.1)
						raid[i] = frame
						table.insert(frames, frame)
					end
				end
			else
				for _, frame in pairs(frames) do
					frame:Show()
				end
			end
			moving = true
		else
			for _, frame in pairs(frames) do
				frame:Hide()
			end
			moving = false
		end
	end
	SLASH_TEST_RAID_DPS1 = "/testraiddps"
	SLASH_TEST_RAID_DPS2 = "/еуыекфшввзы"
	SLASH_TEST_RAID_DPS3 = "/raiddpstest"
	SLASH_TEST_RAID_DPS4 = "/кфшввзыеуые"
end