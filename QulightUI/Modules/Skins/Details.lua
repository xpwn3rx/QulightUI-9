local T, C, L = unpack(ShestakUI)
if C.skins.details ~= true or not IsAddOnLoaded("Details") then return end

----------------------------------------------------------------------------------------
--	Details skin
----------------------------------------------------------------------------------------
hooksecurefunc(_detalhes.gump, "CreateNewLine", function(_, instancia, index)
	local bar = _G["DetailsBarra_"..instancia.meu_id.."_"..index]
	local icon = _G["DetailsBarra_IconFrame_"..instancia.meu_id.."_"..index]

	if bar and not bar.backdrop then
		bar:CreateBackdrop("Defalt")
		bar.backdrop:SetPoint("TOPLEFT", icon, -2, 2)

		bar.bg = bar:CreateTexture(nil, "BORDER")
		bar.bg:SetAllPoints(bar)
		bar.bg:SetTexture(C.media.texture)
		bar.bg:SetVertexColor(.6, .6, .6, 0.25)
	end

	local frame = _G["DetailsUpFrameInstance"..instancia.meu_id]
	if not frame.b then
		frame.b = CreateFrame("Frame", nil, frame:GetParent())
		frame.b:SetTemplate("Overlay")
		frame.b:SetPoint("TOPLEFT", frame, "TOPLEFT", -23, 2)
		frame.b:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 34, 4)
		frame.b:SetFrameLevel(frame:GetFrameLevel() - 1)
	end
end)

hooksecurefunc(_detalhes, "SetFontOutline", function(_, fontString)
	local _, size = fontString:GetFont()
	fonte = "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf"
	if fonte == "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf" then
		fontString:SetFont(fonte, size)
		if fontString:GetShadowColor() then
			fontString:SetShadowColor(0, 0, 0, 0)
		end
	end
end)

