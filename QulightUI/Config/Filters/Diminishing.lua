local T, C, L = unpack(QulightUI)
if C.unitframe.enable ~= true or C.unitframe.show_arena ~= true or C.unitframe.plugins_diminishing ~= true then return end

----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Sap -> http://www.wowhead.com/spell=6770
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
T.DiminishingSpells = {
	-- Stuns
	[210141] = {"stun"},			-- Zombie Explosion
	[334693] = {"root"},			-- Absolute Zero (Breath of Sindragosa)
	[108194] = {"stun"},			-- Asphyxiate (Unholy)
	[221562] = {"stun"},			-- Asphyxiate (Blood)
	[91800] = {"stun"},			-- Gnaw (Ghoul)
	[91797] = {"stun"},			-- Monstrous Blow (Mutated Ghoul)
	[287254] = {"stun"},			-- Dead of Winter
	[179057] = {"stun"},			-- Chaos Nova
	[205630] = {"stun"},			-- Illidan's Grasp (Primary effect)
	[208618] = {"stun"},			-- Illidan's Grasp (Secondary effect)
	[211881] = {"stun"},			-- Fel Eruption
	[22570] = {"stun"},			-- Maim
	[163505] = {"stun"},			-- Rake (Prowl)
	[5211] = {"stun"},			-- Mighty Bash
	[202244] = {"stun"},			-- Overrun
	[325321] = {"stun"},			-- Wild Hunt's Charge
	[24394] = {"stun"},			-- Intimidation
	[119381] = {"stun"},			-- Leg Sweep
	[202346] = {"stun"},			-- Double Barrel
	[853] = {"stun"},			-- Hammer of Justice
	[255941] = {"stun"},			-- Wake of Ashes
	[64044] = {"stun"},			-- Psychic Horror
	[200200] = {"stun"},			-- Holy Word: Chastise Censure
	[1833] = {"stun"},			-- Cheap Shot
	[408] = {"stun"},			-- Kidney Shot
	[118905] = {"stun"},			-- Static Charge (Capacitor Totem)
	[118345] = {"stun"},			-- Pulverize (Primal Earth Elemental)
	[305485] = {"stun"},			-- Lightning Lasso
	[30283] = {"stun"},			-- Shadowfury
	[89766] = {"stun"},			-- Axe Toss (Felguard)
	[171017] = {"stun"},			-- Meteor Strike (Infernal)
	[171018] = {"stun"},			-- Meteor Strike (Abyssal)
	[46968] = {"stun"},			-- Shockwave
	[132168] = {"stun"},			-- Shockwave (Protection)
	[132169] = {"stun"},			-- Storm Bolt
	[199085] = {"stun"},			-- Warpath
	[20549] = {"stun"},			-- War Stomp (Tauren)
	[255723] = {"stun"},			-- Bull Rush (Highmountain Tauren)
	[287712] = {"stun"},			-- Haymaker (Kul Tiran)
	[332423] = {"stun"},			-- Sparkling Driftglobe Core

	-- Roots
	[204085] = {"root"},			-- Deathchill (Chains of Ice)
	[233395] = {"root"},			-- Deathchill (Remorseless Winter)
	[339] = {"root"},			-- Entangling Roots
	[170855] = {"root"},			-- Entangling Roots (Nature's Grasp)
	[102359] = {"root"},			-- Mass Entanglement
	[117526] = {"root"},			-- Binding Shot
	[162480] = {"root"},			-- Steel Trap
	[212638] = {"root"},			-- Tracker's Net
	[201158] = {"root"},			-- Super Sticky Tar
	[122] = {"root"},			-- Frost Nova
	[33395] = {"root"},			-- Freeze
	[198121] = {"root"},			-- Frostbite
	[233582] = {"root"},			-- Entrenched in Flame
	[116706] = {"root"},			-- Disable
	[324382] = {"root"},			-- Clash
	[64695] = {"root"},			-- Earthgrab (Totem effect)
	[285515] = {"root"},			-- Surge of Power

	-- Incapacitates
	[217832] = {"incapacitate"},		-- Imprison
	[221527] = {"incapacitate"},		-- Imprison (Honor talent)
	[2637] = {"incapacitate"},		-- Hibernate
	[99] = {"incapacitate"},		-- Incapacitating Roar
	[3355] = {"incapacitate"},		-- Freezing Trap
	[203337] = {"incapacitate"},		-- Freezing Trap (Honor talent)
	[209790] = {"incapacitate"},		-- Freezing Arrow
	[213691] = {"incapacitate"},		-- Scatter Shot
	[118] = {"incapacitate"},		-- Polymorph
	[28271] = {"incapacitate"},		-- Polymorph (Turtle)
	[28272] = {"incapacitate"},		-- Polymorph (Pig)
	[61025] = {"incapacitate"},		-- Polymorph (Snake)
	[61305] = {"incapacitate"},		-- Polymorph (Black Cat)
	[61721] = {"incapacitate"},		-- Polymorph (Rabbit)
	[61780] = {"incapacitate"},		-- Polymorph (Turkey)
	[126819] = {"incapacitate"},		-- Polymorph (Porcupine)
	[161353] = {"incapacitate"},		-- Polymorph (Polar Bear Cub)
	[161354] = {"incapacitate"},		-- Polymorph (Monkey)
	[161355] = {"incapacitate"},		-- Polymorph (Penguin)
	[161372] = {"incapacitate"},		-- Polymorph (Peacock)
	[277787] = {"incapacitate"},		-- Polymorph (Baby Direhorn)
	[277792] = {"incapacitate"},		-- Polymorph (Bumblebee)
	[82691] = {"incapacitate"},		-- Ring of Frost
	[115078] = {"incapacitate"},		-- Paralysis
	[20066] = {"incapacitate"},		-- Repentance
	[9484] = {"incapacitate"},		-- Shackle Undead
	[200196] = {"incapacitate"},		-- Holy Word: Chastise
	[1776] = {"incapacitate"},		-- Gouge
	[6770] = {"incapacitate"},		-- Sap
	[199743] = {"incapacitate"},		-- Parley
	[51514] = {"incapacitate"},		-- Hex
	[196942] = {"incapacitate"},		-- Hex (Voodoo Totem)
	[210873] = {"incapacitate"},		-- Hex (Raptor)
	[211004] = {"incapacitate"},		-- Hex (Spider)
	[211010] = {"incapacitate"},		-- Hex (Snake)
	[211015] = {"incapacitate"},		-- Hex (Cockroach)
	[269352] = {"incapacitate"},		-- Hex (Skeletal Hatchling)
	[309328] = {"incapacitate"},		-- Hex (Living Honey)
	[309328] = {"incapacitate"},		-- Hex (Living Honey)
	[277778] = {"incapacitate"},		-- Hex (Zandalari Tendonripper)
	[277784] = {"incapacitate"},		-- Hex (Wicker Mongrel)
	[197214] = {"incapacitate"},		-- Sundering
	[6789] = {"incapacitate"},		-- Mortal Coil
	[107079] = {"incapacitate"},		-- Quaking Palm (Pandaren)

	-- Disorients
	[207167] = {"disorient"},		-- Blinding Sleet
	[207685] = {"disorient"},		-- Sigil of Misery
	[33786] = {"disorient"},		-- Cyclone
	[1513] = {"disorient"},			-- Scare Beast
	[31661] = {"disorient"},		-- Dragon's Breath
	[198909] = {"disorient"},		-- Song of Chi-ji
	[202274] = {"disorient"},		-- Incendiary Brew
	[105421] = {"disorient"},		-- Blinding Light
	[10326] = {"disorient"},		-- Turn Evil (for Lichborne)?
	[605] = {"disorient"},			-- Mind Control
	[8122] = {"disorient"},			-- Psychic Scream
	[226943] = {"disorient"},		-- Mind Bomb
	[2094] = {"disorient"},			-- Blind
	[118699] = {"disorient"},		-- Fear
	[5484] = {"disorient"},			-- Howl of Terror
	[6358] = {"disorient"},			-- Seduction (Succubus)
	[261589] = {"disorient"},		-- Seduction (Grimoire of Sacrifice)
	[5246] = {"disorient"},			-- Intimidating Shout
	[331866] = {"disorient"},		-- Agent of Chaos (Venthyr Covenant)

	-- Silences
	[47476] = {"silence"},			-- Strangulate
	[204490] = {"silence"},			-- Sigil of Silence
	[202933] = {"silence"},			-- Spider Sting
	[217824] = {"silence"},			-- Shield of Virtue
	[199683] = {"silence"},			-- Last Word
	[15487] = {"silence"},			-- Silence
	[1330] = {"silence"},			-- Garrote
	[196364] = {"silence"},			-- Unstable Affliction Silence Effect
}

local function GetIcon(id)
	local _, _, icon = GetSpellInfo(id)
	return icon
end

T.DiminishingIcons = {
	["stun"] = GetIcon(408),
	["root"] = GetIcon(122),
	["incapacitate"] = GetIcon(118),
	["disorient"] = GetIcon(8122),
	["silence"] = GetIcon(15487),
}