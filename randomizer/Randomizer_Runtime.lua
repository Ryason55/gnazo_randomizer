local RandomSeed,RandomizeDoors,RandomizeAttacks,RandomizeEnemies,RandomizeBackgrounds,EntranceTable,AutoUnlocks,MapCoords = dofile(TrainerOrigin.."Randomizer_CurrentSettings.lua")

local ObjectIndexAddress = 0x7F97D8
local ObjectStateAddress = 0x7F976C
local ObjectDoorTargetRoomAddress = 0x7F9C6C
local ObjectDoorTargetEntranceAddress = 0x7F9C70
local ObjectDoorHitsAddress = 0x7F9C7C
local ObjectSpriteAddress = 0x7F9768

local ObjectDataOffset = 0x578

--Object State, Is Door, Target Room, Target Entrance ID, Room Created In, Shortcut to Unlock
local ObjectStatusTable = {}
for i = 1,256,1 do
  ObjectStatusTable[i] = {false,false,0,0,0}
end

local FairySpriteBaseOffSet = nil
local FairySprites = {}
FairySprites[1] = 0 --Blue
FairySprites[2] = 112 --Red
FairySprites[3] = 224 --Green
FairySprites[4] = 336 --Pink
FairySprites[5] = 448 --Purple
FairySprites[6] = 560 --Pink-haired
FairySprites[7] = 672 --Blue-haired
FairySprites[8] = 784 --Dark Purple
FairySprites[9] = 1284272 --Blue Maid
FairySprites[10] = 1284384 --Red Maid
FairySprites[11] = 1284496 --Green Maid
FairySprites[12] = 1284608 --Purple Maid
FairySprites[13] = 1284720 --Cyan Maid
FairySprites[14] = 1284832 --Purple-haired Maid
FairySprites[15] = 1284944 --Orange-haired Maid
FairySprites[16] = 1285056 --Dark-Brown Maid

local DoorSpriteBaseOffset = nil
local DoorTypeSpriteIndexes = {}
DoorTypeSpriteIndexes[35000] = 0 --Wooden
DoorTypeSpriteIndexes[35100] = 32 --Red
DoorTypeSpriteIndexes[35200] = 64 --Black
DoorTypeSpriteIndexes[35300] = 96 --Golden

