﻿local T, C, L, _ = unpack(ShestakUI)
if C.actionbar.enable ~= true then return end

----------------------------------------------------------------------------------------
--	Style ActionBars buttons(by Tukz)
----------------------------------------------------------------------------------------

local gsub = string.gsub
local function UpdateHotkey(self)
	local hotkey = _G[self:GetName().."HotKey"]
	local text = hotkey:GetText()
	if not text then return end

	text = gsub(text, "(s%-)", "S")
	text = gsub(text, "(a%-)", "A")
	text = gsub(text, "(а%-)", "A") -- fix ruRU
	text = gsub(text, "(c%-)", "C")
	text = gsub(text, "(Mouse Button )", "M")
	text = gsub(text, "(Кнопка мыши )", "M")
	text = gsub(text, KEY_BUTTON3, "M3")
	text = gsub(text, KEY_PAGEUP, "PU")
	text = gsub(text, KEY_PAGEDOWN, "PD")
	text = gsub(text, KEY_SPACE, "SpB")
	text = gsub(text, KEY_INSERT, "Ins")
	text = gsub(text, KEY_HOME, "Hm")
	text = gsub(text, KEY_DELETE, "Del")
	text = gsub(text, KEY_NUMPADDECIMAL, "Nu.")
	text = gsub(text, KEY_NUMPADDIVIDE, "Nu/")
	text = gsub(text, KEY_NUMPADMINUS, "Nu-")
	text = gsub(text, KEY_NUMPADMULTIPLY, "Nu*")
	text = gsub(text, KEY_NUMPADPLUS, "Nu+")
	text = gsub(text, KEY_NUMLOCK, "NuL")
	text = gsub(text, KEY_MOUSEWHEELDOWN, "MWD")
	text = gsub(text, KEY_MOUSEWHEELUP, "MWU")

	if hotkey:GetText() == _G["RANGE_INDICATOR"] then
		hotkey:SetText("")
	else
		hotkey:SetText(text)
	end
end

local function StyleNormalButton(button)
=======
=======
local NUM_STANCE_SLOTS = NUM_STANCE_SLOTS or 10
local function StyleNormalButton(button, size)
	if not button.isSkinned then
		local name = button:GetName()
		local icon = _G[name.."Icon"]
		local count = _G[name.."Count"]
		local flash = _G[name.."Flash"]
		local hotkey = _G[name.."HotKey"]
		local border = button.Border or _G[name..'Border']
		local btname = _G[name.."Name"]
		local normal = _G[name.."NormalTexture"]
		local float = _G[name.."FloatingBG"]
		local highlight = button.SpellHighlightTexture
		local isExtraAction = name:match("ExtraAction")
		local isFlyout = name:match("Flyout")
		local flyoutBorder = _G[name.."FlyoutBorder"]
		local flyoutBorderShadow = _G[name.."FlyoutBorderShadow"]

		local normal = button.NormalTexture or _G[name..'NormalTexture']
		local normal2 = button:GetNormalTexture()

		if button.IconMask then
			button.IconMask:Hide()
		end

		if button.SlotArt then
			button.SlotArt:Hide()
		end

		if button.RightDivider then
			button.RightDivider:Kill()
		end

		if button.SlotBackground then
			button.SlotBackground:Hide()
		end

		if button.NewActionTexture then
			button.NewActionTexture:SetAlpha(0)
		end

		if normal then normal:SetTexture() normal:Hide() normal:SetAlpha(0) end
		if normal2 then normal2:SetTexture() normal2:Hide() normal2:SetAlpha(0) end

		-- _G[button:GetName().."NormalTexture"]:SetAlpha(0)
		-- _G[button:GetName().."NormalTexture"]:Hide()
		-- button:GetNormalTexture():SetAlpha(0)
		-- button:GetNormalTexture():Hide()

		flash:SetTexture("")

		button:SetNormalTexture("")

		if float then
			float:SetTexture("")
		end

		if border then
			border:Kill()
		end

		if not isExtraAction then
			count:ClearAllPoints()
			count:SetPoint("BOTTOMRIGHT", 0, 2)
			count:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
			count:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)
		end

		if btname then
			if C.actionbar.macro == true then
				btname:ClearAllPoints()
				btname:SetPoint("BOTTOM", 0, 0)
				btname:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
				btname:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)
				btname:SetWidth(C.actionbar.button_size - 1)
			else
				btname:Kill()
			end
		end

		if C.actionbar.hotkey == true then
			hotkey:ClearAllPoints()
			hotkey:SetPoint("TOPRIGHT", 0, -1)
			hotkey.SetPoint = T.dummy -- BETA It's bad way but work while I find better
			hotkey:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
			hotkey:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)
			hotkey:SetWidth(C.actionbar.button_size - 1)
		else
			hotkey:Kill()
		end

		if not isFlyout and not isExtraAction then
			button:SetSize(C.actionbar.button_size, C.actionbar.button_size)
		end
		button:SetTemplate("Transparent")
		if C.actionbar.classcolor_border == true then
			button:SetBackdropBorderColor(unpack(C.media.classborder_color))
		else
			button:SetBackdropBorderColor(0, 0, 0)
		end

		icon:CropIcon()
		icon:SetDrawLayer("BACKGROUND", 7)

		if normal then
			normal:ClearAllPoints()
			normal:SetPoint("TOPLEFT")
			normal:SetPoint("BOTTOMRIGHT")
		end

		if highlight then
			highlight:ClearAllPoints()
			highlight:SetPoint("TOPLEFT", -4, 4)
			highlight:SetPoint("BOTTOMRIGHT", 4, -4)
		end

		button.oborder:SetFrameLevel(button:GetFrameLevel())
		
		button.iborder:SetFrameLevel(button:GetFrameLevel())

		if button.QuickKeybindHighlightTexture then
			button.QuickKeybindHighlightTexture:SetTexture("")
		end

		button:StyleButton(button, button.size, true)
		if flyoutBorder then
			flyoutBorder:SetTexture("")
		end
		if flyoutBorderShadow then
			flyoutBorderShadow:SetTexture("")
		end

		button:StyleButton()

		button.isSkinned = true
	end
