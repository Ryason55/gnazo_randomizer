local Player1CharFunction = readInteger("gnazo.exe+5C4B5")
writeBytes("gnazo.exe+5C4B3",0xE8)
writeInteger("gnazo.exe+5C4B4",(0x1B0ED4-0x5C4B3)-5)
writeBytes("gnazo.exe+5C4B8",0x90)
writeBytes("gnazo.exe+1B0ED4",{0xC7,0x05})
writeInteger("gnazo.exe+1B0ED6",Player1CharFunction)
writeBytes("gnazo.exe+1B0EDA",{0x00,0x00,0x00,0x00,0xC3})

for i = 0,24,1 do --Allows True Yukari to appear with "unusable" characters (SSC)
  if (i <= 12) then
    writeBytes(string.format("gnazo.exe+%X", 0x1680DE+(0xD*i)),{0x0F,0x8C} )
  elseif (i >= 14) then
    writeBytes(string.format("gnazo.exe+%X", 0x168194+(0x9*(i-14))),0x7C )
  end
end

--Prevents bosses from reappearing in Solo Character mode
--(Changes "Not Equal To" to "Less Than")
writeBytes("gnazo.exe+BB6D7",0x7C) --Alice
writeBytes("gnazo.exe+C3F57",0x7C) --Cirno 
writeBytes("gnazo.exe+CBC77",0x7C) --Meiling
writeBytes("gnazo.exe+D2E67",0x7C) --Patchouli
writeBytes("gnazo.exe+E46F7",0x7C) --Sakuya
writeBytes("gnazo.exe+105037",0x7C) --Remilia
writeBytes("gnazo.exe+F94CA",0x7C) --Youmu
writeBytes("gnazo.exe+111FAA",0x7C) --Yuyuko
writeBytes("gnazo.exe+B491C",0x7C) --Rumia
writeBytes("gnazo.exe+C3497",0x7C) --Daiyousei
writeBytes("gnazo.exe+12800A",0x7C) --Flandre
writeBytes("gnazo.exe+FE42A",0x7C) --Yukari
writeBytes("gnazo.exe+FE58C",{0x0F,0x9C}) --Wall after Yukari
--writeBytes("gnazo.exe+D309F",0x7C) --Gap Yukari in 42
writeBytes("gnazo.exe+DB49A",0x7C) --Keine
writeBytes("gnazo.exe+11AC6A",0x7C) --Tewi
writeBytes("gnazo.exe+11FD8A",0x7C) --Reisen
writeBytes("gnazo.exe+12EA7A",0x7C) --Eirin
writeBytes("gnazo.exe+132B7A",0x7C) --Kaguya
writeBytes("gnazo.exe+155CDA",0x7C) --Mokou
writeBytes("gnazo.exe+F146A",0x7C) --Nitori
writeBytes("gnazo.exe+13BF6A",0x7C) --Aya
writeBytes("gnazo.exe+14343A",0x7C) --Sanae
writeBytes("gnazo.exe+14C2AA",0x7C) --Kanako 1
writeBytes("gnazo.exe+14C3CC",{0x0F,0x9C}) --Wall after Kanako 1
writeBytes("gnazo.exe+14C4EA",0x7C) --Kanako 2
writeBytes("gnazo.exe+15B8AA",0x7C) --Suwako

local SoloCharJumpPowers = {} --Desired Jump Velocity for characters in solo mode when possessing a Level 2 or 3 jumper (the only natural jump levels aside from 0)
SoloCharJumpPowers[0] = { 12.1 , 12.55 } --Reimu
SoloCharJumpPowers[1] = { 14 , 14.325 } --Marisa
SoloCharJumpPowers[2] = { 13.2 , 13.8 } --Alice
SoloCharJumpPowers[3] = { 14 , 14.8 } --Cirno
SoloCharJumpPowers[4] = { 12.1 , 12.55 } --Meiling
SoloCharJumpPowers[5] = { 11 , 11.75 } --Patchouli
SoloCharJumpPowers[6] = { 13.3 , 13.9 } --Sakuya
SoloCharJumpPowers[7] = { 15.8 , 17 } --Remilia
SoloCharJumpPowers[8] = { 14 , 14.725 } --Youmu
SoloCharJumpPowers[9] = { 11 , 11.8 } --Yuyuko
SoloCharJumpPowers[10] = { 12.8 , 13.8 } --Rumia
SoloCharJumpPowers[11] = { 12.26 , 13.5 } --Daiyousei
SoloCharJumpPowers[12] = { 15.8 , 17 } --Flandre
SoloCharJumpPowers[13] = { 11 , 11.8 } --Yukari
SoloCharJumpPowers[14] = { 13.2 , 13.8 } --Keine
SoloCharJumpPowers[15] = { 13.3 , 13.7 } --Tewi
SoloCharJumpPowers[16] = { 12.9 , 13.7 } --Reisen
SoloCharJumpPowers[17] = { 12.1 , 12.55 } --Eirin
SoloCharJumpPowers[18] = { 10.5 , 11.25 } --Kaguya
SoloCharJumpPowers[19] = { 12.9 , 13.7 } --Mokou
SoloCharJumpPowers[20] = { 12.1 , 13 } --Nitori
SoloCharJumpPowers[21] = { 13.1 , 14.1 } --Aya
SoloCharJumpPowers[22] = { 12.6 , 13.25 } --Sanae
SoloCharJumpPowers[23] = { 11 , 11.8 } --Kanako
SoloCharJumpPowers[24] = { 13 , 13 } --Suwako

