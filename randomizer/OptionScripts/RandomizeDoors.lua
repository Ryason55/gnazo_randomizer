--Do up the map arrows first
dofile(TrainerOrigin.."OptionScripts/MapHintArrows.lua")

--Remove the functions that write to the entrances in the entrance table in memory
--NOP all of this shit (alternating address and length)
local StageWritesToKill = {676835,10,676845,6,676856,7,676870,10,676880,6,676898,7,676912,10,676922,6,676943,7,676956,10,676966,6,676988,7,677001,10,677011,6,677033,6,677045,10,677055,6,677077,7,677090,10,677100,6,677126,6,677138,10,677148,6,677174,7,677187,10,677197,6,677218,7,677231,10,677241,6,677263,7,677276,10,677286,6,677304,7,677317,10,677327,6,677353,7,677366,10,677376,6,677402,7,677415,10,677425,6,677451,7,677464,10,677474,6,677496,7,677509,10,677519,6,677545,7,677558,10,677568,10,677598,7,677611,10,677621,6,677647,7,677660,10,677670,10,677695,7,677708,10,677718,6,677744,7,677758,10,677768,6,677790,6,677802,10,677812,6,677838,6,677851,10,677861,6,677883,7,677896,10,677906,6,677932,7,677945,10,677955,6,677972,7,677985,10,677995,6,678016,7,678029,10,678039,6,678065,7,678078,10,678088,6,678114,7,678127,10,678137,6,678158,7,678171,10,678181,6,678202,7,678215,10,678225,6,678243,7,678256,10,678266,6,678292,7,678305,10,678315,6,678336,7,678349,10,678359,6,678381,7,678394,10,678404,6,678430,7,678443,10,678453,6,678479,7,678492,10,678502,6,678528,7,678541,10,678551,6,678577,7,678590,10,678600,6,678621,6,678633,10,678643,6,678665,7,678678,10,678688,6,678714,7,678727,10,678737,6,678758,7,678771,10,678781,6,678807,7,678820,10,678830,6,678856,7,678869,10,678879,6,678905,7,678918,10,678928,6,678954,7,678967,10,678977,6,678999,6,679011,10,679021,6,679043,6,679056,10,679066,10,679092,7,679105,10,679115,6,679141,7,679154,10,679164,6,679186,7,679199,10,679209,6,679231,7,679244,10,679254,6,679276,7,679289,10,679299,6,679325,7,679338,10,679348,6,679374,7,679387,10,679397,6,679423,7,679436,10,679446,6,679468,7,679481,10,679491,10,679517,7,679530,10,679540,6,679558,7,679571,10,679581,6,679607,7,679620,10,679630,6,679652,7,679665,10,679675,6,679696,7,679709,10,679719,6,679740,7,679753,10,679763,6,679785,7,679798,10,679808,6,679830,7,679843,10,679853,6,679879,6,679892,10,679902,10,679928,6,679940,10,679950,6,679976,7,679990,10,680000,6,680026,7,680040,10,680050,6,680076,7,680090,10,680100,6,680126,6,680139,10,680149,6,680170,6,680182,10,680192,6,680218,6,680231,10,680241,6,680267,6,680280,10,680290,6,680311,6,680324,10,680334,10,680364,6,680377,10,680387,10,680417,6,680430,10,680440,6,680466,6,680479,10,680489,6,680511,7,680524,10,680534,10,680560,7,680573,10,680583,10,680609,7,680622,10,680632,6,680658,7,680671,10,680681,6,680707,7,680720,10,680730,6,680756,6,680768,10,680778,6,680800,6,680812,10,680822,6,680848,7,680861,10,680871,6,680897,7,680910,10,680920,6,680942,7,680955,10,680965,6,680986,7,680999,10,681009,6,681030,7,681043,10,681053,10,681083,7,681096,10,681106,6,681132,6,681144,10,681154,6,681180,6,681192,10,681202,6,681223,7,681236,10,681246,6,681267,7,681280,10,681290,6,681316,7,681329,5,681334,6,681360,7,681373,10,681383,6,681409,7,681422,10,681432,6,681458,7,681471,10,681481,6,681507,7,681520,10,681530,6,681552,7,681565,10,681575,6,681597,7,681610,10,681620,6,681646,7,681659,10,681669,6,681695,7,681709,10,681719,6,681741,7,681754,5,681759,6,681781,7,681794,10,681804,6,681830,6,681842,10,681852,6,681870,7,681884,10,681894,10,681924,7,681937,10,681947,10,681973,6,681985,10,681995,6,682021,7,682034,10,682044,6,682070,7,682083,6,682089,6,682115,7,682128,10,682138,6,682164,7,682177,10,682187,6,682209,7,682222,5,682227,10,682257,7,682270,10,682280,6,682302,7,682315,10,682325,6,682351,6,682363,10,682373,6,682394,7,682407,10,682417,6,682439,7,682452,10,682462,6,682488,7,682501,10,682511,6,682533,7,682546,10,682556,6,682578,6,682590,10,682600,6,682622,7,682635,10,682645,6,682667,7,682680,10,682690,10,682720,7,682733,10,682743,10,682768,7,682781,10,682791,6,682813,6,682825,10,682835,6,682861,6,682873,10,682883,6,682909,6,682921,10,682931,6,682957,6,682969,10,682979,6,683001,6,683013,10,683023,10,683048,6,683060,10,683070,6,683096,7,683109,10,683119,6,683140,7,683153,10,683163,6,683185,6,683197,10,683207,6,683229,7,683242,10,683252,6,683273,7,683286,10,683296,6,683322,6,683334,10,683344,10,683374,7,683387,10,683397,6,683418,7,683431,10,683441,6,683467,6,683479,10,683489,6,683515,7,683528,10,683538,6,683555,7,683568,10,683578,6,683604,6,683616,10,683626,6,683648,6,683660,10,683670,6,683696,6,683708,10,683718,6,683744,6,683757,10,683767,6,683788,7,683801,10,683811,6,683837,6,683850,10,683860,6,683881,6,683894,10,683904,6,683922,7,683935,10,683945,10,683966,7,683979,10,683989,6,684011,6,684023,10,684033,6,684055,6,684067,10,684077,6,684099,7,684112,10,684122,6,684144,7,684157,10,684167,6,684189,7,684202,10,684212,6,684234,7,684247,10,684257,6,684283,7,684296,10,684306,6,684328,6,684340,10,684350,6,684376,6,684388,10,684398,6,684419,6,684431,10,684441,6,684463,6,684475,10,684485,10,684511,7,684524,10,684534,6,684560,7,684573,10,684583,10,684613,7,684626,10,684636,6,684662,7,684675,10,684685,6,684706,7,684719,10,684729,6,684747,7,684760,10,684770,6,684792,7,684805,10,684815,6,684837,7,684850,10,684860,6,684886,7,684899,10,684909,6,684931,7,684944,10,684954,6,684976,6,684988,10,684998,6,685024,7,685037,10,685047,6,685069,7,685082,10,685092,6,685114,6,685127,10,685137,6,685163,7,685176,10,685186,6,685212,7,685225,10,685235,6,685252,7,685265,10,685275,6,685292,7,685305,10,685315,6,685336,7,685349,10,685359,6,685381,6,685393,10,685403,6,685424,7,685437,10,685447,10,685473,7,685486,10,685496,6,685522,6,685534,10,685544,6,685570,6,685582,10,685592,6,685618,6,685630,10,685640,6,685662,7,685675,10,685685,6,685711,7,685724,10,685734,6,685760,6,685772,10,685782,6,685803,6,685815,10,685825,6,685846,7,685859,10,685869,6,685891,7,685904,10,685914,6,685940,7,685953,10,685963,6,685985,7,685998,10,686008,6,686034,7,686047,10,686057,6,686083,7,686096,10,686106,6,686132,6,686144,10,686154,6,686180,7,686193,10,686203,6,686229,6,686241,10,686251,6,686277,6,686289,10,686299,10,686325,7,686338,10,686348,6,686369,7,686382,10,686392,6,686418,6,686430,10,686440,10,686465,7,686478,10,686488,6,686514,6,686526,10,686536,6,686562,7,686575,10,686585,10,686615,6,686627,10,686637,6,686663,7,686676,10,686686,6,686708,7,686721,10,686731,10,686757,6,686769,10,686779,6,686852,6,686864,10,686874,6,686896,6,686908,10,686918,6,686934,6,686946,10,686956,6,686978,6,686990,10,687000,6,687026,7,687039,10,687049,6,687061,7,687074,10,687084,6,687110,7,0xAC257,12,0xAC285,6} 
--local StageWritesToKill = {676835,10,676845,6,676870,10,676880,6,676912,10,676922,6,676956,10,676966,6,677001,10,677011,6,677045,10,677055,6,677090,10,677100,6,677138,10,677148,6,677187,10,677197,6,677231,10,677241,6,677276,10,677286,6,677317,10,677327,6,677366,10,677376,6,677415,10,677425,6,677464,10,677474,6,677509,10,677519,6,677558,10,677568,10,677611,10,677621,6,677660,10,677670,10,677708,10,677718,6,677758,10,677768,6,677802,10,677812,6,677851,10,677861,6,677896,10,677906,6,677945,10,677955,6,677985,10,677995,6,678029,10,678039,6,678078,10,678088,6,678127,10,678137,6,678171,10,678181,6,678215,10,678225,6,678256,10,678266,6,678305,10,678315,6,678349,10,678359,6,678394,10,678404,6,678443,10,678453,6,678492,10,678502,6,678541,10,678551,6,678590,10,678600,6,678633,10,678643,6,678678,10,678688,6,678727,10,678737,6,678771,10,678781,6,678820,10,678830,6,678869,10,678879,6,678918,10,678928,6,678967,10,678977,6,679011,10,679021,6,679056,10,679066,10,679105,10,679115,6,679154,10,679164,6,679199,10,679209,6,679244,10,679254,6,679289,10,679299,6,679338,10,679348,6,679387,10,679397,6,679436,10,679446,6,679481,10,679491,10,679530,10,679540,6,679571,10,679581,6,679620,10,679630,6,679665,10,679675,6,679709,10,679719,6,679753,10,679763,6,679798,10,679808,6,679843,10,679853,6,679892,10,679902,10,679940,10,679950,6,679990,10,680000,6,680040,10,680050,6,680090,10,680100,6,680139,10,680149,6,680182,10,680192,6,680231,10,680241,6,680280,10,680290,6,680324,10,680334,10,680377,10,680387,10,680430,10,680440,6,680479,10,680489,6,680524,10,680534,10,680573,10,680583,10,680622,10,680632,6,680671,10,680681,6,680720,10,680730,6,680768,10,680778,6,680812,10,680822,6,680861,10,680871,6,680910,10,680920,6,680955,10,680965,6,680999,10,681009,6,681043,10,681053,10,681096,10,681106,6,681144,10,681154,6,681192,10,681202,6,681236,10,681246,6,681280,10,681290,6,681329,5,681334,6,681373,10,681383,6,681422,10,681432,6,681471,10,681481,6,681520,10,681530,6,681565,10,681575,6,681610,10,681620,6,681659,10,681669,6,681709,10,681719,6,681754,5,681759,6,681794,10,681804,6,681842,10,681852,6,681884,10,681894,10,681937,10,681947,10,681985,10,681995,6,682034,10,682044,6,682083,6,682089,6,682128,10,682138,6,682177,10,682187,6,682222,5,682227,10,682270,10,682280,6,682315,10,682325,6,682363,10,682373,6,682407,10,682417,6,682452,10,682462,6,682501,10,682511,6,682546,10,682556,6,682590,10,682600,6,682635,10,682645,6,682680,10,682690,10,682733,10,682743,10,682781,10,682791,6,682825,10,682835,6,682873,10,682883,6,682921,10,682931,6,682969,10,682979,6,683013,10,683023,10,683060,10,683070,6,683109,10,683119,6,683153,10,683163,6,683197,10,683207,6,683242,10,683252,6,683286,10,683296,6,683334,10,683344,10,683387,10,683397,6,683431,10,683441,6,683479,10,683489,6,683528,10,683538,6,683568,10,683578,6,683616,10,683626,6,683660,10,683670,6,683708,10,683718,6,683757,10,683767,6,683801,10,683811,6,683850,10,683860,6,683894,10,683904,6,683935,10,683945,10,683979,10,683989,6,684023,10,684033,6,684067,10,684077,6,684112,10,684122,6,684157,10,684167,6,684202,10,684212,6,684247,10,684257,6,684296,10,684306,6,684340,10,684350,6,684388,10,684398,6,684431,10,684441,6,684475,10,684485,10,684524,10,684534,6,684573,10,684583,10,684626,10,684636,6,684675,10,684685,6,684719,10,684729,6,684760,10,684770,6,684805,10,684815,6,684850,10,684860,6,684899,10,684909,6,684944,10,684954,6,684988,10,684998,6,685037,10,685047,6,685082,10,685092,6,685127,10,685137,6,685176,10,685186,6,685225,10,685235,6,685265,10,685275,6,685305,10,685315,6,685349,10,685359,6,685393,10,685403,6,685437,10,685447,10,685486,10,685496,6,685534,10,685544,6,685582,10,685592,6,685630,10,685640,6,685675,10,685685,6,685724,10,685734,6,685772,10,685782,6,685815,10,685825,6,685859,10,685869,6,685904,10,685914,6,685953,10,685963,6,685998,10,686008,6,686047,10,686057,6,686096,10,686106,6,686144,10,686154,6,686193,10,686203,6,686241,10,686251,6,686289,10,686299,10,686338,10,686348,6,686382,10,686392,6,686430,10,686440,10,686478,10,686488,6,686526,10,686536,6,686575,10,686585,10,686627,10,686637,6,686676,10,686686,6,686721,10,686731,10,686769,10,686779,6,686864,10,686874,6,686908,10,686918,6,686946,10,686956,6,686990,10,687000,6,687039,10,687049,6,687074,10,687084,6,0xAC257,12,0xAC285,6}
for i = 1,#StageWritesToKill,2 do
  local ToWrite = {}
  for l = 1,StageWritesToKill[i+1],1 do
    table.insert(ToWrite,0x90)
  end
  writeBytes(string.format("gnazo.exe+%X",StageWritesToKill[i]),ToWrite)