local SpriteInUse = {{},{}}
local FairySpriteFilepaths = {}
FairySpriteFilepaths[1] = {"gr\\ribbonyouseim1.bmp","gr\\ribbonyouseim2.bmp","gr\\ribbonyouseim3.bmp","gr\\ribbonyouseim4.bmp","ex\\ribbonfairyw1.bmp","ex\\ribbonfairyw2.bmp","ex\\ribbonfairyw3.bmp"}
FairySpriteFilepaths[2] = {"gr\\ribbonyouseim5.bmp","gr\\ribbonyouseim6.bmp","gr\\ribbonyouseim7.bmp","gr\\ribbonyouseim8.bmp","ex\\ribbonfairys1.bmp","ex\\ribbonfairys2.bmp","ex\\ribbonfairys3.bmp","ex\\ribbonfairys4.bmp","ex\\ribbonfairys5.bmp","ex\\ribbonfairys6.bmp"}
local FairySpriteFilepathAddress = 0x3165A8
math.randomseed(RandomSeed)
local mrg = math.random()
for i = 0,7,1 do
  local tableindex = 1
  if i >= 4 then
    tableindex = 2
  end
  local SpriteIndex
  for a = 1,50,1 do
    SpriteIndex = math.random(1,#FairySpriteFilepaths[tableindex])
    if not SpriteInUse[tableindex][SpriteIndex] then
      SpriteInUse[tableindex][SpriteIndex] = true
      local StringLength = string.len(FairySpriteFilepaths[tableindex][SpriteIndex])
      for n = 1,21,1 do
        if n <= StringLength then
          local Byte = string.byte(FairySpriteFilepaths[tableindex][SpriteIndex],n)
          writeBytes(string.format("gnazo.exe+%X", 0x3165A8 + (i*0x18) + (n-1) ),Byte)
        else
          writeBytes(string.format("gnazo.exe+%X", 0x3165A8 + (i*0x18) + (n-1) ),0)
        end
      end
      break
    end
  end
end


local CharacterStartingSpirit = {110,100,100,70,60,140,110,130,100,130,70,70,140,140,100,120,110,120,140,120,100,110,120,140,140}
--offset between player char data is 0x2C
local CharacterCurrentSpiritAddress = 0x8543E0 --Float
local CharacterCurrentRPAddress = 0x8543E4 --Float
local CharacterMaxSpiritAddress = 0x8543E8 --Integer
local CharacterSpiritLevelAddress = 0x8543F4 --Integer
local CharacterAllSpiritLevelAddress = 0x8543F8 --Integer
local CharacterAbilityLevelAddress = 0x8543FC --Integer (Reimu and Sanae increase RP via Ability)
local NewCharacterSpirit = {}

if RandomizeAttacks then
  --Allow Reimu and Marisa to have their shots modified
  local ValueToCompare = readBytes("gnazo.exe+10C1A",4,true)
  --Reimu Shot
  writeBytes("gnazo.exe+1B0807",{0x8B,0x87,0x80,0x09,0x00,0x00,0xC3}) --relocated data
  writeBytes("gnazo.exe+10A94",{0xE8,0x6E,0xFD,0x19,0x00,0x83,0x3C,0x85,ValueToCompare[1],ValueToCompare[2],ValueToCompare[3],ValueToCompare[4],0x00}) --new comparison
  --Marisa Shot
  writeBytes("gnazo.exe+1B0878",{0x8B,0x8F,0x80,0x09,0x00,0x00,0xC3})
  writeBytes("gnazo.exe+10C11",{0xE8,0x62,0xFC,0x19,0x00,0x83,0x3C,0x8D,ValueToCompare[1],ValueToCompare[2],ValueToCompare[3],ValueToCompare[4],0x01})
  --Reimu Charge (shares relocated data with Reimu Shot)
  writeBytes("gnazo.exe+93AD",{0xE8,0x55,0x74,0x1A,0x00,0x83,0x3C,0x85,ValueToCompare[1],ValueToCompare[2],ValueToCompare[3],ValueToCompare[4],0x00})
  --Marisa Charge
  writeBytes("gnazo.exe+1B09B7",{0x8B,0x97,0x80,0x09,0x00,0x00,0xC3})
  writeBytes("gnazo.exe+9661",{0xE8,0x51,0x73,0x1A,0x00,0x83,0x3C,0x95,ValueToCompare[1],ValueToCompare[2],ValueToCompare[3],ValueToCompare[4],0x01})
  --Marisa Charge Sound
  local function1 = readBytes("gnazo.exe+91C5",6,true) --Player 1
  local function2 = readBytes("gnazo.exe+91D4",5,true)
  writeBytes("gnazo.exe+91A9",0x29)
  writeBytes("gnazo.exe+91B1",0x21)
  writeBytes("gnazo.exe+91C4",0x0E)
  writeBytes("gnazo.exe+91C5",{0xE8,0x3D,0x78,0x1A,0x00,0x52,0xE8,0x00,0x43,0x19,0x00,0x83,0xC4,0x04,function2[1],function2[2],function2[3],function2[4],function2[5],0x83,0xF8,0x01})
  writeBytes("gnazo.exe+1B0A07",{function1[1],function1[2],function1[3],function1[4],function1[5],function1[6],0xC3})
  local function3 = readBytes("gnazo.exe+9204",6,true) --Player 2
  local function4 = readBytes("gnazo.exe+9213",5,true)
  writeBytes("gnazo.exe+91E1",0x30)
  writeBytes("gnazo.exe+91E9",0x28)
  writeBytes("gnazo.exe+91F1",0x20)
  writeBytes("gnazo.exe+9203",0x0E)
  writeBytes("gnazo.exe+9204",{0xE8,0x8F,0x7B,0x1A,0x00,0x51,0xE8,0xC1,0x42,0x19,0x00,0x83,0xC4,0x04,function4[1],function4[2],function4[3],function4[4],function4[5],0x83,0xF8,0x01})
  writeBytes("gnazo.exe+1B0D98",{function3[1],function3[2],function3[3],function3[4],function3[5],function3[6],0xC3})
  
  local IsProblemCharacter = {}
  IsProblemCharacter[0] = true --Reimu
  IsProblemCharacter[5] = true --Patchouli
  IsProblemCharacter[6] = true --Sakuya
  IsProblemCharacter[9] = true --Yuyuko
  IsProblemCharacter[10] = true --Rumia
  IsProblemCharacter[13] = true --Yukari
  IsProblemCharacter[16] = true --Reisen
  IsProblemCharacter[18] = true --Kaguya
  local IsProblemShot = {}
  IsProblemShot[1] = true --Marisa
  IsProblemShot[3] = true --Cirno
  IsProblemShot[7] = true --Remilia
  IsProblemShot[11] = true --Daiyousei
  IsProblemShot[12] = true --Flandre
  IsProblemShot[19] = true --Mokou
  IsProblemShot[20] = true --Nitori
  IsProblemShot[21] = true --Aya
  IsProblemShot[22] = true --Sanae
  IsProblemShot[23] = true --Kanako
  local IsProblemCharge = {}
  IsProblemCharge[1] = true --Marisa
  IsProblemCharge[2] = true --Alice
  IsProblemCharge[3] = true --Cirno
  IsProblemCharge[7] = true --Remilia (Shot)
  IsProblemCharge[8] = true --Youmu
  IsProblemCharge[11] = true --Daiyousei
  IsProblemCharge[12] = true --Flandre (Shot)
  IsProblemCharge[19] = true --Mokou
  IsProblemCharge[20] = true --Nitori (Shot)
  IsProblemCharge[21] = true --Aya
  IsProblemCharge[22] = true --Sanae
  IsProblemCharge[23] = true --Kanako
  
  local CharacterShotAttackAddresses = {0x10AA0,0x10C1D,0x110AD,0x115B5,0x1201A,0x125CA,0x12C9E,0x13699,0x13938,0x13E47,0x14369,0x11AE9,0x14BD1,0x15072,0x15CA9,0x15E56,0x16277,0x1641C,0x165C3,0x169E5,0x16BAA,0x16E55,0x17054,0x175D7,0x17825}
  local CharacterChargeAttackAddresses = {0x93B9,0x966D,0x9AA9,0x9E78,0xA4BC,0xAAC1,0xAE3B,0xB820,0xBC4C,0xC081,0xCAC4,0xA19A,0xCF4E,0xD3D3,0xD8BC,0xDD17,0xDD19,0xE1D7,0xE3D1,0xE6F2,0xE930,0xF2FD,0xF896,0xFFE8,0x10235}
  local CharacterToAttachChargeToAddresses = {0,0x44C0,0,0,0,0,0,0,0,0,0,0,0,0x456F,0,0x46A6,0,0,0x4605,0,0,0,0,0x46E3,0}
  local CharacterToHandleChargeSoundAddresses =  {}
  CharacterToHandleChargeSoundAddresses[2] = {0x91DA,0x9219} --Marisa
  CharacterToHandleChargeSoundAddresses[14] = {0x91DF,0x921E} --Yukari
  CharacterToHandleChargeSoundAddresses[19] = {0x91A7} --Kaguya
  local CharacterToUseMeleeAnimationForChargeAddresses = {}
  CharacterToUseMeleeAnimationForChargeAddresses[5] = 0x3D07A --Meiling
  CharacterToUseMeleeAnimationForChargeAddresses[9] = 0x3D075 --Youmu
  
  math.randomseed(RandomSeed)
  local mrgr = math.random()
  local ChargeAttackInUse = {}
  local ShotAttackInUse = {}
  local minChar = 1
  local maxChar = 25
  local DoThing = {false,true}
  local NewSpiritValues = {}
  for i = 1,25,1 do
    NewSpiritValues[i] = {0,0}
  end
  for l = 1,2,1 do
    for i = minChar,maxChar,1 do
      if (IsProblemCharge[i-1] and (not DoThing[l])) or ((not IsProblemCharge[i-1]) and DoThing[l]) then
        --print("Handling character index",i-1)
        local NewSpirit1 = 0
        local NewSpirit2 = 0
        while true do --Shot Attack
          local NewIndex = math.random(minChar,maxChar)
          if (not ShotAttackInUse[NewIndex]) and (not (IsProblemCharacter[NewIndex-1] and IsProblemShot[i-1])) then
            ShotAttackInUse[NewIndex] = true
            writeBytes(string.format("gnazo.exe+%X", CharacterShotAttackAddresses[i]),NewIndex-1)
            NewSpiritValues[NewIndex][1] = CharacterStartingSpirit[i]
            break
          end
        end
        while true do --Charge Attack
          local NewIndex = math.random(minChar,maxChar)
          if (not ChargeAttackInUse[NewIndex]) and (not (IsProblemCharacter[NewIndex-1] and IsProblemCharge[i-1])) then
            ChargeAttackInUse[NewIndex] = true
            writeBytes(string.format("gnazo.exe+%X", CharacterChargeAttackAddresses[i]),NewIndex-1)
            if not (CharacterToAttachChargeToAddresses[i] == 0) then
              writeBytes(string.format("gnazo.exe+%X", CharacterToAttachChargeToAddresses[i]),NewIndex-1)
            end
            if not (CharacterToHandleChargeSoundAddresses[i] == nil) then
              for a = 1,#CharacterToHandleChargeSoundAddresses[i],1 do
                writeBytes(string.format("gnazo.exe+%X", CharacterToHandleChargeSoundAddresses[i][a]),NewIndex-1)
              end
            end
            if not (CharacterToUseMeleeAnimationForChargeAddresses[i] == nil) then
              writeBytes(string.format("gnazo.exe+%X", CharacterToUseMeleeAnimationForChargeAddresses[i]),NewIndex-1)
            end
            NewSpiritValues[NewIndex][2] = CharacterStartingSpirit[i]
            break
          end
        end
      end
    end
  end
  for i = 1,25,1 do
    NewCharacterSpirit[i] = math.ceil((NewSpiritValues[i][1]+NewSpiritValues[i][2])/2)
  end
end

local BossChallengeRooms = {91,161,241,252,301,401,671,1131,1481,512,791,921,1291,1351,1391,1581,1631,2101,1762,1891,1991,2001,2201,1001,1001,10}
local UnlockedReimu = false
local Player1CharFunction = readInteger("gnazo.exe+5C4B5")
writeBytes("gnazo.exe+5C4B3",0xE8)
writeInteger("gnazo.exe+5C4B4",(0x1B0ED4-0x5C4B3)-5)
writeBytes("gnazo.exe+5C4B8",0x90)
writeBytes("gnazo.exe+1B0ED4",{0xC7,0x05})
writeInteger("gnazo.exe+1B0ED6",Player1CharFunction)
writeBytes("gnazo.exe+1B0EDA",{0x00,0x00,0x00,0x00,0xC3})
local Player1GameOverCharAddress = 0x1B0EDA
local Player2GameOverCharAddress = 0x5C4BF
local Player1DefaultChar = 0
local Player2DefaultChar = 1

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

local whole,decimal = math.modf(RandomSeed/10)
if math.ceil(decimal*10) == 9 then --if the seed ends in 9...
  --Allow Large Ice Chunk explosions to freeze the player
  writeBytes("gnazo.exe+34803",{0xE4,0x57})
end


local BossRooms = {91,161,241,252,301,401,512,671,791,921,1001,1131,1291,1351,1391,1481,1581,1631,1762,1891,1991,2001,2101,2201}
local IsBossRoom = {} --To be excluded from enemy randomization
for i = 1,#BossRooms,1 do
  IsBossRoom[BossRooms[i]] = true
end

--Index ID, count of skins, should fly straight, should have weight, dangerous projectile, can be paired up, can be selected, Player Chars
--(Entries without any stats are not meant to be chosen)
local ShotTypes = {
{100,1,true,false,false,true,true,{0}}, --Reimu Needles
{101,1,false,false,false,false,true,{1}}, --Marisa Stars
{102,4,true,false,false,true,true,{2}}, --Wave bullets
{103,1,true,false,false,true,true,{3,11}}, --Icicles (Yuuen Sekai)
{104,4,true,false,false,true,true,{10}}, --Thin Bullets (Yuuen Sekai)
{105,1,true,false,false,true,true}, --Fire (Yuuen Sekai)
{106,4,true,false,false,true,true,{6}}, --Knives (Yuuen Sekai)
{107,4,false,false,false,false,true}, --Large shots (Yuuen Sekai)
{108,4,true,false,false,true,true,{2}}, --Wave bullets again?
{109,4,true,false,false,true,true,{9}}, --Butterflies (Yuuen Sekai)
{110,4,true,false,false,true,true}, --Kunai
{111,1,true,false,false,false,true,{8}}, --Youmu Spirit (Requires Lifetime)
{112,1,true,false,false,true,true,{16}}, --Reisen's Bullets (Yuuen Sekai)
{113,1,false,false,false,false,true,{21}}, --Aya Tornado (Requires Lifetime)
{114,4,false,false,false,true,true}, --Small Pulsating Bullet
{115,4,false,false,false,true,true}, --Pulsating Bullet
{116,4,false,false,false,false,true,{25}}, --Music Notes
{200,1,false,false,false,false,true,{0}}, --Reimu Charge
--{220,1,false,true,false,false,false,{2}}, --Alice Dolls (They only explode when hitting where the floor would be in a boss room)
{222,1,false,false,false,false,true,{3,11}}, --Ice Chunk
{225,6,true,false,false,true,true,{4,7,12,18}}, --Spear Bullets
{226,1,true,false,false,true,true}, --Black Spear Bullets
{227,1,false,false,true,false,true,{4}}, --Meiling Charge
{228,2,true,false,false,false,true,{5,19}}, --Fire
{229,1,false,false,false,false,true,{5,20}}, --Water
{234,4,true,false,false,true,true,{6}}, --Knives
{235,4,true,false,false,false,false,{6}}, -- Bouncing Knives (Enemy use is restricted)
{238,5,true,false,false,false,true,{8,21}}, --Aya's Shot
{239,5}, --Youmu's Down Shot (Player)
{241,5,false,false,false,false,true,{8}}, --Large Scythes
{242,5,true,false,false,true,true,{9}}, --Butterflies
{246,5,true,false,false,true,true,{10}}, --Short-Trailed Bullets
{247,5}, --Rumia Up/Down Shot (Player)
{248,5,true,false,false,false,true,{7,12}}, --Flandre's Spear Shots
{250,5}, --Falling Bullets from Flan's Charge (Player)
{251,5,true,false,false,true,true,{13}}, --Trailed Bullets
{255,5,true,false,true,false,true,{14}}, --Keine's Shot Attack
{256,5,false,false,true,false,true,{14}}, --Keine's Charge Attack
{257,5}, --Another part of Keine's Charge Attack? (Player)
{259,1,true,false,false,true,true,{15}}, --Carrots
--{260,1,false,true,false,false,false,{17}}, --Tewi's Bouncing Charm (Bouncing doesn't work correctly outside of boss rooms)
{262,1,true,false,false,false,true,{16}}, --Reisen's Bullets
{264,1,true,false,false,true,true,{17}}, --Eirin's Arrows
{266,4,false,false,false,true,true}, --Glowing Bullets that vanish
{270,4}, --Glowing Bullets from Kaguya's shot (Player)
{273,8}, --Spear Bullets from Kaguya's Charge (Player)
{276,4}, --Particles from Mokou's Shot (Player)
{296,4}, --Knives from Kanako's charge (Player)
{275,1,false,false,true,false,true,{19}}, --[Mokou's Phoenix]
{277,1,false,false,true,false,true,{19}}, --Mokou's Charge Attack
{286,1,true,false,false,true,true,{23}}, --Kanako's Amulets
--{295,1,true,false,false,false,false,{23}}, --Kanako's Beam (Weird collision)
{299,1,false,true,false,false,true,{24}}, --Suwako's Rocks
{300,1,true,false,true,false,true,{24}}, --Suwako's Rings
{302,5,true,false,false,true,true}, --Arrow Bullets
{303,5,false,false,false,false,true}, --Scythes
{304,5,false,false,false,false,true}, --Large Glowing Bullets
{305,4,false,false,false,true,true}, --Spinning Oblong Bullets
{314,5,true,false,false,false,true,{25}}, --Mystia's Attack~
{315,4,true,false,false,true,true}, --Oblong Bullets (Sunny's Attack)
{316,4,true,false,false,true,true}, --Oblong Bullets (Luna's Attack)
{317,4,true,false,false,false,true}, --Star Sapphire's shot
{318,16}, --Star's Shot Trail
{319,4}, --Mystia's Shot Trail~
{325,4,true,false,false,true,true,{22}}, --Amulets
{347,4,true,false,true,false,true,{1}}, --Lasers
{361,5,true,false,false,true,false}, --Arrow Bullets Again (redundant)
{362,1,false,false,true,false,true,{17}}, --Eirin's Shot Attack
{364,5,false,false,false,true,true}} --Glowing Bullets

local ShotTypeLookup = {}
for i = 1,#ShotTypes,1 do
  ShotTypeLookup[ShotTypes[i][1]] = i
end

local HardcodedBulletsToUpdate = {0x25FA6,0x40597,0x4129D,0x4141B,0x4158A,0x4175F,0x421B6}
local CurrentHardcodedBulletColors = {}
if RandomizeEnemies or RandomizeAttacks then
  if RandomizeAttacks then
    local TestMemoryAddress = readInteger("gnazo.exe+5005")
    local JumpOffset1 = (TestMemoryAddress - 0x0000543C) + 0x00057EAD
    local JumpOffset2 = (0x0000543C - 0x00057ED5) - 5
    --Allows Player Yukari shots to have random colors
    writeBytes("gnazo.exe+5004",0xE9)
    writeInteger("gnazo.exe+5005",JumpOffset1)
    writeBytes("gnazo.exe+57EAD",{0x81,0xE2,0x0F,0x00,0x00,0x80,0x79,0x05,0x4A,0x83,0xCA,0xF0,0x42,0x81,0xF9,0x70,0x62,0x00,0x00,0x7D,0x09,0x8D,0x84,0x11,0xF4,0x9D,0xFF,0xFF,0xEB,0x07,0x8D,0x84,0x11,0x90,0x9D,0xFF,0xFF,0x89,0x46,0x54,0xE9})
    writeInteger("gnazo.exe+57ED6",JumpOffset2)
  end
  local LastBulletOfTypeHandled = {}
  local HardcodedBullets = {0x3F78,0x3FF0,0x5821,0x5897,0x5971,0x61CA,0x6231,0x627F,0x62C6,0x6559,0x6636,0x6713,0x68B3,0x7337,0x76D3,0x7780,0x7CD1,0xA7AB,0xA826,0xA893,0xA908,0xA975,0xA9EA,0xAA5B,0xAF94,0xB060,0xB155,0xB220,0xB320,0xB400,0xB533,0xB5A9,0xB62D,0xB6AE,0xB729,0xB7AC,0xBDD4,0xBE7E,0xBF40,0xCD1F,0xCD9D,0xCE05,0xCE7D,0xCEEB,0xD2CC,0xD362,0xD5F6,0xD66F,0xD708,0xD799,0xD832,0xDA07,0xDAB7,0xDB74,0xDC1D,0xDCAB,0xF666,0xF740,0xF818,0x122AC,0x1232D,0x1239E,0x1240F,0x1247C,0x124F1,0x1255E,0x128E8,0x12E01,0x12F1F,0x12F95,0x13019,0x1309A,0x13115,0x13194,0x1324A,0x132D9,0x13362,0x133EF,0x13475,0x13504,0x1358D,0x1361A,0x13B68,0x13C8D,0x144F6,0x14577,0x145EA,0x1465D,0x146CE,0x1480F,0x148DA,0x14A52,0x14B1D,0x14E12,0x15285,0x15304,0x1539D,0x1542E,0x154C3,0x1573A,0x157E9,0x158A2,0x1595B,0x15A1A,0x15ADB,0x15B86,0x15C1B,0x15DDE,0x16FC4,0x28AD8,0x357DF,0x35861,0x4187F,0x6C898,0x6CB71,0x6CD37,0x6D0F6,0x6D1C7,0x6D26C,0x6D33F,0x6D421,0x6D4AC,0x6D573,0x6D5FD,0x6D7A8,0x6D844,0x6D8D7,0x6D967,0x6DA5F,0x6DB7B,0x6DC74,0x6DD94,0x6E0AB,0x6E2C4,0x6E702,0x6E782,0x6E8CE,0x6E994,0x6EA5D,0x6EAF2,0x6EB79,0x6EC00,0x6ED17,0x6EE87,0x6EFC3,0x6F049,0x6F0C1,0x6F13A,0x6F2DE,0x6F374,0x6F403,0x6F555,0x6F685,0x6F755,0x6FD33,0x6FFD4,0x70267,0x7073A,0x70828,0x70B85,0x70C94,0x70D77,0x70E5A,0x71028,0x710D2,0x713B0,0x714B8,0x715D8,0x716A0,0x71896,0x719B0,0x71AB2,0x71B78,0x71DC3,0x71FE9,0x7214C,0x72231,0x72386,0x7252A,0x725EA,0x726B7,0x72792,0x7285F,0x7292C,0x72A07,0x72AC6,0x72B93,0x72DFB,0x73571,0x73634,0x736EE,0x737BA,0x73944,0x73A2A,0x73AFA,0x73C60,0x73D1F,0x73DB9,0x73E94,0x73F53,0x73FED,0x7409E,0x7412B,0x7477C,0x7484C,0x74924,0x749EE,0x74AB8,0x74B73,0x74C3D,0x74CD6,0x74DAE,0x74E75,0x74F3F,0x74FF6,0x750C0,0x751BB,0x75390,0x755AC,0x75644,0x756DB,0x75772,0x7593F,0x759D7,0x75A6E,0x75B05,0x75DAA,0x75E8D,0x76690,0x7678E,0x768A3,0x769D7,0x76B88,0x76CDC,0x76F0F,0x76FFD,0x77112,0x77200,0x7731D,0x77432,0x7754E,0x77686,0x785E6,0x786BA,0x78CBC,0x78DA5,0x78EDC,0x78FC5,0x7910F,0x791D8,0x79495,0x79565,0x79623,0x79718,0x7980E,0x79911,0x799D3,0x79ACE,0x79BCC,0x79CD6,0x79FFD,0x7A0C7,0x7A18B,0x7A288,0x7A386,0x7A491,0x7A553,0x7A64E,0x7A74C,0x7A856,0x7AAEE,0x7ABDA,0x7ACAE,0x7AD98,0x7AE71,0x7AF5B,0x7B03E,0x7B128,0x7B259,0x7B34E,0x7BC97,0x7BE27,0x7BFA7,0x7C137,0x7C910,0x7C9F0,0x7CAD6,0x7CC61,0x7CCF9,0x7CD81,0x7CE15,0x7D2E5,0x7E85D,0x7EA17,0x7EB06,0x7EBF5,0x7ECE4,0x7EDD3,0x7EEC2,0x7EFE6,0x7F0D5,0x7F1C4,0x7F2B3,0x7F3A2,0x7F491,0x7F5B5,0x7F6A4,0x7F793,0x7F882,0x7F971,0x7FA60,0x7FB33,0x7FBE8,0x7FD9D,0x7FE50,0x7FF75,0x8116E,0x81274,0x8137D,0x81483,0x8158C,0x81692,0x8179B,0x818A1,0x825E2,0x82761,0x827F0,0x82873,0x828F6,0x8299F,0x82B1E,0x82BAD,0x82C30,0x82CB3,0x82D63,0x82EE2,0x82F71,0x82FF4,0x83077,0x83127,0x832A6,0x83335,0x833B8,0x8343B,0x83508,0x83611,0x8371A,0x8381F,0x83AB0,0x83B56,0x83BEE,0x83D69,0x83E4E,0x83EE2,0x83F68,0x83FFC,0x84082,0x84122,0x841F4,0x84288,0x8430E,0x843A2,0x84428,0x844E5,0x845DB,0x8466F,0x846F5,0x84789,0x8480F,0x849A1,0x84A30,0x84AD4,0x84B97,0x84C26,0x84CCA,0x84D8D,0x84E1C,0x84EC0,0x84F82,0x85011,0x850B5,0x8519D,0x8529A,0x85374,0x85475,0x85536,0x85761,0x8582D,0x85D74,0x85E65,0x85F55,0x86040,0x86143,0x86584,0x86663,0x86742,0x86821,0x86900,0x869DF,0x86A8C,0x86B62,0x86C38,0x86D0E,0x86DE4,0x86EBA,0x871DB,0x873CF,0x875D8,0x876F1,0x87832,0x87966,0x87A9D,0x87CA4,0x87D9C,0x87E79,0x87F56,0x8803F,0x8811F,0x881FF,0x882DF,0x883D1,0x88932,0x88A22,0x88AE0,0x88BD3,0x88C92,0x88DA1,0x88EC1,0x88FC4,0x89171,0x89272,0x893A3,0x8949B,0x8987D,0x8996A,0x89A7F,0x89B68,0x89C53,0x89CF5,0x89D8A,0x89E76,0x89F18,0x89FAD,0x8A0D3,0x8A187,0x8A221,0x8A2C8,0x8A364,0x8A3FC,0x8A498,0x8A532,0x8A5CC,0x8A673,0x8A70F,0x8A7A7,0x8A843,0x8A8DD,0x8A977,0x8AB5B,0x8AC54,0x8AD09,0x8ADEC,0x8AECF,0x8B10A,0x8B1C0,0x8B276,0x8B32C,0x8B3E2,0x8B498,0x8B54E,0x8B604,0x8B6BA,0x8B770,0x8B826,0x8B8E9,0x8B99F,0x8BA55,0x8BB0B,0x8BBC1,0x8BC77,0x8BD2D,0x8BDE3,0x8BE99,0x8BF4F,0x8C71A,0x8C7B4,0x8D314,0x8D42B,0x8D59A,0x8D672,0x8D759,0x8D85E,0x8D92E,0x8D9F9,0x8DB02,0x8DBDB,0x8DCBB,0x8DDEE,0x8DEBF,0x8DF89,0x8E065,0x8E21E,0x8E2DE,0x8E390,0x8E42B,0x8E4B4,0x8E572,0x8E638,0x8E6F0,0x8E791,0x8E81E,0x8E8E4,0x8E9AA,0x8EA62,0x8EB03,0x8EB90,0x8EC80,0x8ED3A,0x8EF01,0x8F0D5,0x8F1B2,0x8F252,0x8F334,0x8F40B,0x8F4B0,0x8F57F,0x8F64C,0x8F709,0x8F817,0x8F8DC,0x8FA41,0x8FC92,0x8FD80,0x8FE5F,0x8FF07,0x8FF9F,0x90065,0x9010D,0x901A5,0x90278,0x90320,0x903B8,0x9048A,0x90532,0x905CA,0x9073D,0x9082B,0x9090C,0x909E6,0x90A8E,0x90B26,0x90BEC,0x90C94,0x90D2C,0x90DFF,0x90EA7,0x90F3F,0x91011,0x910B9,0x91151,0x91224,0x912CC,0x91364,0x91437,0x914DF,0x91577,0x91776,0x91858,0x91926,0x919E0,0x91AA1,0x91B6F,0x91C17,0x91CF2,0x91D87,0x91FCE,0x92088,0x92131,0x921FD,0x922C5,0x9237F,0x92428,0x92642,0x926FC,0x927A5,0x92871,0x92939,0x929F3,0x92A9C,0x92BD1,0x92D30,0x92EF9,0x92F58,0x93035,0x93112,0x93282,0x93334,0x933E0,0x934B2,0x93582,0x9376D,0x9383F,0x9390F,0x93B4A,0x93C5C,0x93D59,0x93E6B,0x93F3E,0x93FD6,0x940FA,0x94265,0x94435,0x944FB,0x945AC,0x9468A,0x9475E,0x94832,0x94990,0x94A87,0x94B9B,0x94C38,0x94D2F,0x94E31,0x94F59,0x95050,0x95164,0x95201,0x952F8,0x953FA,0x9556F,0x9564B,0x9571D,0x957EC,0x95882,0x95948,0x959F9,0x95B1A,0x95CAD,0x95E21,0x96354,0x96A9E,0x96B6D,0x96C42,0x96D10,0x96E0D,0x96ED3,0x96FAA,0x9703B,0x970EA,0x97766,0x97835,0x9790A,0x979D8,0x97AD5,0x97B9B,0x97C69,0x97D66,0x97E2C,0x97F03,0x97F94,0x98043,0x9821F,0x983C8,0x9856E,0x9864D,0x98733,0x9881B,0x9893B,0x98A1B,0x98AFE,0x98BE3,0x98CD8,0x98E09,0x98EF3,0x98FDD,0x990D7,0x991C1,0x992AB,0x9941D,0x994CE,0x99587,0x995E9,0x996A7,0x9977B,0x9982F,0x998DF,0x999B3,0x99A67,0x99BD0,0x99C81,0x99D3B,0x99D9D,0x99E5B,0x99F2F,0x99FE3,0x9A093,0x9A167,0x9A21B,0x9A453,0x9A5D1,0x9A69C,0x9A767,0x9A832,0x9A8FD,0x9A9E6,0x9AAB0,0x9AD50,0x9ADEA,0x9AED4,0x9AF6E,0x9B013,0x9B0AD,0x9B133,0x9B1CD,0x9B349,0x9B4F4,0x9C551,0x9EF09,0x9F0C6,0xA058C,0xA06C5,0xA0788,0xA0857,0xA091D,0xA09C2,0xA0B47,0xA0C6B,0xA0D99,0xA0E61,0xA0F6F,0xA1037,0xA1135,0xA12A6,0xA13CC,0xA1500,0xA15C8,0xA16D6,0xA179E,0xA189D,0xA2D83,0xA2F34,0xA30AF,0xA3155,0xA322A,0xA32D0,0xA33A5,0xA344B,0xA3520,0xA35C6,0xA3695,0xA37E9,0xA392E,0xA3B59,0xA3C1F,0xA3C6F,0xA3CD7,0xA3D6B,0xA3DF1,0xA3E77,0xA3F0D,0xA40A4,0xA416A,0xA41BA,0xA4222,0xA42B6,0xA433C,0xA43C2,0xA4458,0x15C924,0x15CA20,0x164E2D,0x169C98,0x169CB5,0x16DE99,0x18DA4A,0x96044}
  math.randomseed(RandomSeed)
  local mrgr = math.random()
  for i = 1,#HardcodedBullets,1 do
    if (RandomizeEnemies and (HardcodedBullets[i] <= 0x8EAB)) or (RandomizeAttacks and (HardcodedBullets[i] >= 0x9140)) then --TEST THIS (probably doesn't handle shots generated from player bullets)
      local BulletType = readInteger(string.format("gnazo.exe+%X",HardcodedBullets[i]))
      local ShotType = math.floor(BulletType/100)
      local ShotIndex = ShotTypeLookup[ShotType]
      if not (ShotIndex == nil) then
        local NewColor
        if LastBulletOfTypeHandled[BulletType] == nil then
          NewColor = math.random(1,ShotTypes[ShotIndex][2])-1
          if (ShotType == 225) and (HardcodedBullets[i] >= 0x12013) and (HardcodedBullets[i] < 0x125C3) then --Meiling's Spear Shots
            NewColor = NewColor * 16
          end
        else
          if (HardcodedBullets[i] - LastBulletOfTypeHandled[BulletType][2]) < 500 then
            NewColor = LastBulletOfTypeHandled[BulletType][1]
          else
            NewColor = math.random(1,ShotTypes[ShotIndex][2])-1
            if (ShotType == 225) and (HardcodedBullets[i] >= 0x12013) and (HardcodedBullets[i] < 0x125C3) then
              NewColor = NewColor * 16
            end
          end
        end
        LastBulletOfTypeHandled[BulletType] = {NewColor,HardcodedBullets[i]}
        writeInteger(string.format("gnazo.exe+%X",HardcodedBullets[i]), (ShotTypes[ShotIndex][1]*100)+NewColor )
      end
    end
  end
end

--Percent chance modifier, default projectile speed, normal bullet cap per enemy, large bullet cap per enemy
local DifficultyMultipliers={}
DifficultyMultipliers[0] = {0.25,3,10,1} --Easy
DifficultyMultipliers[1] = {0.5,3,20,2} --Normal
DifficultyMultipliers[2] = {0.75,3,30,3} --Hard
DifficultyMultipliers[3] = {1,3,40,3} --Lunatic
--Old Speeds: 2, 2.66, 3.33, 4

--Map Arrows Address
local MapArrowsAddress = 0x92EB02
local MapArrowsOffset = 0xF8

--Char Data Addresses
local CharDataOffset = 0x1F70

local EnemyHPAddress = 0x93EAD0 --Integer
local EnemyExistsAddress = 0x93EAA4 --Byte
local EnemyCharacterAddress = 0x94051C --Integer
local EnemyMovementPatternAddress = 0x93EACE --Byte
local EnemyInteractsWithGroundAddress = 0x93EACC --Byte
local EnemyMeleeGuardSettingAddress = 0x93EACD --Byte?
local EnemyContactDamageAddress = 0x940528 --Integer
local EnemyXSpeedAddress = 0x93EAE4 --Float

local EnemySpriteAddress = 0x93EAA0 --Integer
local EnemySpriteXSizeAddress = 0x93EA48 --Integer
local EnemySpriteYSizeAddress = 0x93EA4C --Integer

--Melee, Magic, Fire, Water, Electricity (Players Only?), Wind, ???, ???
local EnemyAffinityAddressStart = 0x94052C --Float
local EnemyAffinityOffset = 4

local EnemyBulletAddress = 0x940524 --Integer
local EnemySecondaryBulletAddress = 0x940800 --Integer
local EnemyShotVelocityAddress = 0x940580 --Float

local EnemyShotAimingAddress = 0x940648 --Byte
local EnemyShotSplitingAddress = 0x940998 --Byte

local EnemyInitialShootingDelayAddress = 0x940634 --Integer
local EnemyRefireDelayAddress = 0x9406FC --Integer
local EnemyExtraShotCountAddress = 0x9406AC --Float
local EnemyPairedBulletSpacingAddress = 0x9406C0 --Float

local EnemyShotWeightAddress = 0x9405D0 --Float
local EnemyShotLifetimeAddress = 0x94060C --Integer

local EnemyShotTurningRateAddress = 0x9405E4 --Float
local EnemyShotVelocityModAddress = 0x9405A8 --Float

local EnemyShotTotalFiringTimeAddress = 0x9406E8 --Integer
local EnemyShotFireRateAddress = 0x940724 --Integer
local EnemyShotConsFiringTimeAddress = 0x940710 --Integer
local EnemyShotConsFireRateAddress = 0x940738 --Integer

local EnemyAimDirectionAddress = 0x940594 --Float
local EnemyAimSpinSpeedAddress = 0x940684 --Float
local EnemyShotSpreadCountAddress = 0x94065C --Byte
local EnemyShotSpreadAngleAddress = 0x940670 --Float

local EnemyShotSplitVelocityAddress = 0x94074C --Float
local EnemyShotSplitCountAddress = 0x940828 --Integer
local EnemyShotSplitConeAddress = 0x94083C --Float
local EnemyShotSplitLifetimeAddress = 0x9407D8 --Integer

local EnemyShotSplitVelocityModAddress = 0x940774 --Float
local EnemyShotSplitAimingDirectionAddress = 0x940760 --Float
local EnemyShotSplitWeightAddress = 0x94079C --Float

--Bullet Table Addresses
local EnemyBulletTypeAddress = 0x6B4180 --Integer
local EnemyBulletExistsAddress = 0x6B4134 --Byte
local EnemyBulletWillSplitAddress = 0x6B41A4 --Byte
local EnemyBulletOffset = 0x500

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

--Map Stage Coords Addresses
local StageMapXCoordAddress = 0x92EAF0
local StageMapYCoordAddress = 0x92EAF4
local MapDataOffset = 0xF8

local StageBackgroundOverrides = {}
StageBackgroundOverrides[173] = 1480
StageBackgroundOverrides[174] = 1480
StageBackgroundOverrides[175] = 1480
StageBackgroundOverrides[176] = 91
  
for n = 1,3,1 do
  local Byte = string.byte("091",n)
  writeBytes(string.format("gnazo.exe+%X", 0x2F52BE + (n-1) ),Byte) --Stage 17-6 Collision
  writeBytes(string.format("gnazo.exe+%X", 0x306692 + (n-1) ),Byte) --Stage 17-6 Background
  writeBytes(string.format("gnazo.exe+%X", 0x3153DE + (n-1) ),Byte) --Stage 17-6 Foreground
end

for n = 1,21,1 do
  local Byte = string.byte("ex\\ys_173back.bmp    ",n) -- 17-3 Background
  writeBytes(string.format("gnazo.exe+%X", 0x3066D0+(n-1) ),Byte)
  local Byte = string.byte("ex\\ys_174back.bmp    ",n) -- 17-4 Background
  writeBytes(string.format("gnazo.exe+%X", 0x3066B8+(n-1) ),Byte)
  if n <= 17 then
    local Byte = string.byte("ex\\ys_173fore.bmp",n) -- 17-3 Foreground
    writeBytes(string.format("gnazo.exe+%X", 0x315410+(n-1) ),Byte)
    local Byte = string.byte("ex\\ys_174fore.bmp",n) -- 17-4 Foreground
    writeBytes(string.format("gnazo.exe+%X", 0x3153FC+(n-1) ),Byte)
    local Byte = string.byte("ex\\ys_175fore.bmp",n) -- 17-5 Foreground
    writeBytes(string.format("gnazo.exe+%X", 0x3153E8+(n-1) ),Byte)
    if n <= 13 then
      local Byte = string.byte("ex\\ys173.bmp ",n) -- 17-3 Collision
      writeBytes(string.format("gnazo.exe+%X", 0x2F52E8+(n-1) ),Byte)
      local Byte = string.byte("ex\\ys174.bmp ",n) -- 17-4 Collision
      writeBytes(string.format("gnazo.exe+%X", 0x2F52D8+(n-1) ),Byte)
      local Byte = string.byte("ex\\ys175.bmp ",n) -- 17-5 Collision
      writeBytes(string.format("gnazo.exe+%X", 0x2F52C8+(n-1) ),Byte)
    end
  end
end

local addressthing = readInteger("gnazo.exe+BC7ED")
writeBytes("gnazo.exe+1B0B73",{0x89,0x3D})
writeInteger("gnazo.exe+1B0B75",addressthing)
writeBytes("gnazo.exe+1B0B79",0xC3)

writeBytes("gnazo.exe+BC7EC",0xE8)
writeInteger("gnazo.exe+BC7ED", (0x1B0B73-0xBC7EC)-5 )
writeBytes("gnazo.exe+BD413",0xE8)
writeInteger("gnazo.exe+BD414", (0x1B0B73-0xBD413)-5 )

writeBytes("gnazo.exe+BC7E6",0xAE) --173 Right Edge Exit (174)
writeBytes("gnazo.exe+BD407",0xAF) --174 Right Edge Exit (175)
writeBytes("gnazo.exe+BDA0A",0) --175 Left/Right Edge Exit (0)

math.randomseed(RandomSeed)
local mrgr = math.random()

local StageWaterColor = {}
local StageDarknessOverride

if RandomizeBackgrounds then
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
  
  --[[for i = 1,220,1 do
    if StageDarknessOverride[i] == nil then
      StageDarknessOverride[i] = 0
    end
  end]]
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


local EnemiesThatShoot = {4,5,7,8,9,13,14,19,26,27,28,96,115,116,121,130,132,133,134,1120,1121,1122}
local EnemyCanShoot = {}
for i = 1,#EnemiesThatShoot,1 do
  EnemyCanShoot[EnemiesThatShoot[i]] = true
end
local EnemyIsFairy = {}
EnemyIsFairy[4] = true
EnemyIsFairy[5] = true
EnemyIsFairy[7] = true

local CharacterSpriteOffset = nil
local FairySprites = {} --Sprite, HP Multiplier, Character Index
FairySprites[1] =  {      0,1   ,4} --Blue
FairySprites[2] =  {    112,1.25,4} --Red
FairySprites[3] =  {    224,1.5 ,4} --Green
FairySprites[4] =  {    336,1.75,4} --Pink
FairySprites[5] =  {1284272,1.5 ,5} --Blue Maid
FairySprites[6] =  {1284384,1.75,5} --Red Maid
FairySprites[7] =  {1284496,2   ,5} --Green Maid
FairySprites[8] =  {1284608,2.5 ,5} --Purple Maid
FairySprites[9] =  {1215824,1.5 ,7} --Shanghai
FairySprites[10] = {    448,2.5 ,4} --Purple
FairySprites[11] = {    560,3   ,4} --Pink-Haired
FairySprites[12] = {    672,3   ,4} --Blue-Haired
FairySprites[13] = {    784,3   ,4} --Dark Purple
FairySprites[14] = {1284720,3   ,5} --Cyan Maid
FairySprites[15] = {1284832,3   ,5} --Purple-haired Maid
FairySprites[16] = {1284944,3   ,5} --Orange-haired Maid
FairySprites[17] = {1285056,3   ,5} --Dark Brown Maid

local SpiritSprites = {} --Sprite, Health multiplier, Damage multiplier
SpiritSprites[1] = {1288040,1.0,1.0} --Normal
SpiritSprites[2] = {1288056,1.5,1.5} --Purple
SpiritSprites[3] = {1288072,1.5,1.5} --Red
SpiritSprites[4] = {1288088,3.0,2.0} --Black

local KedamaSprites = {} --Normal Sprite, Tiny Sprite, Health multiplier, Damage multiplier, All Elemental Affinities
KedamaSprites[1] = {1345568,397496,1.0,1.0,1} --White
KedamaSprites[2] = {1345584,397512,1.4,1.0,1} --Blue
KedamaSprites[3] = {1345600,397528,2.4,1.0,1} --Green
KedamaSprites[4] = {1345616,397544,1.5,1.0,1} --Pink
KedamaSprites[5] = {1345632,397560,3.0,1.6,1} --Purple
KedamaSprites[6] = {1345648,397576,1.5,1.0,1} --Yellow
KedamaSprites[7] = {1345664,397592,3.0,1.6,1} --Orange
KedamaSprites[8] = {1345680,397608,1.0,2.3,0} --Metal

local PlayerSprites = {} --Offset from Blue Fairy, Elemental affinities (x8), Contact Damage
PlayerSprites[0] = {3406768,1,1,1,1,1,1,1,1,25} --Reimu
PlayerSprites[1] = {474264,1,1,1,1,1,1,1,1,25} --Marisa
PlayerSprites[2] = {18160,1,1,1,1.3,1,1,1,1,25} --Alice
PlayerSprites[3] = {1288328,1,1.1,5,0.4,1.1,1.1,1.1,1.1,25} --Cirno
PlayerSprites[4] = {1284200,0.8,1.4,1.4,1.4,1.4,1.4,1.4,1.4,35} --Meiling
PlayerSprites[5] = {3742120,1,0.6,0.6,0.6,0.6,0.6,0.6,0.6,25} --Patchouli
PlayerSprites[6] = {400528,0.9,0.9,0.9,0.9,0.9,0.9,0.9,0.9,30} --Sakuya
PlayerSprites[7] = {1219048,0.96,0.96,0.96,1.36,0.96,0.96,0.96,0.96,35} --Remilia
PlayerSprites[8] = {15752,0.8,0.9,1.2,0.9,0.9,0.9,0.9,0.9,50} --Youmu
PlayerSprites[9] = {1264248,0.8,0.9,1.2,0.9,0.9,0.7,0.9,0.9,40} --Yuyuko
PlayerSprites[10] = {393144,1,0.9,1.4,0.9,1,1,1,1,25} --Rumia
PlayerSprites[11] = {1264336,1,1.1,7,0.4,1.1,1.1,1.1,1.1,25} --Daiyousei
PlayerSprites[12] = {1212424,0.7,0.8,0.8,1.3,0.8,0.8,0.8,0.8,40} --Flandre
PlayerSprites[13] = {474352,0.75,0.9,0.9,0.9,0.9,0.9,0.9,0.9,40} --Yukari
PlayerSprites[14] = {471640,0.8,1,1,1,1,1,1,1,35} --Keine
PlayerSprites[15] = {1284104,0.8,0.9,0.9,1.3,0.9,0.9,0.9,0.9,30} --Tewi
PlayerSprites[16] = {471768,0.8,0.9,0.9,1.3,0.9,0.9,0.9,0.9,30} --Reisen
PlayerSprites[17] = {3409744,0.72,0.9,0.9,1.3,0.9,0.7,0.9,0.9,35} --Eirin
PlayerSprites[18] = {1285592,0.58,0.65,0.3,0.7,0.7,0.26,0.7,0.7,35} --Kaguya
PlayerSprites[19] = {3739256,0.72,0.8,0,1.6,0.8,0.7,0.8,0.8,40} --Mokou
PlayerSprites[20] = {1263496,0.75,0.9,1.4,0.4,0.9,0.9,0.9,0.9,30} --Nitori
PlayerSprites[21] = {392976,0.9,0.9,1.3,0.9,0.9,0,0.9,0.9,35} --Aya
PlayerSprites[22] = {1263568,0.73,0.9,0.9,1.1,0.9,0.3,0.9,0.9,30} --Sanae
PlayerSprites[23] = {400184,0.75,0.9,0.9,1.1,0.9,0.3,0.9,0.9,40} --Kanako
PlayerSprites[24] = {1212048,0.6,0.8,1,0.6,0.8,0.6,0.8,0.8,35} --Suwako
PlayerSprites[25] = {1212800,1,1,1,1,1,1,1,1,28} --Mystia~

local MovementPatternsWithRefireTime = {1,17,18,22,23,24,25,31,33,34}
local MovementPatternUsesRefireTime = {}
for i = 1,#MovementPatternsWithRefireTime,1 do
  MovementPatternUsesRefireTime[MovementPatternsWithRefireTime[i]] = true
end

local MovementPatternsThatCannotFire = {6,10,13,20,35,36,37,39,40,41,43}
local MovementPatternCannotFire = {}
for i = 1,#MovementPatternsThatCannotFire,1 do
  MovementPatternCannotFire[MovementPatternsThatCannotFire[i]] = true
end

local PlatformSpriteOffset = nil
local DesiredPlatformColor = {}
local PlatformHandled = {}
local PlatformRoomwideColor = {{},{},{},{},{}}
local PlatformSprites = {} --Offset from Cloud, Number of Colors, Offset Between Colors, Room-Wide Color Index (0 = full random)
PlatformSprites[1] =  {      0, 4,1,0} --Cloud
PlatformSprites[2] =  {   2772, 4,1,5} --4x4 Block
PlatformSprites[3] =  {   2788, 4,1,1} --8x4 Wide Platform
PlatformSprites[4] =  {   2804, 4,1,1} --8x2 Wide Platform
PlatformSprites[5] =  {   2820, 4,1,2} --4x8 Pillar
PlatformSprites[6] =  {   2836, 4,1,2} --2x8 Pillar
PlatformSprites[7] =  {  19876,10,1,3} --2x1 Thin Platform
PlatformSprites[8] =  {  20004,10,1,3} --4x1 Thin Platform
PlatformSprites[9] =  { 832532, 8,1,4} --1x1 Block
PlatformSprites[10] = { 832564, 8,1,4} --2x1 Block
PlatformSprites[11] = { 832596, 8,1,4} --4x1 Block
PlatformSprites[12] = { 904832, 2,4,0} --Flip Platform
PlatformSprites[13] = {3358552, 2,1,0} --Movable Rock


local DesiredBulletTypes = {}
local DesiredSprite = {}
local EnemyHandled = {}
local CurrentRoomLoaded = 0
local PlatformsCreated = false

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
  
local CreateShooter =
  function(XCoord,YCoord,BulletType,AimDirection,TurnSpeed,FireDelay,RefireTime,ResetLifeTimers,CurrentEnemyIndex)
    for i = 0,64,1 do
      local Index = i
      if i == 0 then
        Index = CurrentEnemyIndex
      end
      if not (Index == nil) then
        local Offset = (Index-1) * CharDataOffset 
        if readBytes(string.format("gnazo.exe+%X",EnemyExistsAddress+Offset),1) == 0 then
          
          writeFloat(string.format("gnazo.exe+%X",0x93EA40+Offset),XCoord)
          writeFloat(string.format("gnazo.exe+%X",0x93EA44+Offset),YCoord)
          writeInteger(string.format("gnazo.exe+%X",0x93EA48+Offset),64) --Sprite X
          writeInteger(string.format("gnazo.exe+%X",0x93EA4C+Offset),64) --Sprite Y
          writeFloat(string.format("gnazo.exe+%X",0x93EA50+Offset),-60) --Collision X
          writeFloat(string.format("gnazo.exe+%X",0x93EA54+Offset),-60) --Collision Y
          writeInteger(string.format("gnazo.exe+%X",EnemySpriteAddress+Offset),CharacterSpriteOffset+1213352)
          writeInteger(string.format("gnazo.exe+%X",EnemyCharacterAddress+Offset),49) --Invisible Shooter
          writeInteger(string.format("gnazo.exe+%X",EnemyMovementPatternAddress+Offset),31)
          writeBytes(string.format("gnazo.exe+%X",EnemyInteractsWithGroundAddress+Offset),0)
          writeFloat(string.format("gnazo.exe+%X",0x93EAD8+Offset),0) --Weight
          writeInteger(string.format("gnazo.exe+%X",EnemyHPAddress+Offset),55555)
          for a = 0,7,1 do
            writeFloat(string.format("gnazo.exe+%X",(EnemyAffinityAddressStart+Offset)+(a*4)),0)
          end
          
          --print(BulletType,AimDirection,TurnSpeed,FireDelay,RefireTime)
          
          writeInteger(string.format("gnazo.exe+%X",EnemyBulletAddress+Offset),BulletType)
          writeFloat(string.format("gnazo.exe+%X", EnemyAimDirectionAddress+Offset), AimDirection)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotTurningRateAddress+Offset), TurnSpeed)
          writeInteger(string.format("gnazo.exe+%X",EnemyInitialShootingDelayAddress+Offset),FireDelay)
          writeInteger(string.format("gnazo.exe+%X",EnemyRefireDelayAddress+Offset),RefireTime) 
          
          writeFloat(string.format("gnazo.exe+%X", EnemyAimSpinSpeedAddress+Offset), 0)
          writeBytes(string.format("gnazo.exe+%X", EnemyShotAimingAddress+Offset), 1)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotVelocityAddress+Offset), 3)
          writeInteger(string.format("gnazo.exe+%X", EnemyShotLifetimeAddress+Offset), 1000)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotWeightAddress+Offset), 0)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotSpreadAngleAddress+Offset), 0.1)
          writeBytes(string.format("gnazo.exe+%X", EnemyShotSpreadCountAddress+Offset), 1)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotVelocityModAddress+Offset), 0)
          writeBytes(string.format("gnazo.exe+%X", EnemyShotSplitingAddress+Offset), 0)
          writeInteger(string.format("gnazo.exe+%X", EnemySecondaryBulletAddress+Offset), 0)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitVelocityAddress+Offset), 0)
          writeInteger(string.format("gnazo.exe+%X", EnemyShotSplitCountAddress+Offset), 0)
          writeInteger(string.format("gnazo.exe+%X", EnemyShotSplitLifetimeAddress+Offset), 0)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitConeAddress+Offset), 0)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitVelocityModAddress+Offset),0)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitAimingDirectionAddress+Offset),0)
          writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitWeightAddress+Offset),0)
          writeInteger(string.format("gnazo.exe+%X", EnemyShotTotalFiringTimeAddress+Offset),1)
          writeInteger(string.format("gnazo.exe+%X", EnemyShotFireRateAddress+Offset),1)
          writeInteger(string.format("gnazo.exe+%X", EnemyShotConsFiringTimeAddress+Offset),1)
          writeInteger(string.format("gnazo.exe+%X", EnemyShotConsFireRateAddress+Offset),1)
          writeFloat(string.format("gnazo.exe+%X", EnemyExtraShotCountAddress+Offset),0)
          writeFloat(string.format("gnazo.exe+%X", EnemyPairedBulletSpacingAddress+Offset),0)
          
          
          writeBytes(string.format("gnazo.exe+%X",0x93EAC8+Offset),4) --Dodge Intensity
          writeFloat(string.format("gnazo.exe+%X",EnemyXSpeedAddress+Offset),0.00001)
          writeFloat(string.format("gnazo.exe+%X",0x93EAE8+Offset),0) --Y Speed
          writeFloat(string.format("gnazo.exe+%X",0x93EAEC+Offset),0) --Patrolling Speed
          writeFloat(string.format("gnazo.exe+%X",0x93EAF0+Offset),0) --Float Speed
          writeFloat(string.format("gnazo.exe+%X",0x940528+Offset),0) --Contact Damage
          writeBytes(string.format("gnazo.exe+%X",0x93EA94+Offset),0) --Current Animation Frame
          if ResetLifeTimers then
            writeInteger(string.format("gnazo.exe+%X",0x940814+Offset),0) --Shooting Timer
            writeInteger(string.format("gnazo.exe+%X",0x93EAC4+Offset),0) --Life Timer
          end
          
          writeBytes(string.format("gnazo.exe+%X",EnemyExistsAddress+Offset),255)
          return Index
        end
      end
    end
  end

