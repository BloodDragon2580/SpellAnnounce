local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Shackle_the_Unworthy = {312202},
		Elysian_Decree = {306830},
		Kindred_Spirits = {326434},
		Resonating_Arrow = {308491},
		Radiant_Spark = {307443},
		Weapons_of_Order = {310454},
		Divine_Toll = {304971},
		Boon_of_the_Ascended = {325013},
		Echoing_Reprimand = {323547},
		Vesper_Totem = {324386},
		Scouring_Tithe = {312321},
		Spear_of_Bastion = {307865},
	}
	
	SentencesToAnnounce =
	{
		Shackle_the_Unworthy = {L["Shackle_the_Unworthy"]},
		Elysian_Decree = {L["Elysian_Decree"]},
		Kindred_Spirits = {L["Kindred_Spirits"]},
		Resonating_Arrow = {L["Resonating_Arrow"]},
		Radiant_Spark = {L["Radiant_Spark"]},
		Weapons_of_Order = {L["Weapons_of_Order"]},
		Divine_Toll = {L["Divine_Toll"]},
		Boon_of_the_Ascended = {L["Boon_of_the_Ascended"]},
		Echoing_Reprimand = {L["Echoing_Reprimand"]},
		Vesper_Totem = {L["Vesper_Totem"]},
		Scouring_Tithe = {L["Scouring_Tithe"]},
		Spear_of_Bastion = {L["Spear_of_Bastion"]},
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