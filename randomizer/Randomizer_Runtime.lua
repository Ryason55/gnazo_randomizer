EntranceList,MapCoords = dofile(TrainerOrigin.."Randomizer_CurrentSettings.lua")

ObjectIndexAddress = 0x7F97D8
ObjectStateAddress = 0x7F976C
local ObjectDoorHitsAddress = 0x7F9C7C
local ObjectSpriteAddress = 0x7F9768

ObjectDataOffset = 0x578

--Object State, Is Door, Target Room, Target Entrance ID, Room Created In, Shortcut to Unlock, Hint Arrows
--[[local ObjectStatusTable = {}
for i = 1,256,1 do
  ObjectStatusTable[i] = {false,false,0,0,0}
end]]

--offset between player char data is 0x2C
CharOffset = 0x2C
CharacterAbilityLevelAddress = 0x8543FC --Integer
CharacterJoinedAddress = 0x854400 --Byte

--CharsWithIce = {3,11} --Dai, Cirno
CharsWithLv2Jump = {7,9,12,13,15,16,18,21,23} --Remilia, Yuyuko, Flandre, Yukari, Tewi, Reisen, Kaguya, Aya, Kanako
--CharWithNightVision = 10 --Rumia
--CharWithCloudWalking = 21 --Aya
--CharIsKanako = 23 --Gee I wonder
--ShortChars = {3,8,10,11,15,16,24} --Cirno, Youmu, Rumia, Daiyousei, Tewi, Reisen, Suwako
--(Remilia and Flandre are also short, but this is exclusively for the challenge rooms, and doing it with them would be difficult)
  
local P1CharAddress = readInteger(string.format("gnazo.exe+%X",0x5A525))
GameMemoryOffset = P1CharAddress - 0xB8E0F4

local UnlockedReimu = false

--[[local whole,decimal = math.modf(RandomSeed/10)
if math.ceil(decimal*10) == 9 then --if the seed ends in 9...
  --Allow Large Ice Chunk explosions to freeze the player
  writeBytes("gnazo.exe+34803",{0xE4,0x57})
end]]

local BossRooms = {91,161,241,252,301,401,512,671,791,921,1001,1131,1291,1351,1391,1481,1581,1631,1762,1891,1991,2001,2101,2201}
IsBossRoom = {} --To be excluded from enemy randomization
for i = 1,#BossRooms,1 do
  IsBossRoom[BossRooms[i]] = true
end

ShotTypes,ShotTypeLookup,EnemyUsableShotTypes = dofile(TrainerOrigin.."OptionScripts/BulletList.lua")

--RandomBackgrounds
StageWaterColor = {}

ObjectTypesToHandle = {}
RuntimeFunctions = {}

--dofile(TrainerOrigin.."OptionScripts/SoloCharacterChallenge.lua")

local UsesSeed = false
--Load the option script for each setting
for i = 1,#RandomizerOptions,1 do
  local Option = RandomizerOptions[i][1]
  if RandoSetting[Option] then
    if RandomizerOptions[i][5] then
      local ScriptPath = TrainerOrigin.."OptionScripts/"..Option..".lua"
      local File = io.open(ScriptPath,"r")
      if not (File == nil) then --Ensure file exists
        io.close(File)
        ResetRNG(RandomSeed)
        dofile(ScriptPath)
      else
        print("Could not find script for setting \""..RandomizerOptions[i][3].."\"!")
      end
    end
    if RandomizerOptions[i][6] then
      UsesSeed = true
    end
  end
end

