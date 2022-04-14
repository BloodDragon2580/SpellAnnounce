local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Swarming_Mist = {311648},
		Sinful_Brand = {317009},
		Ravenous_Frenzy = {323546},
		Flayed_Shot = {324149},
		Mirrors_of_Torment = {314793},
		Fallen_Order = {326860},
		Ashen_Hallow = {316958},
		Mindgames = {323673},
		Flagellation = {323654},
		Chain_Harvest = {320674},
		Impending_Catastrophe = {321792},
		Condemn = {317349},
	}
	
	SentencesToAnnounce =
	{
		Swarming_Mist = {L["Swarming_Mist"]},
		Sinful_Brand = {L["Sinful_Brand"]},
		Ravenous_Frenzy = {L["Ravenous_Frenzy"]},
		Flayed_Shot = {L["Flayed_Shot"]},
		Mirrors_of_Torment = {L["Mirrors_of_Torment"]},
		Fallen_Order = {L["Fallen_Order"]},
		Ashen_Hallow = {L["Ashen_Hallow"]},
		Mindgames = {L["Mindgames"]},
		Flagellation = {L["Flagellation"]},
		Chain_Harvest = {L["Chain_Harvest"]},
		Impending_Catastrophe = {L["Impending_Catastrophe"]},
		Condemn = {L["Condemn"]},
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