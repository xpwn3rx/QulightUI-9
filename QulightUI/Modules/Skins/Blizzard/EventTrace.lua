local T, C, L, _ = unpack(select(2, ...))
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	EventTrace skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = EventTrace
	T.SkinCloseButton(frame.CloseButton)

	frame:StripTextures()
	frame:SetTemplate("Transparent")

	EventTrace.SubtitleBar.OptionsDropDown:SkinButton()
	T.SkinEditBox(EventTrace.Log.Bar.SearchBox, nil, 16)

	EventTrace.Log.Events.ScrollBar.Background:Hide()

	EventTraceTooltip:HookScript("OnShow", function(self)
		self.NineSlice:SetTemplate("Transparent")
	end)
end

T.SkinFuncs["Blizzard_EventTrace"] = LoadSkin 