end

--Door Addresses
local ObjectDoorTargetRoomAddress = 0x7F9C6C
local ObjectDoorTargetEntranceAddress = 0x7F9C70

--Map Arrows Address
local MapArrowsAddress = 0x92EB02
local MapArrowsOffset = 0xF8

--Map Stage Coords Addresses
local StageMapXCoordAddress = 0x92EAF0
local StageMapYCoordAddress = 0x92EAF4
local MapDataOffset = 0xF8

local YukariDestination = nil
local YukariTargetPosDefined = false
local HintArrowData = {}

--For these Entrances, adjust the appropriate shortcut address
local ShortcutAddresses = {}
ShortcutAddresses[302] = {}
ShortcutAddresses[302][1] = 0xABDE7 -- 40
ShortcutAddresses[302][4] = 0xABE18 -- 57
ShortcutAddresses[302][2] = 0xABE54 -- 105
ShortcutAddresses[302][3] = 0xABE90 -- 115
ShortcutAddresses[1191] = {}
ShortcutAddresses[1191][1] = 0xABECE -- 129
ShortcutAddresses[1500] = {}
ShortcutAddresses[1500][2] = 0xABF12 -- 163
ShortcutAddresses[1632] = {}
ShortcutAddresses[1632][3] = 0xABF45 -- 210
ShortcutAddresses[1892] = {}
ShortcutAddresses[1892][2] = 0xABF80 -- 211
ShortcutAddresses[10] = {}
ShortcutAddresses[10][1] = 0xABFBB -- 12
ShortcutAddresses[10][2] = 0xABFF2 -- 27
ShortcutAddresses[10][4] = 0xAC031 -- 30
ShortcutAddresses[10][3] = 0xAC064 -- 43
ShortcutAddresses[10][5] = 0xAC09E -- 69
ShortcutAddresses[10][6] = 0xAC0D8 -- 83
ShortcutAddresses[10][7] = 0xAC113 -- 119
ShortcutAddresses[10][8] = 0xAC14E -- 150
ShortcutAddresses[10][9] = 0xAC188 -- 179
ShortcutAddresses[10][10] = 0xAC1C2 -- 189
ShortcutAddresses[10][11] = 0xAC1FD -- 149

