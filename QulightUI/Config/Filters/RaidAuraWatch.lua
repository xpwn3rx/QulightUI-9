local T, C, L, _ = unpack(select(2, ...))
if C.raidframe.plugins_aura_watch ~= true then return end

----------------------------------------------------------------------------------------
--	The best way to add or delete spell is to go at www.wowhead.com, search for a spell.
--	Example: Renew -> http://www.wowhead.com/spell=139
--	Take the number ID at the end of the URL, and add it to the list
----------------------------------------------------------------------------------------
T.RaidBuffs = {
	DRUID = {
		{774, "TOPRIGHT", {0.8, 0.4, 0.8}},					-- Rejuvenation
		{48438, "BOTTOMRIGHT", {0.8, 0.4, 0}},				-- Wild Growth
		{8936, "BOTTOMLEFT", {0.2, 0.8, 0.2}},				-- Regrowth
		{33763, "TOPLEFT", {0.4, 0.8, 0.2}},				-- Lifebloom
		{102342, "LEFT", {0.45, 0.3, 0.2}, true},			-- Ironbark
		{155777, "RIGHT", {0.4, 0.9, 0.4}},				-- Rejuvenation (Germination)
	},
	EVOKER = {
		{355941, "TOPRIGHT", {0.20, 0.58, 0.50}},			-- Dream Breath
		{363502, "BOTTOMLEFT", {0.26, 0.73, 0.63}},			-- Dream Flight
		{366155, "RIGHT", {0.14, 1.00, 0.88}},				-- Reversion
		{364343, "TOP", {0.13, 0.87, 0.50}},				-- Echo
		{357170, "BOTTOM", {0.11, 0.57, 0.71}},				-- Time Dilation
	},
	MONK = {
		{119611, "TOPRIGHT", {0.2, 0.7, 0.7}},				-- Renewing Mist
		{115175, "BOTTOMRIGHT", {0.7, 0.4, 0}},				-- Soothing Mist
		{124682, "BOTTOMLEFT", {0.4, 0.8, 0.2}},			-- Enveloping Mist
		{191840, "TOPLEFT", {0.1, 0.4, 0.9}},				-- Essence Font
		{116849, "LEFT", {0.81, 0.85, 0.1}, true},			-- Life Cocoon
	},
	PALADIN = {
		{53563, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Beacon of Light
		{156910, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Beacon of Faith
		{200025, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Beacon of Virtue
		{1022, "BOTTOMRIGHT", {0.2, 0.2, 1}, true},			-- Blessing of Protection
		{1044, "BOTTOMRIGHT", {0.89, 0.45, 0}, true},			-- Blessing of Freedom
		{6940, "BOTTOMRIGHT", {0.89, 0.1, 0.1}, true},			-- Blessing of Sacrifice
		{204018, "BOTTOMRIGHT", {0.4, 0.6, 0.8}, true},			-- Blessing of Spellwarding
		{287280, "BOTTOMLEFT", {0.9, 0.5, 0.1}},			-- Glimmer of Light
		{223306, "TOPLEFT", {0.8, 0.8, 0.1}},				-- Bestow Faith
	},
	PRIEST = {
		{194384, "TOPRIGHT", {0.8, 0.4, 0.2}},				-- Atonement
		{139, "TOPRIGHT", {0.4, 0.7, 0.2}},					-- Renew
		{41635, "BOTTOMRIGHT", {0.2, 0.7, 0.2}},			-- Prayer of Mending
		{6788, "BOTTOMLEFT", {1, 0, 0}},					-- Weakened Soul
		{17, "TOPLEFT", {0.81, 0.85, 0.1}},					-- Power Word: Shield
		{33206, "LEFT", {0.89, 0.1, 0.1}, true},			-- Pain Suppression
		{47788, "LEFT", {0.86, 0.52, 0}, true},				-- Guardian Spirit
	},
	SHAMAN = {
		{61295, "TOPRIGHT", {0.7, 0.3, 0.7}},				-- Riptide
		{204288, "BOTTOMRIGHT", {0.2, 0.7, 0.2}},			-- Earth Shield
	},
	HUNTER = {
		{35079, "TOPRIGHT", {0.2, 0.2, 1}},				-- Misdirection
	},
	ROGUE = {
		{57934, "TOPRIGHT", {0.89, 0.1, 0.1}},				-- Tricks of the Trade
	},
	WARLOCK = {
		{20707, "TOPRIGHT", {0.7, 0.32, 0.75}},				-- Soulstone
	},
	ALL = {
		{23333, "LEFT", {1, 0, 0}, true}, 				-- Warsong flag, Horde
		{23335, "LEFT", {0, 0, 1}, true},				-- Warsong flag, Alliance
		{34976, "LEFT", {1, 0, 0}, true}, 				-- Netherstorm Flag
	},
}

T.RaidBuffsIgnore = {
	--[spellID] = true,			-- Spell name
}

local function SpellName(id)
	local name = GetSpellInfo(id)
	if name then
		return name
	else
		print("|cffff0000WARNING: spell ID ["..tostring(id).."] no longer exists! Report this to Qulight.|r")
		return "Empty"
	end
end

T.RaidDebuffs = {
-----------------------------------------------------------------
-- Sepulcher of the First Ones
-----------------------------------------------------------------
	-- Vigilant Guardian
	[SpellName(364447)] = 3,	-- Dissonance
	[SpellName(364904)] = 3,	-- Anti-Matter
	[SpellName(364881)] = 3,	-- Matter Disolution
	[SpellName(360415)] = 3,	-- Defenseless
	[SpellName(360412)] = 3,	-- Exposed Core
	[SpellName(366393)] = 3,	-- Searing Ablation
	-- Skolex, the Insatiable Ravener
	[SpellName(364522)] = 3,	-- Devouring Blood
	[SpellName(359976)] = 3,	-- Riftmaw
	[SpellName(359981)] = 3,	-- Rend
	[SpellName(360098)] = 3,	-- Warp Sickness
	[SpellName(366070)] = 3,	-- Volatile Residue
	-- Artificer Xy'mox
	[SpellName(364030)] = 3,	-- Debilitating Ray
	[SpellName(365681)] = 3,	-- System Shock
	[SpellName(363413)] = 3,	-- Forerunner Rings
	[SpellName(362615)] = 3,	-- Dimensional Tear
	[SpellName(362803)] = 3,	-- Glyph of Relocation
	-- Dausegne, The Fallen Oracle
	[SpellName(361751)] = 3,	-- Disintegration Halo
	[SpellName(364289)] = 3,	-- Staggering Barrage
	[SpellName(361225)] = 3,	-- Encroaching Dominion
	[SpellName(361966)] = 3,	-- Infused Strikes
	-- Prototype Pantheon
	[SpellName(365306)] = 3,	-- Invigorating Bloom
	[SpellName(361689)] = 3,	-- Wracking Pain
	[SpellName(366232)] = 3,	-- Animastorm
	[SpellName(364839)] = 3,	-- Sinful Projection
	[SpellName(360259)] = 3,	-- Gloom Bolt
	[SpellName(362383)] = 3,	-- Anima Bolt
	[SpellName(362352)] = 3,	-- Pinned
	-- Lihuvim, Principle Architect
	[SpellName(360159)] = 3,	-- Unstable Protoform Energy
	[SpellName(363681)] = 3,	-- Deconstructing Blast
	[SpellName(363676)] = 3,	-- Deconstructing Energy
	-- Halondrus the Reclaimer
	[SpellName(361309)] = 3,	-- Lightshatter Beam
	[SpellName(361002)] = 3,	-- Ephemeral Fissure
	-- Anduin Wrynn
	[SpellName(365293)] = 3,	-- Befouled Barrier
	[SpellName(363020)] = 3,	-- Necrotic Claws
	[SpellName(365021)] = 3,	-- Wicked Star
	[SpellName(365445)] = 3,	-- Scarred Soul
	[SpellName(365008)] = 3,	-- Psychic Terror
	[SpellName(366849)] = 3,	-- Domination Word: Pain
	-- Lords of Dread
	[SpellName(360148)] = 3,	-- Bursting Dread
	[SpellName(360012)] = 3,	-- Cloud of Carrion
	[SpellName(360146)] = 3,	-- Fearful Trepidation
	[SpellName(360241)] = 3,	-- Unsettling Dreams
	-- Rygelon
	[SpellName(362206)] = 3,	-- Event Horizon
	[SpellName(362137)] = 3,	-- Corrupted Wound
	[SpellName(361548)] = 3,	-- Dark Eclipse
	-- The Jailer
	[SpellName(362075)] = 3,	-- Domination
	[SpellName(365150)] = 3,	-- Rune of Domination
	[SpellName(363893)] = 3,	-- Martyrdom
	[SpellName(363886)] = 3,	-- Imprisonment
	[SpellName(365219)] = 3,	-- Chains of Anguish
	[SpellName(366285)] = 3,	-- Rune of Compulsion
	[SpellName(363332)] = 3,	-- Unbreaking Grasp
-----------------------------------------------------------------
-- Sanctum of Domination
-----------------------------------------------------------------
	-- The Tarragrue
	[SpellName(347283)] = 3,	-- Predator's Howl
	[SpellName(347286)] = 3,	-- Unshakeable Dread
	[SpellName(346986)] = 3,	-- Crushed Armor
	[SpellName(347991)] = 3,	-- Ten of Towers
	[SpellName(347269)] = 3,	-- Chains of Eternity
	[SpellName(346985)] = 3,	-- Overpower
	[SpellName(347274)] = 3,	-- Annihilating Smash
	-- Eye of the Jailer
	[SpellName(350606)] = 3,	-- Hopeless Lethargy
	[SpellName(355240)] = 3,	-- Scorn
	[SpellName(355245)] = 3,	-- Ire
	[SpellName(349979)] = 3,	-- Dragging Chains
	[SpellName(348074)] = 3,	-- Assailing Lance
	[SpellName(351827)] = 3,	-- Spreading Misery
	[SpellName(355143)] = 3,	-- Deathlink
	[SpellName(350763)] = 3,	-- Annihilating Glare
	-- The Nine
	[SpellName(350287)] = 3,	-- Song of Dissolution
	[SpellName(350542)] = 3,	-- Fragments of Destiny
	[SpellName(350202)] = 3,	-- Unending Strike
	[SpellName(350475)] = 3,	-- Pierce Soul
	[SpellName(350555)] = 3,	-- Shard of Destiny
	[SpellName(350109)] = 3,	-- Brynja's Mournful Dirge
	[SpellName(350483)] = 3,	-- Link Essence
	[SpellName(350039)] = 3,	-- Arthura's Crushing Gaze
	[SpellName(350184)] = 3,	-- Daschla's Mighty Impact
	[SpellName(350374)] = 3,	-- Wings of Rage
	-- Remnant of Ner'zhul
	[SpellName(350073)] = 3,	-- Torment
	[SpellName(349890)] = 3,	-- Suffering
	[SpellName(350469)] = 3,	-- Malevolence
	[SpellName(354534)] = 3,	-- Spite
	-- Soulrender Dormazain
	[SpellName(353429)] = 3,	-- Tormented
	[SpellName(353023)] = 3,	-- Torment
	[SpellName(351787)] = 3,	-- Agonizing Spike
	[SpellName(350647)] = 3,	-- Brand of Torment
	[SpellName(350422)] = 3,	-- Ruinblade
	[SpellName(350851)] = 3,	-- Vessel of Torment
	[SpellName(354231)] = 3,	-- Soul Manacles
	[SpellName(350927)] = 3,	-- Warmonger Shackle
	-- Painsmith Raznal
	[SpellName(355505)] = 3,	-- Shadowsteel Chains
	[SpellName(348456)] = 3,	-- Flameclasp Trap
	[SpellName(356870)] = 3,	-- Flameclasp Eruption
	[SpellName(355568)] = 3,	-- Cruciform Axe
	[SpellName(355786)] = 3,	-- Blackened Armor
	-- Guardian of the First Ones
	[SpellName(352394)] = 3,	-- Radiant Energy
	[SpellName(350496)] = 3,	-- Threat Neutralization
	[SpellName(347359)] = 3,	-- Suppression Field
	[SpellName(355357)] = 3,	-- Obliterate
	[SpellName(350732)] = 3,	-- Sunder
	[SpellName(352833)] = 3,	-- Disintegration
	-- Fatescribe Roh-Kalo
	[SpellName(354365)] = 3,	-- Grim Portent
	[SpellName(350568)] = 3,	-- Call of Eternity
	[SpellName(353435)] = 3,	-- Overwhelming Burden
	[SpellName(351680)] = 3,	-- Invoke Destiny
	[SpellName(353432)] = 3,	-- Burden of Destiny
	[SpellName(353693)] = 3,	-- Unstable Accretion
	[SpellName(350355)] = 3,	-- Fated Conjunction
	[SpellName(353931)] = 3,	-- Twist Fate
	-- Kel'Thuzad
	[SpellName(346530)] = 3,	-- Frozen Destruction
	[SpellName(354289)] = 3,	-- Sinister Miasma
	[SpellName(347292)] = 3,	-- Oblivion's Echo
	[SpellName(348978)] = 3,	-- Soul Exhaustion
	[SpellName(355389)] = 3,	-- Relentless Haunt
	[SpellName(357298)] = 3,	-- Frozen Binds
	[SpellName(355137)] = 3,	-- Shadow Pool
	[SpellName(348638)] = 3,	-- Return of the Damned
	[SpellName(348760)] = 3,	-- Frost Blast
	-- Sylvanas Windrunner
	[SpellName(349458)] = 3,	-- Domination Chains
	[SpellName(347704)] = 3,	-- Veil of Darkness
	[SpellName(347607)] = 3,	-- Banshee's Mark
	[SpellName(347670)] = 3,	-- Shadow Dagger
	[SpellName(351117)] = 3,	-- Crushing Dread
	[SpellName(351870)] = 3,	-- Haunting Wave
	[SpellName(351253)] = 3,	-- Banshee Wail
	[SpellName(351451)] = 3,	-- Curse of Lethargy
	[SpellName(351091)] = 3,	-- Destabilize
	[SpellName(348064)] = 3,	-- Wailing Arrow
-----------------------------------------------------------------
-- Castle Nathria
-----------------------------------------------------------------
	-- Shriekwing
	[SpellName(328897)] = 3,	-- Exsanguinated
	[SpellName(330713)] = 3,	-- Reverberating Pain
	[SpellName(342923)] = 3,	-- Deadly Descent
	[SpellName(342863)] = 3,	-- Echo Screech

	-- Huntsman Altimor
	[SpellName(335304)] = 3,	-- Sinseeker
	[SpellName(334971)] = 3,	-- Jagged Claws
	[SpellName(335111)] = 3,	-- Huntsman's Mark
	[SpellName(334945)] = 3,	-- Vicious Lunge
	[SpellName(334852)] = 3,	-- Petrifying Howl

	-- Hungering Destroyer
	[SpellName(334228)] = 3,	-- Volatile Ejection
	[SpellName(329298)] = 3,	-- Gluttonous Miasma

	-- Lady Inerva Darkvein
	[SpellName(325936)] = 3,	-- Shared Cognition
	[SpellName(335396)] = 3,	-- Hidden Desire
	[SpellName(324983)] = 3,	-- Shared Suffering
	[SpellName(324982)] = 3,	-- Shared Suffering (Partner)
	[SpellName(332664)] = 3,	-- Concentrate Anima
	[SpellName(325382)] = 3,	-- Warped Desires

	-- Sun King's Salvation
	[SpellName(333002)] = 3,	-- Vulgar Brand
	[SpellName(326078)] = 3,	-- Infuser's Boon
	[SpellName(325251)] = 3,	-- Sin of Pride
	[SpellName(341475)] = 3,	-- Crimson Flurry
	[SpellName(328479)] = 3,	-- Eyes on Target
	[SpellName(328889)] = 3,	-- Greater Castigation

	-- Artificer Xy'mox
	[SpellName(327902)] = 3,	-- Fixate
	[SpellName(326302)] = 3,	-- Stasis Trap
	[SpellName(325236)] = 3,	-- Glyph of Destruction
	[SpellName(327414)] = 3,	-- Possession
	[SpellName(328468)] = 3,	-- Dimensional Tear

	-- The Council of Blood
	[SpellName(327052)] = 3,	-- Drain Essence
	[SpellName(346651)] = 3,	-- Drain Essence Mythic
	[SpellName(328334)] = 3,	-- Tactical Advance
	[SpellName(330848)] = 3,	-- Wrong Moves
	[SpellName(331706)] = 3,	-- Scarlet Letter
	[SpellName(331636)] = 3,	-- Dark Recital

	-- Sludgefist
	[SpellName(335470)] = 3,	-- Chain Slam
	[SpellName(339181)] = 3,	-- Chain Slam (Root)
	[SpellName(331209)] = 3,	-- Hateful Gaze
	[SpellName(335293)] = 3,	-- Chain Link
	[SpellName(342420)] = 3,	-- Chain Them!
	[SpellName(335295)] = 3,	-- Shattering Chain

	-- Stone Legion Generals
	[SpellName(334498)] = 3,	-- Seismic Upheaval
	[SpellName(337643)] = 3,	-- Unstable Footing
	[SpellName(334765)] = 3,	-- Heart Rend
	[SpellName(333377)] = 3,	-- Wicked Mark
	[SpellName(334616)] = 3,	-- Petrified
	[SpellName(334541)] = 3,	-- Curse of Petrification
	[SpellName(339690)] = 3,	-- Crystalize
	[SpellName(342655)] = 3,	-- Volatile Anima Infusion
	[SpellName(342698)] = 3,	-- Volatile Anima Infection
	[SpellName(343881)] = 3,	-- Serrated Tear

	-- Sire Denathrius
	[SpellName(326851)] = 3,	-- Blood Price
	[SpellName(327796)] = 3,	-- Night Hunter
	[SpellName(327992)] = 3,	-- Desolation
	[SpellName(328276)] = 3,	-- March of the Penitent
	[SpellName(326699)] = 3,	-- Burden of Sin
	[SpellName(329181)] = 3,	-- Wracking Pain
	[SpellName(335873)] = 3,	-- Rancor
	[SpellName(329951)] = 3,	-- Impale
	[SpellName(327039)] = 3,	-- Feeding Time
	[SpellName(332794)] = 3,	-- Fatal Finesse

	---------------------------------------------------------
	---------------- Vault of the Incarnates ----------------
	---------------------------------------------------------
	-- Eranog
	[SpellName(370648)] = 5, -- Primal Flow
	[SpellName(390715)] = 6, -- Primal Rifts
	[SpellName(370597)] = 6, -- Kill Order
	-- Terros
	[SpellName(382776)] = 5, -- Awakened Earth 1
	[SpellName(381253)] = 5, -- Awakened Earth 2
	[SpellName(386352)] = 3, -- Rock Blast
	[SpellName(382458)] = 6, -- Resonant Aftermath
	-- The Primal Council
	[SpellName(371624)] = 5, -- Conductive Mark
	[SpellName(372027)] = 4, -- Slashing Blaze
	[SpellName(374039)] = 4, -- Meteor Axe
	-- Sennarth, the Cold Breath
	[SpellName(371976)] = 4, -- Chilling Blast
	[SpellName(372082)] = 5, -- Enveloping Webs
	[SpellName(374659)] = 4, -- Rush
	[SpellName(374104)] = 5, -- Wrapped in Webs Slow
	[SpellName(374503)] = 6, -- Wrapped in Webs Stun
	[SpellName(373048)] = 3, -- Suffocating Webs
	-- Dathea, Ascended
	[SpellName(391686)] = 5, -- Conductive Mark
	[SpellName(378277)] = 2, -- Elemental Equilbrium
	[SpellName(388290)] = 4, -- Cyclone
	-- Kurog Grimtotem
	[SpellName(377780)] = 5, -- Skeletal Fractures
	[SpellName(372514)] = 5, -- Frost Bite
	[SpellName(374554)] = 4, -- Lava Pool
	[SpellName(374709)] = 4, -- Seismic Rupture
	[SpellName(374023)] = 6, -- Searing Carnage
	[SpellName(374427)] = 6, -- Ground Shatter
	[SpellName(390920)] = 5, -- Shocking Burst
	[SpellName(372458)] = 6, -- Below Zero
	-- Broodkeeper Diurna
	[SpellName(388920)] = 6, -- Frozen Shroud
	[SpellName(378782)] = 5, -- Mortal Wounds
	[SpellName(378787)] = 5, -- Crushing Stoneclaws
	[SpellName(375620)] = 6, -- Ionizing Charge
	[SpellName(375578)] = 4, -- Flame Sentry
	-- Raszageth the Storm-Eater
		-- TODO: DF	
-----------------------------------------------------------------
-- Dungeons
-----------------------------------------------------------------
	
-------------------- Mythic+ Specific --------------------
-- General Affixes
	[SpellName(209858)] = 3, -- Necrotic
	[SpellName(226512)] = 3, -- Sanguine
	[SpellName(240559)] = 3, -- Grievous
	[SpellName(240443)] = 3, -- Bursting
-- Shadowlands Season 2
	[SpellName(356667)] = 6, -- Biting Cold 1
	[SpellName(356666)] = 6, -- Biting Cold 2
	[SpellName(355732)] = 6, -- Melt Soul
	[SpellName(356925)] = 6, -- Carnage
	[SpellName(358777)] = 6, -- Bindings of Misery
-- Shadowlands Season 3
	[SpellName(368241)] = 3, -- Decrypted Urh Cypher
	[SpellName(368244)] = 4, -- Urh Cloaking Field
	[SpellName(368240)] = 3, -- Decrypted Wo Cypher
	[SpellName(368239)] = 3, -- Decrypted Vy Cypher
	[SpellName(366297)] = 6, -- Deconstruct (Tank Debuff)
	[SpellName(366288)] = 6, -- Force Slam (Stun)
-- Shadowlands Season 4
	[SpellName(373364)] = 6, -- Vampiric Claws
	[SpellName(373429)] = 6, -- Carrion Swarm
	[SpellName(373370)] = 6, -- Nightmare Cloud
	[SpellName(373391)] = 6, -- Nightmare
	[SpellName(373570)] = 6, -- Hypnosis
	[SpellName(373607)] = 6, -- Shadowy Barrier (Hypnosis)
	[SpellName(373509)] = 6, -- Shadow Claws (Stacking)
	-- Dragonflight Season 1
	[SpellName(396369)] = 6, -- Mark of Lightning
	[SpellName(396364)] = 6, -- Mark of Wind
----------------------------------------------------------
---------------- Dragonflight (Season 1) -----------------
----------------------------------------------------------
	-- Court of Stars
	[SpellName(207278)] = 3, -- Arcane Lockdown
	[SpellName(209516)] = 3, -- Mana Fang
	[SpellName(209512)] = 3, -- Disrupting Energy
	[SpellName(211473)] = 3, -- Shadow Slash
	[SpellName(207979)] = 3, -- Shockwave
	[SpellName(207980)] = 3, -- Disintegration Beam 1
	[SpellName(207981)] = 3, -- Disintegration Beam 2
	[SpellName(211464)] = 3, -- Fel Detonation
	[SpellName(208165)] = 3, -- Withering Soul
	[SpellName(209413)] = 3, -- Suppress
	[SpellName(209027)] = 3, -- Quelling Strike
	-- Halls of Valor
	[SpellName(197964)] = 3, -- Runic Brand Orange
	[SpellName(197965)] = 3, -- Runic Brand Yellow
	[SpellName(197963)] = 3, -- Runic Brand Purple
	[SpellName(197967)] = 3, -- Runic Brand Green
	[SpellName(197966)] = 3, -- Runic Brand Blue
	[SpellName(193783)] = 3, -- Aegis of Aggramar Up
	[SpellName(196838)] = 3, -- Scent of Blood
	[SpellName(199674)] = 3, -- Wicked Dagger
	[SpellName(193260)] = 3, -- Static Field
	[SpellName(193743)] = 3, -- Aegis of Aggramar Wielder
	[SpellName(199652)] = 3, -- Sever
	[SpellName(198944)] = 3, -- Breach Armor
	[SpellName(215430)] = 3, -- Thunderstrike 1
	[SpellName(215429)] = 3, -- Thunderstrike 2
	[SpellName(203963)] = 3, -- Eye of the Storm
	-- Shadowmoon Burial Grounds
	[SpellName(156776)] = 3, -- Rending Voidlash
	[SpellName(153692)] = 3, -- Necrotic Pitch
	[SpellName(153524)] = 3, -- Plague Spit
	[SpellName(154469)] = 3, -- Ritual of Bones
	[SpellName(162652)] = 3, -- Lunar Purity
	[SpellName(164907)] = 3, -- Void Cleave
	[SpellName(152979)] = 3, -- Soul Shred
	[SpellName(158061)] = 3, -- Blessed Waters of Purity
	[SpellName(154442)] = 3, -- Malevolence
	[SpellName(153501)] = 3, -- Void Blast
	-- Temple of the Jade Serpent
	[SpellName(396150)] = 3, -- Feeling of Superiority
	[SpellName(397878)] = 3, -- Tainted Ripple
	[SpellName(106113)] = 3, -- Touch of Nothingness
	[SpellName(397914)] = 3, -- Defiling Mist
	[SpellName(397904)] = 3, -- Setting Sun Kick
	[SpellName(397911)] = 3, -- Touch of Ruin
	[SpellName(395859)] = 3, -- Haunting Scream
	[SpellName(374037)] = 3, -- Overwhelming Rage
	[SpellName(396093)] = 3, -- Savage Leap
	[SpellName(106823)] = 3, -- Serpent Strike
	[SpellName(396152)] = 3, -- Feeling of Inferiority
	[SpellName(110125)] = 3, -- Shattered Resolve
	-- Ruby Life Pools
	[SpellName(392406)] = 3, -- Thunderclap
	[SpellName(372820)] = 3, -- Scorched Earth
	[SpellName(384823)] = 3, -- Inferno 1
	[SpellName(373692)] = 3, -- Inferno 2
	[SpellName(381862)] = 3, -- Infernocore
	[SpellName(372860)] = 3, -- Searing Wounds
	[SpellName(373869)] = 3, -- Burning Touch
	[SpellName(385536)] = 3, -- Flame Dance
	[SpellName(381518)] = 3, -- Winds of Change
	[SpellName(372858)] = 3, -- Searing Blows
	[SpellName(372682)] = 3, -- Primal Chill 1
	[SpellName(373589)] = 3, -- Primal Chill 2
	[SpellName(373693)] = 3, -- Living Bomb
	[SpellName(392924)] = 3, -- Shock Blast
	[SpellName(381515)] = 3, -- Stormslam
	[SpellName(396411)] = 3, -- Primal Overload
	[SpellName(384773)] = 3, -- Flaming Embers
	[SpellName(392451)] = 3, -- Flashfire
	[SpellName(372697)] = 3, -- Jagged Earth
	[SpellName(372047)] = 3, -- Flurry
	[SpellName(372963)] = 3, -- Chillstorm
	-- The Nokhud Offensive
	[SpellName(382628)] = 3, -- Surge of Power
	[SpellName(386025)] = 3, -- Tempest
	[SpellName(381692)] = 3, -- Swift Stab
	[SpellName(387615)] = 3, -- Grasp of the Dead
	[SpellName(387629)] = 3, -- Rotting Wind
	[SpellName(386912)] = 3, -- Stormsurge Cloud
	[SpellName(395669)] = 3, -- Aftershock
	[SpellName(384134)] = 3, -- Pierce
	[SpellName(388451)] = 3, -- Stormcaller's Fury 1
	[SpellName(388446)] = 3, -- Stormcaller's Fury 2
	[SpellName(395035)] = 3, -- Shatter Soul
	[SpellName(376899)] = 3, -- Crackling Cloud
	[SpellName(384492)] = 3, -- Hunter's Mark
	[SpellName(376730)] = 3, -- Stormwinds
	[SpellName(376894)] = 3, -- Crackling Upheaval
	[SpellName(388801)] = 3, -- Mortal Strike
	[SpellName(376827)] = 3, -- Conductive Strike
	[SpellName(376864)] = 3, -- Static Spear
	[SpellName(375937)] = 3, -- Rending Strike
	[SpellName(376634)] = 3, -- Iron Spear
	-- The Azure Vault
	[SpellName(388777)] = 3, -- Oppressive Miasma
	[SpellName(386881)] = 3, -- Frost Bomb
	[SpellName(387150)] = 3, -- Frozen Ground
	[SpellName(387564)] = 3, -- Mystic Vapors
	[SpellName(385267)] = 3, -- Crackling Vortex
	[SpellName(386640)] = 3, -- Tear Flesh
	[SpellName(374567)] = 3, -- Explosive Brand
	[SpellName(374523)] = 3, -- Arcane Roots
	[SpellName(375596)] = 3, -- Erratic Growth Channel
	[SpellName(375602)] = 3, -- Erratic Growth
	[SpellName(370764)] = 3, -- Piercing Shards
	[SpellName(384978)] = 3, -- Dragon Strike
	[SpellName(375649)] = 3, -- Infused Ground
	[SpellName(387151)] = 3, -- Icy Devastator
	[SpellName(377488)] = 3, -- Icy Bindings
	[SpellName(374789)] = 3, -- Infused Strike
	[SpellName(371007)] = 3, -- Splintering Shards
	[SpellName(375591)] = 3, -- Sappy Burst
	[SpellName(385409)] = 3, -- Ouch, ouch, ouch!
	-- Algeth'ar Academy
	[SpellName(389033)] = 3, -- Lasher Toxin
	[SpellName(391977)] = 3, -- Oversurge
	[SpellName(386201)] = 3, -- Corrupted Mana
	[SpellName(389011)] = 3, -- Overwhelming Power
	[SpellName(387932)] = 3, -- Astral Whirlwind
	[SpellName(396716)] = 3, -- Splinterbark
	[SpellName(388866)] = 3, -- Mana Void
	[SpellName(386181)] = 3, -- Mana Bomb
	[SpellName(388912)] = 3, -- Severing Slash
	[SpellName(377344)] = 3, -- Peck
	[SpellName(376997)] = 3, -- Savage Peck
	[SpellName(388984)] = 3, -- Vicious Ambush
	[SpellName(388544)] = 3, -- Barkbreaker
	[SpellName(377008)] = 3, -- Deafening Screech
----------------------------------------------------------
---------------- Dragonflight (Season 2) -----------------
----------------------------------------------------------
-- Brackenhide Hollow
-- Halls of Infusion
-- Neltharus
-- Uldaman: Legacy of Tyr
----------------------------------------------------------
---------------- Old Dungeons (Season 4) -----------------
----------------------------------------------------------
	-- Grimrail Depot
	[SpellName(162057)] = 3, -- Spinning Spear
	[SpellName(156357)] = 3, -- Blackrock Shrapnel
	[SpellName(160702)] = 3, -- Blackrock Mortar Shells
	[SpellName(160681)] = 3, -- Suppressive Fire
	[SpellName(166570)] = 3, -- Slag Blast (Stacking)
	[SpellName(164218)] = 3, -- Double Slash
	[SpellName(162491)] = 3, -- Acquiring Targets 1
	[SpellName(162507)] = 3, -- Acquiring Targets 2
	[SpellName(161588)] = 3, -- Diffused Energy
	[SpellName(162065)] = 3, -- Freezing Snare
	-- Iron Docks
	[SpellName(163276)] = 3, -- Shredded Tendons
	[SpellName(162415)] = 3, -- Time to Feed
	[SpellName(168398)] = 3, -- Rapid Fire Targeting
	[SpellName(172889)] = 3, -- Charging Slash
	[SpellName(164504)] = 3, -- Intimidated
	[SpellName(172631)] = 3, -- Knocked Down
	[SpellName(172636)] = 3, -- Slippery Grease
	[SpellName(158341)] = 3, -- Gushing Wounds
	[SpellName(167240)] = 3, -- Leg Shot
	[SpellName(173105)] = 3, -- Whirling Chains
	[SpellName(173324)] = 3, -- Jagged Caltrops
	[SpellName(172771)] = 3, -- Incendiary Slug
	[SpellName(173307)] = 3, -- Serrated Spear
	[SpellName(169341)] = 3, -- Demoralizing Roar
	-- Return to Karazhan: Upper
	[SpellName(229248)] = 3, -- Fel Beam
	[SpellName(227592)] = 3, -- Frostbite
	[SpellName(228252)] = 3, -- Shadow Rend
	[SpellName(227502)] = 3, -- Unstable Mana
	[SpellName(228261)] = 3, -- Flame Wreath
	[SpellName(229241)] = 3, -- Acquiring Target
	[SpellName(230083)] = 3, -- Nullification
	[SpellName(230221)] = 3, -- Absorbed Mana
	[SpellName(228249)] = 5, -- Inferno Bolt 1
	[SpellName(228958)] = 5, -- Inferno Bolt 2
	[SpellName(229159)] = 3, -- Chaotic Shadows
	[SpellName(227465)] = 3, -- Power Discharge
	[SpellName(229083)] = 3, -- Burning Blast (Stacking)
	-- Return to Karazhan: Lower
	[SpellName(227917)] = 3, -- Poetry Slam
	[SpellName(228164)] = 3, -- Hammer Down
	[SpellName(228215)] = 3, -- Severe Dusting 1
	[SpellName(228221)] = 3, -- Severe Dusting 2
	[SpellName(29690)] = 3, -- Drunken Skull Crack
	[SpellName(227493)] = 3, -- Mortal Strike
	[SpellName(228280)] = 3, -- Oath of Fealty
	[SpellName(29574)] = 3, -- Rend
	[SpellName(230297)] = 3, -- Brittle Bones
	[SpellName(228526)] = 3, -- Flirt
	[SpellName(227851)] = 3, -- Coat Check 1
	[SpellName(227832)] = 3, -- Coat Check 2
	[SpellName(32752)] = 3, -- Summoning Disorientation
	[SpellName(228559)] = 3, -- Charming Perfume
	[SpellName(227508)] = 3, -- Mass Repentance
	[SpellName(241774)] = 3, -- Shield Smash
	[SpellName(227742)] = 3, -- Garrote (Stacking)
	[SpellName(238606)] = 3, -- Arcane Eruption
	[SpellName(227848)] = 3, -- Sacred Ground (Stacking)
	[SpellName(227404)] = 3, -- Intangible Presence
	[SpellName(228610)] = 3, -- Burning Brand
	[SpellName(228576)] = 3, -- Allured
	-- Operation Mechagon
	[SpellName(291928)] = 3, -- Giga-Zap
	[SpellName(292267)] = 3, -- Giga-Zap
	[SpellName(302274)] = 3, -- Fulminating Zap
	[SpellName(298669)] = 3, -- Taze
	[SpellName(295445)] = 3, -- Wreck
	[SpellName(294929)] = 3, -- Blazing Chomp
	[SpellName(297257)] = 3, -- Electrical Charge
	[SpellName(294855)] = 3, -- Blossom Blast
	[SpellName(291972)] = 3, -- Explosive Leap
	[SpellName(285443)] = 3, -- 'Hidden' Flame Cannon
	[SpellName(291974)] = 3, -- Obnoxious Monologue
	[SpellName(296150)] = 3, -- Vent Blast
	[SpellName(298602)] = 3, -- Smoke Cloud
	[SpellName(296560)] = 3, -- Clinging Static
	[SpellName(297283)] = 3, -- Cave In
	[SpellName(291914)] = 3, -- Cutting Beam
	[SpellName(302384)] = 3, -- Static Discharge
	[SpellName(294195)] = 3, -- Arcing Zap
	[SpellName(299572)] = 3, -- Shrink
	[SpellName(300659)] = 3, -- Consuming Slime
	[SpellName(300650)] = 3, -- Suffocating Smog
	[SpellName(301712)] = 3, -- Pounce
	[SpellName(299475)] = 3, -- B.O.R.K
	[SpellName(293670)] = 3, -- Chain Blade	
-- Shadowlands Dungeons	
	-- Tazavesh, the Veiled Market
	[SpellName(350804)] = 3, -- Collapsing Energy
	[SpellName(350885)] = 3, -- Hyperlight Jolt
	[SpellName(351101)] = 3, -- Energy Fragmentation
	[SpellName(346828)] = 3, -- Sanitizing Field
	[SpellName(355641)] = 3, -- Scintillate
	[SpellName(355451)] = 3, -- Undertow
	[SpellName(355581)] = 3, -- Crackle
	[SpellName(349999)] = 3, -- Anima Detonation
	[SpellName(346961)] = 3, -- Purging Field
	[SpellName(351956)] = 3, -- High-Value Target
	[SpellName(346297)] = 3, -- Unstable Explosion
	[SpellName(347728)] = 3, -- Flock!
	[SpellName(356408)] = 3, -- Ground Stomp
	[SpellName(347744)] = 3, -- Quickblade
	[SpellName(347481)] = 3, -- Shuri
	[SpellName(355915)] = 3, -- Glyph of Restraint
	[SpellName(350134)] = 3, -- Infinite Breath
	[SpellName(350013)] = 3, -- Gluttonous Feast
	[SpellName(355465)] = 3, -- Boulder Throw
	[SpellName(346116)] = 3, -- Shearing Swings
	[SpellName(356011)] = 3, -- Beam Splicer

	-- Halls of Atonement
	[SpellName(335338)] = 3,	-- Ritual of Woe
	[SpellName(326891)] = 3,	-- Anguish
	[SpellName(329321)] = 3,	-- Jagged Swipe
	[SpellName(319603)] = 3,	-- Curse of Stone
	[SpellName(319611)] = 3,	-- Turned to Stone
	[SpellName(325876)] = 3,	-- Curse of Obliteration
	[SpellName(326632)] = 3,	-- Stony Veins
	[SpellName(323650)] = 3,	-- Haunting Fixation
	[SpellName(326874)] = 3,	-- Ankle Bites
	[SpellName(340446)] = 3,	-- Mark of Envy
	[SpellName(323437)] = 3,	-- Stigma of Pride

	-- Mists of Tirna Scithe
	[SpellName(325027)] = 3,	-- Bramble Burst
	[SpellName(323043)] = 3,	-- Bloodletting
	[SpellName(322557)] = 3,	-- Soul Split
	[SpellName(331172)] = 3,	-- Mind Link
	[SpellName(322563)] = 3,	-- Marked Prey
	[SpellName(322487)] = 3,	-- Overgrowth
	[SpellName(328756)] = 3,	-- Repulsive Visage
	[SpellName(325021)] = 3,	-- Mistveil Tear
	[SpellName(321891)] = 3,	-- Freeze Tag Fixation
	[SpellName(325224)] = 3,	-- Anima Injection
	[SpellName(326092)] = 3,	-- Debilitating Poison
	[SpellName(325418)] = 3,	-- Volatile Acid

	-- Plaguefall
	[SpellName(336258)] = 3,	-- Solitary Prey
	[SpellName(331818)] = 3,	-- Shadow Ambush
	[SpellName(329110)] = 3,	-- Slime Injection
	[SpellName(325552)] = 3,	-- Cytotoxic Slash
	[SpellName(336301)] = 3,	-- Web Wrap
	[SpellName(322358)] = 3,	-- Burning Strain
	[SpellName(322410)] = 3,	-- Withering Filth
	[SpellName(328180)] = 3,	-- Gripping Infection
	[SpellName(320542)] = 3,	-- Wasting Blight
	[SpellName(340355)] = 3,	-- Rapid Infection
	[SpellName(328395)] = 3,	-- Venompiercer
	[SpellName(320512)] = 3,	-- Corroded Claws
	[SpellName(333406)] = 3,	-- Assassinate
	[SpellName(332397)] = 3,	-- Shroudweb
	[SpellName(330069)] = 2,	-- Concentrated Plague
	[SpellName(319070)] = 3,	-- Corrosive Gunk

	-- The Necrotic Wake
	[SpellName(321821)] = 3,	-- Disgusting Guts
	[SpellName(323365)] = 3,	-- Clinging Darkness
	[SpellName(338353)] = 3,	-- Goresplatter
	[SpellName(333485)] = 3,	-- Disease Cloud
	[SpellName(338357)] = 3,	-- Tenderize
	[SpellName(328181)] = 3,	-- Frigid Cold
	[SpellName(320170)] = 3,	-- Necrotic Bolt
	[SpellName(323464)] = 3,	-- Dark Ichor
	[SpellName(323198)] = 3,	-- Dark Exile
	[SpellName(343504)] = 3,	-- Dark Grasp
	[SpellName(343556)] = 3,	-- Morbid Fixation
	[SpellName(324381)] = 3,	-- Chill Scythe
	[SpellName(320573)] = 3,	-- Shadow Well
	[SpellName(333492)] = 3,	-- Necrotic Ichor
	[SpellName(334748)] = 3,	-- Drain FLuids
	[SpellName(333489)] = 3,	-- Necrotic Breath
	[SpellName(320717)] = 3,	-- Blood Hunger
	[SpellName(320788)] = 3,	-- Frozen Binds
	[SpellName(320200)] = 3,	-- Stitchneedle

	-- Theater of Pain
	[SpellName(333299)] = 3,	-- Curse of Desolation
	[SpellName(319539)] = 3,	-- Soulless
	[SpellName(326892)] = 3,	-- Fixate
	[SpellName(321768)] = 3,	-- On the Hook
	[SpellName(323825)] = 3,	-- Grasping Rift
	[SpellName(342675)] = 3,	-- Bone Spear
	[SpellName(323831)] = 3,	-- Death Grasp
	[SpellName(330608)] = 3,	-- Vile Eruption
	[SpellName(330868)] = 3,	-- Necrotic Bolt Volley
	[SpellName(323750)] = 3,	-- Vile Gas
	[SpellName(323406)] = 3,	-- Jagged Gash
	[SpellName(330700)] = 3,	-- Decaying Blight
	[SpellName(319626)] = 3,	-- Phantasmal Parasite
	[SpellName(324449)] = 3,	-- Manifest Death
	[SpellName(341949)] = 3,	-- Withering Blight
	[SpellName(333861)] = 3,	-- Ricocheting Blade

	-- Sanguine Depths
	[SpellName(326827)] = 3,	-- Dread Bindings
	[SpellName(326836)] = 3,	-- Curse of Suppression
	[SpellName(322554)] = 3,	-- Castigate
	[SpellName(321038)] = 3,	-- Burden Soul
	[SpellName(328593)] = 3,	-- Agonize
	[SpellName(325254)] = 3,	-- Iron Spikes
	[SpellName(335306)] = 3,	-- Barbed Shackles
	[SpellName(322429)] = 3,	-- Severing Slice
	[SpellName(334653)] = 3,	-- Engorge
	[SpellName(327814)] = 3,	-- Wicked Gash

	-- Spires of Ascension
	[SpellName(338729)] = 3,	-- Charged Stomp
	[SpellName(323195)] = 3,	-- Purifying Blast
	[SpellName(327481)] = 3,	-- Dark Lance
	[SpellName(322818)] = 3,	-- Lost Confidence
	[SpellName(322817)] = 3,	-- Lingering Doubt
	[SpellName(324205)] = 3,	-- Blinding Flash
	[SpellName(331251)] = 3,	-- Deep Connection
	[SpellName(328331)] = 3,	-- Forced Confession
	[SpellName(341215)] = 3,	-- Volatile Anima
	[SpellName(323792)] = 3,	-- Anima Field
	[SpellName(317661)] = 3,	-- Insidious Venom
	[SpellName(330683)] = 3,	-- Raw Anima
	[SpellName(328434)] = 3,	-- Intimidated
	[SpellName(324154)] = 3,	-- Dark Stride

	-- De Other Side
	[SpellName(320786)] = 3,	-- Power Overwhelming
	[SpellName(334913)] = 3,	-- Master of Death
	[SpellName(325725)] = 3,	-- Cosmic Artifice
	[SpellName(328987)] = 3,	-- Zealous
	[SpellName(334496)] = 3,	-- Soporific Shimmerdust
	[SpellName(339978)] = 3,	-- Pacifying Mists
	[SpellName(323692)] = 3,	-- Arcane Vulnerability
	[SpellName(333250)] = 3,	-- Reaver
	[SpellName(330434)] = 3,	-- Buzz-Saw
	[SpellName(331847)] = 3,	-- W-00F
	[SpellName(327649)] = 3,	-- Crushed Soul
	[SpellName(331379)] = 3,	-- Lubricate
	[SpellName(332678)] = 3,	-- Gushing Wound
	[SpellName(322746)] = 3,	-- Corrupted Blood
	[SpellName(323687)] = 3,	-- Arcane Lightning
	[SpellName(323877)] = 3,	-- Echo Finger Laser X-treme
	[SpellName(334535)] = 3,	-- Beak Slice
	[SpellName(333711)] = 3,	-- Decrepit Bite
	[SpellName(320147)] = 3,	-- Bleeding

	-- 8.3 Mythic+
	[SpellName(314406)] = 3,	-- Crippling Pestilence
	[SpellName(314411)] = 3,	-- Lingering Doubt
	[SpellName(314467)] = 4,	-- Volatile Rupture
	[SpellName(314478)] = 5,	-- Cascading Terror
	[SpellName(314531)] = 3,	-- Tear Flesh
	[SpellName(314565)] = 3,	-- Defiled Ground
	[SpellName(314592)] = 3,	-- Mind Flay
	[SpellName(314308)] = 4,	-- Spirit Breaker

	-- Freehold
	[SpellName(258323)] = 3,	-- Infected Wound
	[SpellName(257775)] = 3,	-- Plague Step
	[SpellName(257908)] = 4,	-- Oiled Blade
	[SpellName(257436)] = 3,	-- Poisoning Strike
	[SpellName(274389)] = 3,	-- Rat Traps
	[SpellName(274555)] = 4,	-- Scabrous Bites
	[SpellName(258875)] = 4,	-- Blackout Barrel
	[SpellName(256363)] = 3,	-- Ripper Punch

	-- Shrine of the Storm
	[SpellName(264560)] = 3,	-- Choking Brine
	[SpellName(268233)] = 4,	-- Electrifying Shock
	[SpellName(268322)] = 3,	-- Touch of the Drowned
	[SpellName(268896)] = 3,	-- Mind Rend
	[SpellName(268104)] = 3,	-- Explosive Void
	[SpellName(267034)] = 5,	-- Whispers of Power
	[SpellName(276268)] = 3,	-- Heaving Blow
	[SpellName(264166)] = 3,	-- Undertow
	[SpellName(264526)] = 3,	-- Grasp of the Depths
	[SpellName(274633)] = 4,	-- Sundering Blow
	[SpellName(268214)] = 5,	-- Carving Flesh
	[SpellName(267818)] = 4,	-- Slicing Blast
	[SpellName(268309)] = 4,	-- Unending Darkness
	[SpellName(268317)] = 4,	-- Rip Mind
	[SpellName(268391)] = 3,	-- Mental Assault
	[SpellName(274720)] = 3,	-- Abyssal Strike
	[SpellName(269131)] = 4,	-- Ancient Mindbender

	-- Siege of Boralus
	[SpellName(257168)] = 4,	-- Cursed Slash
	[SpellName(272588)] = 4,	-- Rotting Wounds
	[SpellName(272571)] = 4,	-- Choking Waters
	[SpellName(274991)] = 3,	-- Putrid Waters
	[SpellName(275835)] = 4,	-- Stinging Venom Coating
	[SpellName(273930)] = 3,	-- Hindering Cut
	[SpellName(257292)] = 3,	-- Heavy Slash
	[SpellName(261428)] = 3,	-- Hangman's Noose
	[SpellName(256897)] = 3,	-- Clamping Jaws
	[SpellName(272874)] = 3,	-- Trample
	[SpellName(273470)] = 3,	-- Gut Shot
	[SpellName(272834)] = 3,	-- Viscous Slobber
	[SpellName(257169)] = 4,	-- Terrifying Roar
	[SpellName(272713)] = 3,	-- Crushing Slam

	-- Tol Dagor
	[SpellName(258128)] = 4,	-- Debilitating Shout
	[SpellName(265889)] = 3,	-- Torch Strike
	[SpellName(257791)] = 4,	-- Howling Fear
	[SpellName(258864)] = 3,	-- Suppression Fire
	[SpellName(257028)] = 4,	-- Fuselighter
	[SpellName(258917)] = 3,	-- Righteous Flames
	[SpellName(257777)] = 3,	-- Crippling Shiv
	[SpellName(258079)] = 4,	-- Massive Chomp
	[SpellName(258058)] = 4,	-- Squeeze
	[SpellName(260016)] = 4,	-- Itchy Bite
	[SpellName(257119)] = 5,	-- Sand Trap
	[SpellName(260067)] = 3,	-- Vicious Mauling
	[SpellName(258313)] = 3,	-- Handcuff
	[SpellName(259711)] = 3,	-- Lockdown
	[SpellName(256198)] = 3,	-- Azerite Rounds: Incendiary
	[SpellName(256101)] = 4,	-- Explosive Burst
	[SpellName(256044)] = 6,	-- Deadeye

	-- Waycrest Manor
	[SpellName(260703)] = 3,	-- Unstable Runic Mark
	[SpellName(263905)] = 3,	-- Marking Cleave
	[SpellName(265880)] = 4,	-- Dread Mark
	[SpellName(265882)] = 3,	-- Lingering Dread
	[SpellName(264105)] = 3,	-- Runic Mark
	[SpellName(264050)] = 4,	-- Infected Thorn
	[SpellName(261440)] = 4,	-- Virulent Pathogen
	[SpellName(263891)] = 4,	-- Grasping Thorns
	[SpellName(264378)] = 4,	-- Fragment Soul
	[SpellName(266035)] = 3,	-- Bone Splinter
	[SpellName(266036)] = 4,	-- Drain Essence
	[SpellName(260907)] = 5,	-- Soul Manipulation
	[SpellName(260741)] = 5,	-- Jagged Nettles
	[SpellName(264556)] = 3,	-- Tearing Strike
	[SpellName(265760)] = 5,	-- Thorned Barrage
	[SpellName(260551)] = 3,	-- Soul Thorns
	[SpellName(263943)] = 4,	-- Etch
	[SpellName(265881)] = 4,	-- Decaying Touch
	[SpellName(261438)] = 4,	-- Wasting Strike
	[SpellName(268202)] = 5,	-- Death Lens
	[SpellName(278456)] = 4,	-- Infest

	-- Atal'Dazar
	[SpellName(252781)] = 5,	-- Unstable Hex
	[SpellName(250096)] = 5,	-- Wracking Pain
	[SpellName(250371)] = 5,	-- Lingering Nausea
	[SpellName(253562)] = 3,	-- Wildfire
	[SpellName(255582)] = 4,	-- Molten Gold
	[SpellName(255041)] = 4,	-- Terrifying Screech
	[SpellName(255371)] = 4,	-- Terrifying Visage
	[SpellName(252687)] = 4,	-- Venomfang Strike
	[SpellName(254959)] = 5,	-- Soulburn
	[SpellName(255814)] = 5,	-- Rending Maul
	[SpellName(255421)] = 5,	-- Devour
	[SpellName(255434)] = 4,	-- Serrated Teeth
	[SpellName(256577)] = 5,	-- Soulfeast

	-- King's Rest
	[SpellName(270492)] = 4,	-- Hex
	[SpellName(267763)] = 4,	-- Wretched Discharge
	[SpellName(276031)] = 4,	-- Pit of Despair
	[SpellName(265773)] = 5,	-- Spit Gold
	[SpellName(270920)] = 5,	-- Seduction
	[SpellName(270865)] = 4,	-- Hidden Blade
	[SpellName(271564)] = 4,	-- Embalming Fluid
	[SpellName(270507)] = 4,	-- Poison Barrage
	[SpellName(267273)] = 4,	-- Poison Nova
	[SpellName(270003)] = 4,	-- Suppression Slam
	[SpellName(270084)] = 3,	-- Axe Barrage
	[SpellName(267618)] = 3,	-- Drain Fluids
	[SpellName(267626)] = 5,	-- Dessication
	[SpellName(270487)] = 4,	-- Severing Blade
	[SpellName(266238)] = 5,	-- Shattered Defenses
	[SpellName(266231)] = 5,	-- Severing Axe
	[SpellName(266191)] = 4,	-- Whirling Axes
	[SpellName(272388)] = 4,	-- Shadow Barrage
	[SpellName(271640)] = 4,	-- Dark Revelation
	[SpellName(268796)] = 5,	-- Impaling Spear

	-- Motherlode
	[SpellName(263074)] = 4,	-- Festering Bite
	[SpellName(280605)] = 4,	-- Brain Freeze
	[SpellName(257337)] = 4,	-- Shocking Claw
	[SpellName(270882)] = 5,	-- Blazing Azerite
	[SpellName(268797)] = 4,	-- Transmute: Enemy to Goo
	[SpellName(259856)] = 4,	-- Chemical Burn
	[SpellName(269302)] = 3,	-- Toxic Blades
	[SpellName(280604)] = 3,	-- Iced Spritzer
	[SpellName(257371)] = 4,	-- Tear Gas
	[SpellName(257544)] = 4,	-- Jagged Cut
	[SpellName(268846)] = 4,	-- Echo Blade
	[SpellName(262794)] = 5,	-- Energy Lash
	[SpellName(262513)] = 5,	-- Azerite Heartseeker
	[SpellName(260838)] = 5,	-- Homing Missle
	[SpellName(263637)] = 4,	-- Clothesline

	-- Temple of Sethraliss
	[SpellName(269686)] = 4,	-- Plague
	[SpellName(268013)] = 3,	-- Flame Shock
	[SpellName(268008)] = 4,	-- Snake Charm
	[SpellName(273563)] = 4,	-- Neurotoxin
	[SpellName(272657)] = 3,	-- Noxious Breath
	[SpellName(267027)] = 3,	-- Cytotoxin
	[SpellName(272699)] = 3,	-- Venomous Spit
	[SpellName(263371)] = 4,	-- Conduction
	[SpellName(272655)] = 4,	-- Scouring Sand
	[SpellName(263914)] = 4,	-- Blinding Sand
	[SpellName(263958)] = 5,	-- A Knot of Snakes
	[SpellName(266923)] = 4,	-- Galvanize
	[SpellName(268007)] = 4,	-- Heart Attack

	-- Underrot
	[SpellName(265468)] = 4,	-- Withering Curse
	[SpellName(278961)] = 4,	-- Decaying Mind
	[SpellName(259714)] = 4,	-- Decaying Spores
	[SpellName(272180)] = 4,	-- Death Bolt
	[SpellName(272609)] = 4,	-- Maddening Gaze
	[SpellName(269301)] = 4,	-- Putrid Blood
	[SpellName(265533)] = 4,	-- Blood Maw
	[SpellName(265019)] = 5,	-- Savage Cleave
	[SpellName(265377)] = 4,	-- Hooked Snare
	[SpellName(265625)] = 5,	-- Dark Omen
	[SpellName(260685)] = 3,	-- Taint of G'huun
	[SpellName(266107)] = 5,	-- Thirst for Blood
	[SpellName(260455)] = 3,	-- Serrated Fangs

	-- Operation: Mechagon
	[SpellName(291928)] = 3,	-- Giga-Zap
	[SpellName(302274)] = 3,	-- Fulminating Zap
	[SpellName(298669)] = 3,	-- Taze
	[SpellName(295445)] = 3,	-- Wreck
	[SpellName(294929)] = 3,	-- Blazing Chomp
	[SpellName(297257)] = 3,	-- Electrical Charge
	[SpellName(294855)] = 3,	-- Blossom Blast
	[SpellName(291972)] = 3,	-- Explosive Leap
	[SpellName(285443)] = 3,	-- "Hidden" Flame Cannon
	[SpellName(291974)] = 3,	-- Obnoxious Monologue
	[SpellName(296150)] = 3,	-- Vent Blast
	[SpellName(298602)] = 3,	-- Smoke Cloud
	[SpellName(296560)] = 3,	-- Clinging Static
	[SpellName(297283)] = 3,	-- Cave In
	[SpellName(291914)] = 3,	-- Cutting Beam
	[SpellName(302384)] = 3,	-- Static Discharge

-----------------------------------------------------------------
-- Ny'alotha, the Waking City
-----------------------------------------------------------------
	-- Wrathion, the Black Emperor
	[SpellName(306163)] = 3,	-- Incineration
	[SpellName(306015)] = 3,	-- Searing Armor
	-- Maut
	[SpellName(307806)] = 3,	-- Devour Magic
	[SpellName(307399)] = 3,	-- Shadow Wounds
	-- The Prophet Skitra
	[SpellName(308059)] = 3,	-- Shadow Shock
	-- Dark Inquisitor Xanesh
	[SpellName(311551)] = 3,	-- Abyssal Strike
	[SpellName(306311)] = 3,	-- Soul Flay
	-- The Hivemind
	[SpellName(313460)] = 3,	-- Nullification
	[SpellName(313461)] = 3,	-- Corrosion
	-- Shad'har the Insatiable
	-- Drest'agath
	-- Il'gynoth, Corruption Reborn
	-- Vexiona
	-- Ra-den the Despoiled
	-- Carapace of N'Zoth
	-- N'Zoth the Corruptor

-----------------------------------------------------------------
-- Eternal Palace
-----------------------------------------------------------------
	-- Abyssal Commander Sivara
	[SpellName(300701)] = 3,	-- Rimefrost
	[SpellName(300705)] = 3,	-- Septic Taint
	[SpellName(294847)] = 3,	-- Unstable Mixture
	[SpellName(295850)] = 3,	-- Delirious
	[SpellName(295421)] = 3,	-- Overflowing Venom
	[SpellName(295807)] = 3,	-- Frozen
	[SpellName(300883)] = 3,	-- Inversion Sickness
	[SpellName(295705)] = 3,	-- Toxic Bolt

	-- Blackwater Behemoth
	[SpellName(292127)] = 3,	-- Darkest Depths
	[SpellName(292138)] = 3,	-- Radiant Biomass
	[SpellName(292167)] = 3,	-- Toxic Spine
	[SpellName(301494)] = 3,	-- Piercing Barb

	-- Radiance of Azshara
	[SpellName(296566)] = 3,	-- Tide Fist
	[SpellName(296737)] = 3,	-- Arcane Bomb
	[SpellName(295920)] = 3,	-- Ancient Tempest
	[SpellName(296462)] = 3,	-- Squall Trap
	[SpellName(299152)] = 3,	-- Waterlogged

	-- Lady Ashvane
	[SpellName(296693)] = 3,	-- Waterlogged
	[SpellName(296725)] = 3,	-- Barnacle Bash
	[SpellName(296942)] = 3,	-- Arcing Azerite
	[SpellName(296752)] = 3,	-- Cutting Coral
	[SpellName(297333)] = 3,	-- Briny Bubble

	-- Orgozoa
	[SpellName(298156)] = 3,	-- Desensitizing Sting
	[SpellName(298306)] = 3,	-- Incubation Fluid

	-- The Queen’s Court
	[SpellName(301830)] = 3,	-- Pashmar's Touch
	[SpellName(296851)] = 3,	-- Fanatical Verdict
	[SpellName(297836)] = 3,	-- Potent Spark
	[SpellName(297586)] = 3,	-- Suffering
	[SpellName(304410)] = 3,	-- Repeat Performance
	[SpellName(299914)] = 3,	-- Frenetic Charge
	[SpellName(303306)] = 3,	-- Sphere of Influence
	[SpellName(300545)] = 3,	-- Mighty Rupture

	-- Za’qul
	[SpellName(295495)] = 3,	-- Mind Tether
	[SpellName(295249)] = 3,	-- Delirium Realm
	[SpellName(303819)] = 3,	-- Nightmare Pool
	[SpellName(293509)] = 3,	-- Manifest Nightmares
	[SpellName(295327)] = 3,	-- Shattered Psyche
	[SpellName(294545)] = 3,	-- Portal of Madness
	[SpellName(298192)] = 3,	-- Dark Beyond
	[SpellName(292963)] = 3,	-- Dread
	[SpellName(300133)] = 3,	-- Snapped

	-- Queen Azshara
	[SpellName(298781)] = 3,	-- Arcane Orb
	[SpellName(297907)] = 3,	-- Cursed Heart
	[SpellName(302999)] = 3,	-- Arcane Vulnerability
	[SpellName(302141)] = 3,	-- Beckon
	[SpellName(299276)] = 3,	-- Sanction
	[SpellName(303657)] = 3,	-- Arcane Burst
	[SpellName(298756)] = 3,	-- Serrated Edge
	[SpellName(301078)] = 3,	-- Charged Spear
	[SpellName(298014)] = 3,	-- Cold Blast
	[SpellName(298018)] = 3,	-- Frozen

-----------------------------------------------------------------
-- Crucible of Storms
-----------------------------------------------------------------
	-- The Restless Cabal
	[SpellName(282386)] = 3,	-- Aphotic Blast
	[SpellName(282384)] = 3,	-- Shear Mind
	[SpellName(282566)] = 3,	-- Promises of Power
	[SpellName(282561)] = 3,	-- Dark Herald
	[SpellName(282432)] = 3,	-- Crushing Doubt
	[SpellName(282589)] = 3,	-- Cerebral Assault
	[SpellName(292826)] = 3,	-- Mind Scramble

	-- Uu'nat, Harbinger of the Void
	[SpellName(284851)] = 3,	-- Touch of the End
	[SpellName(286459)] = 3,	-- Feedback: Void
	[SpellName(286457)] = 3,	-- Feedback: Ocean
	[SpellName(286458)] = 3,	-- Feedback: Storm
	[SpellName(285367)] = 3,	-- Piercing Gaze of N'Zoth
	[SpellName(284733)] = 3,	-- Embrace of the Void
	[SpellName(284722)] = 3,	-- Umbral Shell
	[SpellName(285345)] = 3,	-- Maddening Eyes of N'Zoth
	[SpellName(285477)] = 3,	-- Obscurity
	[SpellName(285652)] = 3,	-- Insatiable Torment

-----------------------------------------------------------------
-- Battle of Dazar'alor
-----------------------------------------------------------------
	-- Champion of the Light
	[SpellName(283573)] = 3,	-- Sacred Blade
	[SpellName(283617)] = 3,	-- Wave of Light
	[SpellName(283651)] = 3,	-- Blinding Faith
	[SpellName(284595)] = 3,	-- Penance
	-- [SpellName(283582)] = 3,	-- Consecration

	-- Grong
	[SpellName(285998)] = 3,	-- Ferocious Roar
	[SpellName(283069)] = 3,	-- Megatomic Fire
	[SpellName(285671)] = 3,	-- Crushed
	[SpellName(285875)] = 3,	-- Rending Bite

	-- Jadefire Masters
	[SpellName(282037)] = 3,	-- Rising Flames
	[SpellName(284374)] = 3,	-- Magma Trap
	[SpellName(285632)] = 3,	-- Stalking
	[SpellName(288151)] = 3,	-- Tested
	[SpellName(284089)] = 3,	-- Successful Defense
	[SpellName(286988)] = 3,	-- Searing Embers

	-- Opulence
	[SpellName(286501)] = 3,	-- Creeping Blaze
	[SpellName(283610)] = 3,	-- Crush
	[SpellName(289383)] = 3,	-- Chaotic Displacement
	[SpellName(285479)] = 3,	-- Flame Jet
	[SpellName(283063)] = 3,	-- Flames of Punishment
	[SpellName(283507)] = 3,	-- Volatile Charge

	-- Conclave of the Chosen
	[SpellName(284663)] = 3,	-- Bwonsamdi's Wrath
	[SpellName(282444)] = 3,	-- Lacerating Claws
	[SpellName(282592)] = 3,	-- Bleeding Wounds
	[SpellName(282209)] = 3,	-- Mark of Prey
	[SpellName(285879)] = 3,	-- Mind Wipe
	[SpellName(282135)] = 3,	-- Crawling Hex
	[SpellName(286060)] = 3,	-- Cry of the Fallen
	[SpellName(282447)] = 3,	-- Kimbul's Wrath
	[SpellName(282834)] = 3,	-- Kimbul's Wrath
	[SpellName(286811)] = 3,	-- Akunda's Wrath
	[SpellName(286838)] = 3,	-- Static Orb

	-- King Rastakhan
	[SpellName(284995)] = 3,	-- Zombie Dust
	[SpellName(285349)] = 3,	-- Plague of Fire
	[SpellName(285044)] = 3,	-- Toad Toxin
	[SpellName(284831)] = 3,	-- Scorching Detonation
	[SpellName(289858)] = 3,	-- Crushed
	[SpellName(284662)] = 3,	-- Seal of Purification
	[SpellName(285178)] = 3,	-- Serpent's Breath
	[SpellName(285010)] = 3,	-- Poison Toad Slime

	-- Mekkatorque
	[SpellName(288806)] = 3,	-- Gigavolt Blast
	[SpellName(289023)] = 3,	-- Enormous
	[SpellName(286646)] = 3,	-- Gigavolt Charge
	[SpellName(288939)] = 3,	-- Gigavolt Radiation
	[SpellName(284168)] = 3,	-- Shrunk
	[SpellName(286516)] = 3,	-- Anti-Tampering Shock
	[SpellName(284214)] = 3,	-- Trample

	-- Stormwall Blockade
	[SpellName(284369)] = 3,	-- Sea Storm
	[SpellName(284410)] = 3,	-- Tempting Song
	[SpellName(284405)] = 3,	-- Tempting Song
	[SpellName(284121)] = 3,	-- Thunderous Boom
	[SpellName(286680)] = 3,	-- Roiling Tides
	[SpellName(285000)] = 5,	-- Kelp-Wrapped

	-- Jaina
	[SpellName(285253)] = 3,	-- Ice Shard
	[SpellName(287993)] = 3,	-- Chilling Touch
	[SpellName(287365)] = 3,	-- Searing Pitch
	[SpellName(288038)] = 3,	-- Marked Target
	[SpellName(285254)] = 3,	-- Avalanche
	[SpellName(287626)] = 3,	-- Grasp of Frost
	[SpellName(287490)] = 3,	-- Frozen Solid
	[SpellName(287199)] = 3,	-- Ring of Ice
	[SpellName(288392)] = 3,	-- Vengeful Seas

-----------------------------------------------------------------
-- Uldir
-----------------------------------------------------------------
	-- Taloc
	[SpellName(270290)] = 5,	-- Blood Storm
	[SpellName(271296)] = 5,	-- Cudgel of Gore
	[SpellName(275270)] = 5,	-- Fixate
	[SpellName(271225)] = 4,	-- Plasma Discharge

	-- MOTHER
	[SpellName(268277)] = 3,	-- Purifying Flame
	[SpellName(268253)] = 3,	-- Surgical Beam
	[SpellName(268095)] = 3,	-- Cleansing Purge
	[SpellName(267787)] = 3,	-- Sundering Scalpel
	[SpellName(268198)] = 3,	-- Clinging Corruption
	[SpellName(267821)] = 3,	-- Defense Grid
	[SpellName(267787)] = 5,	-- Sanitizing Strike

	-- Fetid Devourer
	[SpellName(262313)] = 5,	-- Malodorous Miasma
	[SpellName(262292)] = 4,	-- Rotting Regurgitation
	[SpellName(262314)] = 3,	-- Putrid Paroxysm

	-- Zek'voz, Herald of N'zoth
	[SpellName(265237)] = 6,	-- Shatter
	[SpellName(265264)] = 5,	-- Void Lash
	[SpellName(265360)] = 5,	-- Roiling Deceit
	[SpellName(265662)] = 4,	-- Corruptor's Pact
	[SpellName(265646)] = 5,	-- Will of the Corruptor

	-- Vectis
	[SpellName(265127)] = 4,	-- Lingering Infection
	[SpellName(265178)] = 3,	-- Evolving Affliction
	[SpellName(265206)] = 5,	-- Immunosuppression
	[SpellName(265212)] = 5,	-- Gestate
	[SpellName(265129)] = 4,	-- Omega Vector

	-- Zul, Reborn
	[SpellName(273365)] = 4,	-- Dark Revelation
	[SpellName(273434)] = 5,	-- Pit of Despair
	[SpellName(274195)] = 3,	-- Corrupted Blood
	[SpellName(272018)] = 4,	-- Absorbed in Darkness

	-- Mythrax
	[SpellName(272336)] = 3,	-- Annihilation
	[SpellName(272536)] = 5,	-- Imminent Ruin
	[SpellName(274693)] = 4,	-- Essence Shear
	[SpellName(272407)] = 3,	-- Oblivion Sphere

	-- G'huun
	[SpellName(263436)] = 5,	-- Imperfect Physiology
	[SpellName(263227)] = 5,	-- Putrid Blood
	[SpellName(263372)] = 4,	-- Power Matrix
	[SpellName(272506)] = 4,	-- Explosive Corruption
	[SpellName(267409)] = 4,	-- Dark Bargain
	[SpellName(267430)] = 3,	-- Torment
	[SpellName(263235)] = 5,	-- Blood Feast
	[SpellName(270287)] = 3,	-- Blighted Ground

-----------------------------------------------------------------
-- Other
-----------------------------------------------------------------
	[SpellName(87023)] = 4,		-- Cauterize
	[SpellName(94794)] = 4,		-- Rocket Fuel Leak
	[SpellName(116888)] = 4,	-- Shroud of Purgatory
	[SpellName(121175)] = 2,	-- Orb of Power
}

-----------------------------------------------------------------
-- PvP
-----------------------------------------------------------------
if C.raidframe.plugins_pvp_debuffs == true then
	local PvPDebuffs = {
		-- Death Knight
		[SpellName(108194)] = 4,	-- Asphyxiate
		[SpellName(91797)] = 4,		-- Monstrous Blow (Mutated Ghoul)
		[SpellName(91800)] = 4,		-- Gnaw (Ghoul)
		[SpellName(287254)] = 4,	-- Dead of Winter
		[SpellName(47476)] = 3,		-- Strangulate
		-- Demon Hunter
		[SpellName(217832)] = 4,	-- Imprison
		[SpellName(211881)] = 4,	-- Fel Eruption
		[SpellName(179057)] = 4,	-- Chaos Nova
		[SpellName(205630)] = 4,	-- Illidan's Grasp
		[SpellName(207685)] = 4,	-- Sigil of Misery
		[SpellName(204490)] = 3,	-- Sigil of Silence
		-- Druid
		[SpellName(33786)] = 4,		-- Cyclone
		[SpellName(5211)] = 4,		-- Mighty Bash
		[SpellName(22570)] = 4,		-- Maim
		[SpellName(78675)] = 3,		-- Solar Beam
		[SpellName(339)] = 2,		-- Entangling Roots
		-- Hunter
		[SpellName(3355)] = 4,		-- Freezing Trap
		[SpellName(24394)] = 4,		-- Intimidation
		[SpellName(213691)] = 4,	-- Scatter Shot
		[SpellName(117526)] = 2,	-- Binding Shot
		-- Mage
		[SpellName(61305)] = 4,		-- Polymorph
		[SpellName(82691)] = 4,		-- Ring of Frost
		[SpellName(31661)] = 4,		-- Dragon's Breath
		[SpellName(122)] = 2,		-- Frost Nova
		-- Monk
		[SpellName(115078)] = 4,	-- Paralysis
		[SpellName(119381)] = 4,	-- Leg Sweep
		[SpellName(120086)] = 4,	-- Fists of Fury
		[SpellName(198898)] = 4,	-- Song of Chi-Ji
		-- Paladin
		[SpellName(20066)] = 4,		-- Repentance
		[SpellName(853)] = 4,		-- Hammer of Justice
		[SpellName(105421)] = 4,	-- Blinding Light
		-- Priest
		[SpellName(605)] = 4,		-- Dominate Mind
		[SpellName(8122)] = 4,		-- Psychic Scream
		[SpellName(64044)] = 4,		-- Psychic Horror
		[SpellName(205369)] = 4,	-- Mind Bomb
		[SpellName(87204)] = 4,		-- Sin and Punishment
		[SpellName(200196)] = 4,	-- Holy Word: Chastise
		[SpellName(15487)] = 3,		-- Silence
		-- Rogue
		[SpellName(6770)] = 4,		-- Sap
		[SpellName(2094)] = 4,		-- Blind
		[SpellName(1833)] = 4,		-- Cheap Shot
		[SpellName(408)] = 4,		-- Kidney Shot
		[SpellName(1776)] = 4,		-- Gouge
		[SpellName(1330)] = 3,		-- Garrote - Silence
		-- Shaman
		[SpellName(51514)] = 4,		-- Hex
		[SpellName(118905)] = 4,	-- Static Charge
		[SpellName(305485)] = 4,	-- Lightning Lasso
		-- Warlock
		[SpellName(118699)] = 4,	-- Fear
		[SpellName(6789)] = 4,		-- Mortal Coil
		[SpellName(5484)] = 4,		-- Howl of Terror
		[SpellName(6358)] = 4,		-- Seduction (Succubus)
		[SpellName(115268)] = 4,	-- Mesmerize (Shivarra)
		[SpellName(30283)] = 4,		-- Shadowfury
		-- Warrior
		[SpellName(46968)] = 4,		-- Shockwave
		[SpellName(132169)] = 4,	-- Storm Bolt
		[SpellName(194958)] = 4,	-- Intimidating Shout
	}

	tinsert(T.RaidBuffs["ALL"], {284402, "RIGHT", {1, 0, 0}, true})	-- Vampiric Touch (Don't dispel)
	tinsert(T.RaidBuffs["ALL"], {30108, "RIGHT", {1, 0, 0}, true})	-- Unstable Affliction (Don't dispel)

	for spell, prio in pairs(PvPDebuffs) do
		T.RaidDebuffs[spell] = prio
	end
end

T.RaidDebuffsReverse = {
	--[spellID] = true,			-- Spell name
}

T.RaidDebuffsIgnore = {
	[980] = true,			-- Agony
	[1943] = true,			-- Rupture
}

for _, spell in pairs(C.raidframe.plugins_aura_watch_list) do
	T.RaidDebuffs[SpellName(spell)] = 3
end