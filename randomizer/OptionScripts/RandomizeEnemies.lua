--Disable special characters not appearing when the appropriate character is in the party
writeBytes("gnazo.exe+54881",{0x90,0x90}) --Nitori
writeBytes("gnazo.exe+54965",{0x90,0x90}) --Aya
writeBytes("gnazo.exe+54524",{0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90}) --Reisen+Tewi 1
writeBytes("gnazo.exe+546A7",{0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90}) --Reisen+Tewi 2
writeBytes("gnazo.exe+C0760",{0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90}) --Cirno+Daiyousei
--Fix Nitori so that her Water attack properly curves to the right on all difficulties (it was checking total fire time for some reason)
writeBytes("gnazo.exe+1BEEB",{0x90,0x90,0x90,0x90,0x90})

--Percent chance modifier, Projectile speed multiplier, Enemy health multiplier
local DifficultyMultipliers={}
DifficultyMultipliers[0] = {0.25,0.85,0.7} --Easy
DifficultyMultipliers[1] = {0.5,1,1} --Normal
DifficultyMultipliers[2] = {0.75,1.17,1} --Hard
DifficultyMultipliers[3] = {1,1.34,1} --Lunatic
--Old Speeds: 2, 2.66, 3.33, 4

--Char Data Addresses
local CharDataOffset = 0x1F70 --Obsolete

local EnemiesThatShoot = {4,5,7,8,9,13,14,19,26,27,28,96,103,111,115,116,120,121,130,131,132,133,134,1120,1121,1122}
local EnemyCanShoot = {}
for i = 1,#EnemiesThatShoot,1 do
  EnemyCanShoot[EnemiesThatShoot[i]] = true
end

local EnemyIsFairy = {}
EnemyIsFairy[4] = true
EnemyIsFairy[5] = true
EnemyIsFairy[7] = true

local EnemyIsDoor = {}
EnemyIsDoor[134] = true
EnemyIsDoor[135] = true
EnemyIsDoor[136] = true
EnemyIsDoor[137] = true


local EnemyAddressStart = 0x93EA40
local EnemyAddressOffset = 0x1F70
local EnemyBulletTableStart = 0x1B40
local EnemySplitBulletTableStart = 0x1D0C
local EnemyBulletTableEnd = 0x1ED8
--local SplitTableOffset = 0x1CC
--local EnemyBulletTableEnd = (EnemyBulletTableStart+SplitTableOffset) - 1

--Address offset, Name for script, Address Type, Default value
EnemyAspectsList = {
{0x64,"Exists","Byte",1}, --Do these first
{0x1AE4,"BulletType","Integer",0},
{0x1F58,"SplitType","Byte",0},

{0x0,"PositionX","Float",0},
{0x4,"PositionY","Float",0},
{0x8,"SpriteX","Integer",0},
{0xC,"SpriteY","Integer",0},
{0x10,"CollisionX","Float",0},
{0x14,"CollisionY","Float",0},
{0x60,"Sprite","Integer",0},
{0x84,"Lifetime","Integer",0},
{0x88,"DodgeIntensity","Byte",0},
{0x8C,"IsGrounded","Byte",0},
{0x8D,"MeleeGuard","Byte",0},
{0x8E,"MovementPattern","Byte",1},
{0x90,"Health","Integer",100},
{0x98,"Weight","Float",0},
{0x9C,"StopTime","Float",60}, --These two used for flying characters
{0xA0,"MoveTime","Float",11},
{0xA4,"XSpeed","Float",0}, --Also Flying Chase Speed
{0xA8,"YSpeed","Float",0}, --Also Flying Turn Speed
{0xAC,"PatrolSpeed","Float",0},
{0xB0,"FloatSpeed","Float",0},

{0x1ADC,"Character","Integer",1},
{0x1AE8,"ContactDamage","Integer",0},
{0x1AEC,"Affinity1","Float",1}, --Melee
{0x1AF0,"Affinity2","Float",1}, --Magic
{0x1AF4,"Affinity3","Float",1}, --Fire
{0x1AF8,"Affinity4","Float",1}, --Water
{0x1AFC,"Affinity5","Float",1}, --Electricity
{0x1B00,"Affinity6","Float",1}, --Wind
{0x1B04,"Affinity7","Float",1}, --???
{0x1B08,"Affinity8","Float",1}, --???

{0x1B40,"BulletSpeed","Float",3}, --Each difficulty has an inherent bullet speed multiplier applied to this
{0x1B54,"BulletAimDirection","Float",180}, --Used for left/right aim types
{0x1B68,"BulletSpeedMod","Float",0}, --Speed change over lifetime
{0x1B90,"BulletWeight","Float",0},
{0x1BA4,"BulletTurnRate","Float",0},
{0x1BCC,"BulletLifetime","Integer",0},
{0x1BF4,"BulletInitialDelay","Integer",180}, --In the split bullet table, this is the split bullet type
{0x1C08,"BulletAimType","Byte",2},
{0x1C1C,"BulletSpreadCount","Integer",1},
{0x1C30,"BulletSpreadAngle","Float",120},
{0x1C44,"BulletAimSpinSpeed","Float",0}, --Constantly modifies AimDirection
{0x1CA8,"BulletTotalFireTime","Integer",60}, --The total time bullet firing will occur
{0x1C6C,"BulletShotCount","Float",1}, --Shots fired in a single shooting
{0x1C80,"BulletSpacing","Float",0.1}, --Spacing for 1X (speed mod) and 3X (distance)
{0x1CBC,"BulletRefireDelay","Integer",180}, --Starts TotalFireTime and RepeatRate every time this loops
{0x1CD0,"BulletFireTime","Integer",1}, --How long to fire each loop
{0x1CE4,"BulletRepeatRate","Integer",60}, --Starts FireTime every time this loops
{0x1CF8,"BulletFireRate","Integer",1}, --Rate of firing during FireTime

{0x1D0C,"SplitBulletSpeed","Float",4},
{0x1D20,"SplitBulletAimDirection","Float",180},
{0x1D34,"SplitBulletSpeedMod","Float",0},
{0x1D5C,"SplitBulletWeight","Float",0},
{0x1D70,"SplitBulletTurnRate","Float",0},
{0x1D98,"SplitBulletLifetime","Integer",0},
{0x1DC0,"SplitBulletType","Integer",11500},
{0x1DD4,"ShootTimer","Integer",0}, --DEBUG
{0x1DE8,"SplitBulletSpreadCount","Integer",1},
{0x1DFC,"SplitBulletSpreadAngle","Float",120},
{0x1E10,"SplitBulletAimSpinSpeed","Float",0},
{0x1E74,"SplitBulletTotalFireTime","Integer",1},
{0x1E38,"SplitBulletShotCount","Float",1},
{0x1E4C,"SplitBulletSpacing","Float",0.1},
{0x1E88,"SplitBulletRefireDelay","Integer",180}, --No idea what these timings do for split bullets
{0x1E9C,"SplitBulletFireTime","Integer",60},
{0x1EB0,"SplitBulletRepeatRate","Integer",60},
{0x1EC4,"SplitBulletFireRate","Integer",60}}

--{0x1DC0,"SplitBulletType","Integer",0}}


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
SpiritSprites[4] = {1288088,3.0,2.0} --Metal