--Write the new entrance data to the entrance table in memory, while updating shortcuts and Stage 42 Yukari
for i = 1,#EntranceList,1 do
  local RoomID = EntranceList[i][1]
  local Stage = math.floor(RoomID/10)
  local Room = RoomID - (Stage*10)
  local Entrance = EntranceList[i][2]
  --print(i,Stage,Room,Entrance)
  local ExtraCount = 0
  if RoomID == 110 and Entrance == 2 then --The ice drop in Stage 11 has 2 doors, which the randomizer treats as one entrance
    ExtraCount = 1
  end
  for e = 0,ExtraCount,1 do
    local Address = 0x868C30 + (0xC80*(Stage-1)) + (0x140*Room) + (0x14*(Entrance+e))
    writeInteger(string.format("gnazo.exe+%X",Address),EntranceList[i][3])
    writeInteger(string.format("gnazo.exe+%X",Address+4),EntranceList[i][4])
    writeBytes(string.format("gnazo.exe+%X",Address+8),{EntranceList[i][5]-1})
    if ShortcutAddresses[RoomID] and ShortcutAddresses[RoomID][Entrance] then
      local StageB = math.floor(EntranceList[i][3]/10)
      local ShortcutAddress = ShortcutAddresses[RoomID][Entrance]
      local NewAddress = MapArrowsAddress + (((StageB-1) * MapArrowsOffset) + (Stage-1)) + GameMemoryOffset
      writeInteger(string.format("gnazo.exe+%X",ShortcutAddress),NewAddress)
    end
    if EntranceList[i][6] then
      if not HintArrowData[ EntranceList[i][3] ] then
        HintArrowData[ EntranceList[i][3] ] = {}
      end
      HintArrowData[ EntranceList[i][3] ][ EntranceList[i][4] ] = EntranceList[i][6]
    end
    if Stage == 42 and Entrance == 1 then
      writeInteger("gnazo.exe+3617A",EntranceList[i][3])
      YukariDestination = {EntranceList[i][3],EntranceList[i][4]}
      writeInteger("gnazo.exe+36170",0x8B66B0+GameMemoryOffset) --Storing the warp location here, in door data for Room 100-4 Entrance 0
      writeInteger("gnazo.exe+36186",0x8B66B4+GameMemoryOffset)
    elseif Stage == 29 and Entrance == 4 then --Realistically should use full room identifier, but its fiiiiine
      writeInteger(string.format("gnazo.exe+%X",Address-8),2240)
      writeInteger(string.format("gnazo.exe+%X",Address-4),20)
    end
  end
