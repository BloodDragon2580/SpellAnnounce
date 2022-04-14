local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Drums_of_Deathly_Ferocity = {309658},  -- https://www.wowhead.com/item=172233/drums-of-deathly-ferocity
		Drums_of_the_Maelstrom = {256791},  -- https://www.wowhead.com/spell=256791/drums-of-the-maelstrom
		Drums_of_Fury = {178208},  -- https://www.wowhead.com/spell=178208/drums-of-fury
		Drums_of_the_Mountain = {230935},  -- https://www.wowhead.com/spell=230935/drums-of-the-mountain
		Drums_of_Rage = {146613},  -- https://www.wowhead.com/spell=146613/drums-of-rage
	}
	
	SentencesToAnnounce =
	{
		Drums_of_Deathly_Ferocity = {L["Drums"]},
		Drums_of_the_Maelstrom = {L["Drums"]},
		Drums_of_Fury = {L["Drums"]},
		Drums_of_the_Mountain = {L["Drums"]},
		Drums_of_Rage = {L["Drums"]},
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