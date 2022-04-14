local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Abomination_Limb = {315443},
		Fodder_to_the_Flame = {329554},
		Adaptive_Swarm = {325727},
		Death_Chakram = {325028},
		Deathborne = {324220},
		Bonedust_Brew = {325216},
		Vanquishers_Hammer = {328204},
		Unholy_Nova = {324724},
		Serrated_Bone_Spike = {328547},
		Primordial_Wave = {326059},
		Decimating_Bolt = {325289},
		Conquerors_Banner = {324143},
	}
	
	SentencesToAnnounce =
	{
		Abomination_Limb = {L["Abomination_Limb"]},
		Fodder_to_the_Flame = {L["Fodder_to_the_Flame"]},
		Adaptive_Swarm = {L["Adaptive_Swarm"]},
		Death_Chakram = {L["Death_Chakram"]},
		Deathborne = {L["Deathborne"]},
		Bonedust_Brew = {L["Bonedust_Brew"]},
		Vanquishers_Hammer = {L["Vanquishers_Hammer"]},
		Unholy_Nova = {L["Unholy_Nova"]},
		Serrated_Bone_Spike = {L["Serrated_Bone_Spike"]},
		Primordial_Wave = {L["Primordial_Wave"]},
		Decimating_Bolt = {L["Decimating_Bolt"]},
		Conquerors_Banner = {L["Conquerors_Banner"]},
	}
	
	if ( event == "PLAYER_LOGIN" ) then
		self:UnregisterEvent("PLAYER_LOGIN");
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	elseif (event == "COMBAT_LOG_EVENT_UNFILTERED") then

		local _, eventType, _, _, sourceName, _, _, _, _, _, _, spellID, _, _, _ = CombatLogGetCurrentEventInfo()
		
		if (eventType == "SPELL_CAST_SUCCESS") and sourceName == UnitName("player") then
			for index, value in pairs(IDsOfSpellToAnnounce) do
				IDOfSpellCastedByPlayer = IDsOfSpellToAnnounce[index][1]
				if IDOfSpellCastedByPlayer == spellID then
					SentenceForSpellCastedByPlayer = SentencesToAnnounce[index][1]
					PlayerIsInInstance, _ = IsInInstance()
					if PlayerIsInInstance then
						Message = (SentenceForSpellCastedByPlayer .. " " ..GetSpellLink(spellID))
						SendChatMessage(Message, "YELL")
					else
						Message = ("says: " ..SentenceForSpellCastedByPlayer .. " " ..GetSpellLink(spellID))
						SendChatMessage(Message, "EMOTE")
					end
				end
			end
		end
	end
end

local SpellAnnounce = CreateFrame("Frame")
SpellAnnounce:RegisterEvent("PLAYER_LOGIN")
SpellAnnounce:SetScript("OnEvent", OnEvent)