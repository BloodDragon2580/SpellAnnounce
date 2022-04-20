if (GetLocale() ~= "deDE") then return end
local myName, me = ...
local L = me.L
-----------------------------------------------------------
-----------------------------------------------------------
--Für den Anfang sind alle Zauber gleich bis			 --
--ich die richtigen Sätze/Worte habe die man nutzen kann --
--Bei fehlenden Spells oder Unterbrechungen bitte auf	 --
--Github schreiben.	Am besten Spell Name und ID			 --
--In progress											 --
-----------------------------------------------------------
-----------------------------------------------------------



------------------------Says Start------------------------
L["says: "] = "sagt: "
-------------------------Says End-------------------------



------------------------Buffs Start------------------------
L["Buff"] = "Aktiviert "
-------------------------Buffs End-------------------------



------------------------Items Start------------------------
L["Drums"] = "Aktiviert die "
-------------------------Items End-------------------------



----------------------Interrupt Start----------------------
L["interrupted"] = "Nutzt"
-----------------------Interrupt End-----------------------



--------------Covenant Abilities Kyrian Start--------------
L["Shackle_the_Unworthy"] = "Aktiviert "
L["Elysian_Decree"] = "Aktiviert "
L["Kindred_Spirits"] = "Aktiviert "
L["Resonating_Arrow"] = "Aktiviert "
L["Radiant_Spark"] = "Aktiviert "
L["Weapons_of_Order"] = "Aktiviert "
L["Divine_Toll"] = "Aktiviert "
L["Boon_of_the_Ascended"] = "Aktiviert "
L["Echoing_Reprimand"] = "Aktiviert "
L["Vesper_Totem"] = "Aktiviert "
L["Scouring_Tithe"] = "Aktiviert "
L["Spear_of_Bastion"] = "Aktiviert "
--------------Covenant Abilities Kyrian End---------------

--------------Covenant Abilities Necrolord Start----------
L["Abomination_Limb"] = "Aktiviert "
L["Fodder_to_the_Flame"] = "Aktiviert "
L["Adaptive_Swarm"] = "Aktiviert "
L["Death_Chakram"] = "Aktiviert "
L["Deathborne"] = "Aktiviert "
L["Bonedust_Brew"] = "Aktiviert "
L["Vanquishers_Hammer"] = "Aktiviert "
L["Unholy_Nova"] = "Aktiviert "
L["Serrated_Bone_Spike"] = "Aktiviert "
L["Primordial_Wave"] = "Aktiviert "
L["Decimating_Bolt"] = "Aktiviert "
L["Conquerors_Banner"] = "Aktiviert "
--------------Covenant Abilities Necrolord End------------

--------------Covenant Abilities NightFae Start-----------
L["Deaths_Due"] = "Aktiviert "
L["The_Hunt"] = "Aktiviert "
L["Convoke_the_Spirits"] = "Aktiviert "
L["Wild_Spirits"] = "Aktiviert "
L["Shifting_Power"] = "Aktiviert "
L["Faeline_Stomp"] = "Aktiviert "
L["Blessing_of_the_Seasons"] = "Aktiviert "
L["Fae_Guardians"] = "Aktiviert "
L["Sepsis"] = "Aktiviert "
L["Fae_Transfusion"] = "Aktiviert "
L["Soul_Rot"] = "Aktiviert "
L["Ancient_Aftershock"] = "Aktiviert "
--------------Covenant Abilities NightFae End-------------

--------------Covenant Abilities Venthyr Start------------
L["Swarming_Mist"] = "Aktiviert "
L["Sinful_Brand"] = "Aktiviert "
L["Ravenous_Frenzy"] = "Aktiviert "
L["Flayed_Shot"] = "Aktiviert "
L["Mirrors_of_Torment"] = "Aktiviert "
L["Fallen_Order"] = "Aktiviert "
L["Ashen_Hallow"] = "Aktiviert "
L["Mindgames"] = "Aktiviert "
L["Flagellation"] = "Aktiviert "
L["Chain_Harvest"] = "Aktiviert "
L["Impending_Catastrophe"] = "Aktiviert "
L["Condemn"] = "Aktiviert "
--------------Covenant Abilities Venthyr End--------------



