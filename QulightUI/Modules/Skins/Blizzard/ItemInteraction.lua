<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/ItemInteraction.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/ItemInteraction.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	ItemInteractionUI skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	ItemInteractionFrame:StripTextures()
	ItemInteractionFrame:CreateBackdrop("Transparent")

	ItemInteractionFramePortrait:Hide()

	ItemInteractionFrame.ButtonFrame:StripTextures()
	ItemInteractionFrame.ButtonFrame.MoneyFrameEdge:StripTextures()

	local ItemSlot = ItemInteractionFrame.ItemSlot
	ItemSlot:StripTextures()

	ItemSlot:SetSize(58, 58)
	ItemSlot:ClearAllPoints()
	ItemSlot:SetPoint("TOPLEFT", 143, -97)

	ItemSlot.Icon:ClearAllPoints()
	ItemSlot.Icon:SetPoint("TOPLEFT", 1, -1)
	ItemSlot.Icon:SetPoint("BOTTOMRIGHT", -1, 1)
	ItemSlot.Icon:SkinIcon()

	ItemSlot.GlowOverlay:SetAlpha(0)

	ItemInteractionFrame.ButtonFrame.Currency.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)

	ItemInteractionFrame.ButtonFrame.ActionButton:SkinButton()
	T.SkinCloseButton(ItemInteractionFrameCloseButton)
end

T.SkinFuncs["Blizzard_ItemInteractionUI"] = LoadSkin