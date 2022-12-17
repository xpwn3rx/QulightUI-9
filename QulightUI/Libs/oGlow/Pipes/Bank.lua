local T, C, L, _ = unpack(select(2, ...))
if C.bag.enable == true then return end

local _E

local update = function(self)
<<<<<<< HEAD:QulightUI/Libs/oGlow/Pipes/Bank.lua
	for i = 1, NUM_BANKGENERIC_SLOTS or 28 do
		local slotFrame = _G["BankFrameItem"..i]
		local slotLink = C_Container.GetContainerItemLink(-1, i)
=======
	if BankFrame:IsShown() then
		for i = 1, NUM_BANKGENERIC_SLOTS or 28 do
			local slotFrame = _G["BankFrameItem"..i]
			local slotLink = C_Container.GetContainerItemLink(-1, i)
>>>>>>> e09f100a4 (Cleanup.):ShestakUI/Libs/oGlow/Pipes/Bank.lua

		self:CallFilters("bank", slotFrame, _E and slotLink)
	end
end

local enable = function(self)
	_E = true

	self:RegisterEvent("BANKFRAME_OPENED", update)
	self:RegisterEvent("PLAYERBANKSLOTS_CHANGED", update)
end

local disable = function(self)
	_E = nil

	self:UnregisterEvent("BANKFRAME_OPENED", update)
	self:UnregisterEvent("PLAYERBANKSLOTS_CHANGED", update)
end

oGlow:RegisterPipe("bank", enable, disable, update, "Player bank frame")