local T, C, L = unpack(QulightUI)

----------------------------------------------------------------------------------------
--	QulightUI fonts configuration file
--	BACKUP THIS FILE BEFORE UPDATING!
----------------------------------------------------------------------------------------
--	Configuration example:
----------------------------------------------------------------------------------------
-- C["font"] = {
--		-- Stats font
--		["stats_font"] = "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf",
--		["stats_font_size"] = 11,
--		["stats_font_style"] = "",
--		["stats_font_shadow"] = true,
-- }
----------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------
--	Fonts options
----------------------------------------------------------------------------------------
C["font"] = {
	-- Stats font
	["stats_font"] = C.media.normal_font,
	["stats_font_size"] = 12,
	["stats_font_style"] = "OUTLINE",
	["stats_font_shadow"] = false,

	-- Combat text font
	["combat_text_font"] = C.media.normal_font,
	["combat_text_font_size"] = 16,
	["combat_text_font_style"] = "OUTLINE",
	["combat_text_font_shadow"] = false,

	-- Chat font
	["chat_font"] = C.media.normal_font,
	["chat_font_style"] = "",
	["chat_font_shadow"] = true,

	-- Chat tabs font
	["chat_tabs_font"] = C.media.normal_font,
	["chat_tabs_font_size"] = 12,
	["chat_tabs_font_style"] = "OUTLINE",
	["chat_tabs_font_shadow"] = false,

	-- Action bars font
	["action_bars_font"] = C.media.normal_font,
	["action_bars_font_size"] = 12,
	["action_bars_font_style"] = "OUTLINE",
	["action_bars_font_shadow"] = false,

	-- Threat meter font
	["threat_meter_font"] = C.media.normal_font,
	["threat_meter_font_size"] = 12,
	["threat_meter_font_style"] = "OUTLINE",
	["threat_meter_font_shadow"] = false,

	-- Raid cooldowns font
	["raid_cooldowns_font"] = C.media.normal_font,
	["raid_cooldowns_font_size"] = 12,
	["raid_cooldowns_font_style"] = "OUTLINE",
	["raid_cooldowns_font_shadow"] = false,

	-- Cooldowns timer font
	["cooldown_timers_font"] = C.media.normal_font,
	["cooldown_timers_font_size"] = 13,
	["cooldown_timers_font_style"] = "OUTLINE",
	["cooldown_timers_font_shadow"] = false,

	-- Loot font
	["loot_font"] = C.media.normal_font,
	["loot_font_size"] = 12,
	["loot_font_style"] = "OUTLINE",
	["loot_font_shadow"] = false,

	-- Nameplates font
	["nameplates_font"] = C.media.normal_font,
	["nameplates_font_size"] = 11,
	["nameplates_font_style"] = "OUTLINE",
	["nameplates_font_shadow"] = false,

	-- Unit frames font
	["unit_frames_font"] = C.media.normal_font,
	["unit_frames_font_size"] = 11,
	["unit_frames_font_style"] = "OUTLINE",
	["unit_frames_font_shadow"] = false,

	-- Auras font
	["auras_font"] = C.media.normal_font,
	["auras_font_size"] = 12,
	["auras_font_style"] = "OUTLINE",
	["auras_font_shadow"] = false,

	-- Filger bar font
	["filger_font"] = C.media.normal_font,
	["filger_font_size"] = 12,
	["filger_font_style"] = "OUTLINE",
	["filger_font_shadow"] = false,

	-- Stylization font
	["stylization_font"] = C.media.normal_font,
	["stylization_font_size"] = 12,
	["stylization_font_style"] = "OUTLINE",
	["stylization_font_shadow"] = false,

	-- Bags font
	["bags_font"] = C.media.normal_font,
	["bags_font_size"] = 12,
	["bags_font_style"] = "OUTLINE",
	["bags_font_shadow"] = false,

	-- Blizzard fonts
	["tooltip_header_font_size"] = 13,
	["tooltip_font_size"] = 11,
	["bubble_font_size"] = 14,
}

