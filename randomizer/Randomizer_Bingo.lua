local BingoConditions = {}
--Image Filename, Condition Text, Memory Address to Check, Value it must be to be achieved, Value Type
BingoConditions[1] = {"Alice","Recruit Alice","gnazo.exe+854458",1,"ByteGE"}
BingoConditions[2] = {"Cirno","Recruit Cirno","gnazo.exe+854484",1,"ByteGE"}
BingoConditions[3] = {"Meiling","Recruit Meiling","gnazo.exe+8544B0",1,"ByteGE"}
BingoConditions[4] = {"Patchouli","Recruit Patchouli","gnazo.exe+8544DC",1,"ByteGE"}
BingoConditions[5] = {"Sakuya","Recruit Sakuya","gnazo.exe+854508",1,"ByteGE"}
BingoConditions[6] = {"Remilia","Recruit Remilia","gnazo.exe+854534",1,"ByteGE"}
BingoConditions[7] = {"Youmu","Recruit Youmu","gnazo.exe+854560",1,"ByteGE"}
BingoConditions[8] = {"Yuyuko","Recruit Yuyuko","gnazo.exe+85458C",1,"ByteGE"}
BingoConditions[9] = {"Rumia","Recruit Rumia","gnazo.exe+8545B8",1,"ByteGE"}
BingoConditions[10] = {"Daiyousei","Recruit Daiyousei","gnazo.exe+8545E4",1,"ByteGE"}
BingoConditions[11] = {"Flandre","Recruit Flandre","gnazo.exe+854610",1,"ByteGE"}
BingoConditions[12] = {"Keine","Recruit Keine","gnazo.exe+854668",1,"ByteGE"}
BingoConditions[13] = {"Tewi","Recruit Tewi","gnazo.exe+854694",1,"ByteGE"}
BingoConditions[14] = {"Reisen","Recruit Reisen","gnazo.exe+8546C0",1,"ByteGE"}
BingoConditions[15] = {"Eirin","Recruit Eirin","gnazo.exe+8546EC",1,"ByteGE"}
BingoConditions[16] = {"Kaguya","Recruit Kaguya","gnazo.exe+854718",1,"ByteGE"}
BingoConditions[17] = {"Mokou","Recruit Mokou","gnazo.exe+854744",1,"ByteGE"}
BingoConditions[18] = {"Nitori","Recruit Nitori","gnazo.exe+854770",1,"ByteGE"}
BingoConditions[19] = {"Aya","Recruit Aya","gnazo.exe+85479C",1,"ByteGE"}
BingoConditions[20] = {"Sanae","Recruit Sanae","gnazo.exe+8547C8",1,"ByteGE"}
BingoConditions[21] = {"Suwako","Recruit Suwako","gnazo.exe+854820",1,"ByteGE"}
BingoConditions[22] = {"ChestWooden50","Collect 50 Wooden Chests","gnazo.exe+B84FA4",50,"Integer"}
BingoConditions[23] = {"ChestCopper50","Collect 50 Copper Chests","gnazo.exe+B84FA8",50,"Integer"}
BingoConditions[24] = {"ChestSilver20","Collect 20 Silver Chests","gnazo.exe+B84FAC",20,"Integer"}
BingoConditions[25] = {"ChestGold10","Collect 10 Golden Chests","gnazo.exe+B84FB0",10,"Integer"}
BingoConditions[26] = {"Score1M","Obtain a Score of 1,000,000 or higher at any point","gnazo.exe+91BFB4",1000000,"Integer"}
BingoConditions[27] = {"Door50","Visit 50 stages","gnazo.exe+B84F4C",50,"Integer"}
BingoConditions[28] = {"Door100","Visit 100 stages","gnazo.exe+B84F4C",100,"Integer"}
BingoConditions[29] = {"Door150","Visit 150 stages","gnazo.exe+B84F4C",150,"Integer"}
BingoConditions[30] = {"Door200","Visit 200 stages","gnazo.exe+B84F4C",200,"Integer"}
BingoConditions[31] = {"SphereSpirit5","Collect 5 or more Spirit Spheres",{"gnazo.exe+B34AE0","gnazo.exe+8541E0"},5,"MultipleInteger"}
BingoConditions[32] = {"SphereSpirit10","Collect 10 or more Spirit Spheres",{"gnazo.exe+B34AE0","gnazo.exe+8541E0"},10,"MultipleInteger"}
BingoConditions[33] = {"SphereHealth5","Collect 5 or more Health Spheres",{"gnazo.exe+B865DC","gnazo.exe+B34B3C"},5,"MultipleInteger"}
BingoConditions[34] = {"SphereHealth10","Collect 10 or more Health Spheres",{"gnazo.exe+B865DC","gnazo.exe+B34B3C"},10,"MultipleInteger"}
BingoConditions[35] = {"SphereAbility5","Collect 5 or more Ability Spheres","gnazo.exe+91CF44",5,"Integer"}
BingoConditions[36] = {"SphereAbility10","Collect 10 or more Ability Spheres","gnazo.exe+91CF44",10,"Integer"}
BingoConditions[37] = {"Lives","Amass at least 30 lives at any point","gnazo.exe+850FDC",30,"Integer"}
BingoConditions[38] = {"Stage55","Collect the treasure in Stage 55 and finish the stage","gnazo.exe+931F50",1,"Byte"}
BingoConditions[39] = {"Stage59","Collect the treasure in Stage 59 and finish the stage","gnazo.exe+932330",1,"Byte"}
BingoConditions[40] = {"Stage84","Collect the treasure in Stage 84 and finish the stage","gnazo.exe+933B68",1,"Byte"}

