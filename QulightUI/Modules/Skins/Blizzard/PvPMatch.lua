local T, C, L = unpack(ShestakUI)
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	PVPMatch skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	-- Macro to show the PVPMatchScoreboard: /run PVPMatchScoreboard:Show()
	local PVPMatchScoreboard = _G.PVPMatchScoreboard
	PVPMatchScoreboard:StripTextures()
	PVPMatchScoreboard:DisableDrawLayer("BORDER")
	PVPMatchScoreboard:CreateBackdrop("Transparent")

	PVPMatchScoreboard.Content:StripTextures()

	T.SkinScrollBar(PVPMatchScoreboard.Content.ScrollBar)
	T.SkinCloseButton(PVPMatchScoreboard.CloseButton)

	for i = 1, 3 do
		T.SkinTab(_G.PVPMatchScoreboard.Content.TabContainer.TabGroup["Tab"..i])
	end

	-- Macro to show the PVPMatchResults: /run PVPMatchResults:Show()
	local PVPMatchResults = _G.PVPMatchResults
	PVPMatchResults:StripTextures()
	PVPMatchResults:DisableDrawLayer("BORDER")
	PVPMatchResults:CreateBackdrop("Transparent")

	PVPMatchResults.content:StripTextures()
	PVPMatchResults.content.tabContainer:StripTextures()

	T.SkinScrollBar(PVPMatchResults.content.scrollBar)
	T.SkinCloseButton(PVPMatchResults.CloseButton)
	PVPMatchResults.buttonContainer.leaveButton:SkinButton()
	PVPMatchResults.buttonContainer.requeueButton:SkinButton()

	for i = 1, 3 do
		T.SkinTab(_G.PVPMatchResults.content.tabContainer.tabGroup["tab"..i])
	end

	local honor = PVPMatchResults.content.earningsContainer.progressContainer.honor.button
	honor.CircleMask:Hide()
	honor.Ring:Hide()
	honor.Icon:SkinIcon()
	PVPMatchResults.content.earningsContainer.progressContainer.honor:SetScale(1)

	local conquest = PVPMatchResults.content.earningsContainer.progressContainer.conquest.button
	conquest.CircleMask:Hide()
	conquest.Ring:Hide()
	conquest.Icon:SkinIcon()
	PVPMatchResults.content.earningsContainer.progressContainer.conquest:SetScale(1)

	hooksecurefunc(PVPMatchResults, "AddItemReward", function()
		for itemFrame in PVPMatchResults.itemPool:EnumerateActive() do
			itemFrame.IconBorder:Hide()
			itemFrame.IconBorderDropShadow:SetAlpha(0)
			itemFrame:SetScale(1)
			if not itemFrame.backdrop then
				itemFrame.Icon:SkinIcon()
			end
			local atlas = itemFrame.IconBorder:GetAtlas()
			local r, g, b = unpack(C.media.border_color)
			if atlas:find("green") then
				r, g, b = GetItemQualityColor(2)
			elseif atlas:find("blue") then
				r, g, b = GetItemQualityColor(3)
			elseif atlas:find("purple") then
				r, g, b = GetItemQualityColor(4)
			end
			itemFrame.backdrop:SetBackdropBorderColor(r, g, b)
		end
	end)
end

tinsert(T.SkinFuncs["QulightUI"], LoadSkin)