local skinTable = {
	file = [[Interface\AddOns\Details\images\skins\classic_skin.blp]],
	author = "PWn3R", 
	version = "1.0", 
	site = "unknown", 
	desc = "QulightUI Skin",
	no_cache = true,
	
	--micro frames
	micro_frames = {
		color = {1, 1, 1, 0.7}, 
		font = "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf", 
		size = 9,
		textymod = 0,
	},
	
	can_change_alpha_head = true, 
	icon_anchor_main = {-1, -5}, 
	icon_anchor_plugins = {-7, -13}, 
	icon_plugins_size = {19, 18},
	
	--anchors:
	icon_point_anchor = {-37, 0},
	left_corner_anchor = {-107, 0},
	right_corner_anchor = {96, 0},

	icon_point_anchor_bottom = {-37, 12},
	left_corner_anchor_bottom = {-107, 0},
	right_corner_anchor_bottom = {96, 0},
	
	icon_on_top = true,
	icon_ignore_alpha = true,
	icon_titletext_position = {5, 4},
	
	--overwrites
	instance_cprops = {
		menu_icons_alpha = 0.92,
		["color"] = {
			0.3058, -- [1]
			0.3058, -- [2]
			0.3058, -- [3]
			0.8838, -- [4]
		},
		["menu_anchor"] = {
			16, -- [1]
			2, -- [2]
			["side"] = 2,
		},
		["bg_r"] = 0.0941,
		["color_buttons"] = {
			1, -- [1]
			1, -- [2]
			1, -- [3]
			1, -- [4]
		},
		["font_face_file"] = "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf",
		["backdrop_texture"] = "Details Ground",
		["row_info"] = {
			["font_face_file"] = "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf",
			["textR_outline"] = false,
			["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
			["textL_outline"] = false,
			["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
			["textR_show_data"] = {
				true, -- [1]
				true, -- [2]
				true, -- [3]
			},
			["textL_enable_custom_text"] = false,
			["fixed_text_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
			},
			["space"] = {
				["right"] = 0,
				["left"] = 0,
				["between"] = 1,
			},
			["texture_background_class_color"] = false,
			["start_after_icon"] = true,
			["font_face_file"] = "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf",
			["textL_custom_text"] = "{data1}. {data3}{data2}",
			["font_size"] = 16,
			["height"] = 21,
			["texture_file"] = "Interface\\AddOns\\Details\\images\\bar_serenity",
			["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
			["textR_bracket"] = "(",
			["textR_enable_custom_text"] = false,
			["fixed_texture_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
			},
			["font_face_file"]= "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf",
			["textL_show_number"] = true,
			["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
			["texture"] = "Details Serenity",
			["models"] = {
				["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
				["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
				["upper_alpha"] = 0.5,
				["lower_enabled"] = false,
				["lower_alpha"] = 0.1,
				["upper_enabled"] = false,
			},
			["texture_background_file"] = "Interface\\AddOns\\Details\\images\\bar_background",
			["texture_background"] = "DGround",
			["use_spec_icons"] = true,
			["textR_class_colors"] = false,
			["alpha"] = 1,
			["no_icon"] = false,
			["percent_type"] = 1,
			["fixed_texture_background_color"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.319999992847443, -- [4]
			},
			["font_face_file"] = "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf",
			["texture_class_colors"] = true,
			["backdrop"] = {
				["enabled"] = false,
				["texture"] = "Details BarBorder 2",
				["color"] = {
					1, -- [1]
					1, -- [2]
					1, -- [3]
					1, -- [4]
				},
				["size"] = 12,
			},
			["fast_ps_update"] = false,
			["textR_separator"] = ",",
			["textL_class_colors"] = false,
		},
		["micro_displays_side"] = 2,
		["strata"] = "LOW",
		["bg_alpha"] = 0.4181,
		["plugins_grow_direction"] = 1,
		["menu_icons"] = {
			true, -- [1]
			true, -- [2]
			true, -- [3]
			true, -- [4]
			true, -- [5]
			false, -- [6]
			["space"] = -1,
			["shadow"] = false,
		},
		["desaturated_menu"] = false,
		["show_sidebars"] = false,
		["menu_anchor_down"] = {
			16, -- [1]
			-2, -- [2]
		},
		["statusbar_info"] = {
			["alpha"] = 0.77,
			["overlay"] = {
				0.28627, -- [1]
				0.28627, -- [2]
				0.28627, -- [3]
			},
		},
		["hide_icon"] = true,
		["toolbar_side"] = 1,
		["bg_g"] = 0.0941,
		["show_statusbar"] = false,
		["menu_icons_size"] = 0.899999976158142,
		["wallpaper"] = {
			["enabled"] = false,
			["texcoord"] = {
				0, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["overlay"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["anchor"] = "all",
			["height"] = 0,
			["alpha"] = 0.5,
			["width"] = 0,
		},
		["auto_hide_menu"] = {
			["left"] = false,
			["right"] = false,
		},
		["attribute_text"] = {
			["font_face_file"] = "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf",
			["enabled"] = true,
			["shadow"] = false,
			["side"] = 1,
			["text_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["custom_text"] = "{name}",
			["font_face_file"] = "Interface\\AddOns\\QulightUI\\Media\\Fonts\\Normal.ttf",
			["anchor"] = {
				-18, -- [1]
				5, -- [2]
			},
			["text_size"] = 11,
			["enable_custom_text"] = false,
		},
		["bg_b"] = 0.0941,
	},
}

_detalhes.skins["Minimalistic v2"] = skinTable

local lower_instance = _detalhes:GetLowerInstanceNumber()
if lower_instance then
	for i = lower_instance, #_detalhes.tabela_instancias do
		local instance = Details:GetInstance(i)
		if instance and instance.rows_fit_in_window then
			for j = 1, instance.rows_fit_in_window do
				local bar = _G["DetailsBarra_Statusbar_"..i.."_"..j]
				local icon = _G["DetailsBarra_IconFrame_"..i.."_"..j]
				if bar and not bar.backdrop then
					bar:CreateBackdrop("Defalt")
					bar.backdrop:SetPoint("TOPLEFT", icon, -2, 2)

					bar.bg = bar:CreateTexture(nil, "BORDER")
					bar.bg:SetAllPoints(bar)
					bar.bg:SetTexture(C.media.texture)
					bar.bg:SetVertexColor(.6, .6, .6, 0.25)
				end
			end

			local frame = _G["DetailsUpFrameInstance"..i]
			frame.b = CreateFrame("Frame", nil, frame:GetParent())
			frame.b:SetTemplate("Overlay")
			frame.b:SetPoint("TOPLEFT", frame, "TOPLEFT", -23, 2)
			frame.b:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", 34, 4)
			frame.b:SetFrameLevel(frame:GetFrameLevel() - 1)

			instance:ChangeSkin("Minimalistic v2")
		end
	end
end