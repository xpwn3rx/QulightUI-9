<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/Runeforge.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/Runeforge.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	Runeforge skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = RuneforgeFrame
	T.SkinCloseButton(frame.CloseButton)
	frame.CloseButton:SetPoint("TOPRIGHT", -50, 0)

	frame.CreateFrame.CraftItemButton:SkinButton()

	local powerFrame = frame.CraftingFrame.PowerFrame
	powerFrame:StripTextures()
	powerFrame:CreateBackdrop("Overlay")

	local pageControl = powerFrame.PageControl
	T.SkinNextPrevButton(pageControl.BackwardButton)
	T.SkinNextPrevButton(pageControl.ForwardButton)

	hooksecurefunc(powerFrame.PowerList, "RefreshListDisplay", function(list)
		if not list.elements then return end

		for i = 1, list:GetNumElementFrames() do
			local button = list.elements[i]
			if button and not button.IsSkinned then
				button.Border:SetAlpha(0)
				button.CircleMask:Hide()
				button.Icon:SkinIcon()

				button.IsSkinned = true
			end
		end
	end)
end

T.SkinFuncs["Blizzard_RuneforgeUI"] = LoadSkin 