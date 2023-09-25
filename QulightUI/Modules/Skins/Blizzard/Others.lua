<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/Others.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/Others.lua

----------------------------------------------------------------------------------------
--	Reskin Blizzard windows(by Tukz and Co)
----------------------------------------------------------------------------------------
local SkinBlizzUI = CreateFrame("Frame")
SkinBlizzUI:RegisterEvent("ADDON_LOADED")
SkinBlizzUI:SetScript("OnEvent", function(_, _, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end

	-- Stuff not in Blizzard load-on-demand
	if addon == "QulightUI" then
		-- Skin checkButtons
		local checkButtons = {
			"LFDRoleCheckPopupRoleButtonTank",
			"LFDRoleCheckPopupRoleButtonDPS",
			"LFDRoleCheckPopupRoleButtonHealer"
		}

		for _, object in pairs(checkButtons) do
			T.SkinCheckBox(_G[object].checkButton)
		end

		-- Blizzard Frame reskin
		local bgskins = {
			"GameMenuFrame",
			"BNToastFrame",
			"TicketStatusFrameButton",
			"ReadyCheckFrame",
			"ColorPickerFrame",
			"LFDRoleCheckPopup",
			"LFDReadyCheckPopup",
			"GuildInviteFrame",
			"RolePollPopup",
			"OpacityFrame",
			"GeneralDockManagerOverflowButtonList",
			"QueueStatusFrame",
			"BasicScriptErrors"
		}

		QueueStatusFrame:StripTextures()
		GameMenuFrame:StripTextures()
		LFDRoleCheckPopup:StripTextures()
		RolePollPopup:StripTextures()
		OpacityFrame:StripTextures()
		ColorPickerFrame.Border:Hide()
		AutoCompleteBox.NineSlice:SetTemplate("Transparent")

		for i = 1, getn(bgskins) do
			local frame = _G[bgskins[i]]
			if frame then
				frame:SetTemplate("Transparent")
			end
		end

		-- Reskin popups
		for i = 1, 4 do
			for j = 1, 4 do
				_G["StaticPopup"..i.."Button"..j]:SkinButton()
			end
			_G["StaticPopup"..i]:StripTextures()
			_G["StaticPopup"..i].Border:StripTextures()
			_G["StaticPopup"..i]:CreateBackdrop("Transparent")
			_G["StaticPopup"..i].backdrop:SetPoint("TOPLEFT", 2, -2)
			_G["StaticPopup"..i].backdrop:SetPoint("BOTTOMRIGHT", -2, 2)
			T.SkinEditBox(_G["StaticPopup"..i.."EditBox"])
			T.SkinEditBox(_G["StaticPopup"..i.."MoneyInputFrameGold"])
			T.SkinEditBox(_G["StaticPopup"..i.."MoneyInputFrameSilver"])
			T.SkinEditBox(_G["StaticPopup"..i.."MoneyInputFrameCopper"])
			_G["StaticPopup"..i.."EditBox"].backdrop:SetPoint("TOPLEFT", -3, -6)
			_G["StaticPopup"..i.."EditBox"].backdrop:SetPoint("BOTTOMRIGHT", -3, 6)
			_G["StaticPopup"..i.."MoneyInputFrameGold"].backdrop:SetPoint("TOPLEFT", -3, 0)
			_G["StaticPopup"..i.."MoneyInputFrameSilver"].backdrop:SetPoint("TOPLEFT", -3, 0)
			_G["StaticPopup"..i.."MoneyInputFrameCopper"].backdrop:SetPoint("TOPLEFT", -3, 0)
			_G["StaticPopup"..i.."ItemFrameNameFrame"]:Kill()
			_G["StaticPopup"..i.."ItemFrame"]:GetNormalTexture():Kill()
			_G["StaticPopup"..i.."ItemFrame"]:SetTemplate("Default")
			_G["StaticPopup"..i.."ItemFrame"]:StyleButton()
			_G["StaticPopup"..i.."ItemFrame"].IconBorder:SetAlpha(0)
			_G["StaticPopup"..i.."ItemFrameIconTexture"]:SetTexCoord(0.1, 0.9, 0.1, 0.9)
			_G["StaticPopup"..i.."ItemFrameIconTexture"]:ClearAllPoints()
			_G["StaticPopup"..i.."ItemFrameIconTexture"]:SetPoint("TOPLEFT", 2, -2)
			_G["StaticPopup"..i.."ItemFrameIconTexture"]:SetPoint("BOTTOMRIGHT", -2, 2)
			_G["StaticPopup"..i.."CloseButton"]:SetNormalTexture(0)
			_G["StaticPopup"..i.."CloseButton"].SetNormalTexture = T.dummy
			_G["StaticPopup"..i.."CloseButton"]:SetPushedTexture(0)
			_G["StaticPopup"..i.."CloseButton"].SetPushedTexture = T.dummy
			T.SkinCloseButton(_G["StaticPopup"..i.."CloseButton"])
		end
		_G["StaticPopup1ExtraButton"]:SkinButton()

		T.SkinCloseButton(_G["RolePollPopupCloseButton"])

		-- Cinematic popup
		_G["CinematicFrameCloseDialog"]:SetScale(C.general.uiscale)
		_G["CinematicFrameCloseDialog"]:StripTextures()
		_G["CinematicFrameCloseDialog"]:SetTemplate("Transparent")
		_G["CinematicFrameCloseDialogConfirmButton"]:SkinButton()
		_G["CinematicFrameCloseDialogResumeButton"]:SkinButton()
		_G["CinematicFrameCloseDialogResumeButton"]:SetPoint("LEFT", _G["CinematicFrameCloseDialogConfirmButton"], "RIGHT", 15, 0)

		-- Movie popup /run MovieFrame_PlayMovie(MovieFrame, 18)
		MovieFrame.CloseDialog:SetScale(C.general.uiscale)
		MovieFrame.CloseDialog:StripTextures()
		MovieFrame.CloseDialog:SetTemplate("Transparent")
		MovieFrame.CloseDialog.ConfirmButton:SkinButton()
		MovieFrame.CloseDialog.ResumeButton:SkinButton()
		MovieFrame.CloseDialog.ResumeButton:SetPoint("LEFT", MovieFrame.CloseDialog.ConfirmButton, "RIGHT", 15, 0)

		-- PetBattle popup
		_G["PetBattleQueueReadyFrame"]:SetTemplate("Transparent")
		_G["PetBattleQueueReadyFrame"].AcceptButton:SkinButton()
		_G["PetBattleQueueReadyFrame"].DeclineButton:SkinButton()

		-- Reskin Dropdown menu
		local dropdowns = {"DropDownList", "L_DropDownList", "Lib_DropDownList"}
		hooksecurefunc("UIDropDownMenu_InitializeHelper", function()
			for _, name in next, dropdowns do
				for i = 1, UIDROPDOWNMENU_MAXLEVELS do
					local backdrop = _G[name..i.."Backdrop"]
					if backdrop then
						backdrop:SetTemplate("Transparent")
						local menu = _G[name..i.."MenuBackdrop"].NineSlice or _G[name..i.."MenuBackdrop"]
						if menu then
							menu:SetTemplate("Transparent")
						end
						if backdrop.Bg then
							backdrop.Bg:SetAlpha(0)
						end
					end
				end
			end
		end)

		hooksecurefunc("ToggleDropDownMenu", function(level)
			if not level then
				level = 1
			end

			for i = 1, _G.UIDROPDOWNMENU_MAXBUTTONS do
				local button = _G["DropDownList"..level.."Button"..i]
				local check = _G["DropDownList"..level.."Button"..i.."Check"]
				local uncheck = _G["DropDownList"..level.."Button"..i.."UnCheck"]

				if not button.backdrop then
					button:CreateBackdrop("Transparent")
					button.backdrop:SetBackdropColor(C.media.backdrop_color[1], C.media.backdrop_color[2], C.media.backdrop_color[3], 0.3)
				end

				button.backdrop:Hide()

				local texture = check:GetTexture()
				if not button.notCheckable and texture == 375502 then
					uncheck:SetTexture()
					local _, co = check:GetTexCoord()
					if co == 0 then
						check:SetTexture([[Interface\Buttons\UI-CheckBox-Check]])
						check:SetVertexColor(1, 0.9, 0, 1)
						check:SetSize(18, 18)
						check:SetDesaturated(true)
						button.backdrop:SetInside(check, 4, 4)
					else
						check:SetTexture(C.media.blank)
						check:SetVertexColor(1, 0.82, 0, 0.8)
						check:SetSize(6, 6)
						check:SetDesaturated(false)
						button.backdrop:SetOutside(check)
					end

					button.backdrop:Show()
					check:SetTexCoord(0, 1, 0, 1)
				else
					check:SetSize(16, 16)
				end
			end
		end)

		if RaiderIO_CustomDropDownListMenuBackdrop then
			RaiderIO_CustomDropDownListMenuBackdrop:StripTextures()
		end

		-- Reskin menu
		local ChatMenus = {
			"ChatMenu",
			"EmoteMenu",
			"LanguageMenu",
			"VoiceMacroMenu"
		}

		for i = 1, getn(ChatMenus) do
			if _G[ChatMenus[i]] == _G["ChatMenu"] then
				_G[ChatMenus[i]]:HookScript("OnShow", function(self)
					self.NineSlice:SetTemplate("Transparent")
					self:ClearAllPoints()
					self:SetPoint("BOTTOMRIGHT", ChatFrame1, "BOTTOMRIGHT", 0, 30)
				end)
			else
				_G[ChatMenus[i]]:HookScript("OnShow", function(self)
					self.NineSlice:SetTemplate("Transparent")
				end)
			end
		end

		-- Hide header textures and move text/buttons
		local BlizzardHeader = {
			GameMenuFrame,
			ColorPickerFrame
		}

		for _, frame in pairs(BlizzardHeader) do
			local title = frame.Header
			if title then
				title:StripTextures()
				title:ClearAllPoints()
				title:SetPoint("TOP", frame, 0, 7)
			end
		end

		-- Reskin buttons
		local BlizzardButtons = {
			"GameMenuButtonOptions",
			"GameMenuButtonHelp",
			"GameMenuButtonStore",
			"GameMenuButtonSettings",
			"GameMenuButtonEditMode",
			"GameMenuButtonKeybindings",
			"GameMenuButtonMacros",
			"GameMenuButtonRatings",
			"GameMenuButtonAddOns",
			"GameMenuButtonAddons",
			"GameMenuButtonLogout",
			"GameMenuButtonQuit",
			"GameMenuButtonContinue",
			"GameMenuButtonMacOptions",
			"GameMenuButtonOptionHouse",
			"GameMenuButtonSettingsUI",
			"GameMenuButtonWhatsNew",
			"ReadyCheckFrameYesButton",
			"ReadyCheckFrameNoButton",
			"ColorPickerOkayButton",
			"ColorPickerCancelButton",
			"GuildInviteFrameJoinButton",
			"GuildInviteFrameDeclineButton",
			"RolePollPopupAcceptButton",
			"LFDRoleCheckPopupDeclineButton",
			"LFDRoleCheckPopupAcceptButton",
			"LFDReadyCheckPopupAcceptButton",
			"RaidUtilityConvertButton",
			"RaidUtilityMainTankButton",
			"RaidUtilityMainAssistButton",
			"RaidUtilityRoleButton",
			"RaidUtilityReadyCheckButton",
			"RaidUtilityShowButton",
			"RaidUtilityCloseButton",
			"RaidUtilityDisbandButton",
			"RaidUtilityRaidControlButton",
			"BasicScriptErrorsButton"
		}

		if C.misc.raid_tools == true then
			tinsert(BlizzardButtons, "CompactRaidFrameManagerDisplayFrameLeaderOptionsRaidWorldMarkerButton")
		end

		for i = 1, getn(BlizzardButtons) do
			local buttons = _G[BlizzardButtons[i]]
			if buttons then
				buttons:SkinButton()
			end
		end
		LFDReadyCheckPopup.YesButton:SkinButton(true)
		LFDReadyCheckPopup.NoButton:SkinButton(true)

		-- Button position or text
		_G["ColorPickerOkayButton"]:ClearAllPoints()
		_G["ColorPickerOkayButton"]:SetPoint("BOTTOMLEFT", _G["ColorPickerFrame"], "BOTTOMLEFT", 6, 6)
		_G["ColorPickerCancelButton"]:ClearAllPoints()
		_G["ColorPickerCancelButton"]:SetPoint("BOTTOMRIGHT", _G["ColorPickerFrame"], "BOTTOMRIGHT", -6, 6)
		_G["ReadyCheckFrameYesButton"]:SetParent(_G["ReadyCheckFrame"])
		_G["ReadyCheckFrameYesButton"]:ClearAllPoints()
		_G["ReadyCheckFrameNoButton"]:SetParent(_G["ReadyCheckFrame"])
		_G["ReadyCheckFrameNoButton"]:ClearAllPoints()
		_G["ReadyCheckFrameYesButton"]:SetPoint("RIGHT", _G["ReadyCheckFrame"], "CENTER", 0, -22)
		_G["ReadyCheckFrameNoButton"]:SetPoint("LEFT", _G["ReadyCheckFrameYesButton"], "RIGHT", 6, 0)
		_G["ReadyCheckFrameText"]:SetParent(_G["ReadyCheckFrame"])
		_G["ReadyCheckFrameText"]:ClearAllPoints()
		_G["ReadyCheckFrameText"]:SetPoint("TOP", 0, -12)

		-- Others
		for i = 1, 10 do
			select(i, GuildInviteFrame:GetRegions()):Hide()
		end
		_G["GeneralDockManagerOverflowButtonList"]:SetFrameStrata("HIGH")
		_G["ReadyCheckListenerFrame"]:SetAlpha(0)
		_G["ReadyCheckFrame"]:HookScript("OnShow", function(self) if UnitIsUnit("player", self.initiator) then self:Hide() end end)

		-- StackSplit
		StackSplitFrame:SetFrameStrata("TOOLTIP")
		StackSplitFrame:StripTextures()
		StackSplitFrame:CreateBackdrop("Transparent")
		StackSplitFrame.backdrop:SetPoint("TOPLEFT", 5, -5)
		StackSplitFrame.backdrop:SetPoint("BOTTOMRIGHT", -5, 10)
		StackSplitFrame.OkayButton:SkinButton()
		StackSplitFrame.CancelButton:SkinButton()

		if C.skins.blizzard_frames == true then
			-- What's new frame
			SplashFrame:CreateBackdrop("Transparent")
			SplashFrame.BottomCloseButton:SkinButton()
			T.SkinCloseButton(SplashFrame.TopCloseButton)

			-- NavBar Buttons (Used in EncounterJournal and HelpFrame)
			local function SkinNavBarButtons(self)
				if self:GetParent():GetName() == "WorldMapFrame" then return end
				local navButton = self.navList[#self.navList]
				if navButton and not navButton.isSkinned then
					navButton:SkinButton(true)
					if navButton.MenuArrowButton then
						navButton.MenuArrowButton:SetNormalTexture(0)
						navButton.MenuArrowButton:SetPushedTexture(0)
						navButton.MenuArrowButton:SetHighlightTexture(0)
					end
					navButton.xoffset = 1
					navButton.isSkinned = true
				end
			end
			hooksecurefunc("NavBar_AddButton", SkinNavBarButtons)

			local function SetHomeButtonOffsetX(self)
				if self:GetParent():GetName() == "WorldMapFrame" then return end
				if self.homeButton then
					self.homeButton.xoffset = 1
				end
			end
			hooksecurefunc("NavBar_Initialize", SetHomeButtonOffsetX)

			if T.client == "ruRU" then
				_G["DeclensionFrame"]:SetTemplate("Transparent")
				_G["DeclensionFrameCancelButton"]:SkinButton()
				_G["DeclensionFrameOkayButton"]:SkinButton()
				T.SkinNextPrevButton(_G["DeclensionFrameSetNext"])
				T.SkinNextPrevButton(_G["DeclensionFrameSetPrev"])
				for i = 1, 5 do
					_G["DeclensionFrameDeclension"..i.."Edit"]:StripTextures(true)
					_G["DeclensionFrameDeclension"..i.."Edit"]:SetTemplate("Overlay")
					_G["DeclensionFrameDeclension"..i.."Edit"]:SetTextInsets(3, 0, 0, 0)
				end
			end
			if C.skins.clique ~= true and IsAddOnLoaded("Clique") then
				CliqueSpellTab:GetRegions():SetSize(0.1, 0.1)
				CliqueSpellTab:GetNormalTexture():SetTexCoord(0.1, 0.9, 0.1, 0.9)
				CliqueSpellTab:GetNormalTexture():ClearAllPoints()
				CliqueSpellTab:GetNormalTexture():SetPoint("TOPLEFT", 2, -2)
				CliqueSpellTab:GetNormalTexture():SetPoint("BOTTOMRIGHT", -2, 2)
				CliqueSpellTab:CreateBackdrop("Default")
				CliqueSpellTab.backdrop:SetAllPoints()
				CliqueSpellTab:StyleButton()
			end

			local function SkinIconArray(baseName, numIcons)
				for i = 1, numIcons do
					local button = _G[baseName..i]
					local texture = _G[baseName..i.."Icon"]

					button:StripTextures()
					button:StyleButton(true)
					button:SetTemplate("Default")

					texture:ClearAllPoints()
					texture:SetPoint("TOPLEFT", 2, -2)
					texture:SetPoint("BOTTOMRIGHT", -2, 2)
					texture:SetTexCoord(0.1, 0.9, 0.1, 0.9)
				end
			end

			-- This is used to create icons for the GuildBankPopupFrame, MacroPopupFrame, and GearManagerDialogPopup
			hooksecurefunc("BuildIconArray", function(_, baseName, _, rowSize, numRows)
				local numIcons = rowSize * numRows
				SkinIconArray(baseName, numIcons)
			end)

			hooksecurefunc(HelpTipTemplateMixin, "ApplyText", function(self)
				T.SkinHelpBox(self)
			end)
		end
	end
end)