local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Mind_Bomb = {205369},  -- https://www.wowhead.com/spell=205369/mind-bomb
		Psychic_Scream = {8122},  -- https://www.wowhead.com/spell=8122/psychic-scream
		Holy_Word = {88625},  -- https://www.wowhead.com/spell=88625/holy-word-chastise
		Mind_Control = {605},  -- https://www.wowhead.com/spell=605/mind-control
		Silence = {15487},  -- https://www.wowhead.com/spell=15487/silence
	}
	
	SentencesToAnnounce =
	{
		Mind_Bomb = {L["Mind_Bomb"]},
		Psychic_Scream = {L["Psychic_Scream"]},
		Holy_Word = {L["Holy_Word"]},
		Mind_Control = {L["Mind_Control"]},
		Silence = {L["interrupted"]},
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
						Message = (L["says: "] ..SentenceForSpellCastedByPlayer .. " " ..GetSpellLink(spellID))
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