local PossibleLines = {} --Unused ATM
PossibleLines[1] = {1,1},{1,2},{1,3},{1,4},{1,5}
PossibleLines[2] = {2,1},{2,2},{2,3},{2,4},{2,5}
PossibleLines[3] = {3,1},{3,2},{3,3},{3,4},{3,5}
PossibleLines[4] = {4,1},{4,2},{4,3},{4,4},{4,5}
PossibleLines[5] = {5,1},{5,2},{5,3},{5,4},{5,5}
PossibleLines[6] = {1,1},{2,1},{3,1},{4,1},{5,1}
PossibleLines[7] = {1,2},{2,2},{3,2},{4,2},{5,2}
PossibleLines[8] = {1,3},{2,3},{3,3},{4,3},{5,3}
PossibleLines[9] = {1,4},{2,4},{3,4},{4,4},{5,4}
PossibleLines[10] = {1,5},{2,5},{3,5},{4,5},{5,5}
PossibleLines[11] = {1,1},{2,2},{3,3},{4,4},{5,5}
PossibleLines[12] = {1,5},{2,4},{3,3},{4,2},{5,1}

local ConditionInUse = {}
local CurrentBoard = {}

math.randomseed(BingoSeed)
for row = 1,5,1 do
  CurrentBoard[row] = {}
  for column = 1,5,1 do
    if (row == 3) and (column == 3) then
      CurrentBoard[row][column] = {false,{"Kanako","Beat the game and Recruit Kanako","gnazo.exe+8547F4",1,"ByteGE"}}
    else
      if OnlyCharactersMode then
        while true do
          local Index = math.random(1,24)
          if not ConditionInUse[Index] then
            ConditionInUse[Index] = true
            if Index == 22 then
              CurrentBoard[row][column] = {false,{"Reimu","Start the game","gnazo.exe+854400",1,"ByteGE"}}
            elseif Index == 23 then
              CurrentBoard[row][column] = {false,{"Marisa","But where do you get Marisa NotLikeThis","gnazo.exe+85442C",1,"ByteGE"}}
            elseif Index == 24 then
              CurrentBoard[row][column] = {false,{"Yukari","Recruit all characters, including Yukari","gnazo.exe+85463C",1,"ByteGE"}}
            else
              CurrentBoard[row][column] = {false,BingoConditions[Index]}
            end
            break
          end
        end
      else
        while true do
          local Index = math.random(1,#BingoConditions)
          if not ConditionInUse[Index] then
            ConditionInUse[Index] = true
            CurrentBoard[row][column] = {false,BingoConditions[Index]}
            break
          end
        end
      end
    end
  end
end

return CurrentBoard