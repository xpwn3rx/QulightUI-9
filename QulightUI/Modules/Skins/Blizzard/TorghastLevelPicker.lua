<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/TorghastLevelPicker.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/TorghastLevelPicker.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Torghast Level Picker skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = TorghastLevelPickerFrame
	T.SkinCloseButton(frame.CloseButton)
	frame.CloseButton:SetPoint("TOPRIGHT", -50, -50)

	T.SkinNextPrevButton(frame.Pager.PreviousPage)
	T.SkinNextPrevButton(frame.Pager.NextPage)

	frame.OpenPortalButton:SkinButton()

	hooksecurefunc(TorghastLevelPickerFrame, "ScrollAndSelectHighestAvailableLayer", function(self)
		for layer in self.gossipOptionsPool:EnumerateActive() do
			if not layer.styled then
				layer.SelectedBorder:SetAtlas("charactercreate-ring-select")
				layer.SelectedBorder:SetSize(120, 120)
				layer.SelectedBorder:SetPoint("CENTER", 0, 0)
				layer.styled = true
			end
		end
	end)
end

T.SkinFuncs["Blizzard_TorghastLevelPicker"] = LoadSkin