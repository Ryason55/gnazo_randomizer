VersionNumber = "3.9"
VersionNumber_FileName = "3.9"

print("------ Mystery of Gensokyo Randomizer V"..VersionNumber.." ------")
print("Please load \"gnazo.exe\" (V1.01e) to begin.")

RandomizerOptions = {} --Internal Name, Page Number, Checkbox Name, Checkbox Hint, Includes script, Uses Seed, Required setting

RandomizerOptions[1] = {"RandomizeDoors",1,"Randomize Doors",
[[Door connections are shuffled.]],
true,true}

RandomizerOptions[2] = {"RandomizeAttacks",1,"Randomize Player Attacks",
[[Playable characters have their attacks shuffled.]],
true,true}

RandomizerOptions[3] = {"RandomizeEnemies",1,"Randomize Enemies",
[[Enemies have a chance to change type, and their shots may be modified.
Intensity of the randomization is based on difficulty level, and overall
makes the game harder.]],
true,true}

RandomizerOptions[4] = {"RandomizeBackgrounds",1,"Randomize Backgrounds",
[[Stage backgrounds and music are shuffled.
Will affect which stages Remilia and Flandre take sunlight damage in.]],
true,true}

RandomizerOptions[5] = {"RandomizeCosmetics",1,"Randomize Cosmetics",
[[Randomizes the miscellaneous cosmetics, including fairy sprites and bullet colors.
Has minor gameplay impact due to a couple bullet types changing element.]]
,true,true}

RandomizerOptions[6] = {"IncludeSpoilerLog",2,"Include Spoiler Log",
[[Upon generation, a text file is generated that outlines a method to reach all of the bosses (Door Randomization)
and what attacks each character has (Player Attack Randomization). Modifies the randomization result.]],
false,false}