local KedamaSprites = {} --Normal Sprite, Tiny Sprite, Health multiplier, Damage multiplier, All Elemental Affinities
KedamaSprites[1] = {1345568,397496,1.0,1.0,1} --White
KedamaSprites[2] = {1345584,397512,1.4,1.0,1} --Blue
KedamaSprites[3] = {1345600,397528,2.4,1.0,1} --Green
KedamaSprites[4] = {1345616,397544,1.5,1.0,1} --Pink
KedamaSprites[5] = {1345632,397560,3.0,1.6,1} --Purple
KedamaSprites[6] = {1345648,397576,1.5,1.0,1} --Yellow
KedamaSprites[7] = {1345664,397592,3.0,1.6,1} --Orange
KedamaSprites[8] = {1345680,397608,1.0,2.3,0} --Metal


local AimedShotType = {}
AimedShotType[2] = true
AimedShotType[4] = true
AimedShotType[12] = true
AimedShotType[14] = true
AimedShotType[22] = true
AimedShotType[24] = true
AimedShotType[32] = true
AimedShotType[34] = true

local NonJumpMoveType ={}
NonJumpMoveType[1] = true
NonJumpMoveType[4] = true
NonJumpMoveType[10] = true
NonJumpMoveType[11] = true
NonJumpMoveType[13] = true
NonJumpMoveType[14] = true
NonJumpMoveType[31] = true
NonJumpMoveType[32] = true
NonJumpMoveType[33] = true
NonJumpMoveType[34] = true
NonJumpMoveType[35] = true
NonJumpMoveType[36] = true
NonJumpMoveType[37] = true
NonJumpMoveType[38] = true
NonJumpMoveType[39] = true
NonJumpMoveType[40] = true
NonJumpMoveType[41] = true
NonJumpMoveType[42] = true

local ReactionMoveType = {}
ReactionMoveType[16] = true
ReactionMoveType[19] = true
ReactionMoveType[20] = true
ReactionMoveType[22] = true
ReactionMoveType[23] = true
ReactionMoveType[24] = true
ReactionMoveType[25] = true
ReactionMoveType[26] = true
ReactionMoveType[27] = true
ReactionMoveType[28] = true
ReactionMoveType[29] = true
ReactionMoveType[30] = true
ReactionMoveType[32] = true --Not really a reaction, but I didn't track flying move/stop times

--dofile(TrainerOrigin.."OptionScripts/_GetCharSpriteOffsets.lua")
--dofile(TrainerOrigin.."OptionScripts/_SpecialCharAspectCollection.lua")

--dofile(TrainerOrigin.."OptionScripts/_BulletStatCollector.lua")

--dofile(TrainerOrigin.."OptionScripts/_AttackSorting.lua") --TODO: Finish doing this!

local EnemyPatterns,SpecialChars,CharLookup = dofile(TrainerOrigin.."OptionScripts/EnemyAttackPatterns.lua")

if not (EnemyPatterns and SpecialChars and CharLookup) then
  return
end

local PlayerSprites = {}
for i = 1,25,1 do
  local CharData = SpecialChars["Player"][i]
  if CharData then
    local Index = CharData["PlayerChar"]
    PlayerSprites[Index] = CharData["Sprite"]
    local IDs = CharData["BulletIDs"]
    for a = 1,#IDs,1 do
      local Bullet = ShotTypeLookup[ IDs[a] ]
      if Bullet then
        table.insert(Bullet["PlayerChars"],CharData)
      end
    end
  else
    print("ERROR: Missing player character aspects required for Enemy Randomization")
    return
  end
end

local GetRelevantPatternTable =
  function(Aspects,PatternRank,BulletRank)
    --local Type = "Common"
    local Aim = "Unaimed"
    local Fly = "Grounded"
    local Move = "Standing"
    local React = "Non-Reaction"
    --if Special then
    --  Type = "Special"
    --end
    if AimedShotType[ Aspects["BulletAimType"] ] or AimedShotType[ Aspects["SplitType"] ] then
      Aim = "Aimed"
    elseif (Aspects["BulletAimSpinSpeed"] == 0) and (Aspects["BulletAimDirection"] == 180) then
      Aim = "Straight"
    end
    if Aspects["IsGrounded"] == 0 then
      Fly = "Flying"
    end
    if math.abs(Aspects["XSpeed"]) > 0 then
      Move = "Moving"
    elseif not NonJumpMoveType[ Aspects["MovementPattern"] ] then
      Move = "Jumping"
    end
    if ReactionMoveType[ Aspects["MovementPattern"] ] then
      React = "Reaction"
    end
    if not PatternRank then
      PatternRank = "Any"
    end
    if not BulletRank then
      BulletRank = "Any"
    end
    return EnemyPatterns[Aim][Fly][Move][React][PatternRank][BulletRank]
  end

GetEnemyAspects =
  function(Index,Difficulty,ReturnDeadEnemy)
    --print("Enemy",Index)
    local Exists = true
    local Aspects = {}
    Aspects["FiresBullet"] = false
    Aspects["BulletSplits"] = false
    Aspects["Difficulty"] = Difficulty --DEBUG
    Aspects["Index"] = Index
    local EnemyAddressBase = EnemyAddressStart + (EnemyAddressOffset * (Index-1))
    for i = 1,#EnemyAspectsList,1 do
      local AspectAddress = EnemyAddressBase+EnemyAspectsList[i][1]
      local Name = EnemyAspectsList[i][2]
      local Type = EnemyAspectsList[i][3]
      local IsBulletAspect = (EnemyAspectsList[i][1] >= EnemyBulletTableStart) and (EnemyAspectsList[i][1] < EnemySplitBulletTableStart)
      local IsSplitAspect = (EnemyAspectsList[i][1] >= EnemySplitBulletTableStart) and (EnemyAspectsList[i][1] < EnemyBulletTableEnd) and (not (Name == "ShootTimer"))
      
      if ((not IsBulletAspect) or Aspects["FiresBullet"]) and ((not IsSplitAspect) or Aspects["BulletSplits"]) then
        local AspectAddressString = string.format("gnazo.exe+%X",AspectAddress)
        if Type == "Float" then
          Aspects[Name] = readFloat(AspectAddressString)
        elseif Type == "Integer" then
          Aspects[Name] = readInteger(AspectAddressString)
        elseif Type == "Byte" then
          Aspects[Name] = readBytes(AspectAddressString,1)
        end
      else --For bullets, load in a default value if the enemy doesn't actually make use of them
        if EnemyAspectsList[i][4] then
          Aspects[Name] = EnemyAspectsList[i][4]
        else
          Aspects[Name] = 0
        end
      end
      
      --print("",Name,"=",Aspects[Name])
      if (Name == "Exists") and (Aspects[Name] == 0) and not ReturnDeadEnemy then --Don't even bother if the Enemy doesn't exist
        Exists = false
        break
      elseif (Name == "BulletType") and (Aspects[Name] > 0) then --Check if enemy fires
        Aspects["FiresBullet"] = true
      elseif (Name == "SplitType") and (Aspects[Name] > 0) then --Check if enemy bullets split
        Aspects["BulletSplits"] = true
      end
        
    end
    if Exists then
      return Aspects
    else
      return nil
    end
  end

