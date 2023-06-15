local CharacterStartingSpirit = {110,100,100,70,60,140,110,130,100,130,70,70,140,140,100,120,110,120,140,120,100,110,120,140,140}

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

local CharacterShotAttackAddresses = {0x10AA0,0x10C1D,0x110AD,0x115B5,0x1201A,0x125CA,0x12C9E,0x13699,0x13938,0x13E47,0x14369,0x11AE9,0x14BD1,0x15072,0x15CA9,0x15E56,0x16277,0x1641C,0x165C3,0x169E5,0x16BAA,0x16E55,0x17054,0x175D7,0x17825}
local CharacterChargeAttackAddresses = {0x93B9,0x966D,0x9AA9,0x9E78,0xA4BC,0xAAC1,0xAE3B,0xB820,0xBC4C,0xC081,0xCAC4,0xA19A,0xCF4E,0xD3D3,0xD8BC,0xDD17,0xDD19,0xE1D7,0xE3D1,0xE6F2,0xE930,0xF2FD,0xF896,0xFFE8,0x10235}
local CharacterToAttachChargeToAddresses = {0,0x44C0,0,0,0,0,0,0,0,0,0,0,0,0x456F,0,0x46A6,0,0,0x4605,0,0,0,0,0x46E3,0}
local CharacterToHandleChargeSoundAddresses =  {}
CharacterToHandleChargeSoundAddresses[2] = {0x91DA,0x9219} --Marisa
CharacterToHandleChargeSoundAddresses[14] = {0x91DF,0x921E} --Yukari
CharacterToHandleChargeSoundAddresses[19] = {0x91A7} --Kaguya
local CharacterToUseMeleeAnimationForChargeAddresses = {}
CharacterToUseMeleeAnimationForChargeAddresses[5] = {0x3D07A,0x3CDED} --Meiling
CharacterToUseMeleeAnimationForChargeAddresses[9] = {0x3D075,0x3CDE8} --Youmu

local NewCharacterSpirit = {}
local ShotReplacements = ShuffleCharAttacks()
for i = 1,25,1 do
  local Shot = ShotReplacements[1][i]
  local Charge = ShotReplacements[2][i]
  writeBytes(string.format("gnazo.exe+%X", CharacterShotAttackAddresses[Shot]),i-1)
  writeBytes(string.format("gnazo.exe+%X", CharacterChargeAttackAddresses[Charge]),i-1)
  if not (CharacterToAttachChargeToAddresses[Charge] == 0) then
    writeBytes(string.format("gnazo.exe+%X", CharacterToAttachChargeToAddresses[Charge]),i-1)
  end
  if not (CharacterToHandleChargeSoundAddresses[Charge] == nil) then
    for a = 1,#CharacterToHandleChargeSoundAddresses[Charge],1 do
      writeBytes(string.format("gnazo.exe+%X", CharacterToHandleChargeSoundAddresses[Charge][a]),i-1)
    end
  end
  if not (CharacterToUseMeleeAnimationForChargeAddresses[Charge] == nil) then
    writeBytes(string.format("gnazo.exe+%X", CharacterToUseMeleeAnimationForChargeAddresses[Charge][1]),i-1)
    writeBytes(string.format("gnazo.exe+%X", CharacterToUseMeleeAnimationForChargeAddresses[Charge][2]),i-1)
  end
  NewCharacterSpirit[i] = math.ceil((CharacterStartingSpirit[Shot]+CharacterStartingSpirit[Charge])/2)
  --print(i,NewCharacterSpirit[i])
end

local P1CharAddress = readInteger(string.format("gnazo.exe+%X",0x5A525))

--Create tables in memory for the graphics to use for the shot and charge character graphics in the character selection screen
local BaseBytes = {0x6F,0x0C,0x73,0x0C} --Reimu Graphic (adding to the 1st and 3rd bytes will get other characters)
local ShotAddress = 0x904A22 --Unused space for Stage 200 Room 5 Door Data
local ChargeAddress = 0x904B6C --Unused space for Stage 200 Room 6 Door Data
for i = 1,25,1 do
  local Char = ShotReplacements[1][i]-1
  writeBytes(string.format("gnazo.exe+%X", ShotAddress),{BaseBytes[1]+Char,BaseBytes[2],BaseBytes[3]+Char,BaseBytes[4]})
  ShotAddress = ShotAddress + 4
  Char = ShotReplacements[2][i]-1
  writeBytes(string.format("gnazo.exe+%X", ChargeAddress),{BaseBytes[1]+Char,BaseBytes[2],BaseBytes[3]+Char,BaseBytes[4]})
  ChargeAddress = ChargeAddress + 4
end
--Add elements to the character select screen that show what shot and charge attacks each character has
writeBytes(string.format("gnazo.exe+%X",0x5A523),{0xE9,0xC4,0x88,0x08,0x00,0x90}) --Jump to new instructions
writeBytes(string.format("gnazo.exe+%X",0xD2FA2),{0x8B,0x0D,0xFF,0xFF,0xFF,0xFF,0x8B,0x0C,0x8D,0xFF,0xFF,0xFF,0xFF,0x6A,0x01,0x51,0x68,0xF7,0x00,0x00,0x00,0x68,0xC6,0x00,0x00,0x00,0xE8,0x0F,0xD1,0x0A,0x00,0x83,0xC4,0x20,0x8B,0x0D,0xFF,0xFF,0xFF,0xFF,0xE9,0x5A,0x75,0xF8,0xFF}) --Display portrait for shot char (second)
writeInteger(string.format("gnazo.exe+%X",0xD2FA4),P1CharAddress)
writeInteger(string.format("gnazo.exe+%X",0xD2FAB),0x904A22+GameMemoryOffset)
writeInteger(string.format("gnazo.exe+%X",0xD2FC6),P1CharAddress)
writeBytes(string.format("gnazo.exe+%X",0xE2DEC),{0x8B,0x0D,0xFF,0xFF,0xFF,0xFF,0x8B,0x0C,0x8D,0xFF,0xFF,0xFF,0xFF,0x6A,0x01,0x51,0x68,0xF7,0x00,0x00,0x00,0x68,0xFF,0x00,0x00,0x00,0xE8,0xC5,0xD2,0x09,0x00,0xE9,0x92,0x01,0xFF,0xFF}) --Display portrait for charge char (first)
writeInteger(string.format("gnazo.exe+%X",0xE2DEE),P1CharAddress)
writeInteger(string.format("gnazo.exe+%X",0xE2DF5),0x904B6C+GameMemoryOffset)

local CharacterCurrentSpiritAddress = 0x8543E0 --Float
local CharacterCurrentRPAddress = 0x8543E4 --Float
local CharacterMaxSpiritAddress = 0x8543E8 --Integer
local CharacterSpiritLevelAddress = 0x8543F4 --Integer
local CharacterAllSpiritLevelAddress = 0x8543F8 --Integer

local AddFunc =
  function()
    if ((CurrentMusic > 0) or (CurrentTitleScreenMenu == 9)) then
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

table.insert(RuntimeFunctions,AddFunc)