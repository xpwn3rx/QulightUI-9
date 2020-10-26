----------------------------------------------------------------------------------------
--	Initiation of QulightUI
----------------------------------------------------------------------------------------
-- Including system
local addon, engine = ...
engine[1] = {}	-- T, Functions
engine[2] = {}	-- C, Config
engine[3] = {}	-- L, Localization

QulightUI = engine	-- Allow other addons to use Engine

--[[
	This should be at the top of every file inside of the QulightUI AddOn:
	local T, C, L, _ = unpack(select(2, ...))

	This is how another addon imports the QulightUI engine:
	local T, C, L, _ = unpack(QulightUI)
]]