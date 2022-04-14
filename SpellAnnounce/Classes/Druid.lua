local myName, me = ...
local L = me.L

local function OnEvent(self, event, ...)

    IDsOfSpellToAnnounce  =
	{
		Incapacitating_Roar = {99},  -- https://www.wowhead.com/spell=99/incapacitating-roar
		Solar_Beam = {78675},  -- https://www.wowhead.com/spell=78675/solar-beam
		Ursols_Vortex = {102793},  -- https://www.wowhead.com/spell=102793/ursols-vortex
		Typhoon = {132469},  -- https://www.wowhead.com/spell=132469/typhoon
		Mass_Enanglement = {102359},  -- https://www.wowhead.com/spell=102359/mass-entanglement
		Mighty_Bash = {5211},  -- https://www.wowhead.com/spell=5211/mighty-bash
		Maim = {22570},  -- https://tbc.wowhead.com/spell=22570/maim
		Entangling_Roots = {339},  -- https://tbc.wowhead.com/spell=339/entangling-roots
		Cyclone = {33786},  -- https://tbc.wowhead.com/spell=33786/cyclone
	}
	
	SentencesToAnnounce =
	{
		Incapacitating_Roar = {L["Incapacitating_Roar"]},
		Ursols_Vortex = {L["Ursols_Vortex"]},
		Typhoon = {L["Typhoon"]},
		Mass_Enanglement = {L["Mass_Enanglement"]},
		Mighty_Bash = {L["Mighty_Bash"]},
		Maim = {L["Maim"]},
		Entangling_Roots = {L["Entangling_Roots"]},
		Cyclone = {L["Cyclone"]},
		Solar_Beam = {L["interrupted"]},
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