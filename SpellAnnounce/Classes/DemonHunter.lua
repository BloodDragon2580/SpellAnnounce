local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Darkness = {196718},  -- https://www.wowhead.com/spell=196718/darkness
		Sigil_of_Silence = {202137},  -- https://www.wowhead.com/spell=202137/sigil-of-silence
		Sigil_of_Misery = {207684},  -- https://www.wowhead.com/spell=207684/sigil-of-misery
		Fel_Eruption = {211881},  -- https://www.wowhead.com/spell=211881/fel-eruption
		Illidans_Grasp = {205630},  -- https://www.wowhead.com/spell=205630/illidans-grasp
		Demonic_Trample = {205629},  -- https://www.wowhead.com/spell=205629/demonic-trample
		Disrupt = {183752},  -- https://www.wowhead.com/spell=183752/disrupt
	}
	
	SentencesToAnnounce =
	{
		Darkness = {L["Darkness"]},
		Sigil_of_Silence = {L["Sigil_of_Silence"]},
		Sigil_of_Misery = {L["Sigil_of_Misery"]},
		Fel_Eruption = {L["Fel_Eruption"]},
		Illidans_Grasp = {L["Illidans_Grasp"]},
		Demonic_Trample = {L["Demonic_Trample"]},
		Disrupt = {L["interrupted"]},
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