local IsEven =
  function(Number)
    if Number/2 == math.floor(Number/2) then
      return true
    end
    return false
  end
  
ApplyEnemyAspects =
  function(Aspects,Index)
    if not Index then
      Index = Aspects["Index"]
    end
    local EnemyAddressBase = EnemyAddressStart + (EnemyAddressOffset * (Index-1))
    for i = 1,#EnemyAspectsList,1 do
      local AspectAddress = EnemyAddressBase+EnemyAspectsList[i][1]
      local Name = EnemyAspectsList[i][2]
      local Type = EnemyAspectsList[i][3]
      local AspectAddressString = string.format("gnazo.exe+%X",AspectAddress)
      if Type == "Float" then
        writeFloat(AspectAddressString,Aspects[Name])
      elseif Type == "Integer" then
        writeInteger(AspectAddressString,Aspects[Name])
      elseif Type == "Byte" then
        writeBytes(AspectAddressString,{Aspects[Name]})
      end
    end
  end

--Bullet Table Addresses
local EnemyBulletTypeAddress = 0x6B4180 --Integer
local EnemyBulletExistsAddress = 0x6B4134 --Byte
local EnemyBulletWillSplitAddress = 0x6B41A4 --Byte
local EnemyBulletOffset = 0x500

local MovementPatternsWithRefireTime = {1,17,18,31,33,34}
local MovementPatternUsesRefireTime = {}
for i = 1,#MovementPatternsWithRefireTime,1 do
  MovementPatternUsesRefireTime[MovementPatternsWithRefireTime[i]] = true
end

local MovementPatternsThatCannotFire = {6,10,13,20,35,36,37,39,40,41,43}
local MovementPatternCannotFire = {}
for i = 1,#MovementPatternsThatCannotFire,1 do
  MovementPatternCannotFire[MovementPatternsThatCannotFire[i]] = true
end

local SpawnedMystiaEX = false
local MystiaEXLevel = 1
local MystiaEXShooters = {}
local EnemyIsMystia = {}

local MystiaShooterAspects = {
  Exists = 1,
  SpriteX = 64,
  SpriteY = 64,
  CollisionX = -60,
  CollisionY = -60,
  MeleeGuard = 0,
  DodgeIntensity = 4,
  Weight = 0,
  XSpeed = 0,
  YSpeed = 0,
  PatrolSpeed = 0,
  FloatSpeed = 0,
  Character = 49,
  ContactDamage = 0,
  Affinity1 = 0,
  Affinity2 = 0,
  Affinity3 = 0,
  Affinity4 = 0,
  Affinity5 = 0,
  Affinity6 = 0,
  Affinity7 = 0,
  Affinity8 = 0,
  Health = 55555,
  Sprite = 1213352,
  BulletType = 314,
  BulletSpeed = 3,
  BulletSpeedMod = 0.0,
  BulletWeight = 0.0,
  BulletLifetime = 1000,
  BulletAimType = 1,
  BulletSpreadCount = 1,
  BulletTotalFireTime = 180,
  BulletFireTime = 1,
  BulletInitialDelay = 30,
  BulletRepeatRate = 180,
  BulletRefireDelay = 180,
  BulletFireRate = 1,
  SplitType = 0,
}

local DoorSpriteBaseOffset = nil
local DoorTypeSpriteIndexes = {}
DoorTypeSpriteIndexes[35000] = 0 --Wooden
DoorTypeSpriteIndexes[35100] = 32 --Red
DoorTypeSpriteIndexes[35200] = 64 --Black
DoorTypeSpriteIndexes[35300] = 96 --Golden
  
local DesiredBulletTypes = {}
local DesiredSprite = {}
local EnemyHandled = {}
local EnemiesHandled = false
local MystiaEXShooters = {}