local SpawnedMystiaEX = false
local MystiaEXLevel = 1
local MystiaEXShooters = {}
local EnemyIsMystia = {}

local SaveFileIsValid = {}
print("Randomizer Ready!")

local Timer = createTimer(nil)
timer_onTimer(Timer, function()
  if not (getProcessIDFromProcessName("gnazo.exe") == nil) then
    local DestinationRoom = readInteger("gnazo.exe+33D690")
    local CurrentRoom = readInteger("gnazo.exe+33D694")
    local RoomLoadedIndex = readInteger("gnazo.exe+51FB6C")
    if not (RoomLoadedIndex == nil) then
      for a = 1,#AutoUnlocks,1 do
        local Offset = (MapArrowsOffset*(AutoUnlocks[a][2]-1))+(AutoUnlocks[a][1]-1)
        if readBytes(string.format("gnazo.exe+%X", MapArrowsAddress+Offset),1) == 0 then
          writeBytes(string.format("gnazo.exe+%X", MapArrowsAddress+Offset),2)
        end
      end
      if DestinationRoom == 0 then
        DestinationRoom = 420
        writeInteger("gnazo.exe+33D690",420) --Destination Room ID
      elseif DestinationRoom == 173 then
        writeFloat("gnazo.exe+7F7E50",736) --Destination X Coord
        writeFloat("gnazo.exe+93C8D0",65) --Destination Y Coord
      elseif DestinationRoom == 174 or DestinationRoom == 175 then
        writeFloat("gnazo.exe+7F7E50",672) --Destination X Coord
      end
      local IngameMenu = readBytes("gnazo.exe+7F45C8",1) --6 is the stage transition screen
      local CurrentMusic = readBytes("gnazo.exe+855284",1) --0 is menu music
      local CurrentTitleScreenMenu = readBytes("gnazo.exe+851090",1) --9 is Boss Challenge Character Select
      local CurrentSave = readBytes("gnazo.exe+853FC0",1)
      local SelectedBoss = readBytes("gnazo.exe+853FD4",1)
      if RandomizeBackgrounds then --Music Handler for Background Randomization
        if CurrentMusic == 0 then
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
      end
      if CurrentTitleScreenMenu == 5 and (not UnlockedReimu) then
        writeBytes("gnazo.exe+91C00C",26) --Adds Reimu to the Boss Challenge Menu
        writeBytes("gnazo.exe+855CE8",1) --Unlocks Reimu in Boss Challenge
        UnlockedReimu = true
      end
      if (CurrentTitleScreenMenu == 9) and (SelectedBoss == 25) then
        if CurrentMusic == 0 then
          for i = 0,24,1 do
            writeBytes(string.format("gnazo.exe+%X",0x854400+(0x2C*i)),1)
          end
        else
          local BossChallengeMode = readBytes("gnazo.exe+B8E0DC",1)
          if (BossChallengeMode == 1) then
            writeBytes("gnazo.exe+B8E0DC",0)
            local SelectedCharacter = readBytes("gnazo.exe+B8E0F4",1)
            writeBytes("gnazo.exe+92EBDF",SelectedCharacter+2)
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
      if RandomizeEnemies then
        for i = 1,#HardcodedBulletsToUpdate,1 do
          math.randomseed( (RandomSeed+DestinationRoom)*i )
          local mrgr = math.random()
          local BulletType = readInteger(string.format("gnazo.exe+%X",HardcodedBulletsToUpdate[i]))
          local ShotIndex = ShotTypeLookup[math.floor(BulletType/100)]
          if not (ShotIndex == nil) then
            local NewColor = math.random(1,ShotTypes[ShotIndex][2]) - 1
            if not (NewColor == CurrentHardcodedBulletColors[i]) then
              CurrentHardcodedBulletColors[i] = NewColor
              writeInteger(string.format("gnazo.exe+%X",HardcodedBulletsToUpdate[i]), (ShotTypes[ShotIndex][1]*100)+NewColor )
              --print("Hardcoded Bullet "..i.." color changed to "..NewColor)
            end
          end
        end
      end
      --[[if not (StageDarknessOverride == nil) then
        local RoomIsInDarkness = readBytes("gnazo.exe+7F7E58",1)
        if not (RoomIsInDarkness == StageDarknessOverride[math.floor(DestinationRoom/10)]) then
          writeBytes("gnazo.exe+7F7E58",StageDarknessOverride[math.floor(DestinationRoom/10)])
        end
      end]]
      local LifeCount = readBytes("gnazo.exe+850FDC",1)
      if (IngameMenu == 3) and (LifeCount == 0) then
        writeBytes("gnazo.exe+933CB6",0)
      end
      local BossMode = readBytes("gnazo.exe+7F45CA",1) 
      if BossMode == 1 and not IsBossRoom[DestinationRoom] then
        writeBytes("gnazo.exe+7F45CA",0) --Cancel Boss mode when Yukari warping (for SCC)
      end
      if CurrentMusic > 0 then --Solo Character Handler
        local SoloChar = readBytes("gnazo.exe+92EBDF",1)
        if SoloChar > 0 then
          SoloChar = SoloChar - 2
          if not ((Player1DefaultChar == SoloChar) or (Player2DefaultChar == SoloChar)) then
            writeBytes(string.format("gnazo.exe+%X",Player1GameOverCharAddress),SoloChar)
            writeBytes(string.format("gnazo.exe+%X",Player2GameOverCharAddress),SoloChar)
          end
          for i = 0,24,1 do
            if not (i == SoloChar) then
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
        else
          if not (Player1DefaultChar == 0) then
            writeBytes(string.format("gnazo.exe+%X",Player1GameOverCharAddress),0)
          end
          if not (Player2DefaultChar == 1) then
            writeBytes(string.format("gnazo.exe+%X",Player2GameOverCharAddress),1)
          end
        end
      end
      if (IngameMenu == 4) or (IngameMenu == 6) then --Stage Transition or Pause Menu
        for i = 1,220,1 do --Map Fixer
          if not (MapCoords[i] == nil) then
            local Offset = (MapDataOffset*(i-1))
            writeInteger(string.format("gnazo.exe+%X", StageMapXCoordAddress+Offset),MapCoords[i][1])
            writeInteger(string.format("gnazo.exe+%X", StageMapYCoordAddress+Offset),MapCoords[i][2])
          end
        end
      end
      if not ChangingRooms then
        if not (RoomLoadedIndex == CurrentRoomLoaded) then
          CurrentRoomLoaded = RoomLoadedIndex + 0
          LastRoomEntered = CurrentRoom + 0
          ChangingRooms = true
          DesiredBulletTypes = {}
          DesiredSprite = {}
          EnemyHandled = {}
          DesiredPlatformColor = {}
          PlatformHandled = {}
          PlatformRoomwideColor = {{},{},{},{},{}}
          PlatformsCreated = false
          SpawnedMystiaEX = false
          MystiaEXShooters = {}
          EnemyIsMystia = {}
          --local Stage = math.floor(DestinationRoom/10)
          --local RoomNumber = DestinationRoom - (Stage*10)
          --print("----- Stage " .. Stage .. ", Room ".. RoomNumber .." -----")
        else
          --if not (IngameMenu == 6) then
          if RandomizeAttacks then
            if (CurrentMusic > 0) or (CurrentTitleScreenMenu == 9) then
              for i = 1,25,1 do
                local MaxSpirit = readInteger( string.format("gnazo.exe+%X", CharacterMaxSpiritAddress+(0x2C*(i-1))) )
                if MaxSpirit > 0 then
                  local DesiredSpirit = NewCharacterSpirit[i]
                  local SpiritLevel = readInteger( string.format("gnazo.exe+%X", CharacterSpiritLevelAddress+(0x2C*(i-1))) )
                  local AllSpiritLevel = readInteger( string.format("gnazo.exe+%X", CharacterAllSpiritLevelAddress+(0x2C*(i-1))) )
                  DesiredSpirit = DesiredSpirit + (20*SpiritLevel) + (5*AllSpiritLevel)
                  if (i == 1) or (i == 23) then --Reimu and Sanae increase RP via Ability
                    local AbilityLevel = readInteger( string.format("gnazo.exe+%X", CharacterAbilityLevelAddress+(0x2C*(i-1))) )
                    DesiredSpirit = DesiredSpirit + (10*AbilityLevel)
                  end
                  if not (MaxSpirit == DesiredSpirit) then
                    writeInteger(string.format("gnazo.exe+%X", CharacterMaxSpiritAddress+(0x2C*(i-1))), DesiredSpirit)
                    writeFloat(string.format("gnazo.exe+%X", CharacterCurrentSpiritAddress+(0x2C*(i-1))), DesiredSpirit)
                    writeFloat(string.format("gnazo.exe+%X", CharacterCurrentRPAddress+(0x2C*(i-1))), DesiredSpirit)
                  end
                end
              end
            end
          end
          if CurrentMusic == 0 then
            ObjectStatusTable = {}
            for i = 1,256,1 do
              ObjectStatusTable[i] = {false,false,0,0,0}
            end
          else
            if (DestinationRoom == 10) and (CurrentRoom == 10) then --Keep Life count at 5 when in main room
              if LifeCount < 5 then
                writeBytes("gnazo.exe+850FDC",5)
              end
            elseif DestinationRoom == 420 then --Ensure Stage 0 countermeasures are properly handled
              writeFloat("gnazo.exe+7F7E50",1280) --Destination X Coord
              writeFloat("gnazo.exe+93C8D0",65) --Destination Y Coord
              writeBytes("gnazo.exe+9295CE",0) --Player 1 is on stairs
              writeFloat("gnazo.exe+9295BC",1280) --P1 Respawn X Coord
              writeFloat("gnazo.exe+9295C0",65) --P1 Respawn Y Coord
              writeBytes("gnazo.exe+92BC46",0) --Player 2 is on stairs
              writeFloat("gnazo.exe+92BC34",1280) --P2 Respawn X Coord
              writeFloat("gnazo.exe+92BC38",65) --P2 Respawn Y Coord
            end
            if (CharacterSpriteOffset == nil) and (not (CurrentRoom == 0)) and (not (RoomLoadedIndex == 0)) then
              local CurrentCharacter = readBytes("gnazo.exe+B8E0F4",1)
              local Sprite = readInteger("gnazo.exe+928C50") --Player 1 Sprite
              if (not (Sprite == 0)) and (not (PlayerSprites[CurrentCharacter] == nil)) then
                Sprite = Sprite - PlayerSprites[CurrentCharacter][1]
                if Sprite > 0 then
                  CharacterSpriteOffset = Sprite + 0
                  if PlatformSpriteOffset == nil then
                    PlatformSpriteOffset = CharacterSpriteOffset + 380828
                  end
                  --print("Obtained sprite offset of "..CharacterSpriteOffset)
                end
              end
            end
            
            for i = 1,256,1 do
              local Offset = ObjectDataOffset * (i - 1)
              local ObjectState = readBytes(string.format("gnazo.exe+%X", ObjectStateAddress+Offset), 1)
              if ObjectStatusTable[i][1] then
                if (ObjectState == 0) or not (ObjectStatusTable[i][5] == CurrentRoom) then
                  ObjectStatusTable[i][1] = false
                elseif ObjectStatusTable[i][2] and (not (ObjectStatusTable[i][6] == nil)) and (ObjectState == 4) then
                  local Address = MapArrowsAddress + (((ObjectStatusTable[i][6][1] - 1) * MapArrowsOffset) + (ObjectStatusTable[i][6][2] - 1))
                  if readBytes(string.format("gnazo.exe+%X", Address),1) <= 0 then
                    --print("Unlocking Shortcut from",ObjectStatusTable[i][6][1],"to",ObjectStatusTable[i][6][2])
                    writeBytes(string.format("gnazo.exe+%X", Address),2)
                  end
                end
              else
                if ObjectState > 0 then
                  local ObjectIndex = readInteger(string.format("gnazo.exe+%X", ObjectIndexAddress+Offset))
                  local IsDoor = (ObjectIndex >= 35000) and (ObjectIndex <= 35300)
                  local IsWater = (ObjectIndex >= 34000) and (ObjectIndex <= 34401)
                  local TargetRoom = 0
                  local TargetEntranceID = 0
                  local ShortcutUnlock = nil
                  if IsDoor then
                  
                    if RandomizeDoors then
                      if DoorSpriteBaseOffset == nil then
                        local DoorSprite = readInteger(string.format("gnazo.exe+%X", ObjectSpriteAddress+Offset))
                        if not (DoorTypeSpriteIndexes[ObjectIndex] == nil) then
                          DoorSpriteBaseOffset = DoorSprite - DoorTypeSpriteIndexes[ObjectIndex]
                        end
                      end
                    
                      TargetRoom = readInteger(string.format("gnazo.exe+%X", ObjectDoorTargetRoomAddress+Offset))
                      TargetEntranceID = readBytes(string.format("gnazo.exe+%X", ObjectDoorTargetEntranceAddress+Offset),1)
                      if not (EntranceTable[DestinationRoom] == nil) then
                        if not (EntranceTable[DestinationRoom][TargetRoom] == nil) then
                          if not (EntranceTable[DestinationRoom][TargetRoom][TargetEntranceID] == nil) then
                            local NewRoomID = EntranceTable[DestinationRoom][TargetRoom][TargetEntranceID][1]
                            local NewEntranceID = EntranceTable[DestinationRoom][TargetRoom][TargetEntranceID][2]
                            --print("Door Randomized:",TargetRoom,TargetEntranceID,"changed to",NewRoomID,NewEntranceID.." (Owned to Room "..DestinationRoom..")")
                            if not (EntranceTable[DestinationRoom][TargetRoom][TargetEntranceID][4] == nil) then
                              ShortcutUnlock = EntranceTable[DestinationRoom][TargetRoom][TargetEntranceID][4]
                            end
                            if NewRoomID == 0 then
                              writeBytes(string.format("gnazo.exe+%X", ObjectDoorHitsAddress+Offset), 1000000000)
                            end
                            writeInteger(string.format("gnazo.exe+%X", ObjectDoorTargetRoomAddress+Offset),NewRoomID)
                            writeBytes(string.format("gnazo.exe+%X", ObjectDoorTargetEntranceAddress+Offset),NewEntranceID)
                            local NewDoorSprite = DoorSpriteBaseOffset+((EntranceTable[DestinationRoom][TargetRoom][TargetEntranceID][3]-1)*32)
                            writeInteger(string.format("gnazo.exe+%X", ObjectSpriteAddress+Offset),NewDoorSprite)
                          end
                        end
                      end
                    end
                    
                    local RemainingHits = readBytes(string.format("gnazo.exe+%X", ObjectDoorHitsAddress+Offset), 1)
                    if (RemainingHits > 0) and (RemainingHits <= 10) then
                      writeBytes(string.format("gnazo.exe+%X", ObjectDoorHitsAddress+Offset), 0)
                    end
                    
                  elseif IsWater then
                    if StageWaterColor[math.floor(DestinationRoom/10)] == 1 then
                      writeInteger(string.format("gnazo.exe+%X", ObjectIndexAddress+Offset),ObjectIndex+1)
                    end
                  end
                  ObjectStatusTable[i] = {true,IsDoor,TargetRoom,TargetEntranceID,DestinationRoom,ShortcutUnlock}
                end
              end
            end
            
            if (IngameMenu == 0) then
              if RandomizeEnemies then
                local MystiaInRoom = false
                local Difficulty = readBytes("gnazo.exe+85100A",1)
                if not IsBossRoom[CurrentRoom] then --Certain bosses crash when their (presumed) familiars are randomized
                  if DestinationRoom == CurrentRoom then
                    for i = 1,30,1 do --There generally aren't more than 30 enemies per room
                      local Offset = (CharDataOffset*(i-1))
                      local Character = readInteger(string.format("gnazo.exe+%X", EnemyCharacterAddress+Offset))
                      local MovementPattern = readBytes(string.format("gnazo.exe+%X", EnemyMovementPatternAddress+Offset),1)
                      local EnemyExists = readBytes(string.format("gnazo.exe+%X", EnemyExistsAddress+Offset),1)
                      
                      if IngameMenu == 0 then
                        if EnemyIsMystia[i] == nil then
                          if (Character == 14) and (EnemyExists > 0) then
                            EnemyIsMystia[i] = true
                            MystiaInRoom = true
                          else
                            EnemyIsMystia[i] = false
                          end
                        elseif EnemyIsMystia[i] then
                          MystiaInRoom = true
                          if EnemyExists == 0 then
                            EnemyIsMystia[i] = false
                            local CurrentLevel = readBytes("gnazo.exe+933CB6",1)
                            if CurrentLevel <= 1 then
                              writeBytes("gnazo.exe+933CB6",2)
                            else
                              writeBytes("gnazo.exe+933CB6",math.min(55,CurrentLevel+1))
                            end
                          end
                        end
                      end
                      
                      math.randomseed( math.ceil((RandomSeed+(DestinationRoom*3.14))+(i*3.14)) )
                      local mrgr = math.random()
                      
                      if not (Character == 49) then --Invisible Shooter
                        if not (EnemyExists == 0) then
                          
                          local ShotType = readInteger(string.format("gnazo.exe+%X", EnemyBulletAddress+Offset))
                          if not (ShotType == nil) then
                            local NewType = ShotType + 0
                            local NewID = math.floor(ShotType/100)
                            local MainShotChanged = false
                            
                            local TotalFiringTime = 60
                            local FireRate = 60
                            local ConsecutiveFiringTime = 1
                            local ConsecutiveFireRate = 1
                            
                            local AimType = 2
                            local SpreadCount = 1
                            local BulletCount = 1
                            
                            local SplitShotType = 0
                            local SplitType = 0
                            local SplitCount = 0
                            local SplitSpeed = DifficultyMultipliers[Difficulty][2]
                            local SplitLifetime = 0
                            local SplitAngle = 0.1
                            local SplitSpeedMod = 0
                            local SplitAimDirection = 180
                            local SplitWeight = 0
                            
                            local Weight = 0
                            local Lifetime = 0
                            local SpreadAngle = 0.1
                            local AimDirection = 180
                            local AimSpinSpeed = 0
                            local Speed = DifficultyMultipliers[Difficulty][2]
                            local SpeedMod = 0
                            local TurnSpeed = 0
                            
                            local RefireDelay = 180
                            local ExtraShotCount = 1
                            local PairedBulletSpacing = 0
                            
                            --local AttackTypes = {}
                            if EnemyCanShoot[Character] then
                            
                              local MaxBulletCount_Normal = DifficultyMultipliers[Difficulty][3]
                              local MaxBulletCount_Large = DifficultyMultipliers[Difficulty][4]
                              if ShotType > 0 then
                                TotalFiringTime = readInteger(string.format("gnazo.exe+%X", EnemyShotTotalFiringTimeAddress+Offset))
                                FireRate = readInteger(string.format("gnazo.exe+%X", EnemyShotFireRateAddress+Offset))
                                ConsecutiveFiringTime = readInteger(string.format("gnazo.exe+%X", EnemyShotConsFiringTimeAddress+Offset))
                                ConsecutiveFireRate = readInteger(string.format("gnazo.exe+%X", EnemyShotConsFireRateAddress+Offset))
                                
                                AimType = readBytes(string.format("gnazo.exe+%X", EnemyShotAimingAddress+Offset),1)
                                SpreadCount = readBytes(string.format("gnazo.exe+%X", EnemyShotSpreadCountAddress+Offset),1)
                                
                                SplitShotType = readInteger(string.format("gnazo.exe+%X", EnemySecondaryBulletAddress+Offset))
                                SplitType = readBytes(string.format("gnazo.exe+%X", EnemyShotSplitingAddress+Offset),1)
                                SplitCount = readInteger(string.format("gnazo.exe+%X", EnemyShotSplitCountAddress+Offset))
                                SplitSpeed = readFloat(string.format("gnazo.exe+%X", EnemyShotSplitVelocityAddress+Offset))
                                SplitAngle = readFloat(string.format("gnazo.exe+%X", EnemyShotSplitConeAddress+Offset))
                                SplitLifetime = readInteger(string.format("gnazo.exe+%X", EnemyShotSplitLifetimeAddress+Offset))
                                
                                SplitSpeedMod = readFloat(string.format("gnazo.exe+%X", EnemyShotSplitVelocityModAddress+Offset))
                                SplitAimDirection = readFloat(string.format("gnazo.exe+%X", EnemyShotSplitAimingDirectionAddress+Offset))
                                SplitWeight = readFloat(string.format("gnazo.exe+%X", EnemyShotSplitWeightAddress+Offset))
                                
                                Weight = readFloat(string.format("gnazo.exe+%X", EnemyShotWeightAddress+Offset))
                                Lifetime = readInteger(string.format("gnazo.exe+%X", EnemyShotLifetimeAddress+Offset))
                                SpreadAngle = readFloat(string.format("gnazo.exe+%X", EnemyShotSpreadAngleAddress+Offset))
                                AimDirection = readFloat(string.format("gnazo.exe+%X", EnemyAimDirectionAddress+Offset))
                                AimSpinSpeed = readFloat(string.format("gnazo.exe+%X", EnemyAimSpinSpeedAddress+Offset))
                                Speed = readFloat(string.format("gnazo.exe+%X", EnemyShotVelocityAddress+Offset))
                                SpeedMod = readFloat(string.format("gnazo.exe+%X", EnemyShotVelocityModAddress+Offset))
                                TurnSpeed = readFloat(string.format("gnazo.exe+%X", EnemyShotTurningRateAddress+Offset))
                                
                                RefireDelay = readInteger(string.format("gnazo.exe+%X", EnemyRefireDelayAddress+Offset))
                                ExtraShotCount = readFloat(string.format("gnazo.exe+%X", EnemyExtraShotCountAddress+Offset))
                                PairedBulletSpacing = readFloat(string.format("gnazo.exe+%X", EnemyPairedBulletSpacingAddress+Offset))
                                
                                BulletCount = (math.floor(TotalFiringTime/FireRate)*math.floor(ConsecutiveFiringTime/ConsecutiveFireRate))*SpreadCount
                                if ExtraShotCount > 1 then
                                  BulletCount = BulletCount * ExtraShotCount
                                end
                                if SplitType > 0 then
                                  BulletCount = (BulletCount * SplitCount)
                                end
                                if BulletCount > MaxBulletCount_Normal then
                                  MaxBulletCount_Normal = BulletCount + 0
                                  MaxBulletCount_Large = math.ceil(BulletCount/10)
                                end
                              end
                              
                              local InteractsWithGround = readBytes(string.format("gnazo.exe+%X", EnemyInteractsWithGroundAddress+Offset),1) == 1
                              
                              if (ShotType > 0)
                              or (InteractsWithGround and (math.random() < DifficultyMultipliers[Difficulty][1]*0.8))
                              or ((not InteractsWithGround) and (math.random() < (DifficultyMultipliers[Difficulty][1]*0.4)))then
                              
                                local ShotIndex = ShotTypeLookup[NewID]
                                local OldShotIndex = ShotTypeLookup[NewID]
                                if (DesiredBulletTypes[i] == nil) then
                                  local ShotTypeChanged = false
                                  if not ((NewID == 235) or (NewID == 347)) then --Bouncing Knives and Laser won't change type
                                    if not (DestinationRoom == 175) then
                                      for a = 1,5,1 do --Try 5 times
                                        local NewIndex = math.random(1,#ShotTypes)
                                        if ShotTypes[NewIndex][7] then --Cannot select player-specific shots or bouncing knives
                                          local Color = math.random(1,ShotTypes[NewIndex][2]) - 1
                                          if Character == 132 then --Minoriko
                                            if (not (ShotTypes[NewIndex][4] or ShotTypes[NewIndex][5])) and ShotTypes[NewIndex][6] then
                                              ShotIndex = NewIndex
                                              NewID = ShotTypes[NewIndex][1]
                                              NewType = (NewID*100)+Color
                                              ShotTypeChanged = true
                                              break
                                            end
                                          else
                                            if (not ShotTypes[NewIndex][5]) or (((Character == 134) or (EnemyIsFairy[Character] and MovementPatternUsesRefireTime[MovementPattern])) and math.random() < 0.1) then --New Type is Dangerous (Only Doors and Fairies)
                                              if (ShotTypes[NewIndex][3] and (Weight == 0)) --New Type should fly straight
                                              or (ShotTypes[NewIndex][4] and (not (Weight == 0))) --New Type should have weight
                                              or ((not ShotTypes[NewIndex][3]) and (not ShotTypes[NewIndex][4])) then --New Type can be either
                                                ShotIndex = NewIndex
                                                NewID = ShotTypes[NewIndex][1]
                                                NewType = (NewID*100)+Color
                                                ShotTypeChanged = true
                                                break
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                  end

                                  if (not ShotTypeChanged) and (not (ShotIndex == nil)) then
                                    local Color = math.random(1,ShotTypes[ShotIndex][2]) - 1
                                    NewType = (NewID*100)+Color
                                  end

                                  DesiredBulletTypes[i] = NewType
                                  --print("Randomizing Enemy "..i.."'s Projectile to "..NewType.." (Original: "..ShotType..")")
                                elseif (DesiredBulletTypes[i] == ShotType) then --Don't randomize bullet types that are already randomized
                                  ShotIndex = nil
                                else
                                  NewType = DesiredBulletTypes[i]
                                  NewID = math.floor(NewType/100)
                                  ShotIndex = ShotTypeLookup[NewID]
                                  --print("Correcting Enemy "..i.."'s Projectile to "..NewType.." (Original: "..ShotType..")")
                                end
                                
                                local UsingSpecialCharacter = false
                                local EnsureMultipleShots = false
                                if not (CharacterSpriteOffset == nil) then
                                  local CurrentSprite = readInteger(string.format("gnazo.exe+%X", EnemySpriteAddress+Offset))
                                  if not (DesiredSprite[i] == CurrentSprite) then
                                    math.randomseed( (RandomSeed+DestinationRoom)+(i*3) )
                                    local mrgr = math.random()
                                    if EnemyIsFairy[Character] then
                                      local SpriteHandled = false
                                      if (not (ShotIndex == nil)) and (not MovementPatternCannotFire[MovementPattern]) and (math.random() < 0.1) then
                                        if InteractsWithGround then
                                          if not (ShotTypes[ShotIndex][8] == nil) then
                                            local ReplacementIndex = 0
                                            if #ShotTypes[ShotIndex][8] == 1 then
                                              ReplacementIndex = ShotTypes[ShotIndex][8][1]
                                            else
                                              local newindex = math.random(1,#ShotTypes[ShotIndex][8])
                                              ReplacementIndex = ShotTypes[ShotIndex][8][newindex]
                                            end
                                            SpriteHandled = true
                                            local NewSprite = CharacterSpriteOffset+PlayerSprites[ReplacementIndex][1]
                                            writeInteger(string.format("gnazo.exe+%X", EnemySpriteAddress+Offset), NewSprite)
                                            writeInteger(string.format("gnazo.exe+%X", EnemySpriteXSizeAddress+Offset), 128)
                                            writeInteger(string.format("gnazo.exe+%X", EnemySpriteYSizeAddress+Offset), 128)
                                            for a = 1,8,1 do
                                              writeFloat(string.format("gnazo.exe+%X", EnemyAffinityAddressStart+Offset+(4*(a-1))), PlayerSprites[ReplacementIndex][a+1])
                                            end
                                            writeInteger(string.format("gnazo.exe+%X", EnemyContactDamageAddress+Offset), PlayerSprites[ReplacementIndex][10])
                                            local OldHP = readInteger(string.format("gnazo.exe+%X", EnemyHPAddress+Offset))
                                            local NewHP = 400 + (math.random(1,4)*100)
                                            if NewHP > OldHP then
                                              writeInteger(string.format("gnazo.exe+%X", EnemyHPAddress+Offset), NewHP)
                                            end
                                            if ReplacementIndex == 4 then --Meiling can block
                                              writeBytes(string.format("gnazo.exe+%X", EnemyMeleeGuardSettingAddress+Offset), 63)
                                            else
                                              writeBytes(string.format("gnazo.exe+%X", EnemyMeleeGuardSettingAddress+Offset), 0)
                                            end
                                            local XSpeed = readFloat(string.format("gnazo.exe+%X", EnemyXSpeedAddress+Offset))
                                            if math.abs(XSpeed) > 2 then
                                              if XSpeed > 0 then
                                                writeFloat(string.format("gnazo.exe+%X", EnemyXSpeedAddress+Offset), 2)
                                              else
                                                writeFloat(string.format("gnazo.exe+%X", EnemyXSpeedAddress+Offset), -2)
                                              end
                                            end
                                            UsingSpecialCharacter = true
                                            if EnemyIsFairy[Character] then
                                              EnsureMultipleShots = true
                                            end
                                            DesiredSprite[i] = NewSprite
                                          end
                                        end
                                      end
                                      if not SpriteHandled then
                                        local CurrentSpriteIndex = 0
                                        for s = 1,17,1 do
                                          if CharacterSpriteOffset+FairySprites[s][1] == CurrentSprite then
                                            CurrentSpriteIndex = s
                                            break
                                          end
                                        end
                                        if (not (CurrentSpriteIndex == nil)) and (not (FairySprites[CurrentSpriteIndex] == nil)) then
                                          local NewSpriteIndex = 1
                                          if (CurrentSpriteIndex >= 10) or ((not (ShotIndex == nil)) and ShotTypes[ShotIndex][5]) then
                                            NewSpriteIndex = math.random(10,17)
                                            if (CurrentSpriteIndex < 10) and (math.random() < 0.2) then
                                              writeBytes(string.format("gnazo.exe+%X", EnemyMeleeGuardSettingAddress+Offset), 63)
                                            end
                                          else
                                            if readBytes(string.format("gnazo.exe+%X", EnemyInteractsWithGroundAddress+Offset),1) == 1 then
                                              NewSpriteIndex = math.random(1,9)
                                            else
                                              NewSpriteIndex = math.random(1,8)
                                            end
                                          end
                                          if not (FairySprites[NewSpriteIndex] == nil) then
                                            local NewSprite = CharacterSpriteOffset+FairySprites[NewSpriteIndex][1]
                                            writeInteger(string.format("gnazo.exe+%X", EnemySpriteAddress+Offset), NewSprite)
                                            if NewSpriteIndex == 9 then
                                              writeInteger(string.format("gnazo.exe+%X", EnemySpriteXSizeAddress+Offset), 128)
                                              writeInteger(string.format("gnazo.exe+%X", EnemySpriteYSizeAddress+Offset), 128)
                                            else
                                              writeInteger(string.format("gnazo.exe+%X", EnemySpriteXSizeAddress+Offset), 64)
                                              writeInteger(string.format("gnazo.exe+%X", EnemySpriteYSizeAddress+Offset), 64)
                                            end
                                            local OldHP = readInteger(string.format("gnazo.exe+%X", EnemyHPAddress+Offset))
                                            if OldHP < 1000 then
                                              local NewHP = math.min( 1000,math.max( 100,math.ceil((OldHP / FairySprites[CurrentSpriteIndex][2]) * FairySprites[NewSpriteIndex][2]) ) )
                                              if (OldHP > 200) and (NewHP < 200) then
                                                NewHP = 200
                                              end
                                              writeInteger(string.format("gnazo.exe+%X", EnemyHPAddress+Offset), NewHP)
                                            end
                                            writeInteger(string.format("gnazo.exe+%X", EnemyCharacterAddress+Offset),FairySprites[NewSpriteIndex][3])
                                            if (FairySprites[NewSpriteIndex][3] == 5) then --Maid Fairies don't have frames for blocking
                                              writeBytes(string.format("gnazo.exe+%X", EnemyMeleeGuardSettingAddress+Offset), 0)
                                            end
                                            DesiredSprite[i] = NewSprite
                                          end
                                        end
                                      end
                                    elseif (Character == 134) then --Shooting Door
                                      local NewSpriteIndex = math.random(1,4)
                                      local NewSprite = readInteger(string.format("gnazo.exe+%X", EnemySpriteAddress+Offset))
                                      if NewSpriteIndex > 1 then
                                        NewSprite = DoorSpriteBaseOffset+(32*(NewSpriteIndex-1))
                                        writeInteger(string.format("gnazo.exe+%X", EnemySpriteAddress+Offset),NewSprite)
                                      end
                                      DesiredSprite[i] = NewSprite
                                      UsingSpecialCharacter = true
                                    end
                                  else
                                    for s = 0,#PlayerSprites,1 do
                                      if CharacterSpriteOffset+PlayerSprites[s][1] == CurrentSprite then
                                        UsingSpecialCharacter = true
                                        if s <= 24 then
                                          EnsureMultipleShots = true
                                        end
                                        break
                                      end
                                    end
                                  end
                                end
                                
                                if not ((ShotIndex == nil) or (DestinationRoom == 175)) then
                                  --print("Enemy "..i.." ("..Character.."): Using Bullet Index "..NewID)
                                  
                                  math.randomseed( math.ceil((RandomSeed+(DestinationRoom*5.55))+(i*5.55)) )
                                  local mrgr = math.random()
                                  if ShotTypes[ShotIndex][5] then --Dangerous Bullets (Bullets that spawn many children. Also Lasers.)
                                    if NewID == 256 then --Keine Charge
                                      if UsingSpecialCharacter then 
                                        SpreadCount = math.ceil(math.random(4,8)*DifficultyMultipliers[Difficulty][1]) + 4
                                      else
                                        SpreadCount = math.max(2,math.ceil(math.random(6,10)*DifficultyMultipliers[Difficulty][1]))
                                      end
                                      SpreadAngle = 360
                                    elseif NewID == 300 then --Suwako Rings
                                      SpreadCount = 1
                                      SpreadAngle = 0.1
                                    elseif (NewID == 255) or (NewID == 362) then --Keine Shot or Eirin Shot
                                      if UsingSpecialCharacter then
                                        SpreadCount = math.random( 1,math.ceil(MaxBulletCount_Large*2) )
                                      else
                                        SpreadCount = math.random( 1,math.ceil(MaxBulletCount_Large*1.5) )
                                      end
                                      if SpreadCount == 1 then
                                        SpreadAngle = 0.1
                                      elseif (NewID == 362) then --Eirin Shot
                                        SpreadAngle = math.min(360,20*(SpreadCount-1))
                                      else
                                        SpreadAngle = math.min(360,(30/DifficultyMultipliers[Difficulty][1])*(SpreadCount-1))
                                      end
                                    else
                                      if UsingSpecialCharacter then
                                        SpreadCount = math.random( 1,math.ceil(MaxBulletCount_Large*1.5) )
                                      else
                                        SpreadCount = math.random(1,MaxBulletCount_Large)
                                      end
                                      if SpreadCount == 1 then
                                        SpreadAngle = 0.1
                                      else
                                        SpreadAngle = math.min(360,(30/DifficultyMultipliers[Difficulty][1])*(SpreadCount-1))
                                      end
                                    end
                                    if math.random() < 0.5 then
                                      AimType = 2
                                    else
                                      AimType = 4
                                    end
                                    ExtraShotCount = 0
                                    PairedBulletSpacing = 0
                                    Weight = 0
                                    AimDirection = 180
                                    RefireDelay = 120 + (math.random(1,4) * 30)
                                    ConsecutiveFiringTime = 1
                                    ConsecutiveFireRate = 1
                                    TotalFiringTime = 1
                                    FireRate = 1
                                    SplitType = 0
                                    if NewID == 227 then
                                      Speed = DifficultyMultipliers[Difficulty][2] * 0.75
                                    else
                                      Speed = DifficultyMultipliers[Difficulty][2] * 1.5
                                    end
                                    if NewID == 300 then --Suwako Rings (They require a high lifetime in order to bounce)
                                      Lifetime = 10000
                                    end
                                    if NewID == 256 then --Keine Charge
                                      TurnSpeed = (math.random()*4) + 2
                                      if math.random() < 0.5 then
                                        TurnSpeed = -TurnSpeed
                                      end
                                      Lifetime = 120
                                      SpeedMod = math.random()/10
                                    else
                                      TurnSpeed = 0
                                      SpeedMod = 0
                                    end
                                    
                                    if NewID == 347 then --Laser (Enemy shouldn't move while using it)
                                      writeFloat(string.format("gnazo.exe+%X", EnemyXSpeedAddress+Offset), 0)
                                    end
                                  else --Regular Bullets
                                    local OriginalSpreadCount = SpreadCount + 0
                                    if Speed <= 0 then
                                      Speed = DifficultyMultipliers[Difficulty][2]
                                    end
                                    Speed = math.min(6, math.max(2,Speed * (1+((math.random()/2.5)-0.2))) )
                                    if Speed < 3 then
                                      SpeedMod = math.max(0,SpeedMod)
                                    end
                                    
                                    if ShotType == 0 then
                                      if ShotTypes[ShotIndex][3] then --If shot should fly straight
                                        Weight = 0
                                        AimType = math.random(1,4)
                                        Lifetime = 0
                                        if (AimType == 1) or (AimType == 3) then
                                          AimDirection = 180
                                          AimSpinSpeed = math.random(5,15)
                                        end
                                      elseif ShotTypes[ShotIndex][4] then --If shot should be affected by gravity
                                        SpreadAngle = 30
                                        AimDirection = math.random(225,270)
                                        Weight = (math.random()*0.2)+0.1
                                        AimType = 3 --general aiming direction
                                        Lifetime = math.random(60,90)
                                        Speed = math.max(6,Speed)
                                        SpreadCount = math.random(2,5)
                                      end
                                    end
                                    
                                    if (not ShotTypes[ShotIndex][4]) and (Weight == 0) then
                                      if (not (NewID == 235)) then --Exclude Bouncing Knives
                                        if AimType <= 4 then
                                          if ShotTypes[ShotIndex][6] and (math.random() < 0.25) then
                                            AimType = AimType + 30 --Bullets are paired up
                                            ExtraShotCount = math.random(2,3)
                                            PairedBulletSpacing = math.random(1,3)*8
                                          end
                                        elseif AimType >= 11 and AimType <= 14 then
                                          ExtraShotCount = math.random(3,5)
                                        elseif AimType >= 31 and AimType <= 34 then
                                          if ShotTypes[ShotIndex][6] then
                                            ExtraShotCount = math.random(2,3)
                                          else
                                            AimType = AimType - 30
                                            ExtraShotCount = 0
                                          end
                                        end
                                      end
                                      if AimSpinSpeed == 0 then
                                        local MaxCircularSpreadCount = 4+math.ceil(8*DifficultyMultipliers[Difficulty][1]) --For large bullets
                                        if (SpreadCount == 1) and (FiringTime == TotalFiringTime) and (math.random() < 0.2) then
                                          local PlusMinus = 1
                                          if math.random() < 0.5 then
                                            PlusMinus = -1
                                          end
                                          AimSpinSpeed = (6 * math.random(1,3)) * PlusMinus
                                          EnsureMultipleShots = true
                                        elseif (SpreadAngle < 360) and (Weight == 0) and (not (NewID == 235)) and (math.random() < 0.1) then
                                          SpreadAngle = 360
                                          SpreadCount = math.random(0,8*DifficultyMultipliers[Difficulty][1]) + 8
                                          if ((NewID == 256) or (math.random() < 0.2)) then
                                            TurnSpeed = (math.random()*4) + 2
                                            if math.random() < 0.5 then
                                              TurnSpeed = -TurnSpeed
                                            end
                                            if (NewID == 256) then
                                              Lifetime = 120
                                              SpeedMod = math.max(0,SpeedMod)
                                            elseif Lifetime == 0 then
                                              Lifetime = math.random(30,120)
                                            end
                                            if ShotTypes[ShotIndex][3] then
                                              SpeedMod = math.max(0,SpeedMod)
                                            end
                                          end
                                        elseif (SpreadAngle >= 360) and (SpreadCount > MaxCircularSpreadCount) then
                                          if (not ShotTypes[ShotIndex][6]) and ShotTypes[OldShotIndex][6] then
                                            SpreadCount = math.max(MaxCircularSpreadCount,math.ceil(SpreadCount/2))
                                          end
                                        elseif (SpreadCount < 8) then
                                          local lowervalue = 1
                                          local uppervalue = 1
                                          if (SpreadCount > 1) and (math.random() < 0.5) then
                                            lowervalue = math.ceil(1/DifficultyMultipliers[Difficulty][1])
                                          end
                                          if (ShotType == 0) then
                                            uppervalue = math.ceil(5*DifficultyMultipliers[Difficulty][1])
                                          elseif (math.random() < 0.5) then
                                            uppervalue = math.ceil(4*DifficultyMultipliers[Difficulty][1])
                                          end
                                          local upperlimit = 8
                                          if UsingSpecialCharacter then
                                            upperlimit = 10
                                          end
                                          if not ShotTypes[ShotIndex][6] then --Large bullets
                                            upperlimit = math.ceil(upperlimit/2)
                                          end
                                          local maximum = math.min(upperlimit,SpreadCount+uppervalue)
                                          local minimum = math.max(1,math.min(maximum,SpreadCount)-lowervalue)
                                          
                                          --print("---Enemy "..i.."---")
                                          --print(minimum,maximum)
                                          SpreadCount = math.random(minimum,maximum)
                                          if SpreadAngle < 360 then
                                            if SpreadCount == 1 then
                                              SpreadAngle = 0.1
                                            else
                                              if OriginalSpreadCount == 1 then
                                                SpreadAngle = math.min(360,(20/DifficultyMultipliers[Difficulty][1])*(SpreadCount-1))
                                              else
                                                SpreadAngle = math.min(360, ((SpreadAngle / OriginalSpreadCount) * SpreadCount) )
                                              end
                                            end
                                          end
                                        end
                                      end
                                    --elseif (not ShotTypes[ShotIndex][5]) and (not (Weight == 0)) then
                                      
                                    end
                                    
                                    if (NewID == 111) or (NewID == 113) then --Aya Tornado/Youmu Spirit
                                      if SpeedMod < 0 then
                                        SpeedMod = 0
                                      end
                                      if (Lifetime < 60) then
                                        Lifetime = 60 + (math.random(0,6) * 30)
                                      end
                                    end
                                    
                                    if not (Character == 132) then --if not Minoriko
                                      if not (SplitType == 1) then
                                        --if (SpreadAngle < 360) then
                                          if ShotType == 0 then
                                            TotalFiringTime = 10+(math.random(1,5)*10)
                                            FireRate = math.floor(TotalFiringTime / math.random(1,4))
                                            if (AimType == 4) or (AimType == 34) then
                                              ConsecutiveFiringTime = 1
                                              ConsecutiveFireRate = 1
                                            else
                                              ConsecutiveFiringTime = math.random(1,math.ceil(FireRate/2))
                                              ConsecutiveFireRate = math.min(ConsecutiveFiringTime,math.random(1,ConsecutiveFiringTime)/DifficultyMultipliers[Difficulty][1])
                                            end
                                          end
                                          TotalFiringTime = math.max(1,TotalFiringTime)
                                          FireRate = math.max(1,FireRate)
                                          ConsecutiveFiringTime = math.max(1,ConsecutiveFiringTime)
                                          ConsecutiveFireRate = math.max(1,ConsecutiveFireRate)
                                          
                                          local Difference = math.max(0,SpreadCount-OriginalSpreadCount)
                                          local FireCount = math.floor(TotalFiringTime/FireRate)
                                          local ConsecutiveFireCount = math.floor(ConsecutiveFiringTime/ConsecutiveFireRate)
                                          
                                          if not (Character == 14) then
                                            local shotcap = math.max(FireCount,8)
                                            if (SpreadAngle >= 360) then
                                              shotcap = math.max(FireCount,1)
                                            end
                                            if (not ShotTypes[ShotIndex][6]) and (AimSpinSpeed == 0) then --Large Shots, not spinning
                                              shotcap = math.ceil(shotcap/2)
                                            end
                                            local maximum = math.min(shotcap,FireCount+math.ceil(shotcap/(4+Difference)))
                                            local minimum = math.max(1,math.min(maximum,FireCount)-math.ceil(maximum/3))
                                            if EnsureMultipleShots then
                                              minimum = math.max(minimum,5)
                                              maximum = maximum+5
                                            end
                                            maximum = math.max(minimum,maximum)
                                            FireCount = math.random(minimum,maximum)
                                          end
                                          
                                          local shotcap = math.max(ConsecutiveFireCount,5)
                                          if (SpreadAngle >= 360) or (AimType == 4) or (AimType == 34) then
                                            shotcap = math.max(ConsecutiveFireCount,1)
                                          end
                                          if not ShotTypes[ShotIndex][6] and (AimSpinSpeed == 0) then --Large Shots, not spinning
                                            if EnsureMultipleShots then
                                              shotcap = math.ceil(shotcap/2)
                                            else
                                              shotcap = math.ceil(shotcap/4)
                                            end
                                          elseif EnsureMultipleShots then
                                            shotcap = shotcap + 5
                                          end
                                          local maximum = math.min(shotcap,ConsecutiveFireCount+math.ceil(shotcap/(4+Difference)))
                                          local minimum = math.max(1,math.min(maximum,ConsecutiveFireCount)-math.ceil(maximum/3))
                                          maximum = math.max(minimum,maximum)
                                          ConsecutiveFireCount = math.random(minimum,maximum)
                                          
                                          FireRate = math.floor(TotalFiringTime/math.max(1,FireCount))
                                          ConsecutiveFireRate = math.floor(ConsecutiveFiringTime/math.max(1,ConsecutiveFireCount))
                                          
                                          TotalFiringTime = math.max(1,TotalFiringTime)
                                          FireRate = math.max(1,FireRate)
                                          ConsecutiveFiringTime = math.max(1,ConsecutiveFiringTime)
                                          ConsecutiveFireRate = math.max(1,ConsecutiveFireRate)
                                          
                                          if RefireDelay < TotalFiringTime then
                                            RefireDelay = TotalFiringTime + (math.random(1,3) * 30)
                                          end
                                        --end
                                      else
                                        RefireDelay = math.random( math.max(TotalFiringTime,RefireDelay-30),RefireDelay+30  )
                                      end
                                      
                                      if (not (NewID == 235)) and (not (Character == 14)) and (SplitType > 0 or (math.random() < ( DifficultyMultipliers[Difficulty][1]/4 ))) then
                                        local AllowedToSplit = true
                                        local SplitCap = 8
                                        
                                        BulletCount = (math.floor(TotalFiringTime/FireRate)*math.floor(ConsecutiveFiringTime/ConsecutiveFireRate))*SpreadCount
                                        if ExtraShotCount > 1 then
                                          BulletCount = BulletCount * ExtraShotCount
                                        end
                                        if (BulletCount >= MaxBulletCount_Normal) and (SplitType == 0) then
                                          AllowedToSplit = false
                                        elseif BulletCount >= MaxBulletCount_Normal/2 then
                                          SplitCap = 1
                                        elseif BulletCount >= MaxBulletCount_Normal/4 then
                                          SplitCap = 3
                                        elseif BulletCount >= MaxBulletCount_Normal/8 then
                                          SplitCap = 5
                                        end
                                        
                                        if AllowedToSplit then
                                          if SplitShotType == 0 then
                                            SplitShotType = NewType + 0
                                          end
                                          local SplitID = math.floor(SplitShotType/100)
                                          local SplitShotIndex = ShotTypeLookup[SplitID]
                                          local ShotTypeChanged = false
                                          if not ((SplitID == 314) or (SplitID == 317)) then --Mystia Shot and Star Shot will split into same type
                                            for a = 1,3,1 do --Try 3 times
                                              local NewIndex = math.random(1,#ShotTypes)
                                              if ShotTypes[NewIndex][7] then
                                                local Color = math.random(1,ShotTypes[NewIndex][2]) - 1
                                                if not ShotTypes[NewIndex][5] then --Cannot be dangerous
                                                  SplitShotIndex = NewIndex
                                                  SplitID = ShotTypes[NewIndex][1]
                                                  SplitShotType = (SplitID*100)+Color
                                                  ShotTypeChanged = true
                                                  break
                                                end
                                              end
                                            end
                                          end

                                          if (not ShotTypeChanged) and (not (SplitShotIndex == nil)) then
                                            local Color = math.random(1,ShotTypes[SplitShotIndex][2]) - 1
                                            SplitShotType = (SplitID*100)+Color
                                          end
                                          
                                          if not (SplitShotIndex == nil) then
                                            if not (SplitType == 1) then
                                              if Lifetime == 0 then
                                                Lifetime = 20 + (math.random(1,7) * 10)
                                              end
                                              if SplitSpeed <= 0 then
                                                SplitSpeed = DifficultyMultipliers[Difficulty][2]
                                              end
                                              local OldSplitCount = SplitCount + 0
                                              if ShotTypes[ShotIndex][6] then
                                                SplitCount = math.min( SplitCap,math.max(SplitCount,math.random(1, math.ceil(3*DifficultyMultipliers[Difficulty][1]) )) )
                                              else
                                                SplitCount = 1
                                              end
                                              
                                              if ShotTypes[SplitShotIndex][3] or ((not ShotTypes[SplitShotIndex][4]) and ((SpreadAngle >= 360) or (math.random() < 0.75))) then
                                                if SplitType == 0 then
                                                  if (SplitCap > 1) and (math.random() < 0.25) then --Shoot out in all directions
                                                    SplitAngle = 360
                                                    SplitCount = math.min( SplitCap,math.random(SplitCount,SplitCount*2) )
                                                    if (SplitCount >= 4) and (math.random() < 0.5) then
                                                      SplitType = 1 --Aim directly in designated direction
                                                      SplitAimDirection = math.random(-180,180)
                                                    else
                                                      SplitType = 3 --Aim in random cone
                                                    end
                                                  else --Aim at player
                                                    SplitType = math.random(1,2)*2
                                                    if SplitType == 4 then --Fire in random cone at player
                                                      SplitAngle = math.min(360,(25/DifficultyMultipliers[Difficulty][1])*SplitCount)
                                                    end
                                                  end
                                                else
                                                  if (SpreadAngle >= 360) and (SplitType == 2) then --Ring of bullets shot at player
                                                    SplitCount = math.min(SplitCap,OldSplitCount)
                                                    --SplitAngle = 0.1
                                                  elseif (SplitType == 2) or (SplitType == 4) then
                                                    local NewSplitType = math.random(1,2) * 2
                                                    if (NewSplitType == 4) and (not (SplitType == 4)) then
                                                      SplitAngle = math.min(360,(25/DifficultyMultipliers[Difficulty][1])*SplitCount)
                                                    end
                                                    SplitType = NewSplitType
                                                  end
                                                end
                                                SplitSpeed = math.min(6, math.max(2,SplitSpeed * (1+((math.random()/2.5)-0.2))) )
                                                if (SplitID == 111) or (SplitID == 113) then --Aya Tornado/Youmu Spirit
                                                  SplitSpeedMod = 0
                                                  SplitLifetime = 60 + (math.random(0,6) * 30)
                                                else
                                                  SplitLifetime = math.random(1,2) * 10
                                                  SplitSpeedMod = (math.random()*0.2) - 0.1
                                                end
                                              else --Has Weight
                                                SplitSpeedMod  = 0
                                                SplitAngle = 25 + (math.random(1,4) * 5)
                                                SplitAimDirection = -90
                                                SplitWeight = (math.random()*0.2)+0.1
                                                SplitType = 3 --general aiming direction
                                                SplitLifetime = math.random(60,90)
                                                SplitSpeed = math.max(2,SplitSpeed)
                                                SplitCount = math.min( SplitCap,math.random(SplitCount,SplitCount*2) )
                                              end
                                            end
                                          else
                                            SplitShotType = 0
                                            SplitSpeedMod  = 0
                                            SplitAngle = 0.1
                                            SplitAimDirection = 180
                                            SplitWeight = 0
                                            SplitType = 0
                                            SplitLifetime = 0
                                            SplitSpeed = 0
                                            SplitCount = 0
                                          end
                                        else
                                          SplitShotType = 0
                                          SplitSpeedMod  = 0
                                          SplitAngle = 0.1
                                          SplitAimDirection = 180
                                          SplitWeight = 0
                                          SplitType = 0
                                          SplitLifetime = 0
                                          SplitSpeed = 0
                                          SplitCount = 0
                                        end
                                      else
                                        SplitShotType = 0
                                        SplitSpeedMod  = 0
                                        SplitAngle = 0.1
                                        SplitAimDirection = 180
                                        SplitWeight = 0
                                        SplitType = 0
                                        SplitLifetime = 0
                                        SplitSpeed = 0
                                        SplitCount = 0
                                      end
                                    end
                                  
                                  end
                                
                                  --[[print("----------Enemy "..i.."----------")
                                  print("Bullet Type: "..NewType)
                                  print("Aim Direction: "..AimDirection)
                                  print("Aim Spin Speed: "..AimSpinSpeed)
                                  print("Aim Type: "..AimType)
                                  print("Shot Speed: "..Speed)
                                  print("Lifetime: "..Lifetime)
                                  print("Turn Speed: "..TurnSpeed)
                                  print("Weight: "..Weight)
                                  print("Spread Angle: "..SpreadAngle)
                                  print("Spread Count: "..SpreadCount)
                                  print("Shot Speed Modifier: "..SpeedMod)
                                  print("Total Firing Time: "..TotalFiringTime)
                                  print("Firing Time: "..FireRate)
                                  print("Consecutive Firing Time: "..ConsecutiveFiringTime)
                                  print("Consecutive Firing Rate: "..ConsecutiveFireRate)
                                  print("Refire Delay: "..RefireDelay)
                                  print("Extra Shot Count: "..ExtraShotCount)
                                  print("Paired Bullet Spacing: "..PairedBulletSpacing)
                                  print("Split Type: "..SplitType)
                                  print("Split Bullet Type: "..SplitShotType)
                                  print("Split Shot Speed: "..SplitSpeed)
                                  print("Split Shot Speed Mod: "..SplitSpeedMod )
                                  print("Split Count: "..SplitCount)
                                  print("Split Angle: "..SplitAngle)
                                  print("Split Lifetime: "..SplitLifetime)
                                  print("Split Aim Direction: "..SplitAimDirection)
                                  print("Split Weight: "..SplitWeight)]]
                                end
                              else
                                DesiredBulletTypes[i] = 0
                              end
                              
                            else --if enemy can't shoot
                              if not (readBytes(string.format("gnazo.exe+%X", EnemyExistsAddress+Offset),1) == 0) then
                                if not (CharacterSpriteOffset == nil) then
                                  local CurrentSprite = readInteger(string.format("gnazo.exe+%X", EnemySpriteAddress+Offset))
                                  local NewSprite
                                  if not (DesiredSprite[i] == CurrentSprite) then
                                    if math.random() < DifficultyMultipliers[Difficulty][1] then
                                      if (Character == 23) then --Spirit
                                        local NewSpriteIndex = math.random(1,4)
                                        NewSprite = CharacterSpriteOffset+SpiritSprites[NewSpriteIndex][1]
                                        if NewSpriteIndex > 1 then
                                          writeInteger(string.format("gnazo.exe+%X", EnemySpriteAddress+Offset), NewSprite)
                                          local OldHP = readInteger(string.format("gnazo.exe+%X", EnemyHPAddress+Offset))
                                          writeInteger(string.format("gnazo.exe+%X", EnemyHPAddress+Offset), OldHP*SpiritSprites[NewSpriteIndex][2])
                                          local OldContactDamage = readInteger(string.format("gnazo.exe+%X", EnemyContactDamageAddress+Offset))
                                          writeInteger(string.format("gnazo.exe+%X", EnemyContactDamageAddress+Offset), OldContactDamage*SpiritSprites[NewSpriteIndex][3])
                                          if NewSpriteIndex == 2 then --Purple Spirit (Fast)
                                            writeFloat(string.format("gnazo.exe+%X",0x93EAEC + Offset),7) --Patrolling Speed
                                            writeFloat(string.format("gnazo.exe+%X",0x93EAF0 + Offset),2.4) --Float Speed
                                          elseif NewSpriteIndex == 3 then --Red Spirit (Homing)
                                            writeBytes(string.format("gnazo.exe+%X",0x93EACE + Offset),34) --Movement Pattern (Stalk player)
                                            writeFloat(string.format("gnazo.exe+%X",0x93EAE4 + Offset),1.7) --X Vel/Chase Speed
                                            writeFloat(string.format("gnazo.exe+%X",0x93EAE8 + Offset),2) --Y Vel/Turn Speed
                                            writeFloat(string.format("gnazo.exe+%X",0x93EAEC + Offset),0) --Patrolling Speed
                                            writeFloat(string.format("gnazo.exe+%X",0x93EAF0 + Offset),0) --Float Speed
                                          elseif NewSpriteIndex == 4 then --Metal Spirit (Invulnerable)
                                            for a = 1,8,1 do
                                              writeFloat(string.format("gnazo.exe+%X", EnemyAffinityAddressStart+Offset+(4*(a-1))),0)
                                            end
                                          end
                                        elseif math.random() < 0.25 then
                                          NewType = math.random(11500,11503)
                                          writeInteger(string.format("gnazo.exe+%X",0x940634 + Offset),14400) --Initial Shooting Delay
                                        end
                                      elseif (Character == 1) or (Character == 2) then --Kedama (Normal and Tiny)
                                        local CurrentSprite = readInteger(string.format("gnazo.exe+%X", EnemySpriteAddress+Offset))
                                        local CurrentSpriteIndex = 0
                                        local t = 1
                                        if (Character == 1) then
                                          for s = 1,8,1 do
                                            if CharacterSpriteOffset+KedamaSprites[s][1] == CurrentSprite then
                                              CurrentSpriteIndex = s
                                              break
                                            end
                                          end
                                        else
                                          CurrentSpriteIndex = 1
                                          t = 2
                                        end
                                        NewSpriteIndex = math.random(1,8)
                                        if (NewSpriteIndex < 8) or (Character == 2) or (math.random() < 0.25) then
                                          NewSprite = CharacterSpriteOffset+KedamaSprites[NewSpriteIndex][t]
                                          if not (CurrentSpriteIndex == NewSpriteIndex) then
                                            if (not (CurrentSpriteIndex == 8)) or (math.random() > 0.75) then
                                              writeInteger(string.format("gnazo.exe+%X", EnemySpriteAddress+Offset), NewSprite)
                                              local OldHP = readInteger(string.format("gnazo.exe+%X", EnemyHPAddress+Offset))
                                              local NewHP = math.ceil((OldHP / KedamaSprites[CurrentSpriteIndex][3]) * KedamaSprites[NewSpriteIndex][3])
                                              writeInteger(string.format("gnazo.exe+%X", EnemyHPAddress+Offset), NewHP)
                                              local OldContactDamage = readInteger(string.format("gnazo.exe+%X", EnemyContactDamageAddress+Offset))
                                              local NewContactDamage = math.ceil((OldHP / KedamaSprites[CurrentSpriteIndex][4]) * KedamaSprites[NewSpriteIndex][4])
                                              writeInteger(string.format("gnazo.exe+%X", EnemyContactDamageAddress+Offset), NewContactDamage)
                                              if NewSpriteIndex == 7 then
                                                writeBytes(string.format("gnazo.exe+%X", EnemyMeleeGuardSettingAddress+Offset), 63)
                                              end
                                              for a = 1,8,1 do
                                                writeFloat(string.format("gnazo.exe+%X", EnemyAffinityAddressStart+Offset+(4*(a-1))), KedamaSprites[NewSpriteIndex][5])
                                              end
                                            end
                                          end
                                        end
                                      end
                                    end
                                    DesiredSprite[i] = NewSprite or CurrentSprite
                                  end
                                end
                              end
                            end
                              
                            writeInteger(string.format("gnazo.exe+%X", EnemyBulletAddress+Offset), NewType)
                            
                            writeFloat(string.format("gnazo.exe+%X", EnemyAimDirectionAddress+Offset), AimDirection)
                            writeFloat(string.format("gnazo.exe+%X", EnemyAimSpinSpeedAddress+Offset),AimSpinSpeed)
                            writeBytes(string.format("gnazo.exe+%X", EnemyShotAimingAddress+Offset), AimType)
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotVelocityAddress+Offset), Speed)
                            writeInteger(string.format("gnazo.exe+%X", EnemyShotLifetimeAddress+Offset), Lifetime)
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotTurningRateAddress+Offset), TurnSpeed)
                            
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotWeightAddress+Offset), Weight)
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotSpreadAngleAddress+Offset), SpreadAngle)
                            writeBytes(string.format("gnazo.exe+%X", EnemyShotSpreadCountAddress+Offset), SpreadCount)
                            
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotVelocityModAddress+Offset), SpeedMod)
                            writeBytes(string.format("gnazo.exe+%X", EnemyShotSplitingAddress+Offset), SplitType)
                            
                            writeInteger(string.format("gnazo.exe+%X", EnemySecondaryBulletAddress+Offset), SplitShotType)
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitVelocityAddress+Offset), SplitSpeed)
                            writeInteger(string.format("gnazo.exe+%X", EnemyShotSplitCountAddress+Offset), SplitCount)
                            writeInteger(string.format("gnazo.exe+%X", EnemyShotSplitLifetimeAddress+Offset), SplitLifetime)
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitConeAddress+Offset), SplitAngle)
                            
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitVelocityModAddress+Offset),SplitSpeedMod)
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitAimingDirectionAddress+Offset),SplitAimDirection)
                            writeFloat(string.format("gnazo.exe+%X", EnemyShotSplitWeightAddress+Offset),SplitWeight)
                            
                            writeInteger(string.format("gnazo.exe+%X", EnemyShotTotalFiringTimeAddress+Offset),TotalFiringTime)
                            writeInteger(string.format("gnazo.exe+%X", EnemyShotFireRateAddress+Offset),FireRate)
                            writeInteger(string.format("gnazo.exe+%X", EnemyShotConsFiringTimeAddress+Offset),ConsecutiveFiringTime)
                            writeInteger(string.format("gnazo.exe+%X", EnemyShotConsFireRateAddress+Offset),ConsecutiveFireRate)
                            
                            writeInteger(string.format("gnazo.exe+%X", EnemyRefireDelayAddress+Offset),RefireDelay)
                            writeFloat(string.format("gnazo.exe+%X", EnemyExtraShotCountAddress+Offset),ExtraShotCount)
                            writeFloat(string.format("gnazo.exe+%X", EnemyPairedBulletSpacingAddress+Offset),PairedBulletSpacing)
                          end
                        end
                      end
                    end
                  end
                end
                for i = 0,1022,1 do --Clear bullet splitting flag after a bullet has split
                  local Offset = i * EnemyBulletOffset
                  if readBytes(string.format("gnazo.exe+%X", EnemyBulletExistsAddress+Offset),1) == 0 then
                    if readBytes(string.format("gnazo.exe+%X", EnemyBulletWillSplitAddress+Offset),1) >= 1 then
                      writeBytes(string.format("gnazo.exe+%X", EnemyBulletWillSplitAddress+Offset),0)
                    end
                  end
                end
                
                if not (CharacterSpriteOffset == nil) then
                  if (IngameMenu == 0) then
                    MystiaEXLevel = readBytes("gnazo.exe+933CB6",1) --Map data: 55 > 55
                    local Intensity = 1
                    local PercChance = 0.05
                    if MystiaEXLevel > 0 then
                      Intensity = Intensity + ((MystiaEXLevel-1) * 0.35)
                      PercChance = MystiaEXLevel * 0.05
                      if IsBossRoom[DestinationRoom] then
                        PercChance = PercChance * 2
                      end
                    end
                    if not SpawnedMystiaEX then
                      if MystiaInRoom then
                        PercChance = PercChance * 2
                      end
                      math.randomseed( RandomSeed+DestinationRoom )
                      local mrgr = math.random()
                      if (not (DestinationRoom == 10)) and math.random() < PercChance then
                        local Count = math.random( 1,math.ceil(Intensity) )
                        for i = 1,Count,1 do
                          MystiaEXShooters[i] = {0,nil} --Times Spawned, Enemy Index
                        end
                      end
                      SpawnedMystiaEX = true
                    end
                    if #MystiaEXShooters > 0 then
                      local CameraXCoord = readFloat("gnazo.exe+91C3FC")
                      local PlayerYCoord = readFloat("gnazo.exe+928BF4")
                      --local Intensity = 10
                      --local Count = math.random(1, math.ceil(Intensity/2) )
                      for c = 1,#MystiaEXShooters,1 do
                        local EnemyExpired = false
                        local ResetLifeTimers = true
                        if not (MystiaEXShooters[c][2] == nil) then
                          local Offset = (MystiaEXShooters[c][2]-1) * CharDataOffset
                          local XCoord = readFloat(string.format("gnazo.exe+%X",0x93EA40+Offset))
                          local ShootingTimer = readInteger(string.format("gnazo.exe+%X",0x940814+Offset))
                          local RefireDelay = readInteger(string.format("gnazo.exe+%X",0x9406FC+Offset))
                          local EnemyExists = readBytes(string.format("gnazo.exe+%X",EnemyExistsAddress+Offset),1)
                          if (XCoord < CameraXCoord) or (XCoord > (CameraXCoord + 640)) then
                            EnemyExpired = true
                            ResetLifeTimers = false
                            writeBytes(string.format("gnazo.exe+%X",EnemyExistsAddress+Offset),0)
                          elseif (ShootingTimer >= (RefireDelay - 10)) then
                            EnemyExpired = true
                            writeBytes(string.format("gnazo.exe+%X",EnemyExistsAddress+Offset),0)
                          elseif (EnemyExists == 0) then
                            EnemyExpired = true
                            ResetLifeTimers = false
                          end
                        end
                        if EnemyExpired or (MystiaEXShooters[c][2] == nil) then
                          if ResetLifeTimers then
                            MystiaEXShooters[c][1] = MystiaEXShooters[c][1] + 1
                          end
                          math.randomseed( (RandomSeed+DestinationRoom)*(c*MystiaEXShooters[c][1])+math.floor(CameraXCoord) )
                          local mrgr = math.random()
                          local YCoord
                          local AimDirection
                          local AimDirectionOffset = math.random(-20,20)
                          if PlayerYCoord < 40 then --Player is entering from top of screen
                            YCoord = 480
                            AimDirection = 270 + AimDirectionOffset
                          elseif PlayerYCoord > 440 then --Player is entering from bottom of screen
                            YCoord = 0
                            AimDirection = 90 + AimDirectionOffset
                          else
                            if math.random() < 0.5 then
                              YCoord = 480
                              AimDirection = 270 + AimDirectionOffset
                            else
                              YCoord = 0
                              AimDirection = 90 + AimDirectionOffset
                            end
                          end
                          local RoomEntranceXCoord = readFloat("gnazo.exe+7F7E50")
                          local RoomLength = readFloat("gnazo.exe+93C8D4")
                          local XCoord
                          if RoomLength <= 640 or math.random() < 0.5 then --Small Room
                            XCoord = math.random(math.floor(CameraXCoord)+80,math.ceil(CameraXCoord)+560)
                          elseif (RoomEntranceXCoord - 640) < (RoomLength * 0.333) then --Entered from Left side
                            XCoord = math.random(math.floor(CameraXCoord)+460,math.ceil(CameraXCoord)+600)
                          elseif (RoomEntranceXCoord - 640) > (RoomLength * 0.666) then --Entered from Right side
                            XCoord = math.random(math.floor(CameraXCoord)+40,math.ceil(CameraXCoord)+180)
                          else --Entered from middle
                            XCoord = math.random(math.floor(CameraXCoord)+80,math.ceil(CameraXCoord)+560)
                          end
                          local BulletType = math.random(31400,31404)
                          local FireDelay = (math.random(0,6) * 10) + (30*(c-1))
                          local RefireTime = (120/DifficultyMultipliers[Difficulty][1]) + (60 * #MystiaEXShooters) + (math.random(0,6) * 30)
                          --if Intensity > 1 then
                          --  FireDelay = FireDelay / Intensity
                          --  RefireTime = math.min(RefireTime,RefireTime/(Intensity/3))
                          --end
                          local TurnSpeed = math.random(10,30)/100
                          if math.random() < 0.5 then
                            TurnSpeed = -TurnSpeed
                          end
                          MystiaEXShooters[c][2] = CreateShooter(XCoord,YCoord,BulletType,AimDirection,TurnSpeed,FireDelay,RefireTime,ResetLifeTimers,MystiaEXShooters[c][2])
                        end
                      end
                    end
                  end
                end
              end
              
              if RandomizeBackgrounds then
                if not (PlatformSpriteOffset == nil) then
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
                            if PlatformSpriteOffset+PlatformSprites[s][1] == Sprite then
                              SpriteIndex = s
                              break
                            end
                          end
                          if not (SpriteIndex == nil) then
                            math.randomseed( math.ceil((RandomSeed+(DestinationRoom*2.34))+(i*4.32)) )
                            local mrgr = math.random()
                            local RoomwideIndex = PlatformSprites[SpriteIndex][4]
                            if RoomwideIndex == 0 then
                              local NewColor = (math.random(1,PlatformSprites[SpriteIndex][2]) * PlatformSprites[SpriteIndex][3])
                              if SpriteIndex == 13 then --Randomly sized rocks PogChamp
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
              end
              
            end
          end
          
        end
      else
        if (DestinationRoom == CurrentRoom) then
          RoomID = CurrentRoom
          Stage = math.floor(CurrentRoom * 0.1)
          Room = RoomID - Stage
          ChangingRooms = false
        end
      end
      
    else --Game closed
      Timer:destroy()
    end
  else --Game closed
    Timer:destroy()
  end
end)
timer_setInterval(Timer, 100)
timer_setEnabled(Timer, true)

return RandomSeed