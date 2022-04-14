local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Dragons_Breath = {31661},  -- https://tbc.wowhead.com/spell=31661/dragons-breath
		Ring_of_Frost = {113724},  -- https://www.wowhead.com/spell=113724/ring-of-frost
		Polymorph = {118},  -- https://www.wowhead.com/spell=118/polymorph
		Time_Warp = {80353},  -- https://www.wowhead.com/spell=80353/time-warp
		Counterspell = {2139},  -- https://www.wowhead.com/spell=2139/counterspell
	}
	
	SentencesToAnnounce =
	{
		Dragons_Breath = {L["Dragons_Breath"]},
		Ring_of_Frost = {L["Ring_of_Frost"]},
		Polymorph = {L["Polymorph"]},
		Time_Warp = {L["Buff"]},
		Counterspell = {L["interrupted"]},
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