end

--Yuuen Sekai Stages (Don't know what I'll do with this)
StageBackgroundOverrides = {}
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
  local Byte = string.byte("ex\\ys_173back.png    ",n) -- 17-3 Background
  writeBytes(string.format("gnazo.exe+%X", 0x3066D0+(n-1) ),Byte)
  local Byte = string.byte("ex\\ys_174back.png    ",n) -- 17-4 Background
  writeBytes(string.format("gnazo.exe+%X", 0x3066B8+(n-1) ),Byte)
  if n <= 17 then
    local Byte = string.byte("ex\\ys_173fore.png",n) -- 17-3 Foreground
    writeBytes(string.format("gnazo.exe+%X", 0x315410+(n-1) ),Byte)
    local Byte = string.byte("ex\\ys_174fore.png",n) -- 17-4 Foreground
    writeBytes(string.format("gnazo.exe+%X", 0x3153FC+(n-1) ),Byte)
    local Byte = string.byte("ex\\ys_175fore.png",n) -- 17-5 Foreground
    writeBytes(string.format("gnazo.exe+%X", 0x3153E8+(n-1) ),Byte)
    if n <= 13 then
      local Byte = string.byte("ex\\ys173.png ",n) -- 17-3 Collision
      writeBytes(string.format("gnazo.exe+%X", 0x2F52E8+(n-1) ),Byte)
      local Byte = string.byte("ex\\ys174.png ",n) -- 17-4 Collision
      writeBytes(string.format("gnazo.exe+%X", 0x2F52D8+(n-1) ),Byte)
      local Byte = string.byte("ex\\ys175.png ",n) -- 17-5 Collision
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