writeBytes(string.format("gnazo.exe+%X",0xA5385),{0x90,0x90,0x90}) --The function here overwrites bytes in free door memory with 0s; NOP it so I can use door memory (Hopefully no problems ensue)
writeBytes("gnazo.exe+31761C",stringToByteTable("ex\\title.png   "))
if UsesSeed then --Generate and write seed hash
  local HashGraphics = {} --Graphic, Width, X Offset, Y Offset
  HashGraphics[1] = {164170181,52,-6,3} --Health Sphere
  HashGraphics[2] = {164497866,52,-6,3} --Spirit Sphere
  HashGraphics[3] = {164825551,52,-6,3} --Ability Sphere
  HashGraphics[4] = {168167938,39,-5,18} --L Item
  HashGraphics[5] = {170854955,39,-5,18} --S Item
  HashGraphics[6] = {173673046,39,-5,18} --R Item
  HashGraphics[7] = {175049323,39,-5,18} --1up Item
  HashGraphics[8] = {176425600,39,-5,18} --F Item
  HashGraphics[9] = {177212044,42,-2,16} --Metal Chest

  local CharGraphic = {111,12,115,12}
  local CharWidths = {63,64,64,64,58, 63,58,63,62,{61,-1}, 64,64,64,64,{54,-4}, 63,64,{49,-7},64,60, 64,63,64,64,64}
  
  for i = 1,25,1 do
    local Value = byteTableToDword(CharGraphic)
    local Width = CharWidths[i]
    local Offset
    if type(Width) == "table" then
      Offset = Width[2]
      Width = Width[1]
    else
      Offset = Width-64
    end
    
    table.insert(HashGraphics,{Value,Width,Offset,0})
    CharGraphic[1] = CharGraphic[1] + 1
    CharGraphic[3] = CharGraphic[3] + 1
  end

  ResetRNG(RandomSeed)
  local Icons = {}
  local TotalWidth = 0
  for a = 1,5,1 do
    if a == 4 then
      ResetRNG(RandomSeed+SettingsToFlagNumber())
    end
    while true do
      Icons[a] = math.random(1,#HashGraphics)
      local Valid = true
      for b = 1,a-1,1 do
        if Icons[a] == Icons[b] then
          Valid = false
          break
        end
      end
      if Valid then
        break
      end
    end
    TotalWidth = TotalWidth + HashGraphics[ Icons[a] ][2] + 6
  end
  
  local CurrentXCoord = 640 - TotalWidth
  local HashDataAddress = 0x869270 --Stored in Door data for Stage 1-5
  for a = 1,5,1 do
    writeInteger(string.format("gnazo.exe+%X",HashDataAddress),HashGraphics[ Icons[a] ][1]) --Graphic
    writeInteger(string.format("gnazo.exe+%X",HashDataAddress+4),416+HashGraphics[ Icons[a] ][4]) --Y
    writeInteger(string.format("gnazo.exe+%X",HashDataAddress+8),CurrentXCoord+HashGraphics[ Icons[a] ][3]) --X
    
    HashDataAddress = HashDataAddress+12
    CurrentXCoord = CurrentXCoord + HashGraphics[ Icons[a] ][2] + 6
  end
  
  --Jump to new code
  writeBytes("gnazo.exe+670F1",{0xE9,0x57,0xFC,0xFF,0xFF})
  --Prepare values, call looping function, and return to regular code
  writeBytes("gnazo.exe+66D4D",{0xBE,0xFF,0xFF,0xFF,0xFF,0x31,0xC0,0xE8,0xC8,0x50,0x05,0x00,0xE9,0x5E,0x43,0x00,0x00})
  writeInteger("gnazo.exe+66D4E",GameMemoryOffset+0x869270)
  --Loop over each hash image, and call the render function for each one
  writeBytes("gnazo.exe+BBE21",{0x50,0x53,0xFF,0x36,0xFF,0x76,0x04,0xFF,0x76,0x08,0xE8,0xA0,0x42,0x0C,0x00,0x83,0xC4,0x10,0x83,0xC6,0x0C,0x58,0x40,0x83,0xF8,0x05,0x7C,0xE4,0xC3})
end

local ObjectHandled = {}
TrackedObjects = {}
ChangingRooms = false
CurrentRoomLoaded = 0
CurrentDifficulty = 0
local PlatformsCreated = false

local SaveFileIsValid = {}
print("Randomizer Ready!")

local Timer = createTimer(nil)
timer_onTimer(Timer, function()
  if not (getProcessIDFromProcessName("gnazo.exe") == nil) then
    DestinationRoom = readInteger("gnazo.exe+33D690")
    CurrentRoom = readInteger("gnazo.exe+33D694")
    RoomLoadedIndex = readInteger("gnazo.exe+51FB6C")
    if not (RoomLoadedIndex == nil) then
      IngameMenu = readBytes("gnazo.exe+7F45C8",1) --6 is the stage transition screen
      CurrentMusic = readBytes("gnazo.exe+855284",1) --0 is menu music
      CurrentTitleScreenMenu = readBytes("gnazo.exe+851090",1) --9 is Boss Challenge Character Select
      CurrentSave = readBytes("gnazo.exe+853FC0",1)
      SelectedBoss = readBytes("gnazo.exe+853FD4",1)
      CurrentDifficulty = readBytes("gnazo.exe+85100A",1)
      
      ClearRoomData = false
      if not ChangingRooms then
        if (not (RoomLoadedIndex == CurrentRoomLoaded)) or (CurrentMusic == 0) then
          CurrentRoomLoaded = RoomLoadedIndex
          ChangingRooms = true
          ClearRoomData = true
          TrackedObjects = {}
          ObjectHandled = {}
          DebugPrint("Changing rooms")
        elseif #ObjectTypesToHandle > 0 then
          if CurrentMusic == 0 then
            ObjectHandled = {}
            --print("Objects reset")
          else
            for i = 1,256,1 do --Iterate over the Object table to grab Doors/Water
              if not ObjectHandled[i] then
                local Offset = ObjectDataOffset * (i - 1)
                local ObjectState = readBytes(string.format("gnazo.exe+%X", ObjectStateAddress+Offset), 1)
                if ObjectState > 0 then
                  local ObjectIndex = readInteger(string.format("gnazo.exe+%X", ObjectIndexAddress+Offset))
                  for o = 1,#ObjectTypesToHandle,1 do
                    if ObjectIndex >= ObjectTypesToHandle[o][2] and ObjectIndex <= ObjectTypesToHandle[o][3] then
                      local Type = ObjectTypesToHandle[o][1]
                      --print("Object",i,"Type:",Type)
                      if not TrackedObjects[Type] then
                        TrackedObjects[Type] = {}
                      end
                      table.insert(TrackedObjects[Type],i)
                      break
                    end
                  end
                  ObjectHandled[i] = true
                  --print("Object",i,"Handled")
                end
              end
            end
          end
        end
      elseif (DestinationRoom == CurrentRoom) and (CurrentMusic > 0) then
        ChangingRooms = false
        DebugPrint("Room change finished")
      end
      
      --Run handlers for the enabled randomizer settings
      for i = 1,#RuntimeFunctions,1 do
        RuntimeFunctions[i]()
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

return