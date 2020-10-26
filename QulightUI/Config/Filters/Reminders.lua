local T, C, L, _ = unpack(select(2, ...))

----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Well Fed -> http://www.wowhead.com/spell=104280
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
local function SpellName(id)
	local name, _, icon = GetSpellInfo(id)
	if name then
		return {name, icon}
	else
		print("|cffff0000WARNING: spell ID ["..tostring(id).."] no longer exists! Report this to Qulight.|r")
		return {"Empty", ""}
	end
end

if C.reminder.raid_buffs_enable == true or C.announcements.flask_food == true then
	T.ReminderBuffs = {
		Flask = {
			SpellName(251836),	-- Flask of the Currents (Agility)
			SpellName(251837),	-- Flask of Endless Fathoms (Intellect)
			SpellName(251838),	-- Flask of the Vast Horizon (Stamina)
			SpellName(251839),	-- Flask of the Undertow (Strenght)
			SpellName(298836),	-- Greater Flask of the Currents (Agility)
			SpellName(298837),	-- Greater Flask of Endless Fathoms (Intellect)
			SpellName(298839),	-- Greater Flask of the Vast Horizon (Stamina)
			SpellName(298841),	-- Greater Flask of the Undertow (Strength)
		},
		BattleElixir = {
			-- SpellName(spellID),	-- Spell name

		},
		GuardianElixir = {
			-- SpellName(spellID),	-- Spell name
		},
		Food = {
			SpellName(104280),	-- Well Fed
		},
		Stamina = {
			SpellName(21562),	-- Power Word: Fortitude
			SpellName(158486) ,	-- War-Scroll of Fortitude
		},
		Custom = {
			-- SpellName(spellID),	-- Spell name
		}
	}

	-- Caster buffs
	function T.ReminderCasterBuffs()
		Spell4Buff = {	-- Intellect
			SpellName(1459),	-- Arcane Intellect
			SpellName(264760),	-- War-Scroll of Intellect
		}
	end

	-- Physical buffs
	function T.ReminderPhysicalBuffs()
		Spell4Buff = {	-- Attack Power
			SpellName(6673),	-- Battle Shout
			SpellName(264761),	-- War-Scroll of Battle Shout
		}
	end
end

----------------------------------------------------------------------------------------
--[[------------------------------------------------------------------------------------
	Spell Reminder Arguments

	Type of Check:
		spells - List of spells in a group, if you have anyone of these spells the icon will hide.

	Spells only Requirements:
		reversecheck - only works if you provide a role or a spec, instead of hiding the frame when you have the buff, it shows the frame when you have the buff
		negate_reversecheck - if reversecheck is set you can set a spec to not follow the reverse check

	Requirements:
		role - you must be a certain role for it to display (Tank, Melee, Caster)
		spec - you must be active in a specific spec for it to display (1, 2, 3) note: spec order can be viewed from top to bottom when you open your talent pane
		level - the minimum level you must be (most of the time we don't need to use this because it will register the spell learned event if you don't know the spell, but in some cases it may be useful)

	Additional Checks: (Note we always run a check when gaining/losing an aura)
		combat - check when entering combat
		instance - check when entering a party/raid instance
		pvp - check when entering a bg/arena

	For every group created a new frame is created, it's a lot easier this way.
]]--------------------------------------------------------------------------------------
if C.reminder.solo_buffs_enable == true then
	T.ReminderSelfBuffs = {
		MAGE = {
			[1] = {	-- Intellect group
				["spells"] = {
					SpellName(1459),	-- Arcane Intellect
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
		PRIEST = {
			[1] = {	-- Stamina group
				["spells"] = {
					SpellName(21562),	-- Power Word: Fortitude
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true
			},
		},
		ROGUE = {
			[1] = {	-- Lethal Poisons group
				["spells"] = {
					SpellName(2823),	-- Deadly Poison
					SpellName(8679),	-- Wound Poison
				},
				["spec"] = 1,			-- Only Assassination have poisen now
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
			[2] = {	-- Non-Lethal Poisons group
				["spells"] = {
					SpellName(3408),	-- Crippling Poison
					SpellName(108211),	-- Leeching Poison
				},
				["spec"] = 1,			-- Only Assassination have poisen now
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
		WARRIOR = {
			[1] = {	-- Battle Shout group
				["spells"] = {
					SpellName(6673),	-- Battle Shout
				},
				["combat"] = true,
				["instance"] = true,
				["pvp"] = true,
			},
		},
	}
end