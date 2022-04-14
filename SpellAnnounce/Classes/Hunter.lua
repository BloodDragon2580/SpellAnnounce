local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Binding_Shot = {109248},
		Steel_Trap = {162488},
		Freezing_Trap = {187650},
		Intimidation = {19577},
		Scatter_Shot = {213691},
		Freezing_Arrow = {209789},
		Counter_Shot = {147362},
		Primal_Rage = {264667},
	}
	
	SentencesToAnnounce =
	{
		Binding_Shot = {L["Binding_Shot"]},
		Steel_Trap = {L["Steel_Trap"]},
		Freezing_Trap = {L["Freezing_Trap"]},
		Intimidation = {L["Intimidation"]},
		Scatter_Shot = {L["Scatter_Shot"]},
		Freezing_Arrow = {L["Freezing_Arrow"]},
		Counter_Shot = {L["interrupted"]},
		Primal_Rage = {L["Buff"]},		
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