<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/Scrapping.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/Scrapping.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	ScrappingMachine skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = ScrappingMachineFrame
	T.SkinFrame(frame)

	frame.ScrapButton:SkinButton()

	local ItemSlots = frame.ItemSlots
	ItemSlots:StripTextures()

	for button in pairs(ItemSlots.scrapButtons.activeObjects) do
		if not button.styled then
			button:SetHighlightTexture(0)
			button.Icon:SkinIcon()
			button.IconBorder:SetAlpha(0)
			hooksecurefunc(button.IconBorder, "SetVertexColor", function(_, r, g, b) button.backdrop:SetBackdropBorderColor(r, g, b) end)
			hooksecurefunc(button.IconBorder, "Hide", function() button.backdrop:SetBackdropBorderColor(unpack(C.media.border_color)) end)

			button.styled = true
		end
	end
end

T.SkinFuncs["Blizzard_ScrappingMachineUI"] = LoadSkin