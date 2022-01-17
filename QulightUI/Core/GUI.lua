local T, C, L, _ = unpack(select(2, ...))

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
C.nameplate.debuffs_list = {}
C.nameplate.buffs_list = {}
C.chat.spam_list = ""
C.media.profile = "-- Insert Your code here\n"
C.options = {}

if not IsAddOnLoaded("QulightUI_Config") then return end

----------------------------------------------------------------------------------------
--	This Module loads new user settings if QulightUI_Config is loaded
----------------------------------------------------------------------------------------
-- Create the profile boolean
if not QulightUIOptionsGlobal then QulightUIOptionsGlobal = {} end
if QulightUIOptionsGlobal[T.realm] == nil then QulightUIOptionsGlobal[T.realm] = {} end
if QulightUIOptionsGlobal[T.realm][T.name] == nil then QulightUIOptionsGlobal[T.realm][T.name] = false end

-- Create the main options table
if QulightUIOptions == nil then QulightUIOptions = {} end

-- Determine which settings to use
local profile
if QulightUIOptionsGlobal[T.realm][T.name] == true then
	if QulightUIOptionsPerChar == nil then
		QulightUIOptionsPerChar = {}
	end
	profile = QulightUIOptionsPerChar
else
	profile = QulightUIOptions
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
		profile[group] = nil
	end
end

-- Add global options variable
C.options = profile

-- Load edited profile code
loadstring("local T, C, L = unpack(QulightUI)\n"..C["media"].profile)()