end

local function StyleSmallButton(normal, button, icon, name, pet)
	if not button.isSkinned then
		local flash = _G[name.."Flash"]
		local hotkey = _G[name.."HotKey"]

		button:SetNormalTexture("")

		hooksecurefunc(button, "SetNormalTexture", function(self, texture)
			if texture and texture ~= "" then
				self:SetNormalTexture("")
			end
		end)

		flash:SetColorTexture(0.8, 0.8, 0.8, 0.5)
		flash:SetPoint("TOPLEFT", button, 2, -2)
		flash:SetPoint("BOTTOMRIGHT", button, -2, 2)

		if C.actionbar.hotkey == true then
			hotkey:ClearAllPoints()
			hotkey:SetPoint("TOPRIGHT", 0, 0)
			hotkey:SetFont(C.font.action_bars_font, C.font.action_bars_font_size, C.font.action_bars_font_style)
			hotkey:SetShadowOffset(C.font.action_bars_font_shadow and 1 or 0, C.font.action_bars_font_shadow and -1 or 0)
			hotkey:SetWidth(C.actionbar.button_size - 1)
		else
			hotkey:Kill()
		end

		button:SetSize(C.actionbar.button_size, C.actionbar.button_size)
		button:SetTemplate("Transparent")
		if C.actionbar.classcolor_border == true then
			--button:SetBackdropBorderColor(unpack(C.media.classborder_color))
			button:SetBackdropBorderColor(0, 1, 0)
		end

		icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		icon:ClearAllPoints()
		icon:SetPoint("TOPLEFT", button, 2, -2)
		icon:SetPoint("BOTTOMRIGHT", button, -2, 2)
		icon:SetDrawLayer("BACKGROUND", 7)

		if pet then
			--BETA local autocast = _G[name.."AutoCastable"]
			-- autocast:SetSize((C.actionbar.button_size * 2) - 10, (C.actionbar.button_size * 2) - 10)
			-- autocast:ClearAllPoints()
			-- autocast:SetPoint("CENTER", button, 0, 0)

			local shine = _G[name.."Shine"]
			shine:SetSize(C.actionbar.button_size, C.actionbar.button_size)

			local cooldown = _G[name.."Cooldown"]
			cooldown:SetSize(C.actionbar.button_size - 2, C.actionbar.button_size - 2)
		end

		if normal then
			normal:ClearAllPoints()
			normal:SetPoint("TOPLEFT")
			normal:SetPoint("BOTTOMRIGHT")
		end

		if button.QuickKeybindHighlightTexture then
			button.QuickKeybindHighlightTexture:SetTexture("")
		end

		button:StyleButton()

		button.isSkinned = true
	end