local FindThisAttackPattern =
  function(Aspects,BulletRank)
    local Table
    if CharLookup[ Aspects["Character"] ] then
      Table = CharLookup[ Aspects["Character"] ]["AttackPatterns"]["Any"]
    else
      Table = GetRelevantPatternTable(Aspects,"Any",BulletRank)
    end
    --print("  checking",#Table,"entries")
    for i = 1,#Table,1 do
      local AllMatch = true
      local NewAspects = Table[i]
      for a = 1,#EnemyAspectsList,1 do
        local AspName = EnemyAspectsList[a][2]
        if NewAspects[AspName] and ((not (AspName == "BulletAimDirection")) or (not NewAspects["BulletTurnRate"])) then --Turn Rate screws with Aim Direction
          local Diff = math.abs(NewAspects[AspName] - Aspects[AspName])
          if Diff > 0.001 then --Thanks float values
            --print(" ",i,"failed against",AspName,"- Curr:",Aspects[AspName],"Patt:",NewAspects[AspName])
            AllMatch = false
            break
          end
        end
      end
      if AllMatch then
        return NewAspects
      end
    end
    return nil
  end

local ChooseClosestInTable =
  function(Table,OldValue,Mininum)
    local NewValue
    local Close = 100000
    for a = 1,#Table,1 do
      local Value = Table[a]
      if (not Mininum) or (Value >= Mininum) then
        local Dist = math.abs(Value-OldValue)
        if Dist < Close or (Dist == Close and math.random() < 0.5) then
          Close = Dist
          NewValue = Value
        end
      end
    end
    return NewValue
  end
  
local ChooseRandomInTable =
  function(Table)
    if #Table > 0 then
      if #Table > 1 then
        local Index = math.random(1,#Table)
        return Table[Index],Index
      else
        return Table[1],1
      end
    else
      return nil,0
    end
  end

local ChooseBullets =
  function(BulletRank,Aspects,Pattern)
    DebugPrint("Choosing bullet with rank",BulletRank)
    if BulletRank == 5 then
      Aspects["SplitType"] = 0
      Aspects["BulletSplits"] = false
    end
    local Splits = Aspects["SplitType"] > 0
    local RepeatCount = 1
    local Type = "Straight"
    if not (Aspects["BulletWeight"] == 0) then
      Type = "Weighted"
    end
    if Splits and Pattern then
      if Pattern["SplitBulletShouldMatch"] then
        if (Type == "Straight" and (not (Aspects["SplitBulletWeight"] == 0)))
        or (Type == "Weighted" and (Aspects["SplitBulletWeight"] == 0)) then
          Type = "Both"
        end
      else
        RepeatCount = 2
      end
    end
    
    local UsesRefireDelay = MovementPatternUsesRefireTime[ Aspects["MovementPattern"] ]
    --print(" pattern",Aspects["MovementPattern"])

    local ChosenBullet
    local Prefix = ""
    for x = 1,RepeatCount,1 do
      for i = 1,30,1 do
        local Index = math.random(1,#EnemyUsableShotTypes[BulletRank][Type])
        local NewBullet = EnemyUsableShotTypes[BulletRank][Type][Index]
        if (not NewBullet["MustUseRefireTime"]) or UsesRefireDelay then
          if ((not NewBullet["MinShots"]) or (Pattern and Pattern["TotalBullets"] >= NewBullet["MinShots"]))
          and ((not NewBullet["MaxShots"]) or (Pattern and Pattern["TotalBullets"] <= NewBullet["MaxShots"]))then
            if Pattern or not NewBullet["MinSpeed"] then
              --print(" for bullet",x,"chose",NewBullet["ID"])
              if Pattern then
                local NewSpeed = ChooseClosestInTable(Pattern["Valid"..Prefix.."Speeds"],Aspects[Prefix.."BulletSpeed"],NewBullet["MinSpeed"])
                if NewSpeed then
                  if Pattern["Consistent"..Prefix.."Speed"] then
                    NewSpeed = NewSpeed / DifficultyMultipliers[CurrentDifficulty][2]
                  end
                  --Set speed
                  Aspects[Prefix.."BulletSpeed"] = NewSpeed
                  --print(" and speed",NewSpeed)
                end
              end
              --Set bullet
              Aspects[Prefix.."BulletType"] = NewBullet["ID"]*100 + (math.random(1,NewBullet["Skins"])-1)
              if NewBullet["ForceMinLifetime"] then
                Aspects["BulletLifetime"] = math.max(Aspects["BulletLifetime"],NewBullet["ForceMinLifetime"])
              end
              if NewBullet["MinTurnRate"] then
                if Aspects["BulletTurnRate"] == 0 then
                  if math.random() < 0.5 then
                    Aspects["BulletTurnRate"] = NewBullet["MinTurnRate"]
                  else
                    Aspects["BulletTurnRate"] = NewBullet["MinTurnRate"] * -1
                  end
                else
                  if Aspects["BulletTurnRate"] > 0 then
                    Aspects["BulletTurnRate"] = math.max(Aspects["BulletTurnRate"],NewBullet["MinTurnRate"])
                  else
                    Aspects["BulletTurnRate"] = math.min(Aspects["BulletTurnRate"],NewBullet["MinTurnRate"]*-1)
                  end
                end
              end
              ChosenBullet = NewBullet
              break
            end
          end
        end
      end
      
      if x == 1 then
        if RepeatCount == 2 then
          Prefix = "Split"
        elseif Splits and ChosenBullet then
          Aspects["SplitBulletType"] = ChosenBullet["ID"]*100 + (math.random(1,ChosenBullet["Skins"])-1)
          if Pattern then
            local NewSpeed = ChooseClosestInTable(Pattern["ValidSplitSpeeds"],Aspects["SplitBulletSpeed"],ChosenBullet["MinSpeed"])
            if NewSpeed then
              if Pattern["ConsistentSplitSpeed"] then
                NewSpeed = NewSpeed / DifficultyMultipliers[CurrentDifficulty][2]
              end
              Aspects["SplitBulletSpeed"] = NewSpeed
              --print(" split bullet speed",NewSpeed)
            end
          end
        end
      end
    end
  end
  
local PatternSupportsBulletRank = 
  function(Pattern,BulletRank)
    for i = 1,#Pattern["ValidBulletRanks"],1 do
      if Pattern["ValidBulletRanks"][i] == BulletRank then
        return true
      end
    end
    return false
  end
  
local GetDistanceBetweenAspects =
  function(Aspects1,Aspects2)
    local Coords1 = {Aspects1["PositionX"],Aspects1["PositionY"]}
    local Coords2 = {Aspects2["PositionX"],Aspects2["PositionY"]}
    return GetDistanceBetweenCoords(Coords1,Coords2)
  end
  
local AddAspects =
  function(Aspects,NewAspects,IgnoreHealth)
    for i = 1,#EnemyAspectsList,1 do
      local Asp = EnemyAspectsList[i][2]
      if (not (Asp == "Health")) or (not IgnoreHealth) then
        if NewAspects[Asp] then
          local NewAsp = NewAspects[Asp]
          if type(NewAsp) == "table" then
            Aspects[Asp] = ChooseClosestInTable(NewAsp,Aspects[Asp])
          else
            if Asp == "Health" then
              Aspects["Health"] = math.max(Aspects["Health"],NewAsp*DifficultyMultipliers[CurrentDifficulty][3])
            elseif Asp == "Sprite" then
              Aspects[Asp] = NewAsp + CharacterSpriteOffset
            else
              Aspects[Asp] = NewAsp
            end
          end
        end
      end
    end
  end
  
--local RandomizeCharacterShot = --???
--  function(Index,Aspects,Promoted,FairyType)
--    
--  end

local AddFunc =
  function()
  
    if not ChangingRooms then
    
      if (CharacterSpriteOffset == nil) and (not (CurrentRoom == 0)) and (not (RoomLoadedIndex == 0)) then
        local CurrentCharacter = readBytes("gnazo.exe+B8E0F4",1)
        local Sprite = readInteger("gnazo.exe+928C50") --Player 1 Sprite
        if (not (Sprite == 0)) and (not (PlayerSprites[CurrentCharacter] == nil)) then
          Sprite = Sprite - PlayerSprites[CurrentCharacter]
          if Sprite > 0 then
            CharacterSpriteOffset = Sprite + 0
          end
        end
      end
      
      if not (CharacterSpriteOffset == nil) then
        if not EnemiesHandled then
          local MystiaInRoom = false
          local FairyCount = 0
          if DestinationRoom == 550 then --Special handler for Stage 55, distributing the 7 knives between the two fairies
            ResetRNG(RandomSeed)
            local KnifeCounts = {math.random(1,6)}
            KnifeCounts[2] = 7 - KnifeCounts[1]
            local FirstToShoot = math.random(1,2)
            for i = 1,2,1 do
              local Aspects = GetEnemyAspects(i,CurrentDifficulty)
              if Aspects then
                local DesireSprite = 0
                if math.random() >= 0.5 then --Strong Fairy
                  DesireSprite = math.random(11,13)
                else --Strong Maid Fairy
                  DesireSprite = math.random(14,17)
                  Aspects["Character"] = 5
                end
                Aspects["Sprite"] = CharacterSpriteOffset + FairySprites[DesireSprite][1]
                Aspects["BulletType"] = 23500 + math.random(0,3)
                Aspects["FloatSpeed"] = (math.random()*0.4) + 0.3
                Aspects["BulletSpreadCount"] = KnifeCounts[i]
                Aspects["BulletSpreadAngle"] = math.random(30,40) * (KnifeCounts[i] - 1)
                if FirstToShoot == i then
                  Aspects["BulletInitialDelay"] = 30
                else
                  Aspects["BulletInitialDelay"] = 120
                end
                ApplyEnemyAspects(Aspects,i)
              end
            end
            FairyCount = 2
          elseif not IsBossRoom[DestinationRoom] then
            DebugPrint("Randomizing enemies...")
            local MetalChangeChance = ((1-DifficultyMultipliers[CurrentDifficulty][1])*0.20)+0.05
            local SpecialCharsInRoom = 0
            
            local CharInRoom = {}
            local RoomFairies = {}
            local RoomSpecialChars = {}
            for i = 1,30,1 do --Generally no more than 30 enemies per room (high estimate)
              local Aspects = GetEnemyAspects(i,CurrentDifficulty)
              if Aspects then --If no aspects returned, enemy does not exist
                --AddNewAttack(Aspects,CurrentDifficulty) --DEBUG
                local Char = Aspects["Character"]
                ResetRNG( RandomSeed+(DestinationRoom*97)+(i*3) )
                local Randomize = math.random() < DifficultyMultipliers[CurrentDifficulty][1]
                if RandoSetting["MaxEnemyRando"] then --Even when this is on, the RNG roll is done anyways for consistency
                  Randomize = true
                end
                if EnemyCanShoot[Char] then
                  local Shoots = Aspects["BulletType"] > 0
                  if EnemyIsFairy[Char] then
                    table.insert(RoomFairies,Aspects)
                  elseif EnemyIsDoor[Char] then --Doors will have level 2 unaimed attacks
                  
                    --Pick a new door color
                    local NewDoorType = math.random(0,3)
                    if NewDoorType > 0 then
                      Aspects["Character"] = Aspects["Character"] + NewDoorType
                      Aspects["Sprite"] = Aspects["Sprite"] + (32*NewDoorType)
                    end
                    
                    --Pick a new firing pattern and bullet
                    if Randomize and math.random() < 0.5 then
                      local Possible = EnemyPatterns["Unaimed"]["Flying"]["Standing"]["Non-Reaction"][2]["Any"]
                      if #Possible > 0 then
                        local Pattern = Possible[ math.random(1,#Possible) ]
                        AddAspects(Aspects,Pattern)
                        ChooseBullets(2,Aspects,Pattern)
                      end
                    else
                      ChooseBullets(2,Aspects)
                    end
                    
                    ApplyEnemyAspects(Aspects,i)
                    
                  elseif Char == 28 then --Flying spinning thing
                    
                    --Just randomize the bullet, idk
                    local BulletID = math.floor(Aspects["BulletType"]/100)
                    local BulletRank = ShotTypeLookup[BulletID]["Rank"]
                    ChooseBullets(BulletRank,Aspects)
                    ApplyEnemyAspects(Aspects,i)
                    
                  else
                    if DestinationRoom == 201 and (Char == 103 or Char == 111) then --Set the Dai and Cirno in Stage 20 to be any character
                    
                      local CharAspects
                      local NewChar
                      while true do
                        if math.random() < 0.5 then
                          local CharIndex = math.random(1,#SpecialChars["All"])
                          CharAspects = SpecialChars["All"][CharIndex]
                        else
                          local CharIndex = math.random(1,#SpecialChars["Player"])
                          CharAspects = SpecialChars["Player"][CharIndex]
                        end
                        NewChar = CharAspects["Character"]
                        if not CharInRoom[NewChar] then
                          CharInRoom[NewChar] = true
                          break
                        end
                      end
                      
                      AddAspects(Aspects,CharAspects,true)
                      if NewChar == 19 or NewChar == 26 then --Chen and Ran have hardcoding that makes them fly; Set them to be considered fairies
                        Aspects["Character"] = 4
                      end
                      ApplyEnemyAspects(Aspects,i)
                      
                    else --Special Characters will be shuffled
                      table.insert(RoomSpecialChars,Aspects)
                    end
                  end
                
                elseif (Char == 1) or (Char == 2) then --Kedama (Normal and Tiny)
                  local CurrentType = 0
                  local Size = 1 -- 1 = normal, 2 = small
                  if (Char == 1) then
                    for s = 1,8,1 do
                      if CharacterSpriteOffset+KedamaSprites[s][1] == Aspects["Sprite"] then
                        CurrentType = s
                        break
                      end
                    end
                  else
                    CurrentType = 1
                    Size = 2
                  end
                  
                  --Metal Kedamas have a chance of randomizing regardless of randomization chance
                  if (CurrentType > 0) and (Randomize or CurrentType == 8) and (CurrentType < 8 or (math.random() < MetalChangeChance)) then
                    local MaxType = 7 --Smaller percent chance of choosing a metal kedama, and must also be moving
                    if (math.abs(Aspects["XSpeed"]) > 0) and (math.random() < 0.25) then
                      MaxType = 8
                    end
                    local NewType = math.random(1,MaxType)
                    if not (NewType == CurrentType) then
                      Aspects["Sprite"] = CharacterSpriteOffset+KedamaSprites[NewType][Size]
                      Aspects["Health"] = math.ceil( (Aspects["Health"] / KedamaSprites[CurrentType][3]) * KedamaSprites[NewType][3] )
                      Aspects["ContactDamage"] = math.ceil( (Aspects["ContactDamage"] / KedamaSprites[CurrentType][4]) * KedamaSprites[NewType][4] )
                      if NewType == 7 then
                        Aspects["MeleeGuard"] = 63
                      end
                      for a = 1,8,1 do
                        Aspects["Affinity"..a] = KedamaSprites[NewType][5]
                      end
                      ApplyEnemyAspects(Aspects,i)
                    end
                  end
                  
                elseif Char == 23 then --Spirit
                  if Randomize then
                    local NewType = math.random(1,4)
                    if NewType > 1 then
                      Aspects["Sprite"] = CharacterSpriteOffset + SpiritSprites[NewType][1]
                      Aspects["Health"] = Aspects["Health"] * SpiritSprites[NewType][2]
                      Aspects["ContactDamage"] = Aspects["ContactDamage"] * SpiritSprites[NewType][3]
                      if NewType == 2 then --Purple Spirit (Fast)
                        Aspects["PatrolSpeed"] = 7
                        Aspects["FloatSpeed"] = 2.4
                      elseif NewType == 3 then --Red Spirit (Homing)
                        Aspects["MovementPattern"] = 34 --Stalk Player
                        Aspects["XSpeed"] = 1.7 --Chase Speed
                        Aspects["YSpeed"] = 2 --Turn Speed
                        Aspects["PatrolSpeed"] = 0
                        Aspects["FloatSpeed"] = 0
                      elseif NewType == 4 then --Metal Spirit (Invulnerable)
                        for a = 1,8,1 do
                          Aspects["Affinity"..a] = 0
                        end
                      end
                      ApplyEnemyAspects(Aspects,i)
                    end
                  end
                  
                end
              end
            end
            
            ResetRNG( RandomSeed+(DestinationRoom*97) )
            local PromotedEnemy = 0
            if #RoomFairies > 0 and (math.random() < (DifficultyMultipliers[CurrentDifficulty][1] * 0.8)) then
              PromotedEnemy = 1
              if #RoomFairies > 1 then
                PromotedEnemy = math.random(1,#RoomFairies)
              end
            end
            
            ResetRNG( RandomSeed+(DestinationRoom*97) )
            local NewSpecialChars = {}
            DebugPrint(#RoomSpecialChars,"special characters")
            for x = 1,10,1 do
              local AllValid = true
              for i = 1,#RoomSpecialChars,1 do
                local Char = RoomSpecialChars[i]["Character"]
                --print("Spec Char",Char)
                if CharInRoom[Char] or math.random() <= DifficultyMultipliers[CurrentDifficulty][1] or RandoSetting["MaxEnemyRando"] then
                  local Aspects = RoomSpecialChars[i]
                  
                  local Type = "Moving"
                  if Aspects["Weight"] == 0 then
                    Type = "Flying"
                  elseif math.abs(Aspects["XSpeed"]) == 0 or Char == 19 or Char == 26 then
                    Type = "Standing"
                  end
                  
                  local PatternRank
                  if Aspects["BulletType"] > 0 then 
                    local ThisPattern = FindThisAttackPattern(Aspects,BulletRank)
                    if ThisPattern then
                      PatternRank = ThisPattern["Rank"]
                    end
                  elseif Char == 19 or Char == 26 then --Non-shooting Chen/Ran
                    PatternRank = 1
                  else--Non-shooting character
                    PatternRank = "Any"
                  end
                  if PatternRank then
                    local MatchingChars = SpecialChars[Type][PatternRank]
                    if #MatchingChars > 1 then
                      local ValidChars = {}
                      local LowerHP = Aspects["Health"] + (400 * DifficultyMultipliers[CurrentDifficulty][1])
                      --local UpperHP = Aspects["Health"] - (400 * (1.25 - DifficultyMultipliers[CurrentDifficulty][1]))
                      for i = 1,#MatchingChars,1 do
                        local CharAspects = MatchingChars[i]
                        if (not CharInRoom[ CharAspects["Character"] ]) and (LowerHP >= CharAspects["Health"][1]) then
                          table.insert(ValidChars,CharAspects)
                        end
                      end
                      if #ValidChars > 1 then
                        local Index = math.random(1,#ValidChars)
                        NewSpecialChars[i] = {ValidChars[Index],Type,PatternRank}
                      elseif #ValidChars == 1 then
                        NewSpecialChars[i] = {ValidChars[1],Type,PatternRank}
                      else
                        AllValid = false
                        break
                      end
                    elseif #MatchingChars == 1 then
                      NewSpecialChars[i] = {MatchingChars[1],Type,PatternRank}
                    end
                    if NewSpecialChars[i] then
                      CharInRoom[ NewSpecialChars[i][1]["Character"] ] = true
                      --print(" new char in room",NewSpecialChars[i][1]["Character"])
                    end
                  else
                    DebugPrint("Could not find pattern rank for char",Char,"in slot",Aspects["Index"])
                  end
                end
                if not NewSpecialChars[i] then --Character not randomized
                  if not CharInRoom[Char] then
                    CharInRoom[Char] = true
                  else
                    AllValid = false
                    break
                  end
                end
              end
              if AllValid then
                break
              else
                NewSpecialChars = {}
                CharInRoom = {}
              end
            end
            
            for i = 1,#RoomSpecialChars,1 do
              if NewSpecialChars[i] then
                local Aspects = RoomSpecialChars[i]
                local NewAspects = {NewSpecialChars[i][1]}
                local MoveType = NewSpecialChars[i][2]
                local PatternRank = NewSpecialChars[i][3]
                
                local ChoseMethod = 1
                local MoveMethods = NewAspects[1]["MovementMethods"][MoveType]
                local AttackPatterns = {}
                if not (PatternRank == "Any") then
                  AttackPatterns = NewAspects[1]["AttackPatterns"][PatternRank]
                end
                if #MoveMethods > 0 then
                  local BulletTypes = NewAspects[1]["BulletIDs"]
                  local Method = 0
                  NewAspects[2],Method = ChooseRandomInTable(MoveMethods)
                  local Pattern = 0
                  if (#AttackPatterns > 0) and (#BulletTypes > 0) then
                    NewAspects[3],Pattern = ChooseRandomInTable(AttackPatterns)
                  end
                  DebugPrint("Chose new Char",NewAspects[1]["Character"],"of type",MoveType,"(method "..ChoseMethod..") with pattern",Pattern,"in slot",Aspects["Index"])
                  for a = 1,#EnemyAspectsList,1 do
                    local AspName = EnemyAspectsList[a][2]
                    for b = 1,#NewAspects,1 do
                      if NewAspects[b][AspName] then
                        local NewAsp = NewAspects[b][AspName]
                        if type(NewAsp) == "table" then
                          Aspects[AspName] = ChooseClosestInTable(NewAsp,Aspects[AspName])
                        else
                          Aspects[AspName] = NewAsp
                          if AspName == "Sprite" then
                            Aspects[AspName] = Aspects[AspName] + CharacterSpriteOffset
                          end
                        end
                      end
                    end
                  end
                  
                  Aspects["BulletType"] = 0
                  if NewAspects[3] then --Has shooting pattern
                    Aspects["BulletRefireDelay"] = ChooseClosestInTable(NewAspects[3]["ValidRefireTimes"],Aspects["BulletRefireDelay"])
                    
                    local Prefix = ""
                    for x = 1,2,1 do
                      local CurrSpeed = Aspects[Prefix.."BulletSpeed"]
                      if NewAspects[3]["Consistent"..Prefix.."Speed"] then
                        CurrSpeed = CurrSpeed * DifficultyMultipliers[CurrentDifficulty][2]
                      end
                      Aspects[Prefix.."BulletSpeed"] = ChooseClosestInTable(NewAspects[3]["Valid"..Prefix.."Speeds"],CurrSpeed)
                      if NewAspects[3]["Consistent"..Prefix.."Speed"] then
                        Aspects[Prefix.."BulletSpeed"] = Aspects[Prefix.."BulletSpeed"] / DifficultyMultipliers[CurrentDifficulty][2]
                      end
                      if (x == 1) and (NewAspects[3]["SplitType"] > 0) then
                        Prefix = "Split"
                      else
                        break
                      end
                    end
                    local ChosenID = nil
                    local BulletTypes = NewAspects[1]["BulletIDs"]
                    if #BulletTypes == 1 then
                      ChosenID = BulletTypes[1]
                    elseif #BulletTypes > 1 then
                      local ValidIDs = {}
                      local ValidRanks = NewAspects[3]["ValidBulletRanks"]
                      for b = 1,#BulletTypes,1 do
                        local ID = BulletTypes[b]
                        local Bullet = ShotTypeLookup[ID]
                        if Bullet then
                          local Rank = Bullet["Rank"]
              --print("trying bullet",ID,"of rank",Rank)
                          local Valid = false
                          for r = 1,#ValidRanks,1 do
                --print("against rank",ValidRanks[r])
                            if Rank == ValidRanks[r] then
                              Valid = true
                --print("valid")
                              break
                            end
                          end
                          if Valid then
                            table.insert(ValidIDs,ID)
                          end
                        end
                      end
                      ChosenID = ChooseRandomInTable(ValidIDs)
            --print("Chose bullet id",ChosenID)
                    end
                    if ChosenID then
                      local NewBullet = ShotTypeLookup[ChosenID]
                      if NewBullet then
                        Aspects["BulletType"] = ChosenID*100 + (math.random(1,NewBullet["Skins"])-1)
                        Aspects["SplitBulletType"] = Aspects["BulletType"]
                      end
                    end
                  end
                  
                  ApplyEnemyAspects(Aspects)
                end
              end
            end
            
            DebugPrint(#RoomFairies,"fairies")
            --RoomFairies = {} --DEBUG
            for i = 1,#RoomFairies,1 do
              local Aspects = RoomFairies[i]
              local Index = Aspects["Index"]
              local Promoted = i == PromotedEnemy
              ResetRNG( RandomSeed+(DestinationRoom*97)+(Index*3) )
              DebugPrint("Enemy",Index)
              
              --Get fairy type here
              
              if Aspects["BulletType"] == 0 and Aspects["Health"] < 1000 then --Each enemy without a shot attack checks how many other enemies with shots are in range
                local PercChance = DifficultyMultipliers[CurrentDifficulty][1]
                if RandoSetting["MaxEnemyRando"] then
                  PercChance = 1
                end
                for i2 = 1,#RoomFairies,1 do
                  if not (i == i2) then
                    local Aspects2 = RoomFairies[i2]
                    if Aspects2["BulletType"] > 0 then
                      local Dist = GetDistanceBetweenAspects(Aspects,Aspects2)
                      if Dist <= 256 then
                        PercChance = PercChance - 0.25
                      elseif Dist <= 512 then
                        PercChance = PercChance - 0.125
                      end
                    end
                  end
                end
                if (PercChance > 0) and (math.random() <= PercChance) then
                  Aspects["BulletType"] = 11500 + math.random(0,3)
                end
              end
              
              if Aspects["BulletType"] > 0 then --TODO: Handle lasers differently
                --RandomizeCharacterShot(Index,Aspects,Promoted) --Was I gonna do something with this???
                local RandomizeBullet = false
                local RandomizePattern = false
                if Promoted or CurrentDifficulty == 3 then
                  RandomizeBullet = true
                  RandomizePattern = true
                else
                  RandomizeBullet = math.random() <= (DifficultyMultipliers[CurrentDifficulty][1]+0.25)
                  RandomizePattern = math.random() <= DifficultyMultipliers[CurrentDifficulty][1]
                  if RandoSetting["MaxEnemyRando"] then
                    RandomizeBullet = true
                    RandomizePattern = true
                  end
                end
                
                local SpriteReplaced = false
                if RandomizeBullet or RandomizePattern then
                  local PatternRankMod = 0
                  local BulletRankMod = 0
                  if math.random() < 0.2 then -- 20% Chance for an attack to mutate up or down
                    if (not RandomizeBullet) or (RandomizePattern and math.random() < 0.5) then --Pattern Rank
                      if math.random() <= DifficultyMultipliers[CurrentDifficulty][1] then
                        PatternRankMod = 1
                      else
                        PatternRankMod = -1
                      end
                    else --Bullet Rank
                      if math.random() <= DifficultyMultipliers[CurrentDifficulty][1] then
                        BulletRankMod = 1
                      else
                        BulletRankMod = -1
                      end
                    end
                  end
                  if Promoted then --A Promoted enemy will attempt to raise 2 ranks randomly
                    for r = 1,2,1 do
                      if math.random() < 0.5 then
                        PatternRankMod = PatternRankMod + 1
                      else
                        BulletRankMod = BulletRankMod + 1
                      end
                    end
                  end
                  
                  local ChangeCount = 0
                  
                  local BulletID = math.floor(Aspects["BulletType"]/100)
                  local BulletRank = ShotTypeLookup[BulletID]["Rank"]
                  local NewBulletRank = math.max(1,math.min(5,BulletRank+BulletRankMod))
                  local ThisPattern = FindThisAttackPattern(Aspects,BulletRank)
                  
                  if ThisPattern then --Script needs to be able to confirm what pattern is being worked with for the sake of ranking
                    local PatternRank = ThisPattern["Rank"]
                    local NewPatternRank = math.max(1,math.min(5,PatternRank+PatternRankMod))
                    if NewPatternRank == 5 or NewBulletRank == 5 then
                      --NewPatternRank = 5
                      NewBulletRank = 5
                      RandomizeBullet = true
                      RandomizePattern = true
                    end
                    DebugPrint(" current pattern is",ThisPattern["Index"],"with Rank",PatternRank)
                    if RandomizePattern then
                      local Table = GetRelevantPatternTable(Aspects,NewPatternRank,NewBulletRank)
                      if #Table == 0 then
                        Table = GetRelevantPatternTable(Aspects,PatternRank,BulletRank)
                        NewBulletRank = BulletRank
                      end
                      if #Table >= 1 then
                        local PatternIndex = math.random(1,#Table)
                        ThisPattern = Table[PatternIndex]
                        DebugPrint(" chose new pattern",ThisPattern["Index"])
                        if ThisPattern["SplitType"] and Aspects["SplitType"] == 0 and ThisPattern["SplitType"] > 0 then
                          Aspects["SplitBulletType"] = Aspects["BulletType"]
                        end
                        for a = 1,#EnemyAspectsList,1 do
                          local AspName = EnemyAspectsList[a][2]
                          if ThisPattern[AspName] then
                            --ChangeCount = ChangeCount + 1
                            Aspects[AspName] = ThisPattern[AspName]
                          end
                        end
                        local NewRefireTime = ChooseClosestInTable(ThisPattern["ValidRefireTimes"],Aspects["BulletRefireDelay"])
                        if NewRefireTime then
                          Aspects["BulletRefireDelay"] = NewRefireTime
                        end
                      end
                      if RandomizeBullet then
                        ChooseBullets(NewBulletRank,Aspects,ThisPattern)
                      end
                    else
                      if PatternSupportsBulletRank(ThisPattern,NewBulletRank) then
                        ChooseBullets(NewBulletRank,Aspects,ThisPattern)
                      else
                        ChooseBullets(BulletRank,Aspects,ThisPattern)
                      end
                    end
                  elseif RandomizeBullet then --Can't confirm if current pattern would support a bigger/smaller bullet, so use the old rank
                    ChooseBullets(BulletRank,Aspects)
                  end
                  
                  local NewBulletID = math.floor(Aspects["BulletType"]/100)
                  local NewSplitBulletID = math.floor(Aspects["SplitBulletType"]/100)
                  --Choose new fairy sprite
                  if Promoted then
                    --Check if the bullets used by the character line up for any player character
                    if ((not Aspects["BulletSplits"]) or (NewBulletID == NewSplitBulletID)) and (Aspects["IsGrounded"] == 1) then
                      local Bullet = ShotTypeLookup[NewBulletID]
                      if Bullet and (#Bullet["PlayerChars"] > 0) then
                        local CharIndex = math.random(1,#Bullet["PlayerChars"])
                        local CharAspects = Bullet["PlayerChars"][CharIndex]
                        if not CharInRoom[ CharAspects["Character"] ] then
                          DebugPrint("Promoted Fairy upgraded to character",CharAspects["Character"])
                          SpriteReplaced = true
                          CharInRoom[ CharAspects["Character"] ] = true
                          AddAspects(Aspects,CharAspects)
                        end
                      end
                    end
                  end
                  if not SpriteReplaced then
                    local CurrentSpriteIndex = 0
                    for s = 1,17,1 do
                      if CharacterSpriteOffset+FairySprites[s][1] == Aspects["Sprite"] then
                        CurrentSpriteIndex = s
                        break
                      end
                    end
                    if CurrentSpriteIndex > 0 then
                      local NewSpriteIndex
                      if Promoted or CurrentSpriteIndex >= 10 then
                        NewSpriteIndex = math.random(10,17)
                        if (Aspects["IsGrounded"] == 1) and (not (FairySprites[NewSpriteIndex][3] == 5)) then
                          Aspects["MeleeGuard"] = 63
                        else --Maids don't have animation frames for blocking
                          Aspects["MeleeGuard"] = 0
                        end
                      elseif Aspects["IsGrounded"] == 1 then
                        NewSpriteIndex = math.random(1,9)
                      else
                        NewSpriteIndex = math.random(1,8)
                      end
                      if not (NewSpriteIndex == CurrentSpriteIndex) then
                        local NewChar = FairySprites[NewSpriteIndex][3]
                        Aspects["Character"] = NewChar
                        Aspects["Sprite"] = CharacterSpriteOffset+FairySprites[NewSpriteIndex][1]
                        if NewChar == 7 then --The Shanghai Doll sprite takes up more space
                          Aspects["SpriteX"] = 128
                          Aspects["SpriteY"] = 128
                        else
                          Aspects["SpriteX"] = 64
                          Aspects["SpriteY"] = 64
                        end
                        local LowHP = math.min(200,Aspects["Health"])
                        local HighHP = math.max(600,Aspects["Health"])
                        local NewHP = (Aspects["Health"] / FairySprites[CurrentSpriteIndex][2]) * FairySprites[NewSpriteIndex][2]
                        Aspects["Health"] = math.max(LowHP,math.min(NewHP,HighHP))
                      end
                    end
                  end
                  
                  --print("Applied",ChangeCount,"aspects to enemy",Index,"from attack",NewAspects["Index"])
                  ApplyEnemyAspects(Aspects,Index)
                else
                  DebugPrint(" decided on no changes")
                end
                
              end
              
            end
            MystiaInRoom = CharInRoom[14]
            FairyCount = #RoomFairies
          end
          
          --Mystia EX Attack
          MystiaEXShooters = {}
          if DestinationRoom > 10 then
            local PercChance = 0.05
            local Intensity = 1
            if IsBossRoom[DestinationRoom] then
              PercChance = 0.10
            else
              if FairyCount <= 0 then
                Intensity = math.min(3,CurrentDifficulty+1)
              end
              if MystiaInRoom then
                PercChance = 0.10
              end
            end
            ResetRNG( RandomSeed+(DestinationRoom*97) )
            if math.random() < PercChance then
              local Count = 1
              if Intensity > 1 then
                Count = math.random(1,Intensity)
              end
              for i = 1,Count,1 do
                MystiaEXShooters[i] = {0,30+i}
              end
            end
          end
          
          EnemiesHandled = true
        end
        
        if #MystiaEXShooters > 0 then
          local CameraXCoord = readFloat("gnazo.exe+91C3FC")
          local PlayerYCoord = readFloat("gnazo.exe+928BF4")
          local RoomEntranceXCoord = readFloat("gnazo.exe+7F7E50")
          local RoomLength = readFloat("gnazo.exe+93C8D4")
          for i = 1,#MystiaEXShooters,1 do
            local EnemyIndex = MystiaEXShooters[i][2]
            local Aspects = GetEnemyAspects(EnemyIndex,CurrentDifficulty)
            local Changed = false
            local ResetPosition = false
            local ResetLifeTimer = true
            if not Aspects then
              Aspects = GetEnemyAspects(EnemyIndex,CurrentDifficulty,true)
              AddAspects(Aspects,MystiaShooterAspects)
              Changed = true
              ResetPosition = true
              DebugPrint("Created Mystia shooter",i)
            else
              if (Aspects["PositionX"] < CameraXCoord) or (Aspects["PositionX"] > (CameraXCoord + 640)) then
                ResetPosition = true
                ResetLifeTimer = false
                --DebugPrint("Shooter",i,"scrolled off; Repositioning")
              elseif Aspects["ShootTimer"] >= Aspects["BulletRefireDelay"] - 10 then
                ResetPosition = true
                --DebugPrint("Shooter",i,"expired; Recreating")
              end
            end
            if ResetPosition then
              if ResetLifeTimer then
                MystiaEXShooters[i][1] = MystiaEXShooters[i][1] + 1
              end
              ResetRNG( (RandomSeed+DestinationRoom)*(EnemyIndex*MystiaEXShooters[i][1])+math.floor(CameraXCoord) )
              local AimDirectionOffset = math.random(-20,20)
              
              --Set Y Coord
              if PlayerYCoord < 40 then --Player is entering from top of screen
                Aspects["PositionY"] = 480
                Aspects["BulletAimDirection"] = 270 + AimDirectionOffset
              elseif PlayerYCoord > 440 then --Player is entering from bottom of screen
                Aspects["PositionY"] = 0
                Aspects["BulletAimDirection"] = 90 + AimDirectionOffset
              else
                if math.random() < 0.5 then
                  Aspects["PositionY"] = 480
                  Aspects["BulletAimDirection"] = 270 + AimDirectionOffset
                else
                  Aspects["PositionY"] = 0
                  Aspects["BulletAimDirection"] = 90 + AimDirectionOffset
                end
              end
              
              --Set X Coord
              if RoomLength <= 640 or math.random() < 0.5 then --Small Room
                Aspects["PositionX"] = math.random(math.floor(CameraXCoord)+80,math.ceil(CameraXCoord)+560)
              elseif (RoomEntranceXCoord - 640) < (RoomLength * 0.333) then --Entered from Left side
                Aspects["PositionX"] = math.random(math.floor(CameraXCoord)+460,math.ceil(CameraXCoord)+600)
              elseif (RoomEntranceXCoord - 640) > (RoomLength * 0.666) then --Entered from Right side
                Aspects["PositionX"] = math.random(math.floor(CameraXCoord)+40,math.ceil(CameraXCoord)+180)
              else --Entered from middle
                Aspects["PositionX"] = math.random(math.floor(CameraXCoord)+80,math.ceil(CameraXCoord)+560)
              end
              
              --DebugPrint(" Shooter",i,"placed at",Aspects["PositionX"],Aspects["PositionY"])
              
              --Set Bullet
              Aspects["BulletType"] = math.random(31400,31404)
              if ResetLifeTimer then
                Aspects["BulletInitialDelay"] = (math.random(0,6) * 10) + (30*i)
                Aspects["BulletRefireDelay"] = (120/DifficultyMultipliers[CurrentDifficulty][1]) + (60 * #MystiaEXShooters) + (math.random(0,6) * 30)
                Aspects["BulletTotalFireTime"] = Aspects["BulletRefireDelay"]
                Aspects["BulletRepeatRate"] = Aspects["BulletRefireDelay"]
                Aspects["Lifetime"] = 0
                Aspects["ShootTimer"] = 0
              end
              Aspects["BulletTurnRate"] = math.random(10,30)/100
              if math.random() < 0.5 then
                Aspects["BulletTurnRate"] = -Aspects["BulletTurnRate"]
              end
              Changed = true
            end
            if Changed then
              ApplyEnemyAspects(Aspects,EnemyIndex)
            end
          end
        end
      end
    elseif ClearRoomData then
      DesiredBulletTypes = {}
      DesiredSprite = {}
      EnemyHandled = {}
      EnemiesHandled = false
      MystiaEXShooters = {}
    elseif #MystiaEXShooters > 0 then
      for i = 1,#MystiaEXShooters,1 do
        
      end
    end
  end
  
table.insert(RuntimeFunctions,AddFunc)