--local CharMoveSpeeds_Base = {4,4.3,4.15,4.61,4,3.7,4.19,4.88,4.5,3.9,4.5,4.2,5,4,4.15,4.5,4.3,4,3.8,4.2,4.1,4.4,4.1,3.9,4.5}
local CharMoveSpeeds_Base = {4,4.3,4.15,4.61,4,3.7,4.19,4.61,4.5,3.9,4.5,4.2,4.61,4,4.15,4.5,4.3,4,3.8,4.2,4.1,4.4,4.1,3.9,4.5}
local CharMoveSpeeds = {}
for i = 1,#CharMoveSpeeds_Base,1 do
  CharMoveSpeeds[i] = {i-1,CharMoveSpeeds_Base[i]}
end
table.sort(CharMoveSpeeds,function(a,b) return a[2] > b[2] end)

local Player1JumpPowerString = string.format("gnazo.exe+%X",0x928C68)
local Player2JumpPowerString = string.format("gnazo.exe+%X",0x92B2E0)
local SetPlayerJumpPower = --For Solo character mode
  function(NewJumpPower)
    local JumpPower = readFloat(Player1JumpPowerString)
    if JumpPower < NewJumpPower then
      writeFloat(Player1JumpPowerString,NewJumpPower)
    end
    --[[JumpPower = readFloat(Player2JumpPowerString)
    if JumpPower < NewJumpPower then
      writeFloat(Player2JumpPowerString,NewJumpPower)
    end]]
  end

local UnlockedReimu = false
local Player1GameOverCharString = string.format("gnazo.exe+%X",0x1B0EDA)
local Player2GameOverCharString = string.format("gnazo.exe+%X",0x5C4BF)
local DarknessAbilityCharString = string.format("gnazo.exe+%X",0xAC367)
local CloudWalkCharString1 = string.format("gnazo.exe+%X",0x642FD)
local CloudWalkCharString2 = string.format("gnazo.exe+%X",0x64798)