local CurrentPlayerAbilities = {}

local AddAbility =
  function(PlayerAbilities,NewAbility)
    if NewAbility > 0 then
      if NewAbility <= 5 then --Jump abilities
        for a = NewAbility,1,-1 do
          PlayerAbilities[a] = true
          if PlayerAbilities[8] then --DarkJump; Check against Darkness
            PlayerAbilities[10+a] = true
          end
        end
      else --Anything else
        PlayerAbilities[NewAbility] = true
        if NewAbility == 8 then --DarkJump; Check against Jump
          for a = 1,5,1 do
            if PlayerAbilities[a] then
              PlayerAbilities[10+a] = true
            end
          end
        end
      end
    end
    return PlayerAbilities
  end

local AbilitiesUpdated = false --Based on opening/closing the map menus
local UpdatePlayerAbilities =
  function()
    local Abilities = {}
    CurrentPlayerAbilities = {}
    if RandoSetting["HardLogic"] then
      CurrentPlayerAbilities[8] = true
      CurrentPlayerAbilities[10] = true
    end
    if RandoSetting["SuperJump"] and (not RandoSetting["SoloCharacterChallenge"]) then
      CurrentPlayerAbilities[1] = true
      CurrentPlayerAbilities[2] = true
    end
    for a = 1,#CharsWithAbility,1 do
      if not CurrentPlayerAbilities[a] then
        if a < 11 then --Regular abilities; Check if we have a character with the ability
          local CharSet = CharsWithAbility[a]
          if a == 7 and RandoSetting["RandomizeAttacks"] then --Ice drop is randomized with this setting
            local _,CharsWithIce = ShuffleCharAttacks()
            CharSet = CharsWithIce
          end
          for b = 1,#CharSet,1 do
            local Char = nil
            local RequireLevel = nil
            local Data = CharSet[b]
            if type(Data) == "table" then
              Char = Data[1]
              RequireLevel = Data[2]
            else
              Char = Data
            end
            local Offset = (CharOffset*Char)
            if readBytes(string.format("gnazo.exe+%X",CharacterJoinedAddress+Offset),1) >= 1 then
              if (not RequireLevel) or (readBytes(string.format("gnazo.exe+%X",CharacterAbilityLevelAddress+Offset),1) >= RequireLevel) then
                CurrentPlayerAbilities[a] = true
                table.insert(Abilities,a)
                break
              end
            end
          end
        elseif CurrentPlayerAbilities[8] then --DarkJump; Check if we have Night Vision and appropriate Jump levels
          for i = 1,5,1 do
            if CurrentPlayerAbilities[i] then
              CurrentPlayerAbilities[10+i] = true
              table.insert(Abilities,10+i)
            end
          end
        end
      end
    end
    
    DebugPrint("Abilities:",table.concat(Abilities,","))
  end

