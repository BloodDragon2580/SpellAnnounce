local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Capacitor_Totem = {192058},  -- https://www.wowhead.com/spell=192058/capacitor-totem
		Hex = {51514},  -- https://www.wowhead.com/spell=51514/hex
		Thunderstorm = {51490},  -- https://www.wowhead.com/spell=51490/thunderstorm
		Lightning_Lasso = {305483},  -- https://www.wowhead.com/spell=305483/lightning-lasso
		Bloodlust = {2825},  -- https://tbc.wowhead.com/spell=2825/bloodlust
		Heroism = {32182},  -- https://tbc.wowhead.com/spell=32182/heroism
		Wind_Shear = {57994},  -- https://www.wowhead.com/spell=57994/wind-shear
	}
	
	SentencesToAnnounce =
	{
		Capacitor_Totem = {L["Capacitor_Totem"]},
		Hex = {L["Hex"]},
		Thunderstorm = {L["Thunderstorm"]},
		Lightning_Lasso = {L["Lightning_Lasso"]},
		Bloodlust = {L["Buff"]},
		Heroism = {L["Buff"]},
		Wind_Shear = {L["interrupted"]},
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