----------------------------------------------------------------------------------------
--	Pixel font replacement
----------------------------------------------------------------------------------------
local disablePixel
if QulightUIOptionsGlobal then
	if QulightUIOptionsGlobal[T.realm] and QulightUIOptionsGlobal[T.realm][T.name] and QulightUIOptionsGlobal[T.realm]["Current_Profile"] then
		local i = tostring(QulightUIOptionsGlobal[T.realm]["Current_Profile"][T.name])
		if QulightUIOptionsPerChar and QulightUIOptionsPerChar[i] and QulightUIOptionsPerChar[i]["font"] and QulightUIOptionsPerChar[i]["font"]["global_font"] then
			disablePixel = true
		end
	else
		local i = tostring(QulightUIOptionsGlobal["Current_Profile"])
		if QulightUIOptions and QulightUIOptions[i] and QulightUIOptions[i]["font"] and QulightUIOptions[i]["font"]["global_font"] then
			disablePixel = true
		end
	end
end

if disablePixel then
	C["media"].pixel_font = C.media.normal_font
	C["media"].pixel_font_size = 11
	C["media"].pixel_font_style = "OUTLINE"

	C["font"].stats_font = C.media.normal_font
	C["font"].stats_font_size = 12
	C["font"].stats_font_style = "OUTLINE"
	C["font"].stats_font_shadow = false

	C["font"].combat_text_font = C.media.normal_font
	C["font"].combat_text_font_size = 20
	C["font"].combat_text_font_style = "OUTLINE"
	C["font"].combat_text_font_shadow = false

	C["font"].chat_tabs_font = C.media.normal_font
	C["font"].chat_tabs_font_size = 12
	C["font"].chat_tabs_font_style = "OUTLINE"
	C["font"].chat_tabs_font_shadow = false

	C["font"].action_bars_font = C.media.normal_font
	C["font"].action_bars_font_size = 12
	C["font"].action_bars_font_style = "OUTLINE"
	C["font"].action_bars_font_shadow = false

	C["font"].threat_meter_font = C.media.normal_font
	C["font"].threat_meter_font_size = 12
	C["font"].threat_meter_font_style = "OUTLINE"
	C["font"].threat_meter_font_shadow = false

	C["font"].raid_cooldowns_font = C.media.normal_font
	C["font"].raid_cooldowns_font_size = 12
	C["font"].raid_cooldowns_font_style = "OUTLINE"
	C["font"].raid_cooldowns_font_shadow = false

	C["font"].cooldown_timers_font = C.media.normal_font
	C["font"].cooldown_timers_font_size = 16
	C["font"].cooldown_timers_font_style = "OUTLINE"
	C["font"].cooldown_timers_font_shadow = false

	C["font"].loot_font = C.media.normal_font
	C["font"].loot_font_size = 12
	C["font"].loot_font_style = "OUTLINE"
	C["font"].loot_font_shadow = false

	C["font"].nameplates_font = C.media.normal_font
	C["font"].nameplates_font_size = 13
	C["font"].nameplates_font_style = "OUTLINE"
	C["font"].nameplates_font_shadow = false

	C["font"].unit_frames_font = C.media.normal_font
	C["font"].unit_frames_font_size = 13
	C["font"].unit_frames_font_style = "OUTLINE"
	C["font"].unit_frames_font_shadow = false

	C["font"].auras_font = C.media.normal_font
	C["font"].auras_font_size = 12
	C["font"].auras_font_style = "OUTLINE"
	C["font"].auras_font_shadow = false

	C["font"].filger_font = C.media.normal_font
	C["font"].filger_font_size = 12
	C["font"].filger_font_style = "OUTLINE"
	C["font"].filger_font_shadow = false

	C["font"].stylization_font = C.media.normal_font
	C["font"].stylization_font_size = 12
	C["font"].stylization_font_style = ""
	C["font"].stylization_font_shadow = false

	C["font"].bags_font = C.media.normal_font
	C["font"].bags_font_size = 12
	C["font"].bags_font_style = "OUTLINE"
	C["font"].bags_font_shadow = false
