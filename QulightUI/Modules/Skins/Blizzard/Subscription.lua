<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/Subscription.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/Subscription.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	SubscriptionInterstitialUI skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = SubscriptionInterstitialFrame
	T.SkinCloseButton(frame.CloseButton)

	frame:StripTextures()
	frame:SetTemplate("Transparent")
	frame.ShadowOverlay:Hide()

	frame.ClosePanelButton:SkinButton()

	if IsWetxius then
		SubscriptionInterstitialFrame:Kill()
	end
end

T.SkinFuncs["Blizzard_SubscriptionInterstitialUI"] = LoadSkin