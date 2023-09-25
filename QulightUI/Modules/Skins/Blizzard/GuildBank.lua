<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/GuildBank.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/GuildBank.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	GuildBankUI skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	GuildBankFrame:StripTextures()
	GuildBankFrame:SetTemplate("Transparent")
	GuildBankFrame.Emblem:StripTextures(true)
	GuildBankFrame.MoneyFrameBG:StripTextures()

	for i = 1, GuildBankFrame:GetNumChildren() do
		local child = select(i, GuildBankFrame:GetChildren())
		if child.GetPushedTexture and child:GetPushedTexture() and not child:GetName() then
			T.SkinCloseButton(child)
		end
	end

	GuildBankFrame.DepositButton:SkinButton(true)
	GuildBankFrame.WithdrawButton:SkinButton(true)
	GuildBankInfoSaveButton:SkinButton(true)
	GuildBankFrame.BuyInfo.PurchaseButton:SkinButton(true)

	GuildBankFrame.WithdrawButton:SetPoint("RIGHT", GuildBankFrame.DepositButton, "LEFT", -2, 0)

	T.SkinScrollBar(GuildBankInfoScrollFrame.ScrollBar)
	T.SkinScrollBar(GuildBankFrame.Log.ScrollBar)

	GuildBankFrame.inset = CreateFrame("Frame", nil, GuildBankFrame)
	GuildBankFrame.inset:SetTemplate("Overlay")
	GuildBankFrame.inset:SetPoint("TOPLEFT", 21, -58)
	GuildBankFrame.inset:SetPoint("BOTTOMRIGHT", -17, 61)

	GuildItemSearchBox:StripTextures(true)
	GuildItemSearchBox:CreateBackdrop("Overlay")
	GuildItemSearchBox.backdrop:SetPoint("TOPLEFT", 13, 0)
	GuildItemSearchBox.backdrop:SetPoint("BOTTOMRIGHT", -2, 0)

	for i = 1, 7 do
		local column = _G.GuildBankFrame["Column"..i]
		column:StripTextures()

		for j = 1, 14 do
			local button = column["Button"..j]
			local icon = button.icon

			button.IconBorder:SetAlpha(0)
			button:SetNormalTexture(0)
			button:StyleButton()
			button:SetTemplate("Default")

			icon:ClearAllPoints()
			icon:SetPoint("TOPLEFT", 2, -2)
			icon:SetPoint("BOTTOMRIGHT", -2, 2)
			icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		end
	end

	for i = 1, 8 do
		local tab = _G["GuildBankTab"..i]
		local button = tab.Button
		local texture = button.IconTexture
		tab:StripTextures(true)

		button:StripTextures()
		button:StyleButton()
		button:SetTemplate("Default")

		-- Reposition tabs
		button:ClearAllPoints()
		if i == 1 then
			button:SetPoint("TOPLEFT", GuildBankFrame, "TOPRIGHT", 1, 0)
		else
			local fixpos = i-1
			button:SetPoint("TOP", _G["GuildBankTab"..i-1].Button, "BOTTOM", 0, -20)
		end

		texture:ClearAllPoints()
		texture:SetPoint("TOPLEFT", 2, -2)
		texture:SetPoint("BOTTOMRIGHT", -2, 2)
		texture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	end

	for i = 1, 4 do
		T.SkinTab(_G["GuildBankFrameTab"..i])
	end

	-- Reposition tabs
	GuildBankFrameTab1:ClearAllPoints()
	GuildBankFrameTab1:SetPoint("TOPLEFT", GuildBankFrame, "BOTTOMLEFT", 0, 2)

	-- Popup
	GuildBankPopupFrame:HookScript("OnShow", function(frame)
		if not frame.isSkinned then
			T.SkinIconSelectionFrame(frame, nil, nil, "GuildBankPopup")
			frame.isSkinned = true
		end
	end)
end

T.SkinFuncs["Blizzard_GuildBankUI"] = LoadSkin