end

----------------------------------------------------------------------------------------
--	Font replacement for zhTW, zhCN, and koKR clients
----------------------------------------------------------------------------------------
local locale_font
if T.client == "zhTW" then
	locale_font = "Fonts\\bLEI00D.ttf"
elseif T.client == "zhCN" then
	locale_font = "Fonts\\ARKai_T.ttf"
elseif T.client == "koKR" then
	locale_font = "Fonts\\2002.ttf"
end

if locale_font then
	C["media"].normal_font = locale_font
	C["media"].normal_font = locale_font
	C["media"].normal_font_style = "OUTLINE"
	C["media"].normal_font_size = 11

	C["font"].stats_font = locale_font
	C["font"].stats_font_size = 12
	C["font"].stats_font_style = "OUTLINE"
	C["font"].stats_font_shadow = true

	C["font"].combat_text_font = locale_font
	C["font"].combat_text_font_size = 16
	C["font"].combat_text_font_style = "OUTLINE"
	C["font"].combat_text_font_shadow = true

	C["font"].chat_font = locale_font
	C["font"].chat_font_style = "OUTLINE"
	C["font"].chat_font_shadow = true

	C["font"].chat_tabs_font = locale_font
	C["font"].chat_tabs_font_size = 12
	C["font"].chat_tabs_font_style = "OUTLINE"
	C["font"].chat_tabs_font_shadow = true

	C["font"].action_bars_font = locale_font
	C["font"].action_bars_font_size = 12
	C["font"].action_bars_font_style = "OUTLINE"
	C["font"].action_bars_font_shadow = true

	C["font"].threat_meter_font = locale_font
	C["font"].threat_meter_font_size = 12
	C["font"].threat_meter_font_style = "OUTLINE"
	C["font"].threat_meter_font_shadow = true

	C["font"].raid_cooldowns_font = locale_font
	C["font"].raid_cooldowns_font_size = 12
	C["font"].raid_cooldowns_font_style = "OUTLINE"
	C["font"].raid_cooldowns_font_shadow = true

	C["font"].cooldown_timers_font = locale_font
	C["font"].cooldown_timers_font_size = 13
	C["font"].cooldown_timers_font_style = "OUTLINE"
	C["font"].cooldown_timers_font_shadow = true

	C["font"].loot_font = locale_font
	C["font"].loot_font_size = 13
	C["font"].loot_font_style = "OUTLINE"
	C["font"].loot_font_shadow = true

	C["font"].nameplates_font = locale_font
	C["font"].nameplates_font_size = 13
	C["font"].nameplates_font_style = "OUTLINE"
	C["font"].nameplates_font_shadow = true

	C["font"].unit_frames_font = locale_font
	C["font"].unit_frames_font_size = 12
	C["font"].unit_frames_font_style = "OUTLINE"
	C["font"].unit_frames_font_shadow = true

	C["font"].auras_font = locale_font
	C["font"].auras_font_size = 11
	C["font"].auras_font_style = "OUTLINE"
	C["font"].auras_font_shadow = true

	C["font"].filger_font = locale_font
	C["font"].filger_font_size = 14
	C["font"].filger_font_style = "OUTLINE"
	C["font"].filger_font_shadow = true

	C["font"].stylization_font = locale_font
	C["font"].stylization_font_size = 12
	C["font"].stylization_font_style = ""
	C["font"].stylization_font_shadow = true

	C["font"].bags_font = locale_font
	C["font"].bags_font_size = 11
	C["font"].bags_font_style = "OUTLINE"
	
	C["font"].tooltip_header_font_size = 14
	C["font"].tooltip_font_size = 12
	C["font"].bubble_font_size = 14
end