local ArrowsApplied = {}
table.insert(ObjectTypesToHandle,{"Door",35000,35300})

local WriteArrow = --But when is WriteSparrow
  function(Type,StageA,StageB)
    local Address = MapArrowsAddress + (((StageA-1) * MapArrowsOffset) + (StageB-1))
    local CurrentValue = readBytes(string.format("gnazo.exe+%X", Address),1)
    local ReverseAddress = MapArrowsAddress + (((StageB-1) * MapArrowsOffset) + (StageA-1))
    local ReverseValue = readBytes(string.format("gnazo.exe+%X", ReverseAddress),1)
    local Connected = (CurrentValue == 1) or (ReverseValue == 1)
    if (Type == 1) or ( ( (Type > 1) and (not Connected) ) or (CurrentValue >= 2) ) then
      writeBytes(string.format("gnazo.exe+%X",Address),Type)
    end
  end
  
local WriteHintArrows =
  function(TargetRoom,TargetEntranceID)
    local CurrentStage = math.floor(CurrentRoom/10)
    local DestinationStage = math.floor(DestinationRoom/10)
    if HintArrowData[TargetRoom] and HintArrowData[TargetRoom][TargetEntranceID] then
      DebugPrint("Activating Hint Arrows for Door leading to Stage",DestinationStage)
      local ArrowData = HintArrowData[TargetRoom][TargetEntranceID]
      for ar = 1,#ArrowData,1 do
        local Add = 0
        local RequireAbility = ArrowData[ar][2]
        if RequireAbility and (not CurrentPlayerAbilities[RequireAbility]) then
          Add = ArrowData[ar][2]
        end
        WriteArrow(2+Add,DestinationStage,ArrowData[ar][1])
        
        --print("Arrow",ar,"-",ArrowData[ar][1],Add)
        --[[local Address = MapArrowsAddress + ((DestinationStage * MapArrowsOffset) + (ArrowData[ar][1]-1))
        print(DestinationStage+1,ArrowData[ar][1],Address,Add)
        local ReverseAddress = MapArrowsAddress + (((ArrowData[ar][1]-1) * MapArrowsOffset) + DestinationStage)
        if not ((readBytes(string.format("gnazo.exe+%X", Address),1) == 1) or (readBytes(string.format("gnazo.exe+%X", ReverseAddress),1) == 1)) then
          writeBytes(string.format("gnazo.exe+%X", Address),2+Add)
        end]]
      end
    end
    if not (DestinationStage == CurrentStage) then
      WriteArrow(0,DestinationStage,CurrentStage) --Clear any blue arrows on the reverse connection
    end
    --[[local ReverseAddress = MapArrowsAddress + ((CurrentStage * MapArrowsOffset) + DestinationStage)
    if (readBytes(string.format("gnazo.exe+%X", ReverseAddress),1) >= 2) then
      writeBytes(string.format("gnazo.exe+%X", ReverseAddress),0)
    end]]
  end
  
