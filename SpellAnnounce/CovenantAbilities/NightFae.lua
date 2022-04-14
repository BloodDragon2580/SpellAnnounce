local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Deaths_Due = {324128},
		The_Hunt = {323639},
		Convoke_the_Spirits = {323764},
		Wild_Spirits = {328231},
		Shifting_Power = {314791},
		Faeline_Stomp = {327104},
		Blessing_of_the_Seasons = {328278},
		Fae_Guardians = {327661},
		Sepsis = {328305},
		Fae_Transfusion = {328923},
		Soul_Rot = {325640},
		Ancient_Aftershock = {325886},
	}
	
	SentencesToAnnounce =
	{
		Deaths_Due = {L["Deaths_Due"]},
		The_Hunt = {L["The_Hunt"]},
		Convoke_the_Spirits = {L["Convoke_the_Spirits"]},
		Wild_Spirits = {L["Wild_Spirits"]},
		Shifting_Power = {L["Shifting_Power"]},
		Faeline_Stomp = {L["Faeline_Stomp"]},
		Blessing_of_the_Seasons = {L["Blessing_of_the_Seasons"]},
		Fae_Guardians = {L["Fae_Guardians"]},
		Sepsis = {L["Sepsis"]},
		Fae_Transfusion = {L["Fae_Transfusion"]},
		Soul_Rot = {L["Soul_Rot"]},
		Ancient_Aftershock = {L["Ancient_Aftershock"]},
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