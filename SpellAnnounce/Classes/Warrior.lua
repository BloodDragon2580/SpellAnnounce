local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Shockwave = {46968},  -- https://www.wowhead.com/spell=46968/shockwave
		Intimidating_Shout = {5246},  -- https://www.wowhead.com/spell=5246/intimidating-shout
		Storm_Bolt = {107570},  -- https://www.wowhead.com/spell=107570/storm-bolt
		Pummel = {6552},  -- https://www.wowhead.com/spell=6552/pummel
	}
	
	SentencesToAnnounce =
	{
		Shockwave = {L["Shockwave"]},
		Intimidating_Shout = {L["Intimidating_Shout"]},
		Storm_Bolt = {L["Storm_Bolt"]},
		Pummel = {L["interrupted"]},
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