---------------------DeathKnight Start---------------------
L["Gorefiends_Grasp"] = "Aktiviert "
L["Blinding_Sleet"] = "Aktiviert "
L["Asphyxiate"] = "Aktiviert "
L["Strangulate"] = "Aktiviert "
----------------------DeathKnight End----------------------



---------------------DemonHunter Start---------------------
L["Darkness"] = "Aktiviert "
L["Sigil_of_Silence"] = "Aktiviert "
L["Sigil_of_Misery"] = "Aktiviert "
L["Fel_Eruption"] = "Benutzt"
L["Illidans_Grasp"] = "Aktiviert "
L["Demonic_Trample"] = "Aktiviert "
----------------------DemonHunter End----------------------



------------------------Druid Start------------------------
L["Incapacitating_Roar"] = "Aktiviert "
L["Ursols_Vortex"] = "Aktiviert "
L["Typhoon"] = "Aktiviert "
L["Mass_Enanglement"] = "Aktiviert "
L["Mighty_Bash"] = "Aktiviert "
L["Maim"] = "Aktiviert "
L["Entangling_Roots"] = "Aktiviert "
L["Cyclone"] = "Aktiviert "
-------------------------Druid End-------------------------



------------------------Hunter Start-----------------------
L["Binding_Shot"] = "Aktiviert "
L["Steel_Trap"] = "Aktiviert "
L["Freezing_Trap"] = "Aktiviert "
L["Intimidation"] = "Aktiviert "
L["Scatter_Shot"] = "Aktiviert "
L["Freezing_Arrow"] = "Aktiviert "
-------------------------Hunter End------------------------



-------------------------Mage Start------------------------
L["Dragons_Breath"] = "Aktiviert "
L["Ring_of_Frost"] = "Aktiviert "
L["Polymorph"] = "Aktiviert "
--------------------------Mage End-------------------------



-------------------------Monk Start------------------------
L["Leg_Sweep"] = "Aktiviert "
L["Ring_of_Peace"] = "Aktiviert "
L["Paralysis"] = "Aktiviert "
--------------------------Monk End-------------------------


------------------------Paladin Start----------------------
L["Blinding_Light"] = "Aktiviert "
L["Hammer_of_Justice"] = "Aktiviert "
L["Repentance"] = "Aktiviert "
-------------------------Paladin End-----------------------



------------------------Priest Start-----------------------
L["Mind_Bomb"] = "Aktiviert "
L["Psychic_Scream"] = "Aktiviert "
L["Holy_Word"] = "Aktiviert "
L["Mind_Control"] = "Aktiviert "
L["Power_Word_Barrier"] = "Kommt in die Kuppel"
-------------------------Priest End------------------------



-------------------------Rogue Start-----------------------
L["Blind"] = "Aktiviert "
L["Sap"] = "Aktiviert "
L["Cheap_Shot"] = "Aktiviert "
L["Kidney_Shot"] = "Aktiviert "
L["Between_the_Eyes"] = "Aktiviert "
L["Gouge"] = "Aktiviert "
-------------------------Rogue End-------------------------



------------------------Schaman Start----------------------
L["Capacitor_Totem"] = "Aktiviert "
L["Hex"] = "Aktiviert "
L["Thunderstorm"] = "Aktiviert "
L["Lightning_Lasso"] = "Aktiviert "
L["Bloodlust"] = "Aktiviert "
L["Heroism"] = "Aktiviert "
------------------------Schaman End------------------------



-------------------------Warlock Start---------------------
L["Shadowfury"] = "Aktiviert "
L["Meteor_Strike"] = "Aktiviert "
L["Fear"] = "Aktiviert "
L["Banish"] = "Aktiviert "
L["Mortal_Coil"] = "Aktiviert "
L["Seduction"] = "Aktiviert "
-------------------------Warlock End-----------------------



-------------------------Warrior Start---------------------
L["Shockwave"] = "Aktiviert "
L["Intimidating_Shout"] = "Aktiviert "
L["Storm_Bolt"] = "Aktiviert "
-------------------------Warrior End-----------------------