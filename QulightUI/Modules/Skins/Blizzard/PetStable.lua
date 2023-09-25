<<<<<<< HEAD:QulightUI/Modules/Skins/Blizzard/PetStable.lua
local T, C, L = unpack(QulightUI)
=======
local T, C, L = unpack(ShestakUI)
>>>>>>> 1957c7e2f (Cleanup.):ShestakUI/Modules/Skins/Blizzard/PetStable.lua
if C.skins.blizzard_frames ~= true then return end

----------------------------------------------------------------------------------------
--	PetStable skin
----------------------------------------------------------------------------------------
local function LoadSkin()
	local frame = PetStableFrame
	T.SkinFrame(frame)

	PetStableFrameInset:SetTemplate("Overlay")

	T.SkinRotateButton(PetStableModelRotateLeftButton)
	T.SkinRotateButton(PetStableModelRotateRightButton)
	PetStableModelRotateRightButton:ClearAllPoints()
	PetStableModelRotateRightButton:SetPoint("LEFT", PetStableModelRotateLeftButton, "RIGHT", 3, 0)

	T.SkinNextPrevButton(PetStablePrevPageButton, nil, "Any")
	T.SkinNextPrevButton(PetStableNextPageButton, nil, "Any")

	for i = 1, NUM_PET_ACTIVE_SLOTS do
		local button = _G["PetStableActivePet"..i]
		local icon = _G["PetStableActivePet"..i.."IconTexture"]

		button:StripTextures()
		button:StyleButton()
		button:SetTemplate("Default")

		icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		icon:ClearAllPoints()
		icon:SetPoint("TOPLEFT", 2, -2)
		icon:SetPoint("BOTTOMRIGHT", -2, 2)
	end

	for i = 1, NUM_PET_STABLE_SLOTS do
		local button = _G["PetStableStabledPet"..i]
		local icon = _G["PetStableStabledPet"..i.."IconTexture"]

		button:StripTextures()
		button:StyleButton()
		button:SetTemplate("Default")

		icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
		icon:ClearAllPoints()
		icon:SetPoint("TOPLEFT", 2, -2)
		icon:SetPoint("BOTTOMRIGHT", -2, 2)
	end

	PetStableSelectedPetIcon:SkinIcon()

	PetStableDiet:StripTextures()
	PetStableDiet:SetSize(20, 20)
	PetStableDiet:SetPoint("TOPRIGHT", -9, -2)

	PetStableDietTexture:SetTexture("Interface\\Icons\\ability_hunter_beasttraining")
	PetStableDietTexture:SkinIcon()
end

tinsert(T.SkinFuncs["QulightUI"], LoadSkin)