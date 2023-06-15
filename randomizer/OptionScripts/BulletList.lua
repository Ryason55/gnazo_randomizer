--Bullet List for Gnazo Randomizer
--Shot types without stats are generally player-only (crash when used by enemies), and are only used for Randomize Cosmetics
--The various stats only affect Randomize Enemies, and not any actual statistics ingame

local ShotTypes = {
  {
    Name = "ReimuNeedle",
    ID = 100,
    Skins = 1,
    Damage = 20,
    Size = 8,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {0}
  },
  {
    Name = "MarisaStar",
    ID = 101,
    Skins = 16,
    Damage = 25,
    Size = 22,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false,
    SpecialChars = {1}
  },
  {
    Name = "WaveBullet",
    ID = 102,
    Skins = 4,
    Damage = 15,
    Size = 16,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {2}
  },
  {
    Name = "YS_Icicle",
    ID = 103,
    Skins = 1,
    Damage = 20,
    Size = 8,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {3,11}
  },
  {
    Name = "YS_Thin",
    ID = 104,
    Skins = 4,
    Damage = 15,
    Size = 8,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {10}
  },
  {
    Name = "YS_Fire",
    ID = 105,
    Skins = 1,
    Damage = 30,
    Size = 22,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true
  },
  {
    Name = "YS_Knife",
    ID = 106,
    Skins = 4,
    Damage = 30,
    Size = 12,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {6}
  },
  {
    Name = "YS_Large",
    ID = 107,
    Skins = 4,
    Damage = 40,
    Size = 35,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false
  },
  {
    Name = "WaveBullet2",
    ID = 108,
    Skins = 4,
    Damage = 20,
    Size = 20,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {2}
  },
  {
    Name = "YS_Butterfly",
    ID = 109,
    Skins = 4,
    Damage = 40,
    Size = 23,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {9}
  },
  {
    Name = "YS_Kunai",
    ID = 110,
    Skins = 4,
    Damage = 40,
    Size = 12,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true
  },
  {
    Name = "YoumuSpirit",
    ID = 111,
    Skins = 1,
    Damage = 30,
    Size = 30,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    ForceMinLifetime = 180,
    SpecialChars = {8}
  },
  {
    Name = "YS_ReisenBullet",
    ID = 112,
    Skins = 1,
    Damage = 20,
    Size = 8,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {16}
  },
  {
    Name = "AyaTornado",
    ID = 113,
    Skins = 1,
    Damage = 30,
    Size = 30,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false,
    ForceMinLifetime = 180,
    SpecialChars = {21}
  },
  {
    Name = "SmallPulsating",
    ID = 114,
    Skins = 4,
    Damage = 13,
    Size = 4,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = true
  },
  {
    Name = "Pulsating",
    ID = 115,
    Skins = 4,
    Damage = 20,
    Size = 6,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = true
  },
  {
    Name = "MusicNote",
    ID = 116,
    Skins = 4,
    Damage = 24,
    Size = 20,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false,
    SpecialChars = {25}
  },
  {
    Name = "ReimuAmulet",
    ID = 200,
    Skins = 1,
    Damage = 30,
    Size = 52,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false,
    SpecialChars = {0}
  },
  {
    Name = "IceChunk",
    ID = 222,
    Skins = 1,
    Damage = 30,
    Size = 22,
    CanFlyStraight = false,
    CanBeWeighted = true,
    OverlapAllowed = false,
    SpecialChars = {3,11}
  },
  {
    Name = "Crystal",
    ID = 225,
    Skins = 6,
    Damage = 20,
    Size = 8,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {4,7,12,18}
  },
  {
    Name = "BlackCrystal",
    ID = 226,
    Skins = 1,
    Damage = 20,
    Size = 8,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    Exclude = true
  },
  {
    Name = "MeilingKick",
    ID = 227,
    Skins = 1,
    Damage = 35,
    Size = 150,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 5,
    MaxShots = 1,
    SpecialChars = {4}
  },
  {
    Name = "Fire",
    ID = 228,
    Skins = 2,
    Damage = 30,
    Size = 21,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    SpecialChars = {5,19}
  },
  {
    Name = "Water",
    ID = 229,
    Skins = 1,
    Damage = 25,
    Size = 26,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    SpecialChars = {5,20}
  },
  {
    Name = "Knife",
    ID = 234,
    Skins = 4,
    Damage = 30,
    Size = 16,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {6}
  },
  {
    Name = "BouncingKnife",
    ID = 235,
    Skins = 4,
    Damage = 30,
    Size = 16,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 3,
    MaxShots = 7,
    SpecialChars = {6},
    Exclude = true
  },
  {
    Name = "AyaShot",
    ID = 238,
    Skins = 5,
    Damage = 25,
    Size = 24,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    SpecialChars = {8,21}
  },
  {
    Name = "YoumuShot",
    ID = 239,
    Skins = 5,
    Exclude = true
  },
  {
    Name = "YoumuSlash",
    ID = 241,
    Skins = 5,
    Damage = 30,
    Size = 64,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false,
    SpecialChars = {8}
  },
  {
    Name = "Butterfly",
    ID = 242,
    Skins = 5,
    Damage = 30,
    Size = 24,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {9}
  },
  {
    Name = "Teardrop",
    ID = 246,
    Skins = 5,
    Damage = 20,
    Size = 8,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {10}
  },
  {
    Name = "RumiaShot",
    ID = 247,
    Skins = 5,
    Exclude = true
  },
  {
    Name = "FlanSpear",
    ID = 248,
    Skins = 5,
    Damage = 35,
    Size = 32,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MinSpeed = 4,
    SpecialChars = {7,12}
  },
  {
    Name = "FlanChargeTeardrop",
    ID = 250,
    Skins = 5,
    Exclude = true
  },
  {
    Name = "Trailed",
    ID = 251,
    Skins = 5,
    Damage = 30,
    Size = 18,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {13}
  },
  {
    Name = "KeineShot",
    ID = 255,
    Skins = 5,
    Damage = 25,
    Size = 24,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 5,
    MinShots = 2,
    MaxShots = 5,
    MinSpeed = 3.5,
    SpecialChars = {14}
  },
  {
    Name = "KeineCharge",
    ID = 256,
    Skins = 5,
    Damage = 25,
    Size = 24,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 5,
    MinShots = 2,
    MaxShots = 5,
    MinTurnRate = 1.5,
    ForceMinLifetime = 120,
    SpecialChars = {14}
  },
  {
    Name = "KeineChargeTeardrop",
    ID = 257,
    Skins = 5,
    Exclude = true
  },
  {
    Name = "Carrot",
    ID = 259,
    Skins = 1,
    Damage = 30,
    Size = 10,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {15}
  },
  {
    Name = "ReisenBullet",
    ID = 262,
    Skins = 1,
    Damage = 25,
    Size = 14,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    RankOverride = 3,
    MaxShots = 7,
    SpecialChars = {16}
  },
  {
    Name = "EirinArrow",
    ID = 264,
    Skins = 1,
    Damage = 30,
    Size = 22,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {17}
  },
  {
    Name = "EirinVanishBullet",
    ID = 266,
    Skins = 4,
    Damage = 30,
    Size = 28,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = true,
    MinSpeed = 3
  },
  {
    Name = "KaguyaShotOrb",
    ID = 270,
    Skins = 4,
    Exclude = true
  },
  {
    Name = "KaguyaChargeCrystal",
    ID = 273,
    Skins = 8,
    Exclude = true
  },
  {
    Name = "MokouShotTrail",
    ID = 276,
    Skins = 4,
    Exclude = true
  },
  {
    Name = "KanakoChargeKnife",
    ID = 296,
    Skins = 4,
    Exclude = true
  },
  {
    Name = "MokouPhoenix",
    ID = 275,
    Skins = 1,
    Damage = 40,
    Size = 70,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 5,
    MinSpeed = 3,
    MaxShots = 1,
    SpecialChars = {19}
  },
  {
    Name = "MokouCharge",
    ID = 277,
    Skins = 1,
    Damage = 30,
    Size = 50,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 5,
    MaxShots = 1,
    SpecialChars = {19}
  },
  {
    Name = "SanaeKanakoAmulet",
    ID = 286,
    Skins = 1,
    Damage = 25,
    Size = 16,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {23}
  },
  {
    Name = "SuwakoRock",
    ID = 299,
    Skins = 1,
    Damage = 40,
    Size = 38,
    CanFlyStraight = false,
    CanBeWeighted = true,
    OverlapAllowed = false,
    SpecialChars = {24}
  },
  {
    Name = "SuwakoRing",
    ID = 300,
    Skins = 1,
    Damage = 40,
    Size = 66,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 5,
    MinSpeed = 3,
    MaxShots = 1,
    ForceMinLifetime = 10000,
    SpecialChars = {24}
  },
  {
    Name = "ArrowBullet",
    ID = 302,
    Skins = 5,
    Damage = 20,
    Size = 14,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true
  },
  {
    Name = "Scythes",
    ID = 303,
    Skins = 5,
    Damage = 25,
    Size = 36,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false
  },
  {
    Name = "LargeGlowing",
    ID = 304,
    Skins = 5,
    Damage = 35,
    Size = 32,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false
  },
  {
    Name = "SpinningOblong",
    ID = 305,
    Skins = 4,
    Damage = 20,
    Size = 14,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = true
  },
  {
    Name = "MystiaShot", --chirp
    ID = 314,
    Skins = 5,
    Damage = 25,
    Size = 24,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 4,
    MinSpeed = 3,
    MaxShots = 5, --Doesn't affect Mystia herself
    SpecialChars = {25}
  },
  {
    Name = "SunnyShot",
    ID = 315,
    Skins = 4,
    Damage = 20,
    Size = 14,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true
  },
  {
    Name = "LunaShot", --functionally the same as SunnyShot
    ID = 316,
    Skins = 4,
    Damage = 20,
    Size = 14,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    Exclude = true
  },
  {
    Name = "StarShot",
    ID = 317,
    Skins = 4,
    Damage = 20,
    Size = 6,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 2,
    MaxShots = 3 --Doesn't affect Star herself
  },
  {
    Name = "StarShotTrail",
    ID = 318,
    Skins = 16,
    Exclude = true
  },
  {
    Name = "MystiaShotTrail",
    ID = 319,
    Skins = 4,
    Exclude = true
  },
  {
    Name = "Amulet",
    ID = 325,
    Skins = 4,
    Damage = 25,
    Size = 7,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true,
    SpecialChars = {22}
  },
  {
    Name = "Laser",
    ID = 347,
    Skins = 4,
    Damage = 40,
    Size = 8,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 5,
    MaxShots = 5,
    SpecialChars = {1},
    Exclude = true --These should have special handlers
  },
  {
    Name = "ArrowBullet2",
    ID = 361,
    Skins = 5,
    Damage = 35,
    Size = 24,
    CanFlyStraight = true,
    CanBeWeighted = false,
    OverlapAllowed = true
  },
  {
    Name = "EirinShot",
    ID = 362,
    Skins = 1,
    Damage = 30,
    Size = 4,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = false,
    MustUseRefireTime = true,
    RankOverride = 4,
    MinSpeed = 4,
    MaxShots = 3,
    SpecialChars = {17}
  },
  {
    Name = "Glowing",
    ID = 364,
    Skins = 5,
    Damage = 25,
    Size = 6,
    CanFlyStraight = true,
    CanBeWeighted = true,
    OverlapAllowed = true
  }
}

