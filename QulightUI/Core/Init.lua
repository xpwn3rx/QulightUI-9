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
<<<<<<< HEAD:QulightUI/Core/Init.lua
	This should be at the top of every file inside of the QulightUI AddOn:
	local T, C, L, _ = unpack(select(2, ...))
=======
	This should be at the top of every file inside of the ShestakUI AddOn:
	local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Core/Init.lua

	This is how another addon imports the QulightUI engine:
	local T, C, L, _ = unpack(QulightUI)
]]