RandomizerOptions[7] = {"SkipCredits",2,"Skip End Credits",
[[Kanako is collectable instead of starting the credits sequence.
Useful if your goal isn't just beating Kanako.]],
true,false}

RandomizerOptions[8] = {"RevealHiddenDoors",2,"Reveal Hidden Doors",
[[Hidden doors are always visible, but don't show a number until they're hit or entered.]],
true,false}

RandomizerOptions[9] = {"QuickBacktracking",2,"Quick Backtracking",
[[Doors you exit from are immediately enterable with a single hit, instead of requiring 7 hits.]],
true,false}

RandomizerOptions[10] = {"ExtraLives",2,"Increased Survivability",
[[You start at 5 lives, and items are provided in Stage 1 to bring you back up to 5 if you're under that.]],
true,false}

RandomizerOptions[11] = {"SuperJump",2,"V1.0 Super Jumps",
[[Can reach higher areas by jumping with a fast character and switching to a floaty one.
Reimu/Marisa Super Jumps will be considered in logic. Also, it's not recommended to
enter high doors with Door Randomization.]],
true,false}

RandomizerOptions[12] = {"SoloCharacterChallenge",3,"Enable Solo Character Mode",
[[Adds a new option in the Boss Challenge menu to choose a single character to play the entire game with.
Selected character inherits exploration abilities from defeated bosses. This will affect logic since you can't 
switch characters in the mode, so it's recommended to leave this off unless you intend on playing the mode.
CURRENTLY DISABLED DUE TO POTENTIAL INSTABILITY.]],
true,false,"DisabledDueToInstability"}

RandomizerOptions[13] = {"HardLogic",3,"Harder Door Logic",
[[Affects Door Randomization.
All dark rooms are in logic without Rumia, and the two
gauntlet rooms can be required without a short character.]],
false,false,"RandomizeDoors"}

RandomizerOptions[14] = {"MaxEnemyRando",3,"Max Enemy Randomization",
[[Affects Enemy Randomization.
All enemies that can be randomized will be randomized in all difficulties.
Has no effect on Lunatic mode, since everything's randomized there anyways.]],
false,false,"RandomizeEnemies"}

-- RandomizerOptions[15] = {"Debug",3,"Debug Text",
-- [[Various debug text will be printed to the console]],
-- false,false}


Spoiler_CharacterNames = {"Reimu", "Marisa", "Alice", "Cirno", "Meiling", "Patchouli", "Sakuya", "Remilia", "Youmu", "Yuyuko", "Rumia", "Daiyousei", "Flandre", "Yukari", "Keine", "Tewi", "Reisen", "Eirin", "Kaguya", "Mokou", "Nitori", "Aya", "Sanae", "Kanako", "Suwako"}
Spoiler_ShotNames = {"Reimu's Needles", "Marisa's Stars", "Alice's Shots & Dolls", "Cirno's Ice", "Meiling's Shots", "Patchouli's Magic", "Sakuya's Knives", "Remilia's Shots", "Youmu's Shots & Spirit", "Yuyuko's Butterflies", "Rumia's Shots", "Daiyousei's Ice", "Flandre's Shots & Spears", "Yukari's Shots", "Keine's Shots", "Tewi's Carrots", "Reisen's Rockets", "Eirin's Branches", "Kaguya's Shots", "Mokou's Phoenixes", "Nitori's Water", "Aya's Wind", "Sanae's Amulets & Wind", "Kanako's Beams", "Suwako's Water & Rocks"}
Spoiler_ChargeNames = {"Reimu's Amulets", "Marisa's Master Spark", "Alice's Spear Doll", "Cirno's Large Ice", "Meiling's Rainbow Kick", "Patchouli's Fireball", "Sakuya's Bouncing Knives", "Remilia's Gungnir", "Youmu's Slash", "Yuyuko's Spirit Swarm", "Rumia's Demarcation", "Daiyousei's Large Ice", "Flandre's Starbow Break", "Yukari's Boundary", "Keine's Arcing Shot", "Tewi's Carrot Sprinkler", "Reisen's Rocket Burst", "Eirin's Cell Burst", "Kaguya's Rainbow Barrage", "Mokou's Flame Eruption", "Nitori's Dowsing Splash", "Aya's Tornado", "Sanae's Triple Amulet", "Kanako's Knife Barrage", "Suwako's Bouncing Rings"}


local SettingPages = {}
RandoSetting = {}
for i = 1,#RandomizerOptions,1 do
  RandoSetting[ RandomizerOptions[i][1] ] = false
  local DesirePage = RandomizerOptions[i][2]
  if not SettingPages[DesirePage] then
    SettingPages[DesirePage] = {}
  end
  table.insert(SettingPages[DesirePage],i)
end

ConcoctBool =
  function(Bool)
    if Bool then
      return "true"
    else
      return "false"
    end
  end

DebugPrint =
  function(Text1,Text2,Text3,Text4,Text5,Text6,Text7,Text8)
    if RandoSetting["Debug"] then
      print(Text1,Text2,Text3,Text4,Text5,Text6,Text7,Text8)
    end
  end

UserSeed = "12345"
RandomSeed = 12345

local AllCharValues = {"1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}
local CharValue = {}
for i = 1,#AllCharValues,1 do
  CharValue[ AllCharValues[i] ] = i
end
CharValue[0] = 0

local ConvertUserSeed =
  function(TextSeed)
    local TestString = string.lower(TextSeed)
    local NewSeed = 0
    local Len = string.len(TextSeed)
    for i = 1,Len,1 do
      local char = string.sub(TextSeed,i,i)
      local Value = CharValue[char]
      if Value == nil then
        Value = 0
      end
      NewSeed = (NewSeed * 10) + Value
    end
    return NewSeed
  end
  
local RandoSeedErrors = {"Please only use numbers and letters (0-9, A-Z) for the seed.","Please keep the seed length to 16 characters or less."}
local CopySeedErrors = {"The seed in the clipboard contains invalid characters.","The seed in the clipboard is too long."}
  
local IsUserSeedValid =
  function(Seed,Errors)
    local SeedValid = false
    local Reason = ""
    if string.len(Seed) <= 16 then
      SeedValid = true
      for i = 1,string.len(Seed),1 do
        local char = string.sub(Seed,i,i)
        if not (CharValue[string.lower(char)] or (char == "0")) then
          SeedValid = false
          if Errors then
            messageDialog(Errors[1],0,2)
          end
          break
        end
      end
    elseif Errors then
      messageDialog(Errors[2],0,2)
    end
    return SeedValid,Reason
  end

dofile(TrainerOrigin.."Randomizer_CurrentSettings.lua")
if not IsUserSeedValid(UserSeed) then
  UserSeed = "12345"
end
RandomSeed = ConvertUserSeed(UserSeed)

--Character Attack Randomization stuff, since it's shared by Setup and Runtime
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

CharStages = {1,16,25,30,40,67,113,92,129,9,24,148,100,51,135,139,158,163,210,79,176,189,200,220}
CharStages[0] = 1

CharsWithAbility = {}
CharsWithAbility[1] = {7,9,{11,1},12,13,15,16,18,21,23,24} --Lv 1 Jump
CharsWithAbility[2] = {7,9,{11,2},12,13,15,16,18,21,23,24} --Lv 2 Jump
CharsWithAbility[3] = {{15,1},{16,2},24} --Lv 3 Jump
CharsWithAbility[4] = {{15,3},{24,1}} --Lv 4 Jump
CharsWithAbility[5] = {{24,3}} --Lv 5 Jump
CharsWithAbility[6] = {21} --Cloud-walking
CharsWithAbility[7] = {3,11} --Ice Drop
CharsWithAbility[8] = {10} --Night Vision
CharsWithAbility[9] = {23} --Kanako
CharsWithAbility[10] = {3,8,10,11,15,16,24} --Short
CharsWithAbility[11] = {} --DarkJump Lv 1-5 (Requires a combination of chars)
CharsWithAbility[12] = {}
CharsWithAbility[13] = {}
CharsWithAbility[14] = {}
CharsWithAbility[15] = {}

function ShuffleCharAttacks()
  ResetRNG(RandomSeed)
  local CharsWithIce = {}
  local NewCharAttacks = {{},{}}
  local ChargeAttackInUse = {}
  local ShotAttackInUse = {}
  local minChar = 1
  local maxChar = 25
  local DoThing = {false,true}
  for l = 1,2,1 do
    for i = minChar,maxChar,1 do
      if (IsProblemCharge[i-1] and (not DoThing[l])) or ((not IsProblemCharge[i-1]) and DoThing[l]) then
        while true do --Shot Attack
          local NewIndex = math.random(minChar,maxChar)
          if (not ShotAttackInUse[NewIndex]) and (not (IsProblemCharacter[NewIndex-1] and IsProblemShot[i-1])) then
            ShotAttackInUse[NewIndex] = true
            NewCharAttacks[1][NewIndex] = i
            if i == 4 or i == 12 then
              table.insert(CharsWithIce,NewIndex-1)
            end
            break
          end
        end
        while true do --Charge Attack
          local NewIndex = math.random(minChar,maxChar)
          if (not ChargeAttackInUse[NewIndex]) and (not (IsProblemCharacter[NewIndex-1] and IsProblemCharge[i-1])) then
            ChargeAttackInUse[NewIndex] = true
            NewCharAttacks[2][NewIndex] = i
            break
          end
        end
      end
    end
  end
  return NewCharAttacks,CharsWithIce
end

GetDistanceBetweenCoords =
  function(Coord1,Coord2)
    local Coord_Diff = {}
    for i = 1,2,1 do
      Coord_Diff[i] = Coord1[i] - Coord2[i]
    end
    return math.abs( math.sqrt( Coord_Diff[1]^2 + Coord_Diff[2]^2) )
  end

local GameFound = false
local GameLoaded = false
local SettingSeed = false
local CurrentlyRandomizing = false
local ScriptRunning = false

local SettingBingoSeed = false
local CopyMenuOpen = false

local LuaEngine = getLuaEngine()
LuaEngine.cbShowOnPrint.Checked=false

addresslist=getAddressList()

gBeepOnAction=false
form_show(CETrainer)
setProperty(CETrainer,"Caption","Gnazo Randomizer V"..VersionNumber)

local UpdateMainButtonUsability =
  function()
    if SettingSeed or SettingBingoSeed then
      setProperty(CETrainer.CopySeed,"Enabled",false)
    elseif CopyMenuOpen then
      setProperty(CETrainer.SetSeed,"Enabled",false)
      setProperty(CETrainer.BingoButton,"Enabled",false)
    else
      setProperty(CETrainer.CopySeed,"Enabled",true)
      setProperty(CETrainer.SetSeed,"Enabled",true)
      setProperty(CETrainer.BingoButton,"Enabled",true)
    end
  end
  
local SaveBingoBoard
local LoadBingoBoard

function CloseClick()
  if GameLoaded then
    local Result = messageDialog("The game is still running; Are you sure you want to close the randomizer?",3,0,1)
    if Result == 6 then
      SaveBingoBoard()
      closeCE()
    end
  else
    SaveBingoBoard()
    closeCE()
  end
end

function ConsoleClick()
  if LuaEngine.Visible then
    LuaEngine:hide()
  else
    LuaEngine:show()
  end
end

setProperty(CETrainer.SetSeed,"Caption","Set Seed (Current: "..UserSeed..")")

local SettingCheckboxes = {CETrainer.SeedSetting1,CETrainer.SeedSetting2,CETrainer.SeedSetting3,CETrainer.SeedSetting4,CETrainer.SeedSetting5,CETrainer.SeedSetting6}

local ToggleSeedSettings =
  function(DesireState)
    setProperty(CETrainer.SeedInput,"Enabled",DesireState)
    setProperty(CETrainer.RandomizeSeed,"Enabled",DesireState)
    setProperty(CETrainer.PageRight,"Enabled",DesireState)
    setProperty(CETrainer.PageLeft,"Enabled",DesireState)
    setProperty(CETrainer.CancelSeed,"Enabled",DesireState)
    for i = 1,6,1 do
      setProperty(SettingCheckboxes[i],"Enabled",DesireState)
    end
  end

local CurrentPage = 0
local NewSettings = {}

local IsRequiredOptionSet =
  function(SettingIndex)
    if (not RandomizerOptions[SettingIndex][7]) then
      return true
    else
      local Required = RandomizerOptions[SettingIndex][7]
      for i = 1,#RandomizerOptions,1 do
        if RandomizerOptions[i][1] == Required then
          if NewSettings[i] then
            return true
          end
          return false
        end
      end
    end
    return false
  end

local UpdateNewSettings = 
  function(Initialize)
    if Initialize then
      NewSettings = {}
      for i = 1,#RandomizerOptions,1 do
        local SettingName = RandomizerOptions[i][1]
        if RandoSetting[SettingName] == true then
          NewSettings[i] = true
        else
          NewSettings[i] = false
        end
      end
    else
      for i = 1,6,1 do
        if SettingPages[CurrentPage][i] then
          NewSettings[ SettingPages[CurrentPage][i] ] = getProperty(SettingCheckboxes[i],"Checked")
        else
          break
        end
      end
    end
  end

local ChangeSettingPage = 
  function(NewPage)
    if not (CurrentPage == NewPage) then
      if NewPage > #SettingPages then
        NewPage = 1
      elseif NewPage < 1 then
        NewPage = #SettingPages
      end
      CurrentPage = NewPage
      setProperty(CETrainer.PageNumber,"Caption",CurrentPage.." / "..#SettingPages)
      for i = 1,6,1 do
        local SettingIndex = SettingPages[CurrentPage][i]
        if SettingIndex then
          setProperty(SettingCheckboxes[i],"Caption",RandomizerOptions[SettingIndex][3])
          setProperty(SettingCheckboxes[i],"Hint",RandomizerOptions[SettingIndex][4])
          setProperty(SettingCheckboxes[i],"Checked",NewSettings[SettingIndex])
          setProperty(SettingCheckboxes[i],"Visible",true)
          if IsRequiredOptionSet(SettingIndex) then
            setProperty(SettingCheckboxes[i],"Enabled",true)
          else
            setProperty(SettingCheckboxes[i],"Enabled",false)
          end
        else
          setProperty(SettingCheckboxes[i],"Caption","")
          setProperty(SettingCheckboxes[i],"Hint","")
          setProperty(SettingCheckboxes[i],"Checked",false)
          setProperty(SettingCheckboxes[i],"Visible",false)
        end
      end
    end
  end
  
function PageRightClick(sender)
  if SettingSeed then
    UpdateNewSettings(false)
    ChangeSettingPage(CurrentPage+1)
  end
end

function PageLeftClick(sender)
  if SettingSeed then
    UpdateNewSettings(false)
    ChangeSettingPage(CurrentPage-1)
  end
end

function CancelSeedClick(sender)
  if SettingSeed then
    NewSettings = {}
    CurrentPage = 0
    SettingSeed = false
    UpdateMainButtonUsability()
    setProperty(CETrainer.SeedOptions,"Visible",false)
    setProperty(CETrainer.SetSeed,"Caption","Set Seed (Current: "..UserSeed..")")
  end
end

local UpdateSeedSettings =
  function()
    ToggleSeedSettings(false)
    setProperty(CETrainer.SetSeed,"Caption","Working...") --TODO: Apparently shows old seed settings when randomizing?
    if not LuaEngine.Visible then
      LuaEngine:show()
    end
    CurrentlyRandomizing = true
    dofile(TrainerOrigin.."Randomizer_Setup.lua")
    CurrentlyRandomizing = false
    ToggleSeedSettings(true)
    setProperty(CETrainer.SetSeed,"Caption","Set Seed (Current: "..UserSeed..")")
  end

function SeedClick(sender)
  if not GameFound then
    if not SettingSeed then
      SettingSeed = true
      UpdateMainButtonUsability()
      UpdateNewSettings(true)
      ChangeSettingPage(1)
      setProperty(CETrainer.SeedInput,"Text",UserSeed)
      setProperty(CETrainer.SeedOptions,"Visible",true)
      setProperty(CETrainer.SetSeed,"Caption","Save Settings")
    else
      local Seed = getProperty(CETrainer.SeedInput,"Text")
      if IsUserSeedValid(Seed,RandoSeedErrors) then
        UserSeed = Seed
        RandomSeed = ConvertUserSeed(UserSeed)
        UpdateNewSettings(false)
        for i = 1,#RandomizerOptions,1 do
          local SettingName = RandomizerOptions[i][1]
          if IsRequiredOptionSet(i) then
            RandoSetting[SettingName] = NewSettings[i]
          else
            RandoSetting[SettingName] = false
          end
        end
        UpdateSeedSettings()
        CancelSeedClick()
      end
    end
  else
    CancelSeedClick()
  end
end

local LastBaseSeed = 0
function ChooseRandomSeed()
  local BaseSeed = os.time()
  if not (LastBaseSeed == BaseSeed) then
    LastBaseSeed = BaseSeed
    math.randomseed(BaseSeed)
    math.random()
  end
  return math.random(1,9999999999)
end

function RandomizeSeedClick(sender) --Choose a new seed based off the system time
  setProperty(CETrainer.SeedInput,"Text", ChooseRandomSeed() )
end

function setImage(wc,name)
  local p = createPicture()
  p.loadFromFile(TrainerOrigin.."BingoThumbnails/"..name..".jpg")
  wc.OnPaint = function(sender)
    local c = sender.getCanvas()
    local bitmap = p.getBitmap()
    c.draw(0,0,bitmap)
  end
end

BingoGrid = {}
BingoGrid[1] = {CETrainer.Bingo1_1,CETrainer.Bingo1_2,CETrainer.Bingo1_3,CETrainer.Bingo1_4,CETrainer.Bingo1_5}
BingoGrid[2] = {CETrainer.Bingo2_1,CETrainer.Bingo2_2,CETrainer.Bingo2_3,CETrainer.Bingo2_4,CETrainer.Bingo2_5}
BingoGrid[3] = {CETrainer.Bingo3_1,CETrainer.Bingo3_2,CETrainer.Bingo3_3,CETrainer.Bingo3_4,CETrainer.Bingo3_5}
BingoGrid[4] = {CETrainer.Bingo4_1,CETrainer.Bingo4_2,CETrainer.Bingo4_3,CETrainer.Bingo4_4,CETrainer.Bingo4_5}
BingoGrid[5] = {CETrainer.Bingo5_1,CETrainer.Bingo5_2,CETrainer.Bingo5_3,CETrainer.Bingo5_4,CETrainer.Bingo5_5}

local CurrentBoard = nil
BingoSeed = nil
OnlyCharactersMode = false
local BingoRunning = false

SaveBingoBoard =
  function()
    local SaveString
    if CurrentBoard then
      SaveString = "return {"..BingoSeed..","
      for row = 1,5,1 do
        for column = 1,5,1 do
          SaveString = SaveString..CurrentBoard[row][column][3]..","..ConcoctBool(CurrentBoard[row][column][1])
          if not ((row == 5) and (column == 5)) then
            SaveString = SaveString..","
          end
        end
      end
      SaveString = SaveString.."}"
    else
      SaveString = "return nil"
    end
    local File = io.open(TrainerOrigin.."Randomizer_LastBingoSession.lua","w")
    File:write(SaveString)
    File:close()
  end
  
local RenderBingoBoard =
  function()
    for row = 1,5,1 do
      for column = 1,5,1 do
        local CurrentSquare = CurrentBoard[row][column][2]
        setProperty(BingoGrid[row][column],"Visible",false)
        if CurrentBoard[row][column][1] then
          setImage(BingoGrid[row][column],CurrentSquare[1].."_Off")
        else
          setImage(BingoGrid[row][column],CurrentSquare[1])
        end
        setProperty(BingoGrid[row][column],"Visible",true)
        setProperty(BingoGrid[row][column],"Hint",CurrentSquare[2])
        setProperty(BingoGrid[row][column],"ShowHint",true)
      end
    end
  end
  
LoadBingoBoard =
  function()
    local File = io.open(TrainerOrigin.."Randomizer_LastBingoSession.lua","r")
    if File then
      File:close()
      BoardToLoad = dofile(TrainerOrigin.."Randomizer_LastBingoSession.lua")
      if BoardToLoad then
        BoardToLoad[1] = tonumber(BoardToLoad[1])
        if BoardToLoad[1] then
          BingoSeed = BoardToLoad[1]
          CurrentBoard = dofile(TrainerOrigin.."Randomizer_Bingo.lua")
          if CurrentBoard then
            RenderBingoBoard()
            setProperty(CETrainer.BingoButton,"Caption","New Board")
            print("Loaded last played bingo session")
          end
        end
      end
    end
  end

local StartBingoBoard =
  function()
    BoardToLoad = nil
    CurrentBoard = dofile(TrainerOrigin.."Randomizer_Bingo.lua")
    RenderBingoBoard()
  end

function CancelBingoClick(sender)
  SettingBingoSeed = false
  UpdateMainButtonUsability()
  setProperty(CETrainer.BingoSeedBox,"Visible",false)
  if CurrentBoard then
    setProperty(CETrainer.BingoButton,"Caption","New Board")
  else
    setProperty(CETrainer.BingoButton,"Caption","Setup Bingo")
  end
end

function BingoClick(sender)
  if not BingoSeed then
    BingoSeed = ChooseRandomSeed()
  end
  if not SettingBingoSeed then
    setProperty(CETrainer.BingoSeedInput,"Text",BingoSeed)
    setProperty(CETrainer.BingoSeedBox,"Visible",true)
    setProperty(CETrainer.BingoButton,"Caption","Begin!")
    setProperty(CETrainer.CharsOnly,"Checked",OnlyCharactersMode)
    if CurrentBoard then
      setProperty(CETrainer.BingoClear,"Enabled",true)
    else
      setProperty(CETrainer.BingoClear,"Enabled",false)
    end
    SettingBingoSeed = true
    UpdateMainButtonUsability()
  else
    local Seed = getProperty(CETrainer.BingoSeedInput,"Text")
    if string.len(Seed) <= 10 then
      if not (tonumber(Seed) == nil) then
        BingoSeed = math.abs(math.modf(Seed))
        OnlyCharactersMode = getProperty(CETrainer.CharsOnly,"Checked")
        StartBingoBoard()
        CancelBingoClick()
        if not BingoRunning then
          setProperty(CETrainer.CopyIncludeBingo,"Enabled",true)
          setProperty(CETrainer.CopyIncludeBingo,"Checked",true)
          BingoRunning = true
        end
      else
        messageDialog("Please input a valid number for the bingo seed.",0,2)
      end
    else
      messageDialog("Please keep the bingo seed length to 10 characters or less.",0,2)
    end
  end
end

function RandomizeBingoClick(sender)
  setProperty(CETrainer.BingoSeedInput,"Text", ChooseRandomSeed() )
end

function CETrainer_ClearBingoClick(sender)
  if CurrentBoard then
    --First check if anything
    local HasSquaresMarked = false
    for row = 1,5,1 do
      for column = 1,5,1 do
        if CurrentBoard[row][column][1] then
          HasSquaresMarked = true
          local Result = messageDialog("Are you sure you want to clear the bingo board?",3,0,1)
          if not (Result == 6) then
            return
          end
          break
        end
      end
      if HasSquaresMarked then
        break
      end
    end
    --Clear the bingo board
    CurrentBoard = nil
    for row = 1,5,1 do
      for column = 1,5,1 do
        setProperty(BingoGrid[row][column],"Visible",false)
        setProperty(BingoGrid[row][column],"ShowHint",false)
      end
    end
    CancelBingoClick()
  end
end

function CopyClick(sender)
  if CopyMenuOpen then
    setProperty(CETrainer.CopySeed,"Caption","Copy Settings")
    setProperty(CETrainer.CopySeedBox,"Visible",false)
  else
    setProperty(CETrainer.CopySeed,"Caption","Cancel")
    setProperty(CETrainer.CopySeedBox,"Visible",true)
  end
  CopyMenuOpen = not CopyMenuOpen
  UpdateMainButtonUsability()
end

function SettingsToFlagNumber()
  local SettingsValue = 0
  for i = 1,#RandomizerOptions,1 do
    if RandoSetting[ RandomizerOptions[i][1] ] then
      SettingsValue = SettingsValue + math.pow(2, i-1)
    end
  end
  return math.floor(SettingsValue)
end

function CopyGetClick(sender)
  local SettingString = "{"..SettingsToFlagNumber()
  if getProperty(CETrainer.CopyIncludeSeed,"Checked") then
    SettingString = SettingString .. "-" .. UserSeed
    if BingoRunning and getProperty(CETrainer.CopyIncludeBingo,"Checked") then
      SettingString = SettingString .. "-" .. BingoSeed
      if OnlyCharactersMode then
        SettingString = SettingString .. "B"
      else
        SettingString = SettingString .. "A"
      end
    end
  end
  SettingString = SettingString .. "}"
  writeToClipboard(SettingString)
end

local BingoAllCharsBool = {}
BingoAllCharsBool["A"] = false
BingoAllCharsBool["B"] = true

function CopyApplyClick(sender)
  local ClipboardString = readFromClipboard()
  local Settings,Seed,Bingo,Chars = string.match(ClipboardString, "{(%d-)-(%w-)-(%d-)(%a)}" )
  if not Settings then
    Settings,Seed = string.match(ClipboardString, "{(%d-)-(%w-)}" )
    if not Settings then
      Settings,Seed = string.match(ClipboardString, "{(%d-)}" )
    end
  end
  if Settings then
    
    local UpdateNeeded = false
    if Bingo then --Update Bingo board if its included with the settings
      Bingo = tonumber(Bingo)
      if (not (Bingo == BingoSeed)) or (not (BingoAllCharsBool[Chars] == OnlyCharactersMode)) then
        if Bingo < 0 or Bingo > 9999999999 then
          Valid = false
          messageDialog("The bingo seed in the clipboard is out of range.",0,2)
        else
          BingoSeed = Bingo
          OnlyCharactersMode = BingoAllCharsBool[Chars]
          StartBingoBoard()
          UpdateNeeded = true
        end
      end
    end
    
    Settings = tonumber(Settings)
    if (not (Settings == SettingsToFlagNumber())) or (Seed and not (Seed == UserSeed)) then
      local Valid = true
      
      if Seed then
        if not IsUserSeedValid(Seed,CopySeedErrors) then
          Valid = false
        end
      end
      
      if Valid then
        
        local NewSettings = {}
        for i = #RandomizerOptions,1,-1 do
          local Exp = math.floor(math.pow(2, i-1))
          if (i == #RandomizerOptions) and (Settings >= (Exp * 2)) then
            Settings = (Exp * 2) - 1
          end
          if Exp <= Settings then
            Settings = Settings - Exp
            RandoSetting[ RandomizerOptions[i][1] ] = true
            --print(RandomizerOptions[i][1],Exp,Settings,Value)
          else
            RandoSetting[ RandomizerOptions[i][1] ] = false
          end
        end
        
        if Seed then
          UserSeed = Seed
          RandomSeed = ConvertUserSeed(UserSeed)
        end
        UpdateSeedSettings()
        UpdateNeeded = true
        
      end
      
    end
    if not UpdateNeeded then
      messageDialog("The settings in the clipboard contain no differences from the current settings.",2,2)
    elseif CopyMenuOpen then
      CopyClick()
    end
  else
    messageDialog("The data in the clipboard does not contain seed settings, or is malformed.",0,2)
  end
end


local WarpCooldown = 10
local PlayerDeadAddress = 0x854401
local PlayerHPAddress = 0x8543D8
local PlayerDataOffset = 0x2C

function WarpClick(sender)
  if GameLoaded then
    writeBytes("gnazo.exe+850FDC",0) --Life Count
    local TwoPlayerMode = readBytes("gnazo.exe+91C24B",1)
    local CurrentCharacter1 = readBytes("gnazo.exe+B8E0F4",1)
    local CurrentCharacter2 = readBytes("gnazo.exe+B8E0F8",1)
    for i = 0,24,1 do
      local Offset = PlayerDataOffset * i
      writeBytes(string.format("gnazo.exe+%X", PlayerHPAddress+Offset), 0)
      if TwoPlayerMode == 0 then --Only Player 1
        if not (i == CurrentCharacter1) then
          writeBytes(string.format("gnazo.exe+%X", PlayerDeadAddress+Offset), 1)
        else
          writeBytes(string.format("gnazo.exe+%X", PlayerDeadAddress+Offset), 0)
        end
      elseif TwoPlayerMode == 1 then --Both Players
        if not ((i == CurrentCharacter1) or (i == CurrentCharacter2)) then
          writeBytes(string.format("gnazo.exe+%X", PlayerDeadAddress+Offset), 1)
        else
          writeBytes(string.format("gnazo.exe+%X", PlayerDeadAddress+Offset), 0)
        end
      elseif TwoPlayerMode == 2 then --Only Player 2
        if not (i == CurrentCharacter2) then
          writeBytes(string.format("gnazo.exe+%X", PlayerDeadAddress+Offset), 1)
        else
          writeBytes(string.format("gnazo.exe+%X", PlayerDeadAddress+Offset), 0)
        end
      end
    end
    setProperty(CETrainer.WarpToStage1,"Caption","RIP Everyone")
  end
  setProperty(CETrainer.WarpToStage1,"Enabled",false)
  WarpCooldown = 30
end

local TimeBeforeExecutingScript = 10
local TimeBeforeGameLost = 5
function myattach(timer)
  if not GameLoaded then
    if not CurrentlyRandomizing then
      if getProcessIDFromProcessName("gnazo.exe") ~= nil then
        if not GameFound then
          if SettingSeed then
            CancelSeedClick()
          end
          print("Process found...")
          GameFound = true
          setProperty(CETrainer.SetSeed,"Caption","Using Seed: "..UserSeed)
          setProperty(CETrainer.SetSeed,"Enabled",false)
          setProperty(CETrainer.CopyApply,"Enabled",false)
          setProperty(CETrainer.CopyApply,"Hint","Cannot apply settings while the game is running.")
        end
        TimeBeforeExecutingScript = TimeBeforeExecutingScript - 0.1
        if TimeBeforeExecutingScript <= 0 then
          TimeBeforeGameLost = 5
          TimeBeforeExecutingScript = 10
          GameLoaded = true
          openProcess("gnazo.exe")
          dofile(TrainerOrigin.."Randomizer_Runtime.lua")
        end
      end
    end
  else
    if getProcessIDFromProcessName("gnazo.exe") == nil then
      TimeBeforeGameLost = TimeBeforeGameLost - 0.1
      if TimeBeforeGameLost <= 0 then
        TimeBeforeGameLost = 5
        TimeBeforeExecutingScript = 10
        GameFound = false
        GameLoaded = false
        print("Game Closed")
        
        setProperty(CETrainer.SetSeed,"Caption","Set Seed (Current: "..UserSeed..")")
        setProperty(CETrainer.SetSeed,"Enabled",true)
        setProperty(CETrainer.CopyApply,"Enabled",true)
        setProperty(CETrainer.CopyApply,"Hint","Apply the seed settings from the clipboard. Will perform randomization operations if valid settings are found.")
        
        WarpCooldown = 20
        setProperty(CETrainer.WarpToStage1,"Caption","Instant Deathwarp")
        setProperty(CETrainer.WarpToStage1,"Enabled",false)
      end
    else
      TimeBeforeGameLost = 5
      if not (CurrentBoard == nil) then
        local RoomLoadedIndex = readInteger("gnazo.exe+51FB6C")
        local CurrentMusic = readBytes("gnazo.exe+855284",1)
        if not (RoomLoadedIndex == nil) then
          if CurrentMusic > 0 then
            for row = 1,5,1 do
              for column = 1,5,1 do
                if not CurrentBoard[row][column][1] then
                  local CurrentSquare = CurrentBoard[row][column][2]
                  local Achieved = false
                  if CurrentSquare[5] == "Byte" then --Equal to Byte
                    if readBytes(CurrentSquare[3], 1) == CurrentSquare[4] then
                      Achieved = true
                    end
                  elseif CurrentSquare[5] == "ByteGE" then --Greater Than or Equal To Byte
                    if readBytes(CurrentSquare[3], 1) >= CurrentSquare[4] then
                      Achieved = true
                    end
                  elseif CurrentSquare[5] == "Integer" then --Greater Than or Equal To Integer
                    if readInteger(CurrentSquare[3]) >= CurrentSquare[4] then
                      Achieved = true
                    end
                  elseif CurrentSquare[5] == "MultipleInteger" then --Greater Than or equal To Total of Integers
                    local Total = 0
                    for i = 1,#CurrentSquare[3],1 do
                      Total = Total + readInteger(CurrentSquare[3][i])
                    end
                    if Total >= CurrentSquare[4] then
                      Achieved = true
                    end
                  end
                  if Achieved then
                    CurrentBoard[row][column][1] = true
                    setProperty(BingoGrid[row][column],"Visible",false)
                    setImage(BingoGrid[row][column],CurrentSquare[1].."_Off")
                    setProperty(BingoGrid[row][column],"Visible",true)
                    setProperty(BingoGrid[row][column],"Hint",CurrentSquare[2].." (DONE)")
                  end
                end
              end
            end
          end
        end
      end
      if WarpCooldown > 0 then
        WarpCooldown = WarpCooldown - 0.1
        if WarpCooldown <= 0 then
          setProperty(CETrainer.WarpToStage1,"Caption","Instant Deathwarp")
          setProperty(CETrainer.WarpToStage1,"Enabled",true)
        end
      end
    end
  end
end

LoadBingoBoard()

t=createTimer(nil);
timer_setInterval(t,10)
timer_onTimer(t,myattach)