local SpecialArrowsWritten = false

local AddFunc =
  function()
  
    --Misc room-based things
    if DestinationRoom == 0 then --Throw the player back in the room they were in instead of bringing up Stage 0
      if not (CurrentRoom == 0) then
        DestinationRoom = CurrentRoom
        writeInteger("gnazo.exe+33D690",CurrentRoom) --Destination Room ID
      end
    elseif DestinationRoom == 173 then
      writeFloat("gnazo.exe+7F7E50",736) --Destination X Coord
      writeFloat("gnazo.exe+93C8D0",65) --Destination Y Coord
    elseif DestinationRoom == 174 or DestinationRoom == 175 then
      writeFloat("gnazo.exe+7F7E50",672) --Destination X Coord
    elseif not SpecialArrowsWritten then
      if CurrentRoom == 420 and (not (DestinationRoom == 420) or (DestinationRoom == 430)) then --Write Door Connection from the Stage 42 Yukari
        local DestinationStage = math.floor(DestinationRoom/10)
        WriteArrow(1,42,DestinationStage)
        if YukariDestination then
          WriteHintArrows(YukariDestination[1],YukariDestination[2])
        end
        SpecialArrowsWritten = true
      elseif CurrentRoom == 10 and DestinationRoom == 10 then
        WriteHintArrows(10,1)
        SpecialArrowsWritten = true
      end
    end
    
    --Set Stage 42's Yukari's warp position when it's loaded into memory
    if YukariDestination and not YukariTargetPosDefined then
      local Stage = math.floor(YukariDestination[1]/10)
      local Room = YukariDestination[1] - (Stage*10)
      local Entrance = YukariDestination[2]
      local Address = 0x868C28 + (0xC80*(Stage-1)) + (0x140*Room) + (0x14*Entrance)
      local DestX = readInteger(string.format("gnazo.exe+%X",Address))
      local DestY = readInteger(string.format("gnazo.exe+%X",Address+4))
      if not ((DestX == 0) and (DestY == 0)) then
        local BytesX = floatToByteTable(DestX)
        writeBytes("gnazo.exe+8B66B0",BytesX)
        local BytesY = floatToByteTable(DestY)
        writeBytes("gnazo.exe+8B66B4",BytesY)
        YukariTargetPosDefined = true
      end
    end
    
    --Keep map screen up-to-date
    if (not (CurrentTitleScreenMenu == 9)) and (CurrentMusic > 0) and ((IngameMenu == 4) or (IngameMenu == 6)) then --Stage Transition or Pause Menu (ignoring boss challenge)
      if not AbilitiesUpdated then
        DebugPrint("Updating map")
        UpdatePlayerAbilities()
        local UpperBound = 590 --640 by the end
        local LowerBound = -570
        for a = 1,220,1 do --Map Fixer
          if not (MapCoords[a] == nil) then
            local Offset = (MapDataOffset*(a-1))
            writeInteger(string.format("gnazo.exe+%X", StageMapXCoordAddress+Offset),MapCoords[a][1])
            writeInteger(string.format("gnazo.exe+%X", StageMapYCoordAddress+Offset),MapCoords[a][2])
            local LowerMod = 640
            for xy = 1,2,1 do
              if UpperBound < -MapCoords[a][xy] then
                UpperBound = -MapCoords[a][xy]
              end
              if LowerBound > -MapCoords[a][xy] + LowerMod then
                LowerBound = -MapCoords[a][xy] + LowerMod
              end
              LowerMod = 480
            end
          end
          for b = 1,220,1 do --Compare the player's abilities against any currently locked paths
            if not (a == b) then
              local Address = MapArrowsAddress + (((a-1) * MapArrowsOffset) + (b-1))
              local Value = readBytes(string.format("gnazo.exe+%X", Address),1)
              if Value > 2 and CurrentPlayerAbilities[Value-2] then
                writeBytes(string.format("gnazo.exe+%X", Address),2)
              end
            end
          end
        end
        writeInteger("gnazo.exe+5FCC5",UpperBound+50) --Positive Initial
        writeInteger("gnazo.exe+5FD7C",UpperBound+50) --Positive Move
        writeInteger("gnazo.exe+5FCD8",LowerBound-70) --Negative Initial
        writeInteger("gnazo.exe+5FDE9",LowerBound-70) --Negative Move
        DebugPrint(UpperBound,LowerBound)
        AbilitiesUpdated = true
      end
    elseif AbilitiesUpdated then
      DebugPrint("var reset")
      AbilitiesUpdated = false
      CurrentPlayerAbilities = {}
    end
    
    if not ChangingRooms then
      if TrackedObjects and TrackedObjects["Door"] then
        for i = 1,#TrackedObjects["Door"],1 do
          if not ArrowsApplied[i] then
            local ObjectPos = TrackedObjects["Door"][i]
            local Offset = ObjectDataOffset * (ObjectPos - 1)
            local ObjectState = readBytes(string.format("gnazo.exe+%X", ObjectStateAddress+Offset), 1)
            --print("Door",i..":",ObjectState)
            
            if ObjectState == 4 and (not (CurrentRoom == DestinationRoom)) then --Apply hint arrows on door transition
              local TargetRoom = readInteger(string.format("gnazo.exe+%X", ObjectDoorTargetRoomAddress+Offset))
              local TargetEntranceID = readBytes(string.format("gnazo.exe+%X", ObjectDoorTargetEntranceAddress+Offset),1)
              WriteHintArrows(TargetRoom,TargetEntranceID)
              ArrowsApplied[i] = true
            end
            
          end
        end
        --print("------")
        
      end
    elseif ClearRoomData then
      ArrowsApplied = {}
      SpecialArrowsWritten = false
    end
    
  end
  
table.insert(RuntimeFunctions,AddFunc)