--[[table.sort(ShotTypes,
  function(a,b)
    if a["Size"] and b["Size"] then
      return a["Size"]<b["Size"]
    elseif a["Size"] then
      return true
    else
      return false
    end
  end)]]
  
local SizeLevels = {10,20,30,200}

local EnemyUsableShotTypes = {}
EnemyUsableShotTypes["All"] = {}
for i = 1,5,1 do
  EnemyUsableShotTypes[i] = {}
  EnemyUsableShotTypes[i]["Straight"] = {}
  EnemyUsableShotTypes[i]["Weighted"] = {}
  EnemyUsableShotTypes[i]["Both"] = {}
end
local ShotTypeLookup = {}

for i = 1,#ShotTypes,1 do
  ShotTypes[i]["PlayerChars"] = {}
  if ShotTypes[i]["RankOverride"] then
    ShotTypes[i]["Rank"] = ShotTypes[i]["RankOverride"]
  elseif ShotTypes[i]["Size"] then
    for s = 1,#SizeLevels,1 do
      if ShotTypes[i]["Size"] < SizeLevels[s] then
        ShotTypes[i]["Rank"] = s
        break
      end
    end
  end
  ShotTypeLookup[ShotTypes[i]["ID"]] = ShotTypes[i]
  if (not ShotTypes[i]["Exclude"]) and ShotTypes[i]["Size"] then
    table.insert(EnemyUsableShotTypes["All"],ShotTypes[i])
    if ShotTypes[i]["CanFlyStraight"] then
      table.insert(EnemyUsableShotTypes[ ShotTypes[i]["Rank"] ]["Straight"],ShotTypes[i])
    end
    if ShotTypes[i]["CanBeWeighted"] then
      table.insert(EnemyUsableShotTypes[ ShotTypes[i]["Rank"] ]["Weighted"],ShotTypes[i])
      if ShotTypes[i]["CanFlyStraight"] then
        table.insert(EnemyUsableShotTypes[ ShotTypes[i]["Rank"] ]["Both"],ShotTypes[i])
      end
    end
  end
  --print(ShotTypes[i]["Size"],ShotTypes[i]["Name"])
end

return ShotTypes,ShotTypeLookup,EnemyUsableShotTypes