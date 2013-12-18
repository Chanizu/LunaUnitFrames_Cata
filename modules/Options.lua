LunaOptionsModule = {}

local OptionsPageNames = {{title = "Player Frame", frame = "LunaPlayerFrame"},
						{title = "Pet Frame", frame = "LunaPetFrame"},
						{title = "Target Frame", frame = "LunaTargetFrame"},
						{title = "Target Target Frame", frame = "LunaTargetTargetFrame"},
						{title = "Party Frames", frame = "LunaPartyFrames"},
						{title = "Party Pets Frame", frame = "LunaPartyPetFrames"},
						{title = "Raid Frames", frame = "LunaUnitFrames.frames.RaidFrames"}
						}

local function ResetSettings()
	LunaOptions = {}
	LunaOptions.ClassColors = {	Warrior = {0.78, 0.61, 0.43},
						Mage = {0.41, 0.8, 0.94},
						Rogue = {1, 0.96, 0.41},
						Druid = {1, 0.49, 0.04},
						Hunter = {0.67, 0.83, 0.45},
						Shaman = {0.96, 0.55, 0.73},
						Priest = {1, 1, 1},
						Warlock = {0.58, 0.51, 0.79},
						Paladin = {0.96, 0.55, 0.73}
						}
	LunaOptions.PowerColors = {
		["Mana"] = { 48/255, 113/255, 191/255}, -- Mana
		["Rage"] = { 226/255, 45/255, 75/255}, -- Rage
		["Focus"] = { 255/255, 178/255, 0}, -- Focus
		["Energy"] = { 1, 1, 34/255}, -- Energy
		["Happiness"] = { 0, 1, 1} -- Happiness
	}
	LunaOptions.MiscColors = {
		["tapped"] = {0.5, 0.5, 0.5},
		["red"] = {0.90, 0.0, 0.0},
		["green"] = {0.20, 0.90, 0.20},
		["static"] = {0.70, 0.20, 0.90},
		["yellow"] = {0.93, 0.93, 0.0},
		["inc"] = {0, 0.35, 0.23},
		["enemyUnattack"] = {0.60, 0.20, 0.20},
		["hostile"] = {0.90, 0.0, 0.0},
		["friendly"] = {0.20, 0.90, b = 0.20},
		["neutral"] = {0.93, 0.93, b = 0.0},
		["offline"] = {0.50, 0.50, b = 0.50}
	}
	LunaOptions.backdrop = {
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background", tile = true, tileSize = 16,
		insets = {left = -1.5, right = -1.5, top = -1.5, bottom = -1.5},
	}
	LunaOptions.fontHeight = 11
	LunaOptions.font = "Interface\\AddOns\\LunaUnitFrames\\media\\barframes.ttf"
	LunaOptions.statusbartexture = "Interface\\AddOns\\LunaUnitFrames\\media\\statusbar"
	LunaOptions.bordertexture = "Interface\\AddOns\\LunaUnitFrames\\media\\border"
	LunaOptions.icontexture = "Interface\\AddOns\\LunaUnitFrames\\media\\icon"
		
	LunaOptions.frames = {	["LunaPlayerFrame"] = {position = {x = 10, y = -20}, size = {x = 240, y = 40}, scale = 1, enabled = 1, ShowBuffs = 1},
							["LunaTargetFrame"] = {position = {x = 280, y = -20}, size = {x = 240, y = 40}, scale = 1, enabled = 1, ShowBuffs = 3},
							["LunaTargetTargetFrame"] = {position = {x = 550, y = -20}, size = {x = 150, y = 40}, scale = 1, enabled = 1},
							["LunaTargetTargetTargetFrame"] = {position = {x = 730, y = -20}, size = {x = 150, y = 40}, scale = 1, enabled = 1},
							["LunaPartyFrames"] = {position = {x = 10, y = -140}, size = {x = 200, y = 40}, scale = 1, enabled = 1, ShowBuffs = 3},
							["LunaPartyPetFrames"] = {position = {x = 0, y = 0}, size = {x = 110, y = 20}, scale = 1, enabled = 1},
							["LunaPetFrame"] = {position = {x = 10, y = -70}, size = {x = 240, y = 30}, scale = 1, enabled = 1, ShowBuffs = 3},
							["GRID"] = {position = {x = 600, y = -400}, size = 20, scale = 1, padding = 4, ShowRaidGroupTitles = 1},
							["BARS"] = {size = 20, scale = 1, padding = 4, ShowRaidGroupTitles = 1},
							["LunaRaidFramesBars1"] = {position = {x = 380, y = -400}},
							["LunaRaidFramesBars2"] = {position = {x = 460, y = -400}},
							["LunaRaidFramesBars3"] = {position = {x = 540, y = -400}},
							["LunaRaidFramesBars4"] = {position = {x = 620, y = -400}},
							["LunaRaidFramesBars5"] = {position = {x = 700, y = -400}},
							["LunaRaidFramesBars6"] = {position = {x = 780, y = -400}},
							["LunaRaidFramesBars7"] = {position = {x = 860, y = -400}},
							["LunaRaidFramesBars8"] = {position = {x = 940, y = -400}},
							}
	LunaOptions.enableRaid = 1
	LunaOptions.PartyinRaids = 0
	LunaOptions.Rangefreq = 0.2
	LunaOptions.Raidlayout = "GRID"
	LunaOptions.EnergyTicker = 1
	LunaOptions.hideCastbar = 0
	LunaOptions.hideBlizzCastbar = 1
	LunaOptions.PartyRange = 1
	LunaOptions.RaidRange = 1
	LunaOptions.XPBar = 1
	LunaOptions.PartySpace = 40
	LunaOptions.VerticalParty = 1
end

if LunaOptions == nil then
	ResetSettings()
end

function print(text)
	ChatFrame1:AddMessage(text)
end

function StartMoving()
	LunaOptionsFrame:StartMoving()
end

function StopMovingOrSizing()
	LunaOptionsFrame:StopMovingOrSizing()
end

function ToggleFrame()
	for i, page in pairs(LunaOptionsFrame.pages) do
		if (i-1) == this.id then
			page:Show()
		else
			page:Hide()
		end
	end
end

local function ToggleRaidLayout()
	if this:GetChecked() == 1 then
		LunaOptions.Raidlayout = "GRID"
	else
		LunaOptions.Raidlayout = "BARS"
	end
	LunaUnitFrames:UpdateRaidLayout()
	LunaUnitFrames:UpdateRaidRoster()
	LunaOptionsFrame.pages[7].scaleslider:SetValue(LunaOptions.frames[LunaOptions.Raidlayout].size)
	LunaOptionsFrame.pages[7].paddingslider:SetValue(LunaOptions.frames[LunaOptions.Raidlayout].padding)
	LunaOptionsFrame.pages[7].RaidGrpNameswitch:SetChecked(LunaOptions.frames[LunaOptions.Raidlayout].ShowRaidGroupTitles)
end

local function RaidScaleAdjust()
	if LunaUnitFrames.frames.RaidFrames[1] then
		LunaOptions.frames[LunaOptions.Raidlayout].size = (math.floor(this:GetValue()*10)/10)
		getglobal("RaidScaleSliderText"):SetText("Scale: "..LunaOptions.frames[LunaOptions.Raidlayout].size)
		LunaUnitFrames:SetRaidFrameSize()
	end
end

local function RaidPaddingAdjust()
	if LunaUnitFrames.frames.RaidFrames[1] then
		LunaOptions.frames[LunaOptions.Raidlayout].padding = this:GetValue()
		getglobal("RaidPaddingSliderText"):SetText("Padding: "..LunaOptions.frames[LunaOptions.Raidlayout].padding)
		LunaUnitFrames:UpdateRaidLayout()
	end
end	

local function ToggleRaidGroupNames()
	if this:GetChecked() == 1 then
		LunaOptions.frames[LunaOptions.Raidlayout].ShowRaidGroupTitles = 1
	else
		LunaOptions.frames[LunaOptions.Raidlayout].ShowRaidGroupTitles = 0
	end
	LunaUnitFrames:UpdateRaidRoster()
end

local function ScaleAdjust()
	local amount = (math.floor(this:GetValue()*10 + 0.5)/10)
	frame = getglobal(this.frame)
	if frame then
		if this.frame == "LunaPartyFrames" then
			for i=1,4 do
				frame[i]:SetScale(amount)
			end
		elseif this.frame == "LunaPartyPetFrames" then
			for i=1,4 do
				frame[i]:SetScale(amount)
			end
		else
			frame:SetScale(amount)
			LunaUnitFrames:ResizeXPBar()
		end
		LunaOptions.frames[this.frame].scale = amount
		getglobal(this.frame.."ScaleSliderText"):SetText("Scale: "..amount)
	end
end

local function HeightAdjust()
	local frame = getglobal(this.frame)
	local amount = this:GetValue()
	if frame then
		if this.frame == "LunaPartyFrames" then
			for i=1,4 do
				frame[i]:SetHeight(amount)
				local frameHeight = frame[i]:GetHeight()
				local frameWidth = (frame[i]:GetWidth()-frameHeight)
				frame[i].portrait:SetHeight(frameHeight+1)
				frame[i].portrait:SetWidth(frameHeight) --square it
				frame[i].HealthBar:SetWidth(frameWidth)
				frame[i].PowerBar:SetWidth(frameWidth)
				frame[i].HealthBar:SetHeight(frameHeight*0.58)
				frame[i].PowerBar:SetHeight(frameHeight-(frameHeight*0.58)-1)
			end
		elseif this.frame == "LunaPartyPetFrames" then
			for i=1,4 do
				frame[i]:SetHeight(amount)
			end
		else
			frame:SetHeight(amount)
			frame:AdjustBars()
		end
		LunaOptions.frames[this.frame].size.y = amount
		getglobal(this.frame.."HeightSliderText"):SetText("Height: "..amount)
	end
end

local function WidthAdjust()
	local frame = getglobal(this.frame)
	local amount = this:GetValue()
	if frame then
		if this.frame == "LunaPartyFrames" then
			for i=1,4 do
				frame[i]:SetWidth(amount)
				local frameWidth = (frame[i]:GetWidth()-frame[i]:GetHeight())
				frame[i].HealthBar:SetWidth(frameWidth)
				frame[i].PowerBar:SetWidth(frameWidth)
			end
		elseif this.frame == "LunaPartyPetFrames" then
			for i=1,4 do
				frame[i]:SetWidth(amount)
			end
		elseif this.frame == "LunaPlayerFrame" and LunaUnitFrames.frames.ExperienceBar and LunaUnitFrames.frames.ExperienceBar:IsShown() then
			frame:SetWidth(amount)
			frame:AdjustBars()
			LunaUnitFrames:ResizeXPBar()
		else
			frame:SetWidth(amount)
			frame:AdjustBars()
		end
		LunaOptions.frames[this.frame].size.x = amount
		getglobal(this.frame.."WidthSliderText"):SetText("Width: "..amount)
	end
end

function TargetWidthAdjust()
	if LunaTargetFrame then
		LunaTargetFrame:SetWidth(this:GetValue())
		LunaTarget:AdjustBars()
	end
end

function TargetHeightAdjust()
	if LunaTargetFrame then
		LunaTargetFrame:SetHeight(this:GetValue())
		LunaTarget:AdjustBars()
	end
end

local function RegisterCastbar(frame)
	getglobal(frame):RegisterEvent("SPELLCAST_START")
	getglobal(frame):RegisterEvent("SPELLCAST_STOP")
	getglobal(frame):RegisterEvent("SPELLCAST_FAILED")
	getglobal(frame):RegisterEvent("SPELLCAST_INTERRUPTED")
	getglobal(frame):RegisterEvent("SPELLCAST_DELAYED")
	getglobal(frame):RegisterEvent("SPELLCAST_CHANNEL_START")
	getglobal(frame):RegisterEvent("SPELLCAST_CHANNEL_UPDATE")
	getglobal(frame):RegisterEvent("SPELLCAST_CHANNEL_STOP")
end

local function UnRegisterCastbar(frame)
	getglobal(frame):UnregisterAllEvents()
end

function HideCastBarToggle()
	if LunaOptionsFrame.pages[1].HideCastbar:GetChecked() == 1 then
		UnRegisterCastbar("LunaPlayerFrame")
		LunaPlayerFrame.Castbar:Hide()
		LunaOptions.hideCastbar = 1
		LunaPlayerFrame.AdjustBars()
	else
		RegisterCastbar("LunaPlayerFrame")
		LunaOptions.hideCastbar = 0
	end
end

function HideBlizzardCastbarToggle()
	if LunaOptionsFrame.pages[1].HideBlizzCast:GetChecked() == 1 then
		UnRegisterCastbar("CastingBarFrame")
		CastingBarFrame:Hide()
		LunaOptions.hideBlizzCastbar = 1
	else
		RegisterCastbar("CastingBarFrame")
		LunaOptions.hideBlizzCastbar = 0
	end
end

function PortraitmodeToggle()
	if LunaOptionsFrame.pages[1].Portraitmode:GetChecked() == 1 then
		LunaPlayerFrame.portrait.type = "3D"
	else
		print("Luna Unit Frames: Not yet implemented!")
	end
end

local function XPBarToggle()
	if LunaOptionsFrame.pages[1].XPBar:GetChecked() == 1 then
		LunaOptions.XPBar = 1
	else
		LunaOptions.XPBar = 0
	end
	LunaUnitFrames:UpdateXPBar()
end

local function PlayerBuffPosSelectChoice()
	UIDropDownMenu_SetSelectedID(LunaOptionsFrame.pages[1].BuffPosition, this:GetID())
	LunaOptions.frames["LunaPlayerFrame"].ShowBuffs = this:GetID()
	LunaUnitFrames:UpdatePlayerBuffLayout()
end

local function PlayerBuffPosSelect()
	local info={}
	for k,v in ipairs({"Hide","Top","Bottom","Left","Right"}) do
		info.text=v
		info.value=k
		info.func= PlayerBuffPosSelectChoice
		info.checked = nil
		UIDropDownMenu_AddButton(info, 1)
	end
end

local function PetBuffPosSelectChoice()
	UIDropDownMenu_SetSelectedID(LunaOptionsFrame.pages[2].BuffPosition, this:GetID())
	LunaOptions.frames["LunaPetFrame"].ShowBuffs = this:GetID()
	LunaUnitFrames:UpdatePetBuffLayout()
end

local function PetBuffPosSelect()
	local info={}
	for k,v in ipairs({"Hide","Top","Bottom","Left","Right"}) do
		info.text=v
		info.value=k
		info.func= PetBuffPosSelectChoice
		info.checked = nil
		UIDropDownMenu_AddButton(info, 1)
	end
end

local function TargetBuffPosSelectChoice()
	UIDropDownMenu_SetSelectedID(LunaOptionsFrame.pages[3].BuffPosition, this:GetID())
	LunaOptions.frames["LunaTargetFrame"].ShowBuffs = this:GetID()
	LunaUnitFrames:UpdateTargetBuffLayout()
end

local function TargetBuffPosSelect()
	local info={}
	for k,v in ipairs({"Hide","Top","Bottom","Left","Right"}) do
		info.text=v
		info.value=k
		info.func= TargetBuffPosSelectChoice
		info.checked = nil
		UIDropDownMenu_AddButton(info, 1)
	end
end

local function PartyBuffPosSelectChoice()
	UIDropDownMenu_SetSelectedID(LunaOptionsFrame.pages[5].BuffPosition, this:GetID())
	LunaOptions.frames["LunaPartyFrames"].ShowBuffs = this:GetID()
	LunaUnitFrames:UpdatePartyBuffLayout()
end

local function PartyBuffPosSelect()
	local info={}
	for k,v in ipairs({"Hide","Top","Bottom","Left","Right"}) do
		info.text=v
		info.value=k
		info.func= PartyBuffPosSelectChoice
		info.checked = nil
		UIDropDownMenu_AddButton(info, 1)
	end
end

function EnergyTickerToggle()
	if LunaOptions.EnergyTicker == 1 then
		LunaOptions.EnergyTicker = 0
		LunaPlayerFrame.PowerBar:SetScript("OnUpdate", nil)
		LunaPlayerFrame.PowerBar.Ticker:Hide()
	else
		LunaOptions.EnergyTicker = 1
		LunaPlayerFrame.PowerBar:SetScript("OnUpdate", LunaPlayerFrame.PowerBar.EnergyUpdate)
		LunaPlayerFrame.PowerBar.Ticker:Show()
	end
end

local function PartyGrowthToggle()
	if LunaOptions.VerticalParty == 1 then
		LunaOptions.VerticalParty = 0
	else
		LunaOptions.VerticalParty = 1
	end
	LunaUnitFrames:UpdatePartyPosition()
end

local function PartySpaceAdjust()
	LunaOptions.PartySpace = this:GetValue()
	getglobal("SpaceSliderText"):SetText("Party Space between units: "..LunaOptions.PartySpace)
	LunaUnitFrames:UpdatePartyPosition()
end

local function PartyRangeToggle()
	if LunaOptions.PartyRange == 1 then
		LunaOptions.PartyRange = 0
		for i=1, 4 do
			LunaPartyFrames[i]:SetAlpha(1)
		end
	else
		LunaOptions.PartyRange = 1
	end
end

local function PartyinRaidToggle()
	if LunaOptions.PartyinRaid == 1 then
		LunaOptions.PartyinRaid = 0
	else
		LunaOptions.PartyinRaid = 1
	end
	LunaUnitFrames:UpdatePartyFrames()
end

local function LockFrames()
	LunaUnitFrames:TogglePlayerLock()
	LunaUnitFrames:ToggleTargetLock()
	LunaUnitFrames:ToggleTargetTargetLock()
	LunaUnitFrames:TogglePetLock()
	LunaUnitFrames:TogglePartyLock()
	LunaUnitFrames:ToggleRaidFrameLock()
end

local function UpdateAll()
	LunaUnitFrames:UpdatePlayerFrame()
	LunaUnitFrames:UpdatePetFrame()
	LunaUnitFrames:UpdateTargetFrame()
	LunaUnitFrames:UpdateTargetTargetFrame()
	LunaUnitFrames:UpdateTargetTargetTargetFrame()
	LunaUnitFrames:UpdatePartyFrames()
	LunaUnitFrames:UpdatePartyPetFrames()
	LunaUnitFrames:UpdateRaidRoster()
end

local function enableFrame()
	if LunaOptions.frames[this.frame].enabled == 1 then
		LunaOptions.frames[this.frame].enabled = 0
	else
		LunaOptions.frames[this.frame].enabled = 1
	end
	UpdateAll()
end

local function enableRaid()
	if LunaOptions.enableRaid == 1 then
		LunaOptions.enableRaid = 0
	else
		LunaOptions.enableRaid = 1
	end
	LunaUnitFrames:UpdateRaidRoster()
end

function LunaOptionsModule:CreateMenu()
	LunaOptionsFrame = CreateFrame("Frame", "LunaOptionsMenu", UIParent)
	LunaOptionsFrame:SetHeight(400)
	LunaOptionsFrame:SetWidth(700)
	LunaOptionsFrame:SetBackdrop(LunaOptions.backdrop)
	LunaOptionsFrame:SetBackdropColor(0.18,0.27,0.5)
	LunaOptionsFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	LunaOptionsFrame:SetFrameStrata("DIALOG")
	LunaOptionsFrame:EnableMouse(1)
	LunaOptionsFrame:SetMovable(1)
	LunaOptionsFrame:RegisterForDrag("LeftButton")
	LunaOptionsFrame:SetScript("OnDragStart", StartMoving)
	LunaOptionsFrame:SetScript("OnDragStop", StopMovingOrSizing)
	LunaOptionsFrame:Hide()

	LunaOptionsFrame.CloseButton = CreateFrame("Button", "LunaOptionsCloseButton", LunaOptionsFrame,"UIPanelCloseButton")
	LunaOptionsFrame.CloseButton:SetPoint("TOPRIGHT", LunaOptionsFrame, "TOPRIGHT", 0, 0)

	LunaOptionsFrame.icon = LunaOptionsFrame:CreateTexture(nil, "ARTWORK", LunaOptionsFrame)
	LunaOptionsFrame.icon:SetTexture(LunaOptions.icontexture)
	LunaOptionsFrame.icon:SetHeight(64)
	LunaOptionsFrame.icon:SetWidth(64)
	LunaOptionsFrame.icon:SetPoint("TOPLEFT", LunaOptionsFrame, "TOPLEFT", 0, 0)

	LunaOptionsFrame.name = LunaOptionsFrame:CreateFontString(nil, "OVERLAY", "NumberFontNormalHuge")
	LunaOptionsFrame.name:SetPoint("TOP", LunaOptionsFrame, "TOP", 0, -10)
	LunaOptionsFrame.name:SetShadowColor(0, 0, 0)
	LunaOptionsFrame.name:SetShadowOffset(0.8, -0.8)
	LunaOptionsFrame.name:SetTextColor(1,1,1)
	LunaOptionsFrame.name:SetText("LUNA UNIT FRAMES")

	LunaOptionsFrame.pages = {}

	for i, v in pairs(OptionsPageNames) do
		LunaOptionsFrame.pages[i] = CreateFrame("Frame", v.title.." Page", LunaOptionsFrame)
		LunaOptionsFrame.pages[i]:SetHeight(350)
		LunaOptionsFrame.pages[i]:SetWidth(500)
		LunaOptionsFrame.pages[i]:SetBackdrop(LunaOptions.backdrop)
		LunaOptionsFrame.pages[i]:SetBackdropColor(0,0,0,1)
		LunaOptionsFrame.pages[i]:SetPoint("BOTTOMRIGHT", LunaOptionsFrame, "BOTTOMRIGHT", -10, 10)
		LunaOptionsFrame.pages[i]:Hide()
		
		LunaOptionsFrame.pages[i].name = LunaOptionsFrame.pages[i]:CreateFontString(nil, "OVERLAY", LunaOptionsFrame.pages[i])
		LunaOptionsFrame.pages[i].name:SetPoint("TOP", LunaOptionsFrame.pages[i], "TOP", 0, -10)
		LunaOptionsFrame.pages[i].name:SetFont(LunaOptions.font, 15)
		LunaOptionsFrame.pages[i].name:SetShadowColor(0, 0, 0)
		LunaOptionsFrame.pages[i].name:SetShadowOffset(0.8, -0.8)
		LunaOptionsFrame.pages[i].name:SetTextColor(1,1,1)
		LunaOptionsFrame.pages[i].name:SetText(v.title.." Configuration")
				
		if i == 7 then
			break
		end
		
		LunaOptionsFrame.pages[i].enable = CreateFrame("CheckButton", v.title.."EnableButton", LunaOptionsFrame.pages[i], "UICheckButtonTemplate")
		LunaOptionsFrame.pages[i].enable:SetPoint("TOPLEFT", LunaOptionsFrame.pages[i], "TOPLEFT", 10, -10)
		LunaOptionsFrame.pages[i].enable:SetHeight(20)
		LunaOptionsFrame.pages[i].enable:SetWidth(20)
		LunaOptionsFrame.pages[i].enable:SetScript("OnClick", enableFrame)
		LunaOptionsFrame.pages[i].enable:SetChecked(LunaOptions.frames[v.frame].enabled)
		LunaOptionsFrame.pages[i].enable.frame = v.frame
		getglobal(v.title.."EnableButtonText"):SetText("Enable")
		
		LunaOptionsFrame.pages[i].heightslider = CreateFrame("Slider", v.frame.."HeightSlider", LunaOptionsFrame.pages[i], "OptionsSliderTemplate")
		LunaOptionsFrame.pages[i].heightslider:SetMinMaxValues(20,110)
		LunaOptionsFrame.pages[i].heightslider:SetValueStep(1)
		LunaOptionsFrame.pages[i].heightslider:SetScript("OnValueChanged", HeightAdjust)
		LunaOptionsFrame.pages[i].heightslider:SetPoint("TOPLEFT", LunaOptionsFrame.pages[i], "TOPLEFT", 20, -40)
		LunaOptionsFrame.pages[i].heightslider:SetValue(LunaOptions.frames[v.frame].size.y)
		LunaOptionsFrame.pages[i].heightslider.frame = v.frame
		LunaOptionsFrame.pages[i].heightslider:SetWidth(460)
		getglobal(v.frame.."HeightSliderText"):SetText("Height: "..LunaOptions.frames[v.frame].size.y)

		LunaOptionsFrame.pages[i].widthslider = CreateFrame("Slider", v.frame.."WidthSlider", LunaOptionsFrame.pages[i], "OptionsSliderTemplate")
		LunaOptionsFrame.pages[i].widthslider:SetMinMaxValues(100,400)
		LunaOptionsFrame.pages[i].widthslider:SetValueStep(1)
		LunaOptionsFrame.pages[i].widthslider:SetScript("OnValueChanged", WidthAdjust)
		LunaOptionsFrame.pages[i].widthslider:SetPoint("TOPLEFT", LunaOptionsFrame.pages[i].heightslider, "TOPLEFT", 0, -40)
		LunaOptionsFrame.pages[i].widthslider:SetValue(LunaOptions.frames[v.frame].size.x)
		LunaOptionsFrame.pages[i].widthslider.frame = v.frame
		LunaOptionsFrame.pages[i].widthslider:SetWidth(460)
		getglobal(v.frame.."WidthSliderText"):SetText("Width: "..LunaOptions.frames[v.frame].size.x)
		
		LunaOptionsFrame.pages[i].scaleslider = CreateFrame("Slider", v.frame.."ScaleSlider", LunaOptionsFrame.pages[i], "OptionsSliderTemplate")
		LunaOptionsFrame.pages[i].scaleslider:SetMinMaxValues(0.5,2)
		LunaOptionsFrame.pages[i].scaleslider:SetValueStep(0.1)
		LunaOptionsFrame.pages[i].scaleslider:SetScript("OnValueChanged", ScaleAdjust)
		LunaOptionsFrame.pages[i].scaleslider:SetPoint("TOPLEFT", LunaOptionsFrame.pages[i].widthslider, "TOPLEFT", 0, -40)
		LunaOptionsFrame.pages[i].scaleslider:SetValue(LunaOptions.frames[v.frame].scale)
		LunaOptionsFrame.pages[i].scaleslider.frame = v.frame
		LunaOptionsFrame.pages[i].scaleslider:SetWidth(460)
		getglobal(v.frame.."ScaleSliderText"):SetText("Scale: "..LunaOptions.frames[v.frame].scale)
	end	
	LunaOptionsFrame.pages[1]:Show()
		
	LunaOptionsFrame.Button0 = CreateFrame("Button", "LunaPlayerFrameButton", LunaOptionsFrame, "UIPanelButtonTemplate")
	LunaOptionsFrame.Button0:SetPoint("TOPLEFT", LunaOptionsFrame, "TOPLEFT", 30, -80)
	LunaOptionsFrame.Button0:SetHeight(20)
	LunaOptionsFrame.Button0:SetWidth(140)
	LunaOptionsFrame.Button0:SetText("Player Frame")
	LunaOptionsFrame.Button0:SetScript("OnClick", ToggleFrame)
	LunaOptionsFrame.Button0.id = 0
	
	LunaOptionsFrame.Button1 = CreateFrame("Button", "LunaPlayerFrameButton", LunaOptionsFrame, "UIPanelButtonTemplate")
	LunaOptionsFrame.Button1:SetPoint("TOPLEFT", LunaOptionsFrame.Button0, "BOTTOMLEFT", 0, -10)
	LunaOptionsFrame.Button1:SetHeight(20)
	LunaOptionsFrame.Button1:SetWidth(140)
	LunaOptionsFrame.Button1:SetText("Pet Frame")
	LunaOptionsFrame.Button1:SetScript("OnClick", ToggleFrame)
	LunaOptionsFrame.Button1.id = 1

	LunaOptionsFrame.Button2 = CreateFrame("Button", "LunaTargetFrameButton", LunaOptionsFrame, "UIPanelButtonTemplate")
	LunaOptionsFrame.Button2:SetPoint("TOPLEFT", LunaOptionsFrame.Button1, "BOTTOMLEFT", 0, -10)
	LunaOptionsFrame.Button2:SetHeight(20)
	LunaOptionsFrame.Button2:SetWidth(140)
	LunaOptionsFrame.Button2:SetText("Target Frame")
	LunaOptionsFrame.Button2:SetScript("OnClick", ToggleFrame)
	LunaOptionsFrame.Button2.id = 2

	LunaOptionsFrame.Button3 = CreateFrame("Button", "LunaTargetTargetFrameButton", LunaOptionsFrame, "UIPanelButtonTemplate")
	LunaOptionsFrame.Button3:SetPoint("TOPLEFT", LunaOptionsFrame.Button2, "BOTTOMLEFT", 0, -10)
	LunaOptionsFrame.Button3:SetHeight(20)
	LunaOptionsFrame.Button3:SetWidth(140)
	LunaOptionsFrame.Button3:SetText("TargetTarget Frame")
	LunaOptionsFrame.Button3:SetScript("OnClick", ToggleFrame)
	LunaOptionsFrame.Button3.id = 3

	LunaOptionsFrame.Button4 = CreateFrame("Button", "LunaPartyFramesButton", LunaOptionsFrame, "UIPanelButtonTemplate")
	LunaOptionsFrame.Button4:SetPoint("TOPLEFT", LunaOptionsFrame.Button3, "BOTTOMLEFT", 0, -10)
	LunaOptionsFrame.Button4:SetHeight(20)
	LunaOptionsFrame.Button4:SetWidth(140)
	LunaOptionsFrame.Button4:SetText("Party Frames")
	LunaOptionsFrame.Button4:SetScript("OnClick", ToggleFrame)
	LunaOptionsFrame.Button4.id = 4

	LunaOptionsFrame.Button5 = CreateFrame("Button", "LunaPartyPetsFrameButton", LunaOptionsFrame, "UIPanelButtonTemplate")
	LunaOptionsFrame.Button5:SetPoint("TOPLEFT", LunaOptionsFrame.Button4, "BOTTOMLEFT", 0, -10)
	LunaOptionsFrame.Button5:SetHeight(20)
	LunaOptionsFrame.Button5:SetWidth(140)
	LunaOptionsFrame.Button5:SetText("Party Pet Frames")
	LunaOptionsFrame.Button5:SetScript("OnClick", ToggleFrame)
	LunaOptionsFrame.Button5.id = 5
	
	LunaOptionsFrame.Button6 = CreateFrame("Button", "LunaRaidFrameButton", LunaOptionsFrame, "UIPanelButtonTemplate")
	LunaOptionsFrame.Button6:SetPoint("TOPLEFT", LunaOptionsFrame.Button5, "BOTTOMLEFT", 0, -10)
	LunaOptionsFrame.Button6:SetHeight(20)
	LunaOptionsFrame.Button6:SetWidth(140)
	LunaOptionsFrame.Button6:SetText("Raid Frames")
	LunaOptionsFrame.Button6:SetScript("OnClick", ToggleFrame)
	LunaOptionsFrame.Button6.id = 6

	LunaOptionsFrame.Button7 = CreateFrame("Button", "LunaLockFramesButton", LunaOptionsFrame, "UIPanelButtonTemplate")
	LunaOptionsFrame.Button7:SetPoint("TOPLEFT", LunaOptionsFrame.Button6, "BOTTOMLEFT", 0, -30)
	LunaOptionsFrame.Button7:SetHeight(20)
	LunaOptionsFrame.Button7:SetWidth(140)
	LunaOptionsFrame.Button7:SetText("Unlock Frames")
	LunaOptionsFrame.Button7:SetScript("OnClick", LockFrames)
	LunaOptionsFrame.Button7.id = 7	
	
	LunaOptionsFrame.Button8 = CreateFrame("Button", "LunaResetFramesButton", LunaOptionsFrame, "UIPanelButtonTemplate")
	LunaOptionsFrame.Button8:SetPoint("TOPLEFT", LunaOptionsFrame.Button7, "BOTTOMLEFT", 0, -30)
	LunaOptionsFrame.Button8:SetHeight(20)
	LunaOptionsFrame.Button8:SetWidth(140)
	LunaOptionsFrame.Button8:SetText("Reset Settings")
	LunaOptionsFrame.Button8:SetScript("OnClick", ResetSettings)
	LunaOptionsFrame.Button8.id = 8
	
	LunaOptionsFrame.reset = LunaOptionsFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	LunaOptionsFrame.reset:SetPoint("TOP", LunaOptionsFrame.Button8, "BOTTOM", 0, -5)
	LunaOptionsFrame.reset:SetText("[BETA] Requires a UI reload")
	
	LunaOptionsFrame.pages[1].HideCastbar = CreateFrame("CheckButton", "HideCastbar", LunaOptionsFrame.pages[1], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[1].HideCastbar:SetHeight(20)
	LunaOptionsFrame.pages[1].HideCastbar:SetWidth(20)
	LunaOptionsFrame.pages[1].HideCastbar:SetPoint("TOPLEFT", LunaOptionsFrame.pages[1].scaleslider, "TOPLEFT", 0, -40)
	LunaOptionsFrame.pages[1].HideCastbar:SetScript("OnClick", HideCastBarToggle)
	LunaOptionsFrame.pages[1].HideCastbar:SetChecked(LunaOptions.hideCastbar)
	getglobal("HideCastbarText"):SetText("Turn off the built-in Castbar")

	LunaOptionsFrame.pages[1].HideBlizzCast = CreateFrame("CheckButton", "HideBlizzCast", LunaOptionsFrame.pages[1], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[1].HideBlizzCast:SetHeight(20)
	LunaOptionsFrame.pages[1].HideBlizzCast:SetWidth(20)
	LunaOptionsFrame.pages[1].HideBlizzCast:SetPoint("TOPLEFT", LunaOptionsFrame.pages[1].HideCastbar, "TOPLEFT", 0, -30)
	LunaOptionsFrame.pages[1].HideBlizzCast:SetScript("OnClick", HideBlizzardCastbarToggle)
	LunaOptionsFrame.pages[1].HideBlizzCast:SetChecked(LunaOptions.hideBlizzCastbar)
	getglobal("HideBlizzCastText"):SetText("Hide original Blizzard Castbar")

	LunaOptionsFrame.pages[1].Portraitmode = CreateFrame("CheckButton", "Portraitmode", LunaOptionsFrame.pages[1], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[1].Portraitmode:SetHeight(20)
	LunaOptionsFrame.pages[1].Portraitmode:SetWidth(20)
	LunaOptionsFrame.pages[1].Portraitmode:SetPoint("TOPLEFT", LunaOptionsFrame.pages[1].HideBlizzCast, "TOPLEFT", 0, -30)
	LunaOptionsFrame.pages[1].Portraitmode:SetScript("OnClick", PortraitmodeToggle)
	LunaOptionsFrame.pages[1].Portraitmode:SetChecked(1)
	getglobal("PortraitmodeText"):SetText("Enable 3D Portrait")
	LunaOptionsFrame.pages[1].Portraitmode:Disable()
	
	LunaOptionsFrame.pages[1].EnergyTicker = CreateFrame("CheckButton", "EnergyTicker", LunaOptionsFrame.pages[1], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[1].EnergyTicker:SetHeight(20)
	LunaOptionsFrame.pages[1].EnergyTicker:SetWidth(20)
	LunaOptionsFrame.pages[1].EnergyTicker:SetPoint("TOPLEFT", LunaOptionsFrame.pages[1].Portraitmode, "TOPLEFT", 0, -30)
	LunaOptionsFrame.pages[1].EnergyTicker:SetScript("OnClick", EnergyTickerToggle)
	LunaOptionsFrame.pages[1].EnergyTicker:SetChecked(LunaOptions.EnergyTicker)
	getglobal("EnergyTickerText"):SetText("Enable Energy Ticker")
	
	LunaOptionsFrame.pages[1].XPBar = CreateFrame("CheckButton", "XPBarSwitch", LunaOptionsFrame.pages[1], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[1].XPBar:SetHeight(20)
	LunaOptionsFrame.pages[1].XPBar:SetWidth(20)
	LunaOptionsFrame.pages[1].XPBar:SetPoint("TOPRIGHT", LunaOptionsFrame.pages[1].EnergyTicker, "TOPRIGHT", 0, -30)
	LunaOptionsFrame.pages[1].XPBar:SetScript("OnClick", XPBarToggle)
	LunaOptionsFrame.pages[1].XPBar:SetChecked(LunaOptions.XPBar)
	getglobal("XPBarSwitchText"):SetText("Enable XP Bar")
	
	for k,i in ipairs({1,2,3,5}) do
		LunaOptionsFrame.pages[i].BuffPosition = CreateFrame("Button", "BuffSwitch"..i, LunaOptionsFrame.pages[i], "UIDropDownMenuTemplate")
		LunaOptionsFrame.pages[i].BuffPosition:SetPoint("TOPRIGHT", LunaOptionsFrame.pages[i].scaleslider, "BOTTOMRIGHT", -100 , -15)
		UIDropDownMenu_SetWidth(80, LunaOptionsFrame.pages[i].BuffPosition)
		UIDropDownMenu_JustifyText("LEFT", LunaOptionsFrame.pages[i].BuffPosition)
		
		LunaOptionsFrame.pages[i].BuffSwitchDesc = LunaOptionsFrame.pages[i]:CreateFontString(nil, "OVERLAY", LunaOptionsFrame.pages[i])
		LunaOptionsFrame.pages[i].BuffSwitchDesc:SetPoint("LEFT", LunaOptionsFrame.pages[i].BuffPosition, "RIGHT", -10, 0)
		LunaOptionsFrame.pages[i].BuffSwitchDesc:SetFont("Fonts\\FRIZQT__.TTF", 10)
		LunaOptionsFrame.pages[i].BuffSwitchDesc:SetTextColor(1,0.82,0)
		LunaOptionsFrame.pages[i].BuffSwitchDesc:SetText("(De)Buff Position")
	end

	UIDropDownMenu_Initialize(LunaOptionsFrame.pages[1].BuffPosition, PlayerBuffPosSelect)
	UIDropDownMenu_SetSelectedID(LunaOptionsFrame.pages[1].BuffPosition, LunaOptions.frames["LunaPlayerFrame"].ShowBuffs)
	UIDropDownMenu_Initialize(LunaOptionsFrame.pages[2].BuffPosition, PetBuffPosSelect)
	UIDropDownMenu_SetSelectedID(LunaOptionsFrame.pages[2].BuffPosition, LunaOptions.frames["LunaPetFrame"].ShowBuffs)
	UIDropDownMenu_Initialize(LunaOptionsFrame.pages[3].BuffPosition, TargetBuffPosSelect)
	UIDropDownMenu_SetSelectedID(LunaOptionsFrame.pages[3].BuffPosition, LunaOptions.frames["LunaTargetFrame"].ShowBuffs)
	UIDropDownMenu_Initialize(LunaOptionsFrame.pages[5].BuffPosition, PartyBuffPosSelect)
	UIDropDownMenu_SetSelectedID(LunaOptionsFrame.pages[5].BuffPosition, LunaOptions.frames["LunaPartyFrames"].ShowBuffs)
	
	LunaOptionsFrame.pages[4].enable2 = CreateFrame("CheckButton", "LunaTargetTargetTargetFrameEnableButton", LunaOptionsFrame.pages[4], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[4].enable2:SetPoint("TOPLEFT", LunaOptionsFrame.pages[4], "TOPLEFT", 10, -170)
	LunaOptionsFrame.pages[4].enable2:SetHeight(20)
	LunaOptionsFrame.pages[4].enable2:SetWidth(20)
	LunaOptionsFrame.pages[4].enable2:SetScript("OnClick", enableFrame)
	LunaOptionsFrame.pages[4].enable2:SetChecked(LunaOptions.frames["LunaTargetTargetTargetFrame"].enabled)
	LunaOptionsFrame.pages[4].enable2.frame = "LunaTargetTargetTargetFrame"
	getglobal("LunaTargetTargetTargetFrameEnableButtonText"):SetText("Enable")
	
	LunaOptionsFrame.pages[4].name2 = LunaOptionsFrame.pages[4]:CreateFontString(nil, "OVERLAY", LunaOptionsFrame.pages[4])
	LunaOptionsFrame.pages[4].name2:SetPoint("TOP", LunaOptionsFrame.pages[4].scaleslider, "BOTTOM", 0, -30)
	LunaOptionsFrame.pages[4].name2:SetFont(LunaOptions.font, 15)
	LunaOptionsFrame.pages[4].name2:SetShadowColor(0, 0, 0)
	LunaOptionsFrame.pages[4].name2:SetShadowOffset(0.8, -0.8)
	LunaOptionsFrame.pages[4].name2:SetTextColor(1,1,1)
	LunaOptionsFrame.pages[4].name2:SetText("Target Target Target Frame Configuration")
	
	LunaOptionsFrame.pages[4].heightslider2 = CreateFrame("Slider", "LunaTargetTargetTargetFrameHeightSlider", LunaOptionsFrame.pages[4], "OptionsSliderTemplate")
	LunaOptionsFrame.pages[4].heightslider2:SetMinMaxValues(20,110)
	LunaOptionsFrame.pages[4].heightslider2:SetValueStep(1)
	LunaOptionsFrame.pages[4].heightslider2:SetScript("OnValueChanged", HeightAdjust)
	LunaOptionsFrame.pages[4].heightslider2:SetPoint("TOP", LunaOptionsFrame.pages[4].name2, "BOTTOM", 0, -30)
	LunaOptionsFrame.pages[4].heightslider2:SetValue(LunaOptions.frames["LunaTargetTargetTargetFrame"].size.y)
	LunaOptionsFrame.pages[4].heightslider2.frame = "LunaTargetTargetTargetFrame"
	LunaOptionsFrame.pages[4].heightslider2:SetWidth(460)
	getglobal("LunaTargetTargetTargetFrameHeightSliderText"):SetText("Height: "..LunaOptions.frames["LunaTargetTargetTargetFrame"].size.y)

	LunaOptionsFrame.pages[4].widthslider2 = CreateFrame("Slider", "LunaTargetTargetTargetFrameWidthSlider", LunaOptionsFrame.pages[4], "OptionsSliderTemplate")
	LunaOptionsFrame.pages[4].widthslider2:SetMinMaxValues(100,400)
	LunaOptionsFrame.pages[4].widthslider2:SetValueStep(1)
	LunaOptionsFrame.pages[4].widthslider2:SetScript("OnValueChanged", WidthAdjust)
	LunaOptionsFrame.pages[4].widthslider2:SetPoint("TOPLEFT", LunaOptionsFrame.pages[4].heightslider2, "TOPLEFT", 0, -40)
	LunaOptionsFrame.pages[4].widthslider2:SetValue(LunaOptions.frames["LunaTargetTargetTargetFrame"].size.x)
	LunaOptionsFrame.pages[4].widthslider2.frame = "LunaTargetTargetTargetFrame"
	LunaOptionsFrame.pages[4].widthslider2:SetWidth(460)
	getglobal("LunaTargetTargetTargetFrameWidthSliderText"):SetText("Width: "..LunaOptions.frames["LunaTargetTargetTargetFrame"].size.x)
	
	LunaOptionsFrame.pages[4].scaleslider2 = CreateFrame("Slider", "LunaTargetTargetTargetFrameScaleSlider", LunaOptionsFrame.pages[4], "OptionsSliderTemplate")
	LunaOptionsFrame.pages[4].scaleslider2:SetMinMaxValues(0.5,2)
	LunaOptionsFrame.pages[4].scaleslider2:SetValueStep(0.1)
	LunaOptionsFrame.pages[4].scaleslider2:SetScript("OnValueChanged", ScaleAdjust)
	LunaOptionsFrame.pages[4].scaleslider2:SetPoint("TOPLEFT", LunaOptionsFrame.pages[4].widthslider2, "TOPLEFT", 0, -40)
	LunaOptionsFrame.pages[4].scaleslider2:SetValue(LunaOptions.frames["LunaTargetTargetTargetFrame"].scale)
	LunaOptionsFrame.pages[4].scaleslider2.frame = "LunaTargetTargetTargetFrame"
	LunaOptionsFrame.pages[4].scaleslider2:SetWidth(460)
	getglobal("LunaTargetTargetTargetFrameScaleSliderText"):SetText("Scale: "..LunaOptions.frames["LunaTargetTargetTargetFrame"].scale)
	
	LunaOptionsFrame.pages[5].spaceslider = CreateFrame("Slider", "SpaceSlider", LunaOptionsFrame.pages[5], "OptionsSliderTemplate")
	LunaOptionsFrame.pages[5].spaceslider:SetMinMaxValues(0,150)
	LunaOptionsFrame.pages[5].spaceslider:SetValueStep(1)
	LunaOptionsFrame.pages[5].spaceslider:SetScript("OnValueChanged", PartySpaceAdjust)
	LunaOptionsFrame.pages[5].spaceslider:SetPoint("TOPLEFT", LunaOptionsFrame.pages[5].scaleslider, "TOPLEFT", 0, -40)
	LunaOptionsFrame.pages[5].spaceslider:SetValue(LunaOptions.PartySpace)
	LunaOptionsFrame.pages[5].spaceslider:SetWidth(230)
	getglobal("SpaceSliderText"):SetText("Party Space between units: "..LunaOptions.PartySpace)
	
	LunaOptionsFrame.pages[5].RangeCheck = CreateFrame("CheckButton", "RangeCheck", LunaOptionsFrame.pages[5], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[5].RangeCheck:SetHeight(20)
	LunaOptionsFrame.pages[5].RangeCheck:SetWidth(20)
	LunaOptionsFrame.pages[5].RangeCheck:SetPoint("TOPLEFT", LunaOptionsFrame.pages[5].spaceslider, "TOPLEFT", 0, -40)
	LunaOptionsFrame.pages[5].RangeCheck:SetScript("OnClick", PartyRangeToggle)
	LunaOptionsFrame.pages[5].RangeCheck:SetChecked(LunaOptions.PartyRange)
	getglobal("RangeCheckText"):SetText("Enable Range Check")
	
	LunaOptionsFrame.pages[5].PartyinRaid = CreateFrame("CheckButton", "PartyinRaid", LunaOptionsFrame.pages[5], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[5].PartyinRaid:SetHeight(20)
	LunaOptionsFrame.pages[5].PartyinRaid:SetWidth(20)
	LunaOptionsFrame.pages[5].PartyinRaid:SetPoint("TOPLEFT", LunaOptionsFrame.pages[5].RangeCheck, "TOPLEFT", 0, -30)
	LunaOptionsFrame.pages[5].PartyinRaid:SetScript("OnClick", PartyinRaidToggle)
	LunaOptionsFrame.pages[5].PartyinRaid:SetChecked(LunaOptions.PartyinRaid)
	getglobal("PartyinRaidText"):SetText("Show Party while in Raid")
	
	LunaOptionsFrame.pages[5].PartyGrowth = CreateFrame("CheckButton", "PartyGrowth", LunaOptionsFrame.pages[5], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[5].PartyGrowth:SetHeight(20)
	LunaOptionsFrame.pages[5].PartyGrowth:SetWidth(20)
	LunaOptionsFrame.pages[5].PartyGrowth:SetPoint("TOPLEFT", LunaOptionsFrame.pages[5].PartyinRaid, "TOPLEFT", 0, -30)
	LunaOptionsFrame.pages[5].PartyGrowth:SetScript("OnClick", PartyGrowthToggle)
	LunaOptionsFrame.pages[5].PartyGrowth:SetChecked(LunaOptions.VerticalParty)
	getglobal("PartyGrowthText"):SetText("Grow Party Frames vertically")

	LunaOptionsFrame.pages[7].enable = CreateFrame("CheckButton", "LunaRaidEnableButton", LunaOptionsFrame.pages[7], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[7].enable:SetPoint("TOPLEFT", LunaOptionsFrame.pages[7], "TOPLEFT", 10, -10)
	LunaOptionsFrame.pages[7].enable:SetHeight(20)
	LunaOptionsFrame.pages[7].enable:SetWidth(20)
	LunaOptionsFrame.pages[7].enable:SetScript("OnClick", enableRaid)
	LunaOptionsFrame.pages[7].enable:SetChecked(LunaOptions.enableRaid)
	getglobal("LunaRaidEnableButtonText"):SetText("Enable")
	
	LunaOptionsFrame.pages[7].Raidlayoutswitch = CreateFrame("CheckButton", "RaidLayoutSwitch", LunaOptionsFrame.pages[7], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[7].Raidlayoutswitch:SetHeight(30)
	LunaOptionsFrame.pages[7].Raidlayoutswitch:SetWidth(30)
	LunaOptionsFrame.pages[7].Raidlayoutswitch:SetPoint("TOPLEFT", LunaOptionsFrame.pages[7], "TOPLEFT", 20, -40)
	LunaOptionsFrame.pages[7].Raidlayoutswitch:SetScript("OnClick", ToggleRaidLayout)
	LunaOptionsFrame.pages[7].Raidlayoutswitch:SetChecked(LunaOptions.Raidlayout == "GRID")
	getglobal("RaidLayoutSwitchText"):SetText("GRID Layout")
	
	LunaOptionsFrame.pages[7].scaleslider = CreateFrame("Slider", "RaidScaleSlider", LunaOptionsFrame.pages[7], "OptionsSliderTemplate")
	LunaOptionsFrame.pages[7].scaleslider:SetMinMaxValues(20,60)
	LunaOptionsFrame.pages[7].scaleslider:SetValueStep(1)
	LunaOptionsFrame.pages[7].scaleslider:SetScript("OnValueChanged", RaidScaleAdjust)
	LunaOptionsFrame.pages[7].scaleslider:SetPoint("TOPLEFT", LunaOptionsFrame.pages[7], "TOPLEFT", 20, -80)
	LunaOptionsFrame.pages[7].scaleslider:SetValue(LunaOptions.frames[LunaOptions.Raidlayout].size)
	LunaOptionsFrame.pages[7].scaleslider:SetWidth(460)
	getglobal("RaidScaleSliderText"):SetText("Scale: "..LunaOptions.frames[LunaOptions.Raidlayout].size)
	
	LunaOptionsFrame.pages[7].paddingslider = CreateFrame("Slider", "RaidPaddingSlider", LunaOptionsFrame.pages[7], "OptionsSliderTemplate")
	LunaOptionsFrame.pages[7].paddingslider:SetMinMaxValues(0,20)
	LunaOptionsFrame.pages[7].paddingslider:SetValueStep(1)
	LunaOptionsFrame.pages[7].paddingslider:SetScript("OnValueChanged", RaidPaddingAdjust)
	LunaOptionsFrame.pages[7].paddingslider:SetPoint("TOPLEFT", LunaOptionsFrame.pages[7], "TOPLEFT", 20, -120)
	LunaOptionsFrame.pages[7].paddingslider:SetValue(LunaOptions.frames[LunaOptions.Raidlayout].padding)
	LunaOptionsFrame.pages[7].paddingslider:SetWidth(215)
	getglobal("RaidPaddingSliderText"):SetText("Padding: "..LunaOptions.frames[LunaOptions.Raidlayout].padding)
	
	LunaOptionsFrame.pages[7].RaidGrpNameswitch = CreateFrame("CheckButton", "RaidGroupNamesSwitch", LunaOptionsFrame.pages[7], "UICheckButtonTemplate")
	LunaOptionsFrame.pages[7].RaidGrpNameswitch:SetHeight(20)
	LunaOptionsFrame.pages[7].RaidGrpNameswitch:SetWidth(20)
	LunaOptionsFrame.pages[7].RaidGrpNameswitch:SetPoint("TOPLEFT", LunaOptionsFrame.pages[7].paddingslider, "TOPLEFT", 0, -40)
	LunaOptionsFrame.pages[7].RaidGrpNameswitch:SetScript("OnClick", ToggleRaidGroupNames)
	LunaOptionsFrame.pages[7].RaidGrpNameswitch:SetChecked(LunaOptions.frames[LunaOptions.Raidlayout].ShowRaidGroupTitles)
	getglobal("RaidGroupNamesSwitchText"):SetText("Show Group Names")

end