local AddFunc =
  function()
  
    if CurrentTitleScreenMenu == 5 and (not UnlockedReimu) then
      writeBytes("gnazo.exe+91C00C",26) --Adds Reimu to the Boss Challenge Menu
      writeBytes("gnazo.exe+855CE8",1) --Unlocks Reimu in Boss Challenge
      UnlockedReimu = true
    end
    
    local BossMode = readBytes("gnazo.exe+7F45CA",1) 
    if BossMode == 1 and not IsBossRoom[DestinationRoom] then
      writeBytes("gnazo.exe+7F45CA",0) --Cancel Boss mode when Yukari warping (for SCC)
    end
    
    if (CurrentTitleScreenMenu == 9) and (SelectedBoss == 25) then --Initialize Solo Character Mode
      if CurrentMusic == 0 then
        for i = 0,24,1 do
          writeBytes(string.format("gnazo.exe+%X",0x854400+(0x2C*i)),1)
        end
      else
        local BossChallengeMode = readBytes("gnazo.exe+B8E0DC",1)
        if (BossChallengeMode == 1) then
          writeBytes("gnazo.exe+B8E0DC",0)
          local SelectedCharacter = readBytes("gnazo.exe+B8E0F4",1)
          writeBytes("gnazo.exe+92EBDF",SelectedCharacter+200)
          if not (SelectedCharacter == 0) then
            writeBytes(string.format("gnazo.exe+%X",0x854400),2) --Reimu Joined
          end
          if not (SelectedCharacter == 1) then
            writeBytes(string.format("gnazo.exe+%X",0x85442C),2) --Marisa Joined
          end
          for i = 2,24,1 do
            if not (i == SelectedCharacter) then
              writeBytes(string.format("gnazo.exe+%X",0x854400+(0x2C*i)),0)
            end
          end
        end
      end
    end
    
    if (CurrentMusic == 0) and (CurrentTitleScreenMenu == 1) then
      for s = 0,9,1 do
        local SaveFileCurrentStage = readBytes(string.format("gnazo.exe+%X", 0x854110+(4*s) ),1)
        local ReimuUnlocked = readBytes(string.format("gnazo.exe+%X", 0x91C150+(0x19*s) ),1)
        if SaveFileCurrentStage > 0 then
          if not (ReimuUnlocked == 1) then
            if not SaveFileIsValid[s+1] then
              local SoloCharacterFile = false
              for i = 1,24,1 do
                local CharacterUnlocked = readBytes(string.format("gnazo.exe+%X", 0x91C150+(0x19*s)+i ),1)
                if (CharacterUnlocked == 1) then
                  if not SoloCharacterFile then
                    SoloCharacterFile = true
                  else
                    SoloCharacterFile = false
                    break
                  end
                end
              end
              if SoloCharacterFile then
                SaveFileIsValid[s+1] = true
                writeBytes(string.format("gnazo.exe+%X", 0x91C150+(0x19*s) ),1)
              end
            end
          else
            SaveFileIsValid[s+1] = true
          end
        elseif ReimuUnlocked == 1 then
          writeBytes(string.format("gnazo.exe+%X", 0x91C150+(0x19*s) ),0)
        end
      end
    else
      SaveFileIsValid = {}
    end
    
    if CurrentMusic > 0 then
      --Solo Character Handler
      local SoloChar = readBytes("gnazo.exe+92EBDF",1)
      if SoloChar >= 200 then
        SoloChar = SoloChar - 200
        writeBytes("gnazo.exe+B8E0F4",SoloChar)
        local PlayerTwoChar = -1
        if readBytes("gnazo.exe+91C24B",1) > 0 then --Is Two Player Mode
          if SoloChar == 0 then
            PlayerTwoChar = 1
          else
            PlayerTwoChar = 0
          end
          writeBytes(string.format("gnazo.exe+%X",0x854400+(0x2C*PlayerTwoChar)),1)
          writeBytes("gnazo.exe+B8E0F8",PlayerTwoChar)
        end
        
        if not ((Player1DefaultChar == SoloChar) or (Player2DefaultChar == SoloChar)) then
          writeBytes(Player1GameOverCharString,SoloChar)
          if PlayerTwoChar >= 0 then
            writeBytes(Player2GameOverCharString,PlayerTwoChar)
          end
        end
        
        if readBytes("gnazo.exe+8545B8",1) > 0 then --Rumia Joined; Give Solo char darkness visibility
          if not (readBytes(DarknessAbilityCharString,1) == SoloChar) then
            writeBytes(DarknessAbilityCharString,SoloChar)
          end
        else
          writeBytes(DarknessAbilityCharString,10)
        end
        
        if readBytes("gnazo.exe+85479C",1) > 0 then --Aya Joined; Give Solo char cloud-walking
          if not (readBytes(CloudWalkCharString1,1) == SoloChar) then
            writeBytes(CloudWalkCharString1,SoloChar)
            writeBytes(CloudWalkCharString2,SoloChar)
          end
        else
          writeBytes(CloudWalkCharString1,21)
          writeBytes(CloudWalkCharString2,21)
        end
        
        for i = 1,#CharMoveSpeeds,1 do
          local Index = CharMoveSpeeds[i][1]
          if Index == SoloChar then
            break
          elseif readBytes(string.format("gnazo.exe+%X",CharacterJoinedAddress+(CharOffset*Index)),1) >= 1 then
            local DesireSpeed = CharMoveSpeeds[i][2]
            local CurrSpeed = readFloat("gnazo.exe+928C40")
            if CurrSpeed < DesireSpeed then
              writeFloat("gnazo.exe+928C40",DesireSpeed)
            end
            break
          end
        end
        
        for i = 0,24,1 do
          if not ((i == SoloChar) or (i == PlayerTwoChar)) then
            local CharacterJoined = readBytes(string.format("gnazo.exe+%X",0x854400+(0x2C*i)),1)
            if CharacterJoined == 1 then
              writeBytes(string.format("gnazo.exe+%X",0x854400+(0x2C*i)),2)
            end
            local CharacterIsDead = readBytes(string.format("gnazo.exe+%X",0x854401+(0x2C*i)),1)
            if CharacterIsDead == 0 then
              writeBytes(string.format("gnazo.exe+%X",0x854401+(0x2C*i)),1) --Is Dead
              writeInteger(string.format("gnazo.exe+%X",0x8543D8+(0x2C*i)),0) --HP
              writeFloat(string.format("gnazo.exe+%X",0x8543E0+(0x2C*i)),0) --Spirit
              writeFloat(string.format("gnazo.exe+%X",0x8543E4+(0x2C*i)),0) --RP
            end
          end
        end
        if readBytes(string.format("gnazo.exe+%X",CharacterJoinedAddress+(CharOffset*24)),1) >= 1 then --Has Suwako
          SetPlayerJumpPower(SoloCharJumpPowers[SoloChar][2])
        else --Has any Level 2 jumper
          for i = 1,#CharsWithLv2Jump,1 do
            if readBytes(string.format("gnazo.exe+%X",CharacterJoinedAddress+(CharOffset*CharsWithLv2Jump[i])),1) >= 1 then
              SetPlayerJumpPower(SoloCharJumpPowers[SoloChar][1])
              break
            end
          end
        end
      else
        writeBytes(Player1GameOverCharString,0)
        writeBytes(Player2GameOverCharString,1)
        writeBytes(DarknessAbilityCharString,10)
        writeBytes(CloudWalkCharString1,21)
        writeBytes(CloudWalkCharString2,21)
      end
    end
    
  end
  
table.insert(RuntimeFunctions,AddFunc)