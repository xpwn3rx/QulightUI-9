local T, C, L = unpack(QulightUI)

-- Spells lists initialization
C.filger.buff_spells_list = {}
C.filger.proc_spells_list = {}
C.filger.debuff_spells_list = {}
C.filger.aura_bar_spells_list = {}
C.filger.cd_spells_list = {}
C.filger.ignore_spells_list = {}
C.raidframe.plugins_aura_watch_list = {}
C.announcements.spells_list = {}
C.raidcooldown.spells_list = {}
C.raidcooldown.spells_list_ver = 1
C.enemycooldown.spells_list = {}
C.enemycooldown.spells_list_ver = 1
C.pulsecooldown.spells_list = {}
C.nameplate.debuffs_list = {}
C.nameplate.buffs_list = {}
C.combattext.spells_list = {}
C.chat.spam_list = ""
C.font.global_font = false
C.media.profile = "-- Insert Your code here\n"
C.general.choose_profile = 1
C.general.profile_name = "1"
C.options = {}

if not IsAddOnLoaded("QulightUI_Config") then return end

----------------------------------------------------------------------------------------
--	This Module loads new user settings if QulightUI_Config is loaded
----------------------------------------------------------------------------------------
-- Create the profile boolean
if not QulightUIOptionsGlobal then QulightUIOptionsGlobal = {} end
if QulightUIOptionsGlobal[T.realm] == nil then QulightUIOptionsGlobal[T.realm] = {} end
if QulightUIOptionsGlobal[T.realm][T.name] == nil then QulightUIOptionsGlobal[T.realm][T.name] = false end
if QulightUIOptionsGlobal[T.realm]["Current_Profile"] == nil then QulightUIOptionsGlobal[T.realm]["Current_Profile"] = {} end

-- Create the main options table
if QulightUIOptions == nil then QulightUIOptions = {} end

-- Determine which settings to use
local profile
if QulightUIOptionsGlobal[T.realm][T.name] == true then
	if QulightUIOptionsPerChar == nil then
		QulightUIOptionsPerChar = QulightUIOptions
		QulightUIOptionsGlobal[T.realm]["Current_Profile"][T.name] = QulightUIOptionsGlobal["Current_Profile"] or 1
	end

	if not QulightUIOptionsPerChar.merged and not QulightUIOptionsPerChar["1"] then	-- TODO delete after while
		local backup = QulightUIOptionsPerChar
		QulightUIOptionsPerChar = {}
		QulightUIOptionsPerChar["1"] = backup
		QulightUIOptionsPerChar.merged = true
	end

	QulightUIOptionsGlobal[T.realm]["Current_Profile"][T.name] = QulightUIOptionsGlobal[T.realm]["Current_Profile"][T.name] or 1
	local i = tostring(QulightUIOptionsGlobal[T.realm]["Current_Profile"][T.name])
	QulightUIOptionsPerChar[i] = QulightUIOptionsPerChar[i] or {}
	profile = QulightUIOptionsPerChar[i]
else
	if not QulightUIOptions.merged and not QulightUIOptions["1"] then	-- TODO delete after while
		local backup = QulightUIOptions
		QulightUIOptions = {}
		QulightUIOptions["1"] = backup
		QulightUIOptions.merged = true
	end

	QulightUIOptionsGlobal["Current_Profile"] = QulightUIOptionsGlobal["Current_Profile"] or 1
	local i = tostring(QulightUIOptionsGlobal["Current_Profile"])
	QulightUIOptions[i] = QulightUIOptions[i] or {}
	profile = QulightUIOptions[i]
end

-- Apply or remove saved settings as needed
for group, options in pairs(profile) do
	if C[group] then
		for option, value in pairs(options) do
			if C[group][option] == nil or C[group][option] == value then
				-- remove saved vars if they do not exist in lua config anymore, or are the same as the lua config
				profile[group][option] = nil
			else
				C[group][option] = value
			end
		end
	else
		-- profile[group] = nil
	end
end

-- Add global options variable
C.options = profile

-- Load edited profile code
loadstring("local T, C, L = unpack(QulightUI)\n"..C["media"].profile)()