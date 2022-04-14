local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Gorefiends_Grasp = {108199},  -- https://www.wowhead.com/spell=108199/gorefiends-grasp
		Blinding_Sleet = {207167},  -- https://www.wowhead.com/spell=207167/blinding-sleet
		Asphyxiate = {221562},  -- https://www.wowhead.com/spell=221562/asphyxiate
		Strangulate = {47476},  -- https://www.wowhead.com/spell=47476/strangulate
		Mind_Freeze = {47528},  -- https://www.wowhead.com/spell=47528/mind-freeze
	}
	
	SentencesToAnnounce =
	{
		Gorefiends_Grasp = {L["Gorefiends_Grasp"]},
		Blinding_Sleet = {L["Blinding_Sleet"]},
		Asphyxiate = {L["Asphyxiate"]},
		Strangulate = {L["Strangulate"]},
		Mind_Freeze = {L["interrupted"]},
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