end

function T.StyleShift()
	for i = 1, NUM_STANCE_SLOTS do
		local name = "StanceButton"..i
		local button = _G[name]
		local icon = _G[name.."Icon"]
		local normal = _G[name.."NormalTexture"]
		StyleSmallButton(normal, button, icon, name)
	end
end

function T.StylePet()
	for i = 1, NUM_PET_ACTION_SLOTS do
		local name = "PetActionButton"..i
		local button = _G[name]
		local icon = _G[name.."Icon"]
		local normal = _G[name.."NormalTexture2"]
		StyleSmallButton(normal, button, icon, name, true)
	end
end

local buttons = 0
local function SetupFlyoutButton()
	for i = 1, buttons do
		local button = _G["SpellFlyoutButton"..i]
		if button then
			if button:GetHeight() ~= C.actionbar.button_size and not InCombatLockdown() then
				button:SetSize(C.actionbar.button_size, C.actionbar.button_size)
			end

			if not button.IsSkinned then
				button:StyleButton()
				StyleNormalButton(button)

				if C.actionbar.rightbars_mouseover == true then
					SpellFlyout:HookScript("OnEnter", function() RightBarMouseOver(1) end)
					SpellFlyout:HookScript("OnLeave", function() RightBarMouseOver(0) end)
					button:HookScript("OnEnter", function() RightBarMouseOver(1) end)
					button:HookScript("OnLeave", function() RightBarMouseOver(0) end)
				end
				
				if C.actionbar.bottombars_mouseover == true then
					SpellFlyout:HookScript("OnEnter", function() BottomBarMouseOver(1) end)
					SpellFlyout:HookScript("OnLeave", function() BottomBarMouseOver(0) end)
					button:HookScript("OnEnter", function() BottomBarMouseOver(1) end)
					button:HookScript("OnLeave", function() BottomBarMouseOver(0) end)
				end
				button.IsSkinned = true
			end
		end
	end
end

local function StyleFlyoutButton(self)
	if self.FlyoutBorder then
		self.FlyoutBorder:SetAlpha(0)
	end
	if self.FlyoutBorderShadow then
		self.FlyoutBorderShadow:SetAlpha(0)
	end

	SpellFlyoutHorizontalBackground:SetAlpha(0)
	SpellFlyoutVerticalBackground:SetAlpha(0)
	SpellFlyoutBackgroundEnd:SetAlpha(0)

	for i = 1, GetNumFlyouts() do
		local x = GetFlyoutID(i)
		local _, _, numSlots, isKnown = GetFlyoutInfo(x)
		if isKnown then
			if numSlots > buttons then
				buttons = numSlots
			end
		end
	end
	SetupFlyoutButton()
end

local function HideHighlightButton(self)
	if self.overlay then
		self.overlay:Hide()
		ActionButton_HideOverlayGlow(self)
	end
end

do
	for i = 1, 12 do
		StyleNormalButton(_G["ActionButton"..i])
		StyleNormalButton(_G["MultiBarBottomLeftButton"..i])
		StyleNormalButton(_G["MultiBarBottomRightButton"..i])
		StyleNormalButton(_G["MultiBarLeftButton"..i])
		StyleNormalButton(_G["MultiBarRightButton"..i])
	end

	if C.actionbar.custom_bar_enable then
		for i = 1, 12 do
			StyleNormalButton(_G["CustomBarButton"..i], C.actionbar.custom_bar_size)
		end
	end

	StyleNormalButton(ExtraActionButton1)
end

local function SetupFlyoutButton(button, self)
	if button:GetHeight() ~= C.actionbar.button_size and not InCombatLockdown() then
		button:SetSize(C.actionbar.button_size, C.actionbar.button_size)
	end

	if not button.IsSkinned then
		StyleNormalButton(button)

		if C.actionbar.rightbars_mouseover == true then
			SpellFlyout:HookScript("OnEnter", function() RightBarMouseOver(1) end)
			SpellFlyout:HookScript("OnLeave", function() RightBarMouseOver(0) end)
			button:HookScript("OnEnter", function() RightBarMouseOver(1) end)
			button:HookScript("OnLeave", function() RightBarMouseOver(0) end)
		end

		if C.actionbar.bottombars_mouseover == true then
			SpellFlyout:HookScript("OnEnter", function() BottomBarMouseOver(1) end)
			SpellFlyout:HookScript("OnLeave", function() BottomBarMouseOver(0) end)
			button:HookScript("OnEnter", function() BottomBarMouseOver(1) end)
			button:HookScript("OnLeave", function() BottomBarMouseOver(0) end)
		end
		button.IsSkinned = true
	end
end

local function StyleFlyoutButton(self)
	local button, i = _G["SpellFlyoutButton1"], 1
	while button do
		SetupFlyoutButton(button, self)

		i = i + 1
		button = _G["SpellFlyoutButton"..i]
	end
end

SpellFlyout:HookScript("OnShow", StyleFlyoutButton)
--BETA hooksecurefunc("SpellButton_OnClick", StyleFlyoutButton)
-- SpellFlyoutHorizontalBackground:SetAlpha(0)
-- SpellFlyoutVerticalBackground:SetAlpha(0)
-- SpellFlyoutBackgroundEnd:SetAlpha(0)
SpellFlyout.Background:Hide()

if C.actionbar.hotkey == true then
	local gsub = string.gsub
	local function UpdateHotkey(self)
		local hotkey = _G[self:GetName().."HotKey"]
		local text = hotkey:GetText()
		if not text then return end

		text = gsub(text, "(s%-)", "S")
		text = gsub(text, "(a%-)", "A")
		text = gsub(text, "(а%-)", "A") -- fix ruRU
		text = gsub(text, "(c%-)", "C")
		text = gsub(text, "(Mouse Button )", "M")
		text = gsub(text, "(Кнопка мыши )", "M")
		text = gsub(text, KEY_BUTTON3, "M3")
		text = gsub(text, KEY_PAGEUP, "PU")
		text = gsub(text, KEY_PAGEDOWN, "PD")
		text = gsub(text, KEY_SPACE, "SpB")
		text = gsub(text, KEY_INSERT, "Ins")
		text = gsub(text, KEY_HOME, "Hm")
		text = gsub(text, KEY_DELETE, "Del")
		text = gsub(text, KEY_NUMPADDECIMAL, "Nu.")
		text = gsub(text, KEY_NUMPADDIVIDE, "Nu/")
		text = gsub(text, KEY_NUMPADMINUS, "Nu-")
		text = gsub(text, KEY_NUMPADMULTIPLY, "Nu*")
		text = gsub(text, KEY_NUMPADPLUS, "Nu+")
		text = gsub(text, KEY_NUMLOCK, "NuL")
		text = gsub(text, KEY_MOUSEWHEELDOWN, "MWD")
		text = gsub(text, KEY_MOUSEWHEELUP, "MWU")

		if hotkey:GetText() == _G["RANGE_INDICATOR"] then
			hotkey:SetText("")
		else
			hotkey:SetText(text)
		end
	end

	local frame = CreateFrame("Frame")
	frame:RegisterEvent("UPDATE_BINDINGS")
	frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	frame:SetScript("OnEvent", function()
		for i = 1, 12 do
			UpdateHotkey(_G["ActionButton"..i])
			UpdateHotkey(_G["MultiBarBottomLeftButton"..i])
			UpdateHotkey(_G["MultiBarBottomRightButton"..i])
			UpdateHotkey(_G["MultiBarLeftButton"..i])
			UpdateHotkey(_G["MultiBarRightButton"..i])
		end
		for i = 1, 10 do
			UpdateHotkey(_G["StanceButton"..i])
			UpdateHotkey(_G["PetActionButton"..i])
		end
		UpdateHotkey(ExtraActionButton1)
	end)
end

if C.actionbar.hide_highlight == true then
	local function HideHighlightButton(self)
		if self.overlay then
			self.overlay:Hide()
			ActionButton_HideOverlayGlow(self)
		end
	end

	hooksecurefunc("ActionButton_ShowOverlayGlow", HideHighlightButton)
end