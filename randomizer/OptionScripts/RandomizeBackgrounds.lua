local ValueToCompare = readInteger("gnazo.exe+59772")
ValueToCompare = ValueToCompare + 0x6031C0 --gnazo.exe+940850
--Stage Music Override
writeInteger("gnazo.exe+59772",ValueToCompare)
--Stage has sunlight Override
writeInteger("gnazo.exe+16831B",ValueToCompare)
--writeBytes("gnazo.exe+61D8A",{0x90,0x90,0x90,0x90,0x90,0x90})

--Background Data
local StartingBackground = 0x3076FA --Stage 0, Room 1
local BackgroundOffset = 0x18

--local StageIsInDarkness = {0,0,0,0,0,0,1,1,1,0,1,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0}
--StageDarknessOverride = {}

local WriteBackgroundData =
  function(OriginalRoomID,NewRoomID)
    local Address = StartingBackground - ((OriginalRoomID-1)*BackgroundOffset)
    --print(string.format(" Writing Background Data "..OriginalRoomID.." as "..NewRoomID.." at address %X",Address))
    local ValueLength = 3
    if OriginalRoomID >= 1000 then
      ValueLength = 4
    end
    
    local NewLength = 3
    if NewRoomID >= 1000 then
      NewLength = 4
    end
    if not (NewRoomID == OriginalRoomID) then
      StageBackgroundOverrides[OriginalRoomID] = NewRoomID
      local NewBackground = tostring(NewRoomID)
      if string.len(NewBackground) < 3 then
        NewBackground = "0"..NewBackground
      end
      if ValueLength == NewLength then
        for n = 1,NewLength,1 do
          local Byte = string.byte(NewBackground,n)
          writeBytes(string.format("gnazo.exe+%X",Address+(n-1)),Byte)
        end
      else
        local DataToPreserve = readBytes(string.format("gnazo.exe+%X",Address+ValueLength),8,true)
        table.insert(DataToPreserve,0)
        for n = 1,NewLength,1 do
          local Byte = string.byte(NewBackground,n)
          writeBytes(string.format("gnazo.exe+%X",Address+(n-1)),Byte)
        end
        writeBytes(string.format("gnazo.exe+%X",Address+NewLength),DataToPreserve)
      end
    end
    
    --[[local OriginalStage = math.floor(OriginalRoomID/10)
    local NewStage = math.floor(NewRoomID/10)
    if StageIsInDarkness[NewStage] == 1 then
      StageIsInDarkness[NewStage] = 0
      StageDarknessOverride[OriginalStage] = 1
      --print(OriginalStage.." is now dark room")
    elseif StageDarknessOverride[OriginalStage] == nil then
      StageDarknessOverride[OriginalStage] = 0
    end]]
  end

local RoomsWithStaticBackgrounds = {10,53,60,110,140,141,142,150,161,162,172,182,183,200,220,232,241,242,250,252,253,300,301,302,371,372,401,402,410,420,440,460,461,462,471,490,491,500,501,510,511,512,513,530,540,550,571,572,620,630,631,640,642,661,662,671,672,742,743,760,791,792,880,900,901,902,910,921,1000,1001,1002,1060,1061,1062,1063,1080,1090,1091,1092,1101,1110,1111,1112,1120,1131,1132,1140,1190,1191,1192,1231,1250,1251,1252,1253,1270,1291,1310,1312,1313,1320,1331,1350,1351,1352,1380,1381,1382,1391,1420,1421,1422,1471,1481,1482,1502,1503,1521,1530,1581,1582,1590,1630,1631,1660,1691,1702,1703,1720,1730,1731,1732,1760,1762,1770,1771,1772,1780,1801,1810,1812,1830,1860,1861,1862,1891,1910,1960,1991,1992,2000,2001,2002,2040,2080,2081,2082,2101,2102,2170,2200,2201,2202}
local StageShouldRemainTheSameArea = {}
for i = 1,#RoomsWithStaticBackgrounds,1 do
  local Stage = math.floor(RoomsWithStaticBackgrounds[i]/10)
  StageShouldRemainTheSameArea[Stage] = true
end

local RoomsWithBackgrounds = {}
--Outdoors
RoomsWithBackgrounds[1] = {11,12,20,21,30,31,40,41,50,100,101,131,132,160,170,171,180,181,251,260,270,271,272,280,281,282,283,290,291,292,293,310,320,430,431,450,451,452,453,492,520,560,570,690,700,710,720,721,730,740,750,770,771,780,790,800,801,810,820,821,830,850,860,861,870,911,920,922,930,931,940,950,960,970,980,1020,1030,1040,1170,1180,1181,1240,1241,1300,1301,1311,1330,1332,1340,1341,1360,1370,1371,1390,1392,1500,1501,1510,1520,1522,1560,1561,1570,1580,1591,1610,1611,1620,1632,1640,1650,1651,1661,1670,1671,1680,1690,1692,1700,1701,1710,1733,1740,1750,1761,1763,1781,1790,1791,1800,1811,1820,1840,1841,1850,1870,1880,1890,1892,1900,1901,1920,1921,1930,1931,1940,1950,1961,1970,1980,1990,2010,2011,2020,2030,2050,2051,2052,2060,2070,2090,2100,2110,2111,2120,2130,2140,2150,2151,2160,2180,2190}
--Indoors
RoomsWithBackgrounds[2] = {70,71,120,190,191,201,202,210,230,231,240,330,331,340,341,342,350,360,370,380,381,390,391,400,470,480,580,590,600,610,611,621,622,641,650,651,660,670,680,731,741,840,890,990,991,1010,1050,1051,1070,1071,1100,1102,1130,1150,1151,1160,1200,1201,1210,1211,1220,1221,1230,1260,1280,1281,1290,1292,1400,1401,1410,1411,1430,1431,1440,1450,1460,1470,1480,1490,1540,1541,1550,1600,1601}
local RoomsWithOneScreenBackgrounds = {{22,42,51,52,130,133},{80,81,82,90,91,92}}
local StageAreas = {2,2,2,4,4,4,3,3,3,4,3,3,4,4,3,4,5,5,5,5,5,4,5,5,5,5,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,42,12,12,12,12,12,12,12,12,12,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,8,13,13,13,13,13,13,13,13,13,13,13,14,14,14,14,26,14,14,14,8,8,14,14,14,26,26,26,26,26,26,26,26,26,26,26,26,9,9,9,9,9,9,9,9,9,9,9,9,14,14,15,15,15,15,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,16,16,10,10,10,10,10,10,10,10,10,10,17,17,17,17,17,17,17,17,17,17,17,17,17,17,17,18,18,18,18,18,18,18,18,18,18,18,18,18,18,19,19,19,19,19,19,19,19,19,19,19,20,20,20,20,20,20,20,20,20,20,20,22,22,22,22,22,22,22,22,22,22,24,24,24,24,24,24,24,24,24,24}

local AreaValidated = {}
local ValidAreas = {}
local AllAreaBackgroundsInUse = {}
local BackgroundsInArea = {} --Background Index, Can Scroll
local BackgroundsInAreaInUse = {}
local BackgroundsInStage = {}
local CurrentRoomIndex = {1,1}
local CurrentRoomIndex_OneScreen = {1,1}
for s = 1,220,1 do
  local Area = StageAreas[s]
  if not AreaValidated[Area] then
    table.insert(ValidAreas,Area)
    AreaValidated[Area] = true
  end
  BackgroundsInStage[s] = {{},{}}
  if BackgroundsInArea[Area] == nil then
    BackgroundsInArea[Area] = {{},{}}
  end
  if BackgroundsInAreaInUse[Area] == nil then
    BackgroundsInAreaInUse[Area] = {{},{}}
  end
  if AllAreaBackgroundsInUse[Area] == nil then
    AllAreaBackgroundsInUse[Area] = {false,false}
  end
  for o = 1,2,1 do
    for r = CurrentRoomIndex[o],#RoomsWithBackgrounds[o],1 do
      local Stage = math.floor(RoomsWithBackgrounds[o][r]/10)
      if Stage == s then
        table.insert(BackgroundsInArea[Area][o],{RoomsWithBackgrounds[o][r],true})
        table.insert(BackgroundsInStage[s][o],{RoomsWithBackgrounds[o][r],true})
        CurrentRoomIndex[o] = CurrentRoomIndex[o] + 1
      else
        break
      end
    end
    for r = CurrentRoomIndex_OneScreen[o],#RoomsWithOneScreenBackgrounds[o],1 do
      local Stage = math.floor(RoomsWithOneScreenBackgrounds[o][r]/10)
      if Stage == s then
        table.insert(BackgroundsInArea[Area][o],{RoomsWithOneScreenBackgrounds[o][r],false})
        table.insert(BackgroundsInStage[s][o],{RoomsWithOneScreenBackgrounds[o][r],false})
        CurrentRoomIndex_OneScreen[o] = CurrentRoomIndex_OneScreen[o] + 1
      else
        break
      end
    end
  end
end

for s = 1,220,1 do
  if StageShouldRemainTheSameArea[s] then
    --print("Handling Stage "..s)
    local Area = StageAreas[s]
    for o = 1,2,1 do
      for b = 1,#BackgroundsInStage[s][o],1 do
        local BackgroundScrolls = BackgroundsInStage[s][o][b][2]
        local NewBackgroundIndex = math.random(1,#BackgroundsInArea[Area][o])
        for i = 1,#BackgroundsInArea[Area][o] do
          if not BackgroundsInAreaInUse[Area][o][NewBackgroundIndex] then
            local NewBackgroundScrolls = BackgroundsInArea[Area][o][NewBackgroundIndex][2]
            if (BackgroundScrolls and NewBackgroundScrolls) or ((not BackgroundScrolls) and (not NewBackgroundScrolls)) then
              break
            end
          end
          NewBackgroundIndex = NewBackgroundIndex + 1
          if NewBackgroundIndex > #BackgroundsInArea[Area][o] then
            NewBackgroundIndex = 1
          end
        end
        if not ((not BackgroundScrolls) and BackgroundsInArea[Area][o][NewBackgroundIndex][2]) then
          BackgroundsInAreaInUse[Area][o][NewBackgroundIndex] = true
        end
        WriteBackgroundData(BackgroundsInStage[s][o][b][1],BackgroundsInArea[Area][o][NewBackgroundIndex][1])
      end
    end
  end
end

for s = 1,220,1 do
  if not StageShouldRemainTheSameArea[s] then
    --print("Handling Stage "..s)
    local Area = StageAreas[s]
    local RequiresOutdoorBackgrounds = #BackgroundsInStage[s][1] > 0
    local RequiresIndoorBackgrounds = #BackgroundsInStage[s][2] > 0
    local NewArea = 0
    for i = 1,100,1 do
      NewArea = ValidAreas[math.random(1,#ValidAreas)]
      if (not RequiresOutdoorBackgrounds) or ((RequiresOutdoorBackgrounds and (#BackgroundsInArea[NewArea][1] > 0)) and ((not AllAreaBackgroundsInUse[NewArea][1]) or (i > 50))) then
        if (not RequiresIndoorBackgrounds) or ((RequiresIndoorBackgrounds and (#BackgroundsInArea[NewArea][2] > 0)) and ((not AllAreaBackgroundsInUse[NewArea][2]) or (i > 50))) then
          break
        end
      end
    end
    if (NewArea == 9) or (NewArea == 10) or (NewArea == 20) or (NewArea == 22) then --Remilia, Flandre, Kanako, Mokou
      StageWaterColor[s] = 1
    end
    for o = 1,2,1 do
      for b = 1,#BackgroundsInStage[s][o],1 do
        local BackgroundScrolls = BackgroundsInStage[s][o][b][2]
        local NewBackgroundScrolls
        local NewBackgroundIndex = math.random(1,#BackgroundsInArea[NewArea][o])
        local SelectedProperly = false
        for i = 1,#BackgroundsInArea[NewArea][o]*3 do
          if (not BackgroundsInAreaInUse[NewArea][o][NewBackgroundIndex]) or (i > #BackgroundsInArea[NewArea][o]*2) then
            NewBackgroundScrolls = BackgroundsInArea[NewArea][o][NewBackgroundIndex][2]
            if (BackgroundScrolls and NewBackgroundScrolls)
            or ((not BackgroundScrolls) and (not NewBackgroundScrolls))
            or ((i > #BackgroundsInArea[NewArea][o]) and NewBackgroundScrolls) then
              break
            end
          end
          NewBackgroundIndex = NewBackgroundIndex + 1
          if NewBackgroundIndex > #BackgroundsInArea[NewArea][o] then
            NewBackgroundIndex = 1
          end
        end
        if not ((not BackgroundScrolls) and NewBackgroundScrolls) then
          BackgroundsInAreaInUse[NewArea][o][NewBackgroundIndex] = true --One-Screen Backgrounds won't mark off Scrolling Backgrounds as in use
        end
        WriteBackgroundData(BackgroundsInStage[s][o][b][1],BackgroundsInArea[NewArea][o][NewBackgroundIndex][1])
        
        local AllBackgroundsInUse = true
        for i = 1,#BackgroundsInArea[NewArea][o],1 do
          if not BackgroundsInAreaInUse[NewArea][o][i] then
            AllBackgroundsInUse = false
            break
          end
        end
        if AllBackgroundsInUse then
          AllAreaBackgroundsInUse[NewArea][o] = true
        end
        
      end
    end
  end
end

local HalloweenMode = (RandomSeed == 666) or ((os.date('%m') == "10") and (os.date('%d') == "31"))

for i = 1,220,1 do
  if HalloweenMode then
    StageWaterColor[i] = 1
  else
    if (StageWaterColor[i] == nil) then
      if (math.random() < 0.1) then
        StageWaterColor[i] = 1
      else
        StageWaterColor[i] = 0
      end
    end
  end
end

--[[for i = 1,220,1 do
  if StageDarknessOverride[i] == nil then
    StageDarknessOverride[i] = 0
  end
end]]

--[[local BlockIndex = math.ceil(math.random()*3)-1
BlockIndex = 2 --DEBUG

if BlockIndex > 0 then
  local BlockAddresses = {0x3167C4,0x3167DC,0x3167F4,0x31680C,0x316824,0x316840}
  local AddonNames = {"32_0","64_0","128_0","64b_0","128b_0","64c_0"}
  
  for i = 1,#BlockAddresses,1 do
    local String = "ex\\colorblock"..AddonNames[i]..BlockIndex..".bmp"
    local Address = BlockAddresses[i]
    local Length = string.len(String)
    for n = 1,Length,1 do
      local Byte = string.byte(String,n)
      writeBytes(string.format("gnazo.exe+%X",Address+(n-1)),Byte)
    end
  end
  local String = "ex\\switch"..BlockIndex..".bmp"
  local Address = 0x316344 --I can't find the dumb switch graphic
  local Length = string.len(String)
  for n = 1,Length,1 do
    local Byte = string.byte(String,n)
    writeBytes(string.format("gnazo.exe+%X",Address+(n-1)),Byte)
  end
end]]

--[[local CreatePlatform = 
  function(XCoord,YCoord,XSize,YSize,Sprite,AltColor)
    for i = 1,64,1 do
      local Offset = (i-1) * PlatformOffset
      if readBytes(string.format("gnazo.exe+%X",PlatformExistsAddress+Offset),1) == 0 then
        PlatformHandled[i] = true
        writeFloat(string.format("gnazo.exe+%X",PlatformXCoordAddress+Offset),XCoord)
        writeFloat(string.format("gnazo.exe+%X",PlatformYCoordAddress+Offset),YCoord)
        writeInteger(string.format("gnazo.exe+%X",PlatformSpriteXSizeAddress+Offset),XSize)
        writeInteger(string.format("gnazo.exe+%X",PlatformSpriteYSizeAddress+Offset),YSize)
        writeFloat(string.format("gnazo.exe+%X",PlatformCollisionXSizeAddress+Offset),XSize-2)
        writeFloat(string.format("gnazo.exe+%X",PlatformCollisionYSizeAddress+Offset),YSize-2)
        writeInteger(string.format("gnazo.exe+%X",PlatformSpriteAddress+Offset),PlatformSpriteOffset+Sprite)
        writeBytes(string.format("gnazo.exe+%X",PlatformAltColorAddress+Offset),AltColor)
        
        writeBytes(string.format("gnazo.exe+%X",PlatformCollisionTypeAddress+Offset),0)
        writeBytes(string.format("gnazo.exe+%X",PlatformBehaviourAddress+Offset),1)
        writeBytes(string.format("gnazo.exe+%X",PlatformTimerAddress+Offset),0)
        writeBytes(string.format("gnazo.exe+%X",PlatformTimerLimitAddress+Offset),0)
        writeFloat(string.format("gnazo.exe+%X",PlatformWeightAddress+Offset),0)
        writeFloat(string.format("gnazo.exe+%X",PlatformVelocityXAddress+Offset),0)
        writeFloat(string.format("gnazo.exe+%X",PlatformVelocityYAddress+Offset),0)
        writeFloat(string.format("gnazo.exe+%X",PlatformBobbingVelocityXAddress+Offset),0)
        writeFloat(string.format("gnazo.exe+%X",PlatformBobbingVelocityYAddress+Offset),0)
        writeFloat(string.format("gnazo.exe+%X",PlatformBobbingTimeAddress+Offset),0)
        writeBytes(string.format("gnazo.exe+%X",PlatformIndicatorTypeAddress+Offset),0)
        writeBytes(string.format("gnazo.exe+%X",PlatformTypeAddress+Offset),0)
        writeBytes(string.format("gnazo.exe+%X",PlatformVanishesAddress+Offset),0)
        writeBytes(string.format("gnazo.exe+%X",PlatformSpecialBehaviourAddress+Offset),0)
        writeBytes(string.format("gnazo.exe+%X",PlatformExistsAddress+Offset),1)
        break
      end
    end
  end]]
  
--Platform Table Addresses
local PlatformExistsAddress = 0xB34BAC
local PlatformAltColorAddress = 0xB34B9C
local PlatformSpriteAddress = 0xB34BA8
local PlatformXCoordAddress = 0xB34B48
local PlatformYCoordAddress = 0xB34B4C
local PlatformSpriteXSizeAddress = 0xB34B50
local PlatformSpriteYSizeAddress = 0xB34B54
local PlatformCollisionXSizeAddress = 0xB34B58
local PlatformCollisionYSizeAddress = 0xB34B5C
local PlatformCollisionTypeAddress = 0xB34C0D
local PlatformConveyorSpeedAddress = 0xB34C13

local PlatformBehaviourAddress = 0xB34BCC
local PlatformTimerAddress = 0xB34BD0
local PlatformTimerLimitAddress = 0xB34BD4
local PlatformWeightAddress = 0xB34BE0
local PlatformVelocityXAddress = 0xB34BEC
local PlatformVelocityYAddress = 0xB34BF0
local PlatformBobbingVelocityXAddress = 0xB34BF4
local PlatformBobbingVelocityYAddress = 0xB34BF8
local PlatformBobbingTimeAddress = 0xB34C00
local PlatformIndicatorTypeAddress = 0xB34C0E
local PlatformTypeAddress = 0xB35020
local PlatformVanishesAddress = 0xB35024
local PlatformSpecialBehaviourAddress = 0xB35044

local PlatformOffset = 0x504
  
local PlatformSpriteOffset = nil
local DesiredPlatformColor = {}
local PlatformHandled = {}
local PlatformRoomwideColor = {{},{},{},{},{}}
local PlatformSprites = {} --Offset from Cloud, Number of Colors, Offset Between Colors, Room-Wide Color Index (0 = full random)
                           --Sprite X, Sprite Y, Type, Behavior
PlatformSprites[1] =  {      0, 4,1,0,64,32,1,31} --Cloud
PlatformSprites[2] =  {   2772, 4,1,5,128,128,0,0} --4x4 Block
PlatformSprites[3] =  {   2788, 4,1,1,256,128,0,0} --8x4 Wide Platform
PlatformSprites[4] =  {   2804, 4,1,1,256,64,0,0} --8x2 Wide Platform
PlatformSprites[5] =  {   2820, 4,1,2,128,256,0,0} --4x8 Pillar
PlatformSprites[6] =  {   2836, 4,1,2,64,256,0,0} --2x8 Pillar
PlatformSprites[7] =  {  19876,10,1,3,64,32,1,0} --2x1 Thin Platform
PlatformSprites[8] =  {  20004,10,1,3,128,32,1,0} --4x1 Thin Platform
PlatformSprites[9] =  { 832532, 8,1,4,32,32,0,0} --1x1 Block
PlatformSprites[10] = { 832564, 8,1,4,64,32,0,0} --2x1 Block
PlatformSprites[11] = { 832596, 8,1,4,128,32,0,0} --4x1 Block
PlatformSprites[12] = { 904832, 2,4,0,64,32,2,0} --Flip Platform
PlatformSprites[13] = {3358552, 2,1,0,32,32,0,0} --Movable Rock

local BossChallengeRooms = {91,161,241,252,301,401,671,1131,1481,512,791,921,1291,1351,1391,1581,1631,2101,1762,1891,1991,2001,2201,1001,1001,10}

table.insert(ObjectTypesToHandle,{"Water",34000,34401})
local WaterHandled = {}
  
local AddFunc =
  function()
    if CurrentMusic == 0 then --TODO: Something in here is causing Boss Challenge to go to Stage 1 rarely?
      if CurrentTitleScreenMenu == 1 then --Load Menu
        local SavedDestinationStage = readInteger(string.format("gnazo.exe+%X", 0x854110+(4*CurrentSave) ))
        --print(string.format("gnazo.exe+%X", 0x854110+(4*CurrentSave)),SavedDestinationStage)
        if StageBackgroundOverrides[SavedDestinationStage] then
          writeInteger("gnazo.exe+940850",StageBackgroundOverrides[SavedDestinationStage])
        else
          writeInteger("gnazo.exe+940850",SavedDestinationStage)
        end
      elseif CurrentTitleScreenMenu == 2 then --Difficulty Select Menu
        writeInteger("gnazo.exe+940850",10)
      elseif CurrentTitleScreenMenu == 6 or CurrentTitleScreenMenu == 9 then
        writeInteger("gnazo.exe+940850",BossChallengeRooms[SelectedBoss+1])
      end
    else
      if IngameMenu == 3 then
        writeInteger("gnazo.exe+940850",10)
        writeInteger("gnazo.exe+33D690",10)
      elseif StageBackgroundOverrides[DestinationRoom] then
        writeInteger("gnazo.exe+940850",StageBackgroundOverrides[DestinationRoom])
      elseif not (IngameMenu == 6) then
        writeInteger("gnazo.exe+940850",DestinationRoom)
      end
    end
    if IngameMenu == 0 then
      for i = 1,64,1 do
        local Offset = (i-1) * PlatformOffset
        if readBytes(string.format("gnazo.exe+%X",PlatformExistsAddress+Offset),1) >= 1 then
          if not PlatformHandled[i] then
            local AltColor = readInteger(string.format("gnazo.exe+%X",PlatformAltColorAddress+Offset))
            if not (DesiredPlatformColor[i] == AltColor) then
              --print("Handling Platform "..i)
              local Sprite = readInteger(string.format("gnazo.exe+%X",PlatformSpriteAddress+Offset))
              local SpriteIndex
              for s = 1,#PlatformSprites,1 do
                if PlatformSpriteOffset then
                  if PlatformSpriteOffset+PlatformSprites[s][1] == Sprite then
                    SpriteIndex = s
                    break
                  end
                else --Grab the sprite offset from the type of platform
                  local ConveyorSpeed = readBytes(string.format("gnazo.exe+%X", PlatformConveyorSpeedAddress+Offset),1)
                  if ConveyorSpeed < 60 then
                    local CollisionType = readBytes(string.format("gnazo.exe+%X", PlatformCollisionTypeAddress+Offset),1)
                    local ThisOne = false
                    if (s == 13) and (CollisionType > 0) then --Pushable rock
                      ThisOne = true
                    elseif CollisionType == 0 then
                      local CompareValues = {}
                      CompareValues[5] = readInteger(string.format("gnazo.exe+%X", PlatformSpriteXSizeAddress+Offset))
                      CompareValues[6] = readInteger(string.format("gnazo.exe+%X", PlatformSpriteYSizeAddress+Offset))
                      CompareValues[7] = readInteger(string.format("gnazo.exe+%X", PlatformTypeAddress+Offset))
                      CompareValues[8] = readInteger(string.format("gnazo.exe+%X", PlatformSpecialBehaviourAddress+Offset))
                      for c = 5,8,1 do
                        if not (PlatformSprites[s][c] == CompareValues[c]) then
                          break
                        elseif c == 8 then
                          ThisOne = true
                        end
                      end
                    end
                    if ThisOne then
                      PlatformSpriteOffset = Sprite - PlatformSprites[s][1]
                      SpriteIndex = s
                      break
                    end
                  end
                end
              end
              if not (SpriteIndex == nil) then
                --DebugPrint("Platform",i..": Sprite Index",SpriteIndex)
                ResetRNG( math.ceil((RandomSeed+(DestinationRoom*2.34))+(i*4.32)) )
                local RoomwideIndex = PlatformSprites[SpriteIndex][4]
                if RoomwideIndex == 0 then
                  local NewColor = (math.random(1,PlatformSprites[SpriteIndex][2]) * PlatformSprites[SpriteIndex][3])
                  if SpriteIndex == 13 then --Randomly sized rocks
                    local YCoord = readFloat(string.format("gnazo.exe+%X", PlatformYCoordAddress+Offset))
                    local Size
                    if YCoord < 340 then
                      Size = math.random(1,3)
                      if Size == 3 then
                        Size = 4 --Exclude tall rocks
                      end
                    else
                      Size = math.random(1,2)
                    end
                    if Size > 1 and ((not (Size == 4)) or (math.random() < 0.5)) then
                      NewColor = ((Size * 2) - NewColor)
                      if Size == 2 or Size == 4 then
                        writeInteger(string.format("gnazo.exe+%X", PlatformSpriteXSizeAddress+Offset),64)
                        writeFloat(string.format("gnazo.exe+%X", PlatformCollisionXSizeAddress +Offset),62)
                      end
                      if Size > 2 then
                        writeInteger(string.format("gnazo.exe+%X", PlatformSpriteYSizeAddress+Offset),64)
                        writeFloat(string.format("gnazo.exe+%X", PlatformCollisionYSizeAddress+Offset),62)
                        writeFloat(string.format("gnazo.exe+%X", PlatformYCoordAddress+Offset),YCoord-16)
                      end
                      if (Size == 2) then
                        writeInteger(string.format("gnazo.exe+%X", PlatformCollisionTypeAddress+Offset),10)
                      elseif (Size == 3) then
                        writeInteger(string.format("gnazo.exe+%X", PlatformCollisionTypeAddress+Offset),115)
                      elseif (Size == 4) then
                        writeInteger(string.format("gnazo.exe+%X", PlatformCollisionTypeAddress+Offset),110)
                      end
                    else
                      NewColor = NewColor - 1
                    end
                  else
                    NewColor = NewColor - 1
                  end
                  writeInteger(string.format("gnazo.exe+%X", PlatformAltColorAddress+Offset),NewColor)
                  DesiredPlatformColor[i] = NewColor
                  if PlatformSprites[SpriteIndex][3] > 1 then
                    PlatformHandled[i] = true
                  end
                else
                  local RoomwideColor = PlatformRoomwideColor[RoomwideIndex][AltColor]
                  if RoomwideColor == nil then
                    local NewColor = (math.random(1,PlatformSprites[SpriteIndex][2]) * PlatformSprites[SpriteIndex][3]) - 1
                    writeInteger(string.format("gnazo.exe+%X", PlatformAltColorAddress+Offset),NewColor)
                    DesiredPlatformColor[i] = NewColor
                    PlatformRoomwideColor[RoomwideIndex][AltColor] = NewColor
                    if PlatformSprites[SpriteIndex][3] > 1 then
                      PlatformHandled[i] = true
                    end
                  else
                    writeInteger(string.format("gnazo.exe+%X", PlatformAltColorAddress+Offset),RoomwideColor)
                    DesiredPlatformColor[i] = RoomwideColor
                  end
                end
              else
                DesiredPlatformColor[i] = AltColor
                PlatformHandled[i] = true
              end
            end
          end
        end
      end
    end
    
    if not ChangingRooms then
      if TrackedObjects and TrackedObjects["Water"] then
        for i = 1,#TrackedObjects["Water"],1 do
          if not WaterHandled[i] then
            --print("Handling Water",i)
            WaterHandled[i] = true
            if StageWaterColor[math.floor(DestinationRoom/10)] == 1 then
              local ObjectPos = TrackedObjects["Water"][i]
              local Offset = ObjectDataOffset * (ObjectPos - 1)
              local ObjectIndex = readInteger(string.format("gnazo.exe+%X", ObjectIndexAddress+Offset))
              writeInteger(string.format("gnazo.exe+%X", ObjectIndexAddress+Offset),ObjectIndex+1)
              --print(" changed to bloody water",ObjectIndex+1)
            end
          end
        end
      end
    else
      WaterHandled = {}
      PlatformHandled = {}
      DesiredPlatformColor = {}
    end
    
    --[[if not (StageDarknessOverride == nil) then
      local RoomIsInDarkness = readBytes("gnazo.exe+7F7E58",1)
      if not (RoomIsInDarkness == StageDarknessOverride[math.floor(DestinationRoom/10)]) then
        writeBytes("gnazo.exe+7F7E58",StageDarknessOverride[math.floor(DestinationRoom/10)])
      end
    end]]
  end
  
table.insert(RuntimeFunctions,AddFunc)