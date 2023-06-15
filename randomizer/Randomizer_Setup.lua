--Mystery of Gensokyo Randomizer setup script

--  1 - Destination Door
--  2 - Destination Entrance ID
--  3 - Self Entrance ID
--  4 - Door Color
--  5 - Is Shortcut
--  6 - Requirement to access other doors
--  7 - Requirement to access *this* door
--  8 - Can be reached from these Doors (if not all)
--  9 - One-way Properties
-- 10 - Connection Tag (auto)
-- 11 - Connected Doorway (auto)
-- 12 - Connected Doorway 2 (for One-Way Targets) (auto)
-- 13 - Been used for cleanup branch (auto)
-- 14 - Chosen Door Color (auto)
-- 15 - Door Data String to bake (auto)

local DoorConnections = {}
DoorConnections[10] = {}
DoorConnections[10][1] = {120,1,1,3,true}
DoorConnections[10][2] = {270,1,2,1,true}
DoorConnections[10][3] = {430,1,3,2,true}
DoorConnections[10][4] = {302,0,4,3,true}
DoorConnections[10][5] = {690,1,5,2,true}
DoorConnections[10][6] = {830,1,6,3,true}
DoorConnections[10][7] = {1191,2,7,2,true}
DoorConnections[10][8] = {1500,1,8,2,true}
DoorConnections[10][9] = {1790,1,9,2,true}
DoorConnections[10][10] = {1892,1,10,4,true}
DoorConnections[10][11] = {1490,1,11,2,true}
DoorConnections[11] = {}
DoorConnections[11][1] = {20,0,0,1,false}
DoorConnections[12] = {}
DoorConnections[12][1] = {40,0,0,1,false}
DoorConnections[12][2] = {110,1,1,2,false,-1 } --One-way

DoorConnections[20] = {}
DoorConnections[20][1] = {11,0,0,1,false}
DoorConnections[22] = {}
DoorConnections[22][1] = {30,0,0,2,false}
DoorConnections[22][2] = {170,0,1,1,false}

DoorConnections[30] = {}
DoorConnections[30][1] = {22,0,0,2,false}
DoorConnections[30][2] = {60,0,1,3,false,-1} --One-way
DoorConnections[31] = {}
DoorConnections[31][1] = {70,0,0,3,false}

DoorConnections[40] = {}
DoorConnections[40][1] = {12,0,0,1,false}
DoorConnections[42] = {}
DoorConnections[42][1] = {50,0,0,1,false}

DoorConnections[50] = {}
DoorConnections[50][1] = {42,0,0,1,false}
DoorConnections[50][2] = {140,0,1,1,false}
DoorConnections[52] = {}
DoorConnections[52][1] = {100,0,0,1,false}
DoorConnections[53] = {}
DoorConnections[53][1] = {220,0,0,1,false}

DoorConnections[60] = {}
DoorConnections[60][1] = {140,1,1,2,false,-1} --One-way
DoorConnections[60][2] = {10,0,0,3,false,false,-1} --One-way Target

DoorConnections[70] = {} --Passable dark room
DoorConnections[70][1] = {31,0,0,3,false}
DoorConnections[70][2] = {92,0,1,3,false,false,false,{{70,3}} }
DoorConnections[70][3] = {120,0,2,3,false,false,false,{{70,2}} }
DoorConnections[71] = {}
DoorConnections[71][1] = {80,0,0,3,false}
DoorConnections[71][2] = {350,0,1,2,false,false,8} --Difficult to get without night vision
DoorConnections[71][3] = {10,0,2,2,false,false,-1} --One-way Target (from 11-0)

DoorConnections[80] = {} --Passable dark room
DoorConnections[80][1] = {71,0,0,3,false}
DoorConnections[80][2] = {150,0,1,2,false}
DoorConnections[82] = {}
DoorConnections[82][1] = {90,0,0,3,false}

DoorConnections[90] = {} --Passable dark room
DoorConnections[90][1] = {82,0,0,3,false}
DoorConnections[92] = {}
DoorConnections[92][1] = {70,1,0,3,false}

DoorConnections[100] = {}
DoorConnections[100][1] = {52,0,0,1,false}
DoorConnections[100][2] = {130,0,1,1,false}
DoorConnections[101] = {}
DoorConnections[101][1] = {142,0,0,1,false}
DoorConnections[101][2] = {133,0,1,1,false}
DoorConnections[101][3] = {2070,0,2,4,false,-1,6} --One-way (Clouds)

DoorConnections[110] = {} --Passable dark room
DoorConnections[110][1] = {71,2,0,2,false,-1 }
DoorConnections[110][2] = {330,2,2,2,false,-1,7 } --2 doors; Entrance 2 & 3
DoorConnections[110][3] = {10,0,1,2,false,false,-1} --One-way Target

DoorConnections[120] = {} --Dark room
DoorConnections[120][1] = {70,2,0,3,false,8,8} --The doors on the right require jumping over pits in the darkness (Normally you get Rumia before this room)
DoorConnections[120][2] = {10,1,1,3,false,8,8}
DoorConnections[120][3] = {270,2,2,3,false}
DoorConnections[120][4] = {721,1,3,3,false,false,1}

DoorConnections[130] = {}
DoorConnections[130][1] = {100,1,0,1,false}
DoorConnections[132] = {}
DoorConnections[132][1] = {160,0,0,1,false}
DoorConnections[133] = {}
DoorConnections[133][1] = {101,1,0,1,false,false,0}

DoorConnections[140] = {}
DoorConnections[140][1] = {50,1,0,1,false}
DoorConnections[140][2] = {10,0,1,2,false,false,-1} --One-way Target
DoorConnections[142] = {}
DoorConnections[142][1] = {101,0,0,1,false}

DoorConnections[150] = {}
DoorConnections[150][1] = {80,1,0,2,false,0,0} --Dead End (dark)

DoorConnections[160] = {}
DoorConnections[160][1] = {132,0,0,1,false}
DoorConnections[162] = {}
DoorConnections[162][1] = {430,0,0,2,false}

DoorConnections[170] = {}
DoorConnections[170][1] = {22,1,0,1,false}
DoorConnections[172] = {}
DoorConnections[172][1] = {180,0,0,1,false}

DoorConnections[180] = {}
DoorConnections[180][1] = {172,0,0,1,false}
DoorConnections[180][2] = {232,0,1,1,false,false,5}
DoorConnections[183] = {}
DoorConnections[183][1] = {200,0,0,1,false}

DoorConnections[190] = {}
DoorConnections[190][1] = {201,0,0,1,false}
DoorConnections[190][2] = {880,0,1,3,false,false,1}
DoorConnections[191] = {}
DoorConnections[191][1] = {210,0,0,1,false}
DoorConnections[191][2] = {202,0,1,1,false}
DoorConnections[191][3] = {242,0,2,1,false,false,3}
DoorConnections[191][4] = {1421,0,3,3,false,false,1}

DoorConnections[200] = {}
DoorConnections[200][1] = {183,0,0,1,false,false,false,{{201,1}} }
DoorConnections[201] = {}
DoorConnections[201][1] = {190,0,0,1,false,false,false,{{200,1}} }
DoorConnections[201][2] = {230,0,1,2,false,false,false,{{202,1}} }
DoorConnections[201][3] = {260,0,2,2,false,false,false,{{201,4},{200,1,7},{201,1,7}} }
DoorConnections[201][4] = {740,2,3,1,false,false,false,{{201,3},{200,1,7},{201,1,7}} }
DoorConnections[202] = {}
DoorConnections[202][1] = {191,1,0,1,false,false,false,{{201,2}} }

DoorConnections[210] = {}
DoorConnections[210][1] = {191,0,0,1,false}
DoorConnections[210][2] = {240,0,1,1,false}

DoorConnections[220] = {}
DoorConnections[220][1] = {53,0,0,1,false,0,0} --Dead End

DoorConnections[230] = {}
DoorConnections[230][1] = {201,1,0,1,false,false,0}
DoorConnections[232] = {}
DoorConnections[232][1] = {180,1,0,1,false}
DoorConnections[232][2] = {250,0,1,1,false}

DoorConnections[240] = {}
DoorConnections[240][1] = {210,1,0,1,false}
DoorConnections[242] = {}
DoorConnections[242][1] = {191,2,0,1,false}

DoorConnections[250] = {}
DoorConnections[250][1] = {232,1,0,1,false}
DoorConnections[253] = {}
DoorConnections[253][1] = {270,0,0,1,false}

DoorConnections[260] = {}
DoorConnections[260][1] = {201,2,0,2,false}
DoorConnections[260][2] = {310,1,1,2,false}

DoorConnections[270] = {}
DoorConnections[270][1] = {253,0,0,1,false,false,false,{{270,2}} }
DoorConnections[270][2] = {10,2,1,1,false,false,false,{{270,1}} }
DoorConnections[270][3] = {120,2,2,1,false,false,0}
DoorConnections[272] = {}
DoorConnections[272][1] = {280,0,0,1,false,0,false}

DoorConnections[280] = {}
DoorConnections[280][1] = {272,0,0,1,false}
DoorConnections[281] = {}
DoorConnections[281][1] = {290,1,0,2,false,false,0}
DoorConnections[282] = {}
DoorConnections[282][1] = {291,0,0,2,false,5,false}
DoorConnections[283] = {}
DoorConnections[283][1] = {290,0,0,1,false}

DoorConnections[290] = {}
DoorConnections[290][1] = {283,0,0,1,false}
DoorConnections[290][2] = {281,0,1,2,false,false,false,{{291,1},{290,1,3},{293,1,3},{293,2,3},{293,3,3},{293,5,3}} }
DoorConnections[291] = {}
DoorConnections[291][1] = {282,0,0,2,false,false,false,{{290,2},{290,1,3},{293,1,3},{293,2,3},{293,3,3},{293,5,3}} }
DoorConnections[293] = {}
DoorConnections[293][1] = {300,0,0,1,false }
DoorConnections[293][2] = {320,0,1,1,false }
DoorConnections[293][3] = {310,0,3,1,false }
DoorConnections[293][4] = {420,0,2,2,false,-1} --One-way
DoorConnections[293][5] = {10,0,4,3,false,false,-1} --One-way Target (New)

DoorConnections[300] = {}
DoorConnections[300][1] = {293,0,0,1,false}
DoorConnections[301] = {}
DoorConnections[301][1] = {330,0,0,3,false}
DoorConnections[302] = {}
DoorConnections[302][1] = {10,4,0,3,false}
DoorConnections[302][2] = {1050,1,2,3,true}
DoorConnections[302][3] = {1150,2,3,3,true}
DoorConnections[302][4] = {572,1,4,3,true}

DoorConnections[310] = {}
DoorConnections[310][1] = {293,3,0,1,false,0,false}
DoorConnections[310][2] = {260,1,1,2,false,false,0}

DoorConnections[320] = {}
DoorConnections[320][1] = {293,1,0,1,false,5,false}
DoorConnections[320][2] = {350,1,1,2,false,false,5}

DoorConnections[330] = {}
DoorConnections[330][1] = {301,0,0,3,false,false,false,{{331,1}} }
DoorConnections[330][2] = {341,0,1,1,false,0,false}
DoorConnections[330][3] = {10,0,2,2,false,false,-1} --One-way Target
DoorConnections[331] = {}
DoorConnections[331][1] = {340,0,0,1,false,false,false,{{330,1}} }

DoorConnections[340] = {}
DoorConnections[340][1] = {331,0,0,1,false,false,0}
DoorConnections[340][2] = {360,1,1,1,false,false,false,{{340,3}} }
DoorConnections[340][3] = {381,1,2,1,false,false,false,{{340,2}} }
DoorConnections[341] = {}
DoorConnections[341][1] = {330,1,0,1,false,false,false,{{340,1},{342,1}} }
DoorConnections[342] = {}
DoorConnections[342][1] = {360,0,0,1,false,false,false,{{340,1},{341,1}} }
DoorConnections[342][2] = {380,1,1,1,false,0,0} --Dead End; Red Orb
DoorConnections[342][3] = {370,1,2,1,false,-1,false,{{340,1},{341,1},{342,1}}} --One-way

DoorConnections[350] = {} --Dark room
DoorConnections[350][1] = {71,1,0,2,false,8,8}
DoorConnections[350][2] = {320,1,1,2,false,8,8}

DoorConnections[360] = {} --Passable dark room (?)
DoorConnections[360][1] = {342,0,0,1,false}
DoorConnections[360][2] = {340,1,1,1,false,0,7} --Ice Drop into enclosed space
DoorConnections[360][3] = {370,0,2,2,false}
DoorConnections[360][4] = {410,0,3,3,false}

DoorConnections[370] = {}
DoorConnections[370][1] = {360,2,0,2,false}
DoorConnections[370][2] = {10,0,1,1,false,false,-1} --One-way Target
DoorConnections[372] = {}
DoorConnections[372][1] = {380,0,0,1,false,2,false} --Requires high jump

DoorConnections[380] = {} --Dark room
DoorConnections[380][1] = {372,0,0,1,false,8,8}
DoorConnections[380][2] = {342,1,1,1,false,8,8}
DoorConnections[381] = {}
DoorConnections[381][1] = {390,0,0,1,false,8,8}
DoorConnections[381][2] = {340,2,1,1,false,8,0}

DoorConnections[390] = {}
DoorConnections[390][1] = {381,0,0,1,false}
DoorConnections[390][2] = {731,1,1,2,false}
DoorConnections[391] = {}
DoorConnections[391][1] = {400,0,0,1,false}

DoorConnections[400] = {}
DoorConnections[400][1] = {391,0,0,1,false}
DoorConnections[402] = {}
DoorConnections[402][1] = {560,0,0,1,false}

DoorConnections[410] = {}
DoorConnections[410][1] = {360,3,0,3,false,1,1} --Requires high jump
DoorConnections[410][2] = {530,0,1,3,false,1,1}

DoorConnections[420] = {}
DoorConnections[420][1] = {293,4,1,3,false,-1} --One-way (Yukari)
DoorConnections[420][2] = {293,2,0,2,false,false,-1} --One-way Target

DoorConnections[430] = {}
DoorConnections[430][1] = {162,0,0,1,false}
DoorConnections[430][2] = {10,3,1,2,false}
DoorConnections[431] = {}
DoorConnections[431][1] = {450,0,0,2,false}

DoorConnections[440] = {} --Dark room
DoorConnections[440][1] = {461,0,0,2,false,8,8}
DoorConnections[440][2] = {571,1,1,1,false,8,8}

DoorConnections[450] = {}
DoorConnections[450][1] = {431,0,0,2,false}
DoorConnections[453] = {}
DoorConnections[453][1] = {460,0,0,2,false}

DoorConnections[460] = {}
DoorConnections[460][1] = {453,0,0,2,false}
DoorConnections[461] = {}
DoorConnections[461][1] = {440,0,0,2,false}
DoorConnections[462] = {}
DoorConnections[462][1] = {470,0,0,1,false}

DoorConnections[470] = {}
DoorConnections[470][1] = {462,0,0,1,false}
DoorConnections[471] = {}
DoorConnections[471][1] = {490,0,0,1,false}
DoorConnections[471][2] = {480,0,1,3,false}

DoorConnections[480] = {} --Dark room
DoorConnections[480][1] = {471,1,0,3,false,8,8}
DoorConnections[480][2] = {492,0,1,2,false,12} --Requires Lv2 Jump AND Night Vision to get to other doors
DoorConnections[480][3] = {1020,0,2,4,false} --Can drop to the door below

DoorConnections[490] = {}
DoorConnections[490][1] = {471,0,0,1,false}
DoorConnections[491] = {}
DoorConnections[491][1] = {540,0,0,1,false}
DoorConnections[492] = {}
DoorConnections[492][1] = {480,1,0,2,false}
DoorConnections[492][2] = {500,0,1,1,false}

DoorConnections[500] = {}
DoorConnections[500][1] = {492,1,0,1,false}
DoorConnections[501] = {}
DoorConnections[501][1] = {510,0,0,2,false}
DoorConnections[501][2] = {520,0,1,3,false}
DoorConnections[501][3] = {590,0,2,4,false,0,0} --Ice Drop, though I don't wanna mark it as such since you also need a character with specific reach to hit the door

DoorConnections[510] = {}
DoorConnections[510][1] = {501,0,0,2,false}
DoorConnections[511] = {}
DoorConnections[511][1] = {1640,0,0,2,false}
DoorConnections[513] = {}
DoorConnections[513][1] = {690,0,0,2,false}

DoorConnections[520] = {}
DoorConnections[520][1] = {501,1,0,3,false}
DoorConnections[520][2] = {560,2,1,2,false}
DoorConnections[520][3] = {911,1,3,4,false,-1,7} --One-way
DoorConnections[520][4] = {530,1,2,2,false,false,-1} --One-way Target

DoorConnections[530] = {}
DoorConnections[530][1] = {410,1,0,3,false,false,0}
DoorConnections[530][2] = {520,2,1,2,false,-1} --One-way

DoorConnections[540] = {}
DoorConnections[540][1] = {491,0,0,1,false,0,0} --Dead End

DoorConnections[550] = {}
DoorConnections[550][1] = {590,1,0,4,false}
DoorConnections[550][2] = {840,0,1,4,false}

DoorConnections[560] = {}
DoorConnections[560][1] = {402,0,0,1,false}
DoorConnections[560][2] = {570,0,1,3,false}
DoorConnections[560][3] = {520,1,2,2,false}

DoorConnections[570] = {}
DoorConnections[570][1] = {560,1,0,3,false}
DoorConnections[571] = {}
DoorConnections[571][1] = {610,0,0,3,false}
DoorConnections[571][2] = {440,1,1,1,false}
DoorConnections[572] = {}
DoorConnections[572][1] = {610,1,0,2,false}
DoorConnections[572][2] = {302,4,1,3,false}

DoorConnections[580] = {}
DoorConnections[580][1] = {642,1,0,3,false,0,0} --Dead End (also dark)

DoorConnections[590] = {}
DoorConnections[590][1] = {501,2,0,4,false}
DoorConnections[590][2] = {550,0,1,4,false,0,10} --Requires a short character to get through
DoorConnections[590][3] = {840,1,2,4,false,false,-1} --One-way Target

DoorConnections[600] = {}
DoorConnections[600][1] = {640,0,2,3,false}
DoorConnections[600][2] = {630,0,1,2,false,-1} --One-way
DoorConnections[600][3] = { 10,0,0,2,false,false,-1} --One-way Target (From 62-1)

DoorConnections[610] = {}
DoorConnections[610][1] = {571,0,0,3,false}
DoorConnections[610][2] = {572,0,1,2,false,false,0}
DoorConnections[611] = {}
DoorConnections[611][1] = {620,0,0,3,false}

DoorConnections[620] = {}
DoorConnections[620][1] = {611,0,0,3,false}
DoorConnections[621] = {}
DoorConnections[621][1] = {600,0,0,2,false,-1} --One-way
DoorConnections[622] = {}
DoorConnections[622][1] = {641,0,0,2,false}

DoorConnections[630] = {}
DoorConnections[630][1] = {640,1,1,2,false,-1} --One-way
DoorConnections[630][2] = {10,0,0,2,false,false,-1} --One-way Target
DoorConnections[631] = {}
DoorConnections[631][1] = {661,0,0,3,false}

DoorConnections[640] = {}
DoorConnections[640][1] = {600,2,0,3,false,false,false,{{640,2}}}
DoorConnections[640][2] = {630,1,1,2,false,false,-1} --One-way Target
DoorConnections[641] = {}
DoorConnections[641][1] = {622,0,0,2,false}
DoorConnections[642] = {}
DoorConnections[642][1] = {650,0,0,3,false}
DoorConnections[642][2] = {580,0,1,3,false}

DoorConnections[650] = {}
DoorConnections[650][1] = {642,0,0,3,false}
DoorConnections[651] = {}
DoorConnections[651][1] = {660,0,0,3,false}

DoorConnections[660] = {}
DoorConnections[660][1] = {651,0,0,3,false}
DoorConnections[661] = {}
DoorConnections[661][1] = {631,0,0,3,false,false,false,{{661,2,1}} }
DoorConnections[661][2] = {680,0,1,3,false,false,false,{{661,1,1}} }
DoorConnections[662] = {}
DoorConnections[662][1] = {670,0,0,2,false}

DoorConnections[670] = {}
DoorConnections[670][1] = {662,0,0,2,false}
DoorConnections[672] = {}
DoorConnections[672][1] = {1050,0,0,2,false}

DoorConnections[680] = {}
DoorConnections[680][1] = {661,1,0,3,false}
DoorConnections[680][2] = {902,1,1,2,false}

DoorConnections[690] = {}
DoorConnections[690][1] = {513,0,0,2,false}
DoorConnections[690][2] = {10,5,1,1,false}
DoorConnections[690][3] = {710,0,2,1,false}

DoorConnections[700] = {}
DoorConnections[700][1] = {750,2,0,3,false,1,3} --Requires high jump
DoorConnections[700][2] = {850,2,1,2,false,3,1}

DoorConnections[710] = {}
DoorConnections[710][1] = {690,2,0,1,false}
DoorConnections[710][2] = {720,0,1,1,false}

DoorConnections[720] = {}
DoorConnections[720][1] = {710,1,0,1,false}
DoorConnections[721] = {}
DoorConnections[721][1] = {730,0,0,1,false}
DoorConnections[721][2] = {120,3,1,3,false}

DoorConnections[730] = {}
DoorConnections[730][1] = {721,0,0,1,false}
DoorConnections[731] = {}
DoorConnections[731][1] = {740,0,0,1,false}
DoorConnections[731][2] = {390,1,1,2,false}

DoorConnections[740] = {}
DoorConnections[740][1] = {731,0,0,2,false}
DoorConnections[740][2] = {760,0,1,1,false}
DoorConnections[740][3] = {201,3,2,1,false}
DoorConnections[742] = {}
DoorConnections[742][1] = {750,0,0,1,false}

DoorConnections[750] = {}
DoorConnections[750][1] = {742,0,0,1,false}
DoorConnections[750][2] = {700,0,2,3,false}
DoorConnections[750][3] = {770,0,1,2,false,-1} --One-way

DoorConnections[760] = {}
DoorConnections[760][1] = {740,1,0,2,false,false,0}
DoorConnections[760][2] = {770,0,1,1,false,-1} --One-way

DoorConnections[770] = {}
DoorConnections[770][1] = {750,1,0,2,false,false,-1} --One-way Target
DoorConnections[771] = {}
DoorConnections[771][1] = {780,0,0,2,false,0} --Dead End

DoorConnections[780] = {}
DoorConnections[780][1] = {771,0,0,1,false}
DoorConnections[780][2] = {790,0,1,2,false}

DoorConnections[790] = {}
DoorConnections[790][1] = {780,1,0,2,false}
DoorConnections[792] = {}
DoorConnections[792][1] = {830,0,0,1,false}

DoorConnections[800] = {}
DoorConnections[800][1] = {850,1,0,1,false}
DoorConnections[800][2] = {1010,1,1,4,false}
DoorConnections[801] = {}
DoorConnections[801][1] = {810,0,0,2,false}
DoorConnections[801][2] = {890,0,1,3,false}

DoorConnections[810] = {}
DoorConnections[810][1] = {801,0,0,2,false}
DoorConnections[810][2] = {820,0,1,3,false}
DoorConnections[810][3] = {1051,1,2,1,false}

DoorConnections[820] = {}
DoorConnections[820][1] = {810,1,0,3,false}
DoorConnections[820][2] = {890,1,1,2,false,false,0}
DoorConnections[821] = {}
DoorConnections[821][1] = {860,0,0,1,false}

DoorConnections[830] = {}
DoorConnections[830][1] = {792,0,0,1,false}
DoorConnections[830][2] = {10,6,1,3,false}
DoorConnections[830][3] = {850,0,2,2,false}

DoorConnections[840] = {}
DoorConnections[840][1] = {550,1,0,4,false,10,0} --Requires a short character to get through
DoorConnections[840][2] = {590,2,1,4,false,-1,10} --One-way

DoorConnections[850] = {}
DoorConnections[850][1] = {830,2,0,2,false}
DoorConnections[850][2] = {800,0,1,1,false}
DoorConnections[850][3] = {700,1,2,2,false}

DoorConnections[860] = {}
DoorConnections[860][1] = {821,0,0,1,false}
DoorConnections[861] = {}
DoorConnections[861][1] = {870,0,0,3,false}
DoorConnections[861][2] = {1160,1,1,2,false,false,4}

DoorConnections[870] = {}
DoorConnections[870][1] = {861,0,0,3,false}
DoorConnections[870][2] = {900,0,1,1,false}

DoorConnections[880] = {}
DoorConnections[880][1] = {190,1,0,3,false,0,0} --Dead End (also dark)

DoorConnections[890] = {} --Dark room
DoorConnections[890][1] = {801,1,0,3,false,8,8}
DoorConnections[890][2] = {820,1,1,2,false,8,8}
DoorConnections[890][3] = {1030,0,2,4,false,8,8}

DoorConnections[900] = {}
DoorConnections[900][1] = {870,1,0,1,false}
DoorConnections[902] = {}
DoorConnections[902][1] = {910,0,0,3,false}
DoorConnections[902][2] = {680,1,1,2,false}

DoorConnections[910] = {}
DoorConnections[910][1] = {902,0,0,3,false}
DoorConnections[911] = {}
DoorConnections[911][1] = {920,0,0,1,false}
DoorConnections[911][2] = {1010,0,2,4,false,0,false,{{911,3}}}
DoorConnections[911][3] = {520,2,1,4,false,false,-1} --One-way Target

DoorConnections[920] = {}
DoorConnections[920][1] = {911,0,0,1,false}
DoorConnections[922] = {}
DoorConnections[922][1] = {1180,0,0,1,false}

DoorConnections[930] = {}
DoorConnections[930][1] = {1241,1,0,4,false}
DoorConnections[931] = {}
DoorConnections[931][1] = {940,0,0,4,false}

DoorConnections[940] = {}
DoorConnections[940][1] = {931,0,0,4,false}
DoorConnections[940][2] = {950,0,1,4,false}
DoorConnections[940][3] = {2202,0,2,4,false,false,-1} --One-way Target

DoorConnections[950] = {}
DoorConnections[950][1] = {940,1,0,4,false,false,1}
DoorConnections[950][2] = {960,0,1,4,false,1,false}

DoorConnections[960] = {}
DoorConnections[960][1] = {950,1,0,4,false}
DoorConnections[960][2] = {970,0,1,4,false}

DoorConnections[970] = {}
DoorConnections[970][1] = {960,1,0,4,false}
DoorConnections[970][2] = {980,0,1,4,false}

DoorConnections[980] = {}
DoorConnections[980][1] = {970,1,0,4,false,false,0}
DoorConnections[980][2] = {990,0,1,4,false,-1} --One-way

DoorConnections[990] = {}
DoorConnections[990][1] = {980,1,0,4,false,false,-1} --One-way Target
DoorConnections[991] = {}
DoorConnections[991][1] = {1000,0,0,4,false,0}

DoorConnections[1000] = {}
DoorConnections[1000][1] = {991,0,0,4,false,false,0,nil,{{1901,1}} }
DoorConnections[1002] = {}
DoorConnections[1002][1] = {1901,1,0,4,false,-1} --One-way

DoorConnections[1010] = {}
DoorConnections[1010][1] = {911,2,0,4,false,false,3}
DoorConnections[1010][2] = {800,1,1,4,false,3}
DoorConnections[1010][3] = {1200,1,2,4,false,-1} --One-way

DoorConnections[1020] = {}
DoorConnections[1020][1] = {480,2,0,4,false,false,0}
DoorConnections[1020][2] = {1120,0,1,4,false,0,false}

DoorConnections[1030] = {}
DoorConnections[1030][1] = {890,2,0,4,false,false,0}
DoorConnections[1030][2] = {1360,3,1,4,false,-1} --One-way

DoorConnections[1040] = {}
DoorConnections[1040][1] = {1490,3,0,4,false,false,0}
DoorConnections[1040][2] = {1170,2,1,4,false,-1} --One-way

DoorConnections[1050] = {}
DoorConnections[1050][1] = {672,0,0,2,false,false,false,{{1050,2}} }
DoorConnections[1050][2] = {302,2,1,3,false,false,false,{{1050,1}} }
DoorConnections[1051] = {}
DoorConnections[1051][1] = {1060,0,0,1,false}
DoorConnections[1051][2] = {810,2,1,1,false}

DoorConnections[1060] = {}
DoorConnections[1060][1] = {1051,0,0,1,false,false,false,{{1062,1}} }
DoorConnections[1062] = {}
DoorConnections[1062][1] = {1070,0,0,3,false,false,false,{{1060,1}} }
DoorConnections[1062][2] = {1120,1,1,3,false,false,false,{{1063,1}} }
DoorConnections[1063] = {}
DoorConnections[1063][1] = {1090,1,0,3,false,false,false,{{1062,2}} }

DoorConnections[1070] = {}
DoorConnections[1070][1] = {1062,0,0,3,false}
DoorConnections[1071] = {}
DoorConnections[1071][1] = {1090,0,0,1,false}

DoorConnections[1080] = {}
DoorConnections[1080][1] = {1101,0,0,2,false,0,0} --Dead End (also dark)

DoorConnections[1090] = {}
DoorConnections[1090][1] = {1071,0,0,1,false}
DoorConnections[1090][2] = {1063,0,1,3,false}
DoorConnections[1092] = {}
DoorConnections[1092][1] = {1100,0,0,3,false}

DoorConnections[1100] = {}
DoorConnections[1100][1] = {1092,0,0,3,false}
DoorConnections[1101] = {}
DoorConnections[1101][1] = {1080,0,0,2,false}
DoorConnections[1102] = {}
DoorConnections[1102][1] = {1110,0,0,3,false}

DoorConnections[1110] = {}
DoorConnections[1110][1] = {1102,0,0,3,false}
DoorConnections[1111] = {}
DoorConnections[1111][1] = {1140,0,0,2,false}
DoorConnections[1112] = {}
DoorConnections[1112][1] = {1130,0,0,3,false}

DoorConnections[1120] = {} --Dark room
DoorConnections[1120][1] = {1020,1,0,4,false,8,0}
DoorConnections[1120][2] = {1062,1,1,3,false,0,8}

DoorConnections[1130] = {}
DoorConnections[1130][1] = {1112,0,0,3,false}
DoorConnections[1132] = {}
DoorConnections[1132][1] = {1150,0,0,1,false}

DoorConnections[1140] = {}
DoorConnections[1140][1] = {1111,0,0,2,false,0,0} --Dead End (also dark)

DoorConnections[1150] = {}
DoorConnections[1150][1] = {1132,0,0,1,false}
DoorConnections[1150][2] = {1160,0,1,2,false}
DoorConnections[1150][3] = {302,3,2,3,false}
DoorConnections[1151] = {}
DoorConnections[1151][1] = {1400,0,0,3,false}

DoorConnections[1160] = {}
DoorConnections[1160][1] = {1150,1,0,2,false}
DoorConnections[1160][2] = {861,1,1,2,false}

DoorConnections[1170] = {}
DoorConnections[1170][1] = {1240,1,0,2,false,2,false}
DoorConnections[1170][2] = {1310,1,1,3,false,false,2}
DoorConnections[1170][3] = {1040,1,2,4,false,false,-1} --One-way Target

DoorConnections[1180] = {}
DoorConnections[1180][1] = {922,0,0,1,false}
DoorConnections[1181] = {}
DoorConnections[1181][1] = {1190,0,0,2,false}

DoorConnections[1190] = {}
DoorConnections[1190][1] = {1181,0,0,2,false}
DoorConnections[1191] = {}
DoorConnections[1191][1] = {1200,0,0,1,false}
DoorConnections[1191][2] = {1292,2,1,3,true}
DoorConnections[1191][3] = {10,7,2,2,false}
DoorConnections[1192] = {}
DoorConnections[1192][1] = {1210,0,0,2,false}

DoorConnections[1200] = {}
DoorConnections[1200][1] = {1191,0,0,1,false}
DoorConnections[1200][2] = {1010,2,1,4,false,false,-1} --One-way Target
DoorConnections[1201] = {}
DoorConnections[1201][1] = {1220,1,0,2,false}

DoorConnections[1210] = {}
DoorConnections[1210][1] = {1192,0,0,2,false}
DoorConnections[1211] = {}
DoorConnections[1211][1] = {1220,0,0,1,false}

DoorConnections[1220] = {}
DoorConnections[1220][1] = {1211,0,0,1,false,false,false,{{1220,2},{1221,1}} }
DoorConnections[1220][2] = {1201,0,1,2,false,false,false,{{1220,1},{1221,1}} }
DoorConnections[1221] = {}
DoorConnections[1221][1] = {1240,0,0,1,false,false,false,{{1220,1},{1220,2}} }
DoorConnections[1221][2] = {1490,2,1,1,false,false,false,{{1221,3}} }
DoorConnections[1221][3] = {1260,2,2,3,false,false,false,{{1221,2}} }

DoorConnections[1231] = {}
DoorConnections[1231][1] = {1270,1,0,1,false,0,0} --Dead End

DoorConnections[1240] = {}
DoorConnections[1240][1] = {1221,0,0,1,false}
DoorConnections[1240][2] = {1170,0,1,2,false}
DoorConnections[1241] = {}
DoorConnections[1241][1] = {1250,0,0,1,false}
DoorConnections[1241][2] = {930,0,1,4,false,false,1}

DoorConnections[1250] = {}
DoorConnections[1250][1] = {1241,0,0,1,false}
DoorConnections[1253] = {}
DoorConnections[1253][1] = {1260,0,0,2,false}

DoorConnections[1260] = {} --Dark room
DoorConnections[1260][1] = {1253,0,0,2,false,8,8}
DoorConnections[1260][2] = {1270,0,1,2,false}
DoorConnections[1260][3] = {1221,2,2,3,false,false,0} --Easy enough to drop down to the door below

DoorConnections[1270] = {}
DoorConnections[1270][1] = {1260,1,0,2,false}
DoorConnections[1270][2] = {1231,0,1,1,false}
DoorConnections[1270][3] = {1280,0,2,1,false}

DoorConnections[1280] = {}
DoorConnections[1280][1] = {1270,2,0,1,false}
DoorConnections[1281] = {}
DoorConnections[1281][1] = {1290,0,0,2,false}

DoorConnections[1290] = {}
DoorConnections[1290][1] = {1281,0,0,2,false}
DoorConnections[1292] = {}
DoorConnections[1292][1] = {1300,0,0,2,false}
DoorConnections[1292][2] = {1191,1,2,3,false}

DoorConnections[1300] = {}
DoorConnections[1300][1] = {1292,0,0,2,false}
DoorConnections[1301] = {}
DoorConnections[1301][1] = {1310,0,0,1,false}

DoorConnections[1310] = {}
DoorConnections[1310][1] = {1301,0,0,1,false,false,false,nil,{{1320,0}} }
DoorConnections[1310][2] = {1170,1,1,3,false,false,false,nil,{{1320,0}} }
DoorConnections[1312] = {}
DoorConnections[1312][1] = {1330,0,0,3,false}
DoorConnections[1313] = {}
DoorConnections[1313][1] = {1320,0,0,2,false,-1} --One-way

DoorConnections[1320] = {} --Passable dark room
DoorConnections[1320][1] = {1331,0,1,1,false,0} --Dead End (Though the opposite entrance is unreachable normally)
DoorConnections[1320][2] = {1390,1,2,3,false,0,0} --Dead End
DoorConnections[1320][3] = {1313,0,0,2,false,false,-1} --One-way Target

DoorConnections[1330] = {}
DoorConnections[1330][1] = {1312,0,0,3,false}
DoorConnections[1331] = {}
DoorConnections[1331][1] = {1320,1,0,1,false,false,0}
DoorConnections[1331][2] = {1440,1,1,4,false,false,-1} --One-way Target
DoorConnections[1332] = {}
DoorConnections[1332][1] = {1340,0,0,1,false}
DoorConnections[1332][2] = {1360,0,1,3,false}

DoorConnections[1340] = {}
DoorConnections[1340][1] = {1332,0,0,1,false}
DoorConnections[1341] = {}
DoorConnections[1341][1] = {1350,0,0,1,false}

DoorConnections[1350] = {}
DoorConnections[1350][1] = {1341,0,0,1,false}
DoorConnections[1352] = {}
DoorConnections[1352][1] = {1360,1,0,1,false}

DoorConnections[1360] = {}
DoorConnections[1360][1] = {1332,1,0,3,false}
DoorConnections[1360][2] = {1352,0,1,1,false,false,0}
DoorConnections[1360][3] = {1370,0,2,1,false}
DoorConnections[1360][4] = {1030,1,3,4,false,false,-1} --One-way Target

DoorConnections[1370] = {}
DoorConnections[1370][1] = {1360,2,0,1,false}
DoorConnections[1370][2] = {1510,0,1,2,false}
DoorConnections[1371] = {}
DoorConnections[1371][1] = {1380,0,0,3,false}

DoorConnections[1380] = {}
DoorConnections[1380][1] = {1371,0,0,3,false}
DoorConnections[1381] = {}
DoorConnections[1381][1] = {1390,0,0,2,false}

DoorConnections[1390] = {}
DoorConnections[1390][1] = {1381,0,0,2,false}
DoorConnections[1390][2] = {1320,2,1,3,false}
DoorConnections[1392] = {}
DoorConnections[1392][1] = {1500,0,0,1,false}

DoorConnections[1400] = {}
DoorConnections[1400][1] = {1151,0,0,3,false}
DoorConnections[1401] = {}
DoorConnections[1401][1] = {1410,0,0,2,false}

DoorConnections[1410] = {}
DoorConnections[1410][1] = {1401,0,0,2,false}
DoorConnections[1411] = {}
DoorConnections[1411][1] = {1420,0,0,1,false}

DoorConnections[1420] = {}
DoorConnections[1420][1] = {1411,0,0,1,false}
DoorConnections[1421] = {}
DoorConnections[1421][1] = {191,3,0,3,false}
DoorConnections[1422] = {}
DoorConnections[1422][1] = {1430,0,0,3,false}

DoorConnections[1430] = {}
DoorConnections[1430][1] = {1422,0,0,3,false}
DoorConnections[1431] = {}
DoorConnections[1431][1] = {1450,0,0,1,false}

DoorConnections[1440] = {} --Dark room that also requires a short character
DoorConnections[1440][1] = {1460,1,0,4,false,8,0}
DoorConnections[1440][2] = {1331,1,1,4,false,-1,8} --One-way

DoorConnections[1450] = {}
DoorConnections[1450][1] = {1431,0,0,1,false}
DoorConnections[1450][2] = {1470,0,1,2,false}
DoorConnections[1450][3] = {1470,1,2,3,false}

DoorConnections[1460] = {}
DoorConnections[1460][1] = {1471,0,0,2,false}
DoorConnections[1460][2] = {1440,0,1,4,false}

DoorConnections[1470] = {}
DoorConnections[1470][1] = {1450,1,0,2,false,false,false,{{1470,3}} }
DoorConnections[1470][2] = {1450,2,1,3,false,false,false,{{1471,1}} }
DoorConnections[1470][3] = {1480,0,2,4,false,false,false,{{1470,1}} }
DoorConnections[1471] = {}
DoorConnections[1471][1] = {1460,0,0,2,false,false,false,{{1470,2}} }

DoorConnections[1480] = {}
DoorConnections[1480][1] = {1470,2,0,4,false}
DoorConnections[1482] = {}
DoorConnections[1482][1] = {1490,0,0,2,false}

DoorConnections[1490] = {}
DoorConnections[1490][1] = {1482,0,0,1,false}
DoorConnections[1490][2] = {10,11,1,2,false}
DoorConnections[1490][3] = {1221,1,2,1,false}
DoorConnections[1490][4] = {1040,0,3,4,false}

DoorConnections[1500] = {}
DoorConnections[1500][1] = {1392,0,0,1,false}
DoorConnections[1500][2] = {10,8,1,2,false}
DoorConnections[1500][3] = {1632,0,2,3,true}
DoorConnections[1502] = {}
DoorConnections[1502][1] = {1520,0,0,1,false}
DoorConnections[1502][2] = {1780,0,1,2,false}

DoorConnections[1510] = {}
DoorConnections[1510][1] = {1370,1,0,2,false,0,0} --Dead End (dark)

DoorConnections[1520] = {}
DoorConnections[1520][1] = {1502,0,0,1,false}
DoorConnections[1522] = {}
DoorConnections[1522][1] = {1530,0,0,2,false}

DoorConnections[1530] = {}
DoorConnections[1530][1] = {1522,0,0,2,false}
DoorConnections[1530][2] = {1540,0,1,1,false}

DoorConnections[1540] = {}
DoorConnections[1540][1] = {1530,1,0,1,false}
DoorConnections[1541] = {}
DoorConnections[1541][1] = {1550,0,0,2,false}

DoorConnections[1550] = {}
DoorConnections[1550][1] = {1541,0,0,2,false}
DoorConnections[1550][2] = {1560,0,1,1,false}

DoorConnections[1560] = {}
DoorConnections[1560][1] = {1550,1,0,1,false}
DoorConnections[1561] = {}
DoorConnections[1561][1] = {1570,0,0,2,false}
DoorConnections[1561][2] = {1590,0,1,3,false}

DoorConnections[1570] = {}
DoorConnections[1570][1] = {1561,0,0,2,false}
DoorConnections[1570][2] = {1580,0,1,1,false}

DoorConnections[1580] = {}
DoorConnections[1580][1] = {1570,1,0,1,false}
DoorConnections[1582] = {}
DoorConnections[1582][1] = {1591,1,0,2,false}

DoorConnections[1590] = {}
DoorConnections[1590][1] = {1561,1,0,3,false}
DoorConnections[1591] = {}
DoorConnections[1591][1] = {1600,0,0,1,false}
DoorConnections[1591][2] = {1582,0,1,2,false,false,0}

DoorConnections[1600] = {}
DoorConnections[1600][1] = {1591,0,0,1,false}
DoorConnections[1601] = {}
DoorConnections[1601][1] = {1610,0,0,1,false}

DoorConnections[1610] = {}
DoorConnections[1610][1] = {1601,0,0,1,false}
DoorConnections[1611] = {}
DoorConnections[1611][1] = {1620,0,0,3,false}
DoorConnections[1611][2] = {1750,0,1,1,false}

DoorConnections[1620] = {}
DoorConnections[1620][1] = {1611,0,0,3,false}
DoorConnections[1620][2] = {1630,0,1,4,false}

DoorConnections[1630] = {}
DoorConnections[1630][1] = {1620,1,0,4,false}
DoorConnections[1632] = {}
DoorConnections[1632][1] = {1500,2,0,3,false}
DoorConnections[1632][2] = {1650,0,1,2,false}
DoorConnections[1632][3] = {2010,0,2,4,false}
DoorConnections[1632][4] = {2102,1,3,4,true}

DoorConnections[1640] = {}
DoorConnections[1640][1] = {511,0,0,2,false,0,0} --Dead End

DoorConnections[1650] = {}
DoorConnections[1650][1] = {1632,1,0,2,false}
DoorConnections[1651] = {}
DoorConnections[1651][1] = {1660,0,0,3,false}

DoorConnections[1660] = {}
DoorConnections[1660][1] = {1651,0,0,3,false}
DoorConnections[1661] = {}
DoorConnections[1661][1] = {1670,0,0,1,false}

DoorConnections[1670] = {}
DoorConnections[1670][1] = {1661,0,0,1,false}
DoorConnections[1671] = {}
DoorConnections[1671][1] = {1691,0,0,1,false}
DoorConnections[1671][2] = {1680,0,1,2,false,0,7} --Ice drop

DoorConnections[1680] = {}
DoorConnections[1680][1] = {1671,1,0,2,false}
DoorConnections[1680][2] = {1690,0,1,1,false}

DoorConnections[1690] = {}
DoorConnections[1690][1] = {1680,1,0,1,false,false,3}
DoorConnections[1691] = {}
DoorConnections[1691][1] = {1671,0,0,1,false}
DoorConnections[1692] = {}
DoorConnections[1692][1] = {1700,0,0,3,false}

DoorConnections[1700] = {}
DoorConnections[1700][1] = {1692,0,0,3,false}
DoorConnections[1700][2] = {1720,0,1,2,false}
DoorConnections[1700][3] = {1770,0,2,1,false}
DoorConnections[1701] = {}
DoorConnections[1701][1] = {1710,0,0,1,false}

DoorConnections[1710] = {}
DoorConnections[1710][1] = {1701,0,0,1,false}
DoorConnections[1710][2] = {1730,0,1,3,false}

DoorConnections[1720] = {}
DoorConnections[1720][1] = {1700,1,0,2,false,0,0} --Dead End

DoorConnections[1730] = {}
DoorConnections[1730][1] = {1710,1,0,3,false}
DoorConnections[1733] = {}
DoorConnections[1733][1] = {1740,0,0,3,false}

DoorConnections[1740] = {}
DoorConnections[1740][1] = {1733,0,0,3,false}
DoorConnections[1740][2] = {1760,0,1,1,false}

DoorConnections[1750] = {}
DoorConnections[1750][1] = {1611,1,0,1,false,0,0} --Dead End

DoorConnections[1760] = {}
DoorConnections[1760][1] = {1740,1,0,2,false}
DoorConnections[1763] = {}
DoorConnections[1763][1] = {1790,0,0,3,false}

DoorConnections[1770] = {}
DoorConnections[1770][1] = {1700,2,0,1,false,6,6} --Clouds
DoorConnections[1772] = {}
DoorConnections[1772][1] = {1811,1,0,1,false,6,6} --Clouds

DoorConnections[1780] = {}
DoorConnections[1780][1] = {1502,1,0,2,false,6,0} --Clouds
DoorConnections[1781] = {}
DoorConnections[1781][1] = {1890,1,0,3,false,0,6} --Dead End (No platforms back)

DoorConnections[1790] = {}
DoorConnections[1790][1] = {1763,0,0,3,false}
DoorConnections[1790][2] = {10,9,1,2,false}
DoorConnections[1791] = {}
DoorConnections[1791][1] = {1800,0,0,3,false}

DoorConnections[1800] = {}
DoorConnections[1800][1] = {1791,0,0,3,false}
DoorConnections[1801] = {}
DoorConnections[1801][1] = {1810,0,0,1,false}

DoorConnections[1810] = {}
DoorConnections[1810][1] = {1801,0,0,1,false}
DoorConnections[1811] = {}
DoorConnections[1811][1] = {1820,0,0,2,false}
DoorConnections[1811][2] = {1772,0,1,1,false}
DoorConnections[1812] = {}
DoorConnections[1812][1] = {1820,1,0,3,false,5,false}

DoorConnections[1820] = {}
DoorConnections[1820][1] = {1811,0,0,2,false}
DoorConnections[1820][2] = {1812,0,1,3,false,false,5}
DoorConnections[1820][3] = {1840,0,2,1,false}
DoorConnections[1820][4] = {1910,0,3,4,false}

DoorConnections[1830] = {}
DoorConnections[1830][1] = {1850,2,0,3,false,0,0} --Dead End

DoorConnections[1840] = {}
DoorConnections[1840][1] = {1820,2,0,1,false}
DoorConnections[1841] = {}
DoorConnections[1841][1] = {1850,0,0,1,false}
DoorConnections[1841][2] = {1850,1,1,2,false}

DoorConnections[1850] = {}
DoorConnections[1850][1] = {1841,0,0,1,false,false,false,{{1850,4}} }
DoorConnections[1850][2] = {1841,1,1,2,false,false,false,{{1850,3}} }
DoorConnections[1850][3] = {1830,0,2,3,false,false,false,{{1850,2}} }
DoorConnections[1850][4] = {1860,0,3,1,false,false,false,{{1850,1}} }

DoorConnections[1860] = {}
DoorConnections[1860][1] = {1850,3,0,1,false}
DoorConnections[1862] = {}
DoorConnections[1862][1] = {1870,0,0,1,false}

DoorConnections[1870] = {}
DoorConnections[1870][1] = {1862,0,0,1,false,false,1}
DoorConnections[1870][2] = {1880,0,1,2,false,1,false}

DoorConnections[1880] = {}
DoorConnections[1880][1] = {1870,1,0,2,false}
DoorConnections[1880][2] = {1890,0,1,3,false}

DoorConnections[1890] = {}
DoorConnections[1890][1] = {1880,1,0,3,false}
DoorConnections[1890][2] = {1781,0,1,3,false}
DoorConnections[1892] = {}
DoorConnections[1892][1] = {1900,0,0,4,false}
DoorConnections[1892][2] = {10,10,1,4,false}
DoorConnections[1892][3] = {2110,1,2,4,true}

DoorConnections[1900] = {}
DoorConnections[1900][1] = {1892,0,0,4,false,false,3}
DoorConnections[1901] = {}
DoorConnections[1901][1] = {1920,0,0,2,false,3,false}
DoorConnections[1901][2] = {1002,0,1,4,false,false,-1} --One-way Target

DoorConnections[1910] = {}
DoorConnections[1910][1] = {1820,3,0,4,false,0,0} --Dead End

DoorConnections[1920] = {}
DoorConnections[1920][1] = {1901,0,0,2,false}
DoorConnections[1921] = {}
DoorConnections[1921][1] = {1930,0,0,1,false}

DoorConnections[1930] = {}
DoorConnections[1930][1] = {1921,0,0,1,false}
DoorConnections[1931] = {}
DoorConnections[1931][1] = {1940,0,0,3,false}

DoorConnections[1940] = {}
DoorConnections[1940][1] = {1931,0,0,3,false}
DoorConnections[1940][2] = {1950,0,1,2,false}

DoorConnections[1950] = {}
DoorConnections[1950][1] = {1940,1,0,2,false}
DoorConnections[1950][2] = {1960,0,1,3,false}

DoorConnections[1960] = {}
DoorConnections[1960][1] = {1950,1,0,3,false}
DoorConnections[1961] = {}
DoorConnections[1961][1] = {1980,0,0,4,false}

DoorConnections[1970] = {}
DoorConnections[1970][1] = {2102,0,0,4,false,6,0}
DoorConnections[1970][2] = {1990,1,1,4,false,-1,6} --One-way (Cloud)

DoorConnections[1980] = {}
DoorConnections[1980][1] = {1961,0,0,4,false}
DoorConnections[1980][2] = {1990,0,1,4,false}

DoorConnections[1990] = {}
DoorConnections[1990][1] = {1980,1,0,4,false}
DoorConnections[1990][2] = {1970,1,1,4,false,false,-1} --One-way Target
DoorConnections[1992] = {}
DoorConnections[1992][1] = {2000,0,0,4,false,9,false} --Blocked by Kanako 1

DoorConnections[2000] = {}
DoorConnections[2000][1] = {1992,0,0,4,false}
DoorConnections[2002] = {}
DoorConnections[2002][1] = {2110,0,0,4,false}

DoorConnections[2010] = {}
DoorConnections[2010][1] = {1632,2,0,4,false}
DoorConnections[2011] = {}
DoorConnections[2011][1] = {2020,0,0,3,false}

DoorConnections[2020] = {}
DoorConnections[2020][1] = {2011,0,0,3,false}
DoorConnections[2020][2] = {2030,0,1,3,false}
DoorConnections[2020][3] = {2040,0,2,3,false}

DoorConnections[2030] = {}
DoorConnections[2030][1] = {2020,1,0,3,false}
DoorConnections[2030][2] = {2050,0,1,2,false}
DoorConnections[2030][3] = {2070,1,2,4,false}

DoorConnections[2040] = {} --Dark room
DoorConnections[2040][1] = {2020,2,0,3,false,8,8}
DoorConnections[2040][2] = {2051,0,1,1,false,8,8}

DoorConnections[2050] = {}
DoorConnections[2050][1] = {2030,1,0,2,false,false,0}
DoorConnections[2051] = {}
DoorConnections[2051][1] = {2040,1,0,1,false}
DoorConnections[2052] = {}
DoorConnections[2052][1] = {2060,0,0,3,false}

DoorConnections[2060] = {}
DoorConnections[2060][1] = {2052,0,0,3,false}
DoorConnections[2060][2] = {2080,0,1,2,false}

DoorConnections[2070] = {}
DoorConnections[2070][1] = {2030,2,1,4,false,0} --Dead End
DoorConnections[2070][2] = {101,2,0,4,false,false,-1} --One-way Target

DoorConnections[2080] = {}
DoorConnections[2080][1] = {2060,1,0,2,false}
DoorConnections[2082] = {}
DoorConnections[2082][1] = {2090,0,0,3,false}

DoorConnections[2090] = {}
DoorConnections[2090][1] = {2082,0,0,3,false}
DoorConnections[2090][2] = {2100,0,1,4,false}

DoorConnections[2100] = {}
DoorConnections[2100][1] = {2090,1,0,4,false,false,2}
DoorConnections[2102] = {}
DoorConnections[2102][1] = {1970,0,0,4,false}
DoorConnections[2102][2] = {1632,3,1,4,false}

DoorConnections[2110] = {}
DoorConnections[2110][1] = {2002,0,0,4,false}
DoorConnections[2110][2] = {1892,2,1,4,false}
DoorConnections[2111] = {}
DoorConnections[2111][1] = {2120,0,0,1,false}

DoorConnections[2120] = {}
DoorConnections[2120][1] = {2111,0,0,1,false}
DoorConnections[2120][2] = {2130,0,1,2,false}

DoorConnections[2130] = {}
DoorConnections[2130][1] = {2120,1,0,2,false}
DoorConnections[2130][2] = {2140,0,1,3,false}

DoorConnections[2140] = {}
DoorConnections[2140][1] = {2130,1,0,3,false}
DoorConnections[2140][2] = {2150,0,1,2,false}

DoorConnections[2150] = {}
DoorConnections[2150][1] = {2140,1,0,2,false,false,1}
DoorConnections[2151] = {}
DoorConnections[2151][1] = {2160,0,0,1,false,1,false}

DoorConnections[2160] = {}
DoorConnections[2160][1] = {2151,0,0,1,false}
DoorConnections[2160][2] = {2170,0,1,4,false}

DoorConnections[2170] = {} --Dark room
DoorConnections[2170][1] = {2160,1,0,4,false,8,8}
DoorConnections[2170][2] = {2180,0,1,4,false,8,8}

DoorConnections[2180] = {}
DoorConnections[2180][1] = {2170,1,0,4,false}
DoorConnections[2180][2] = {2190,0,1,4,false}

DoorConnections[2190] = {}
DoorConnections[2190][1] = {2180,1,0,4,false,false,0}
DoorConnections[2190][2] = {2200,0,1,4,false,0,false}

DoorConnections[2200] = {}
DoorConnections[2200][1] = {2190,1,0,4,false,false,0}
DoorConnections[2202] = {}
DoorConnections[2202][1] = {940,2,0,4,false,-1} --One-way

ResetRNG(RandomSeed)

if math.random() < 0.25 then --Percent chance of including an extra normally unused One-Way drop point
  local rnd = math.random()
  if rnd < 0.333 then
    DoorConnections[42][2] = {10,0,1,3,false,false,-1}
  elseif rnd < 0.666 then
    DoorConnections[82][2] = {10,0,1,2,false,false,-1}
  else
    DoorConnections[220][2] = {10,0,1,2,false,false,-1}
  end
end
  
local TagConnectionOrder = {} --The first tag in the list will be prioritized
TagConnectionOrder["standard"] = {"standard","leadstodeadend","deadend"}
TagConnectionOrder["leadstodeadend"] = {"deadend","leadstodeadend","standard"}
TagConnectionOrder["deadend"] = {"leadstodeadend","standard","deadend"}
TagConnectionOrder["oneway"] = {"onewaytarget"}
TagConnectionOrder["onewaytarget"] = {"oneway"} --Just in case

local Tags_NoObstruct = {standard=true,deadend=true,oneway=true}
local Tags_PreBoss = {standard=true}
local Tags_PreKanako = {deadend=true}
local Tags_Normal = {standard=true,deadend=true,leadstodeadend=true,oneway=true}

local Doors = {all={},standard={},deadend={},leadstodeadend={},oneway={},onewaytarget={}}
for Stage = 1,220,1 do
  Doors[Stage] = {all={},standard={},deadend={},leadstodeadend={},oneway={},onewaytarget={}}
end

local StageConnectionExists = {}

for Room = 10,2202,1 do
  if DoorConnections[Room] then
    local Stage = math.floor(Room/10)
    if StageConnectionExists[Stage] == nil then
      StageConnectionExists[Stage] = {}
      StageConnectionExists[Stage][Stage] = true
    end
    if DoorConnections[Room] then
      for a = 1,#DoorConnections[Room],1 do
        local DoorData = DoorConnections[Room][a]
        table.insert(Doors["all"],{Room,a})
        table.insert(Doors[Stage]["all"],{Room,a})
        if DoorData[6] == -1 then
          table.insert(Doors["oneway"],{Room,a})
          table.insert(Doors[Stage]["oneway"],{Room,a})
          DoorData[10] = "oneway"
        elseif DoorData[7] == -1 then
          table.insert(Doors["onewaytarget"],{Room,a})
          table.insert(Doors[Stage]["onewaytarget"],{Room,a})
          DoorData[10] = "onewaytarget"
        elseif (DoorData[6] or (DoorData[6] == 0)) and not (DoorData[6] == 8) then
          table.insert(Doors["deadend"],{Room,a})
          table.insert(Doors[Stage]["deadend"],{Room,a})
          DoorData[10] = "deadend"
        else --Check Opposite Door
          local Assigned = false
          for i = 1,#DoorConnections[ DoorData[1] ],1 do
            local TargetDoorData = DoorConnections[ DoorData[1] ][i]
            if TargetDoorData[1] == Room and TargetDoorData[2] == DoorData[3] then
              if (TargetDoorData[6] or (TargetDoorData[6] == 0)) and not ((TargetDoorData[6] == 8) or (TargetDoorData[6] == 10)) then
                table.insert(Doors["leadstodeadend"],{Room,a})
                table.insert(Doors[Stage]["leadstodeadend"],{Room,a})
                DoorData[10] = "leadstodeadend"
                Assigned = true
              end
              break
            end
          end
          if not Assigned then
            table.insert(Doors["standard"],{Room,a})
            table.insert(Doors[Stage]["standard"],{Room,a})
            DoorData[10] = "standard"
          end
        end
      end
    end
  end
end

local RoomBossName = {}
local BossStages = {9,"Rumia",16,"Alice",24,"Daiyousei",25,"Cirno",30,"Meiling",40,"Patchouli",51,"Keine",67,"Sakuya",79,"Nitori",92,"Youmu",100,"Yukari",113,"Remilia",129,"Yuyuko",135,"Tewi",139,"Reisen",148,"Flandre",158,"Eirin",163,"Kaguya",176,"Aya",189,"Sanae",199,"Kanako",200,"Final Kanako",210,"Mokou",220,"Suwako"}
for i = 1,#BossStages,2 do
  RoomBossName[BossStages[i]] = BossStages[i+1]
end

local NormalBossStages = {9,16,24,25,30,40,51,67,79,92,113,129,135,139,148,158,163,176,189,199,210}
local RouteEndBossStages = {200,220,100}
local RouteStartDoors = {{11,1},{12,1},{12,2}}
local Spoiler_BossRoute = {{1},{1},{1}}

--New Target Room, New Target Entrance ID, Door Color, Shortcut to Unlock
local EntranceTable = {}

local file = io.open(TrainerOrigin.."Randomizer_CurrentSettings.lua","wb")
file:write("UserSeed = \"" .. UserSeed .. "\"\nRandoSetting = {}\n")
for i = 1,#RandomizerOptions,1 do
  local SettingName = RandomizerOptions[i][1]
  file:write("RandoSetting[\""..SettingName.."\"] = "..ConcoctBool( RandoSetting[SettingName] ).."\n")
end

file:write("\nlocal EntranceList = {}\n")

if RandoSetting["RandomizeDoors"] then
  local DoorStrings = {}
  
  local WriteConnection =
    function(RoomID,d,NewRoomID,n)
      local IgnoreDoor1 = false
      if not DoorConnections[RoomID][d][11] then
        DoorConnections[RoomID][d][11] = {NewRoomID,n}
      else
        DoorConnections[RoomID][d][12] = {NewRoomID,n}
        IgnoreDoor1 = true
      end
      local IgnoreDoor2 = false
      if not DoorConnections[NewRoomID][n][11] then
        DoorConnections[NewRoomID][n][11] = {RoomID,d}
      else
        DoorConnections[NewRoomID][n][12] = {RoomID,d}
        IgnoreDoor2 = true
      end
      
      local DoorColor = 1 --Choose Door color for both sides
      if IgnoreDoor1 and DoorConnections[RoomID][d][14] then
        DoorColor = DoorConnections[RoomID][d][14]
      elseif IgnoreDoor2 and DoorConnections[NewRoomID][n][14] then
        DoorColor = DoorConnections[NewRoomID][n][14]
      else
        if NewRoomID == 10 then --For Stage 1 shortcuts, keep the color of the door leading to 1
          DoorColor = DoorConnections[RoomID][d][4]
        else --Prioritize gold, otherwise choose randomly
          if DoorConnections[RoomID][d][4] == 4 or DoorConnections[NewRoomID][n][4] == 4 then
            DoorColor = 4
          elseif math.random() < 0.5 then
            DoorColor = DoorConnections[RoomID][d][4]
          else
            DoorColor = DoorConnections[NewRoomID][n][4]
          end
        end
      end
      
      if not IgnoreDoor1 then
        DoorConnections[RoomID][d][14] = DoorColor
        DoorConnections[RoomID][d][15] = "{"..RoomID..",".. DoorConnections[RoomID][d][3]..","..NewRoomID..","..DoorConnections[NewRoomID][n][3]..","..DoorColor
      end
      
      if not IgnoreDoor2 then
        DoorConnections[NewRoomID][n][14] = DoorColor
        DoorConnections[NewRoomID][n][15] = "{"..NewRoomID..",".. DoorConnections[NewRoomID][n][3]..","..RoomID..","..DoorConnections[RoomID][d][3]..","..DoorColor
      end
      
      local Stage = math.floor(RoomID/10)
      local NewStage = math.floor(NewRoomID/10)
      StageConnectionExists[Stage][NewStage] = true
      StageConnectionExists[NewStage][Stage] = true
    end
  
  --Abilities:
  --  1 = Jump Lv1
  --  2 = Jump Lv2
  --  3 = Jump Lv3
  --  4 = Jump Lv4
  --  5 = Jump Lv5
  --  6 = Cloud-Walking
  --  7 = Ice Drop
  --  8 = Night Vision
  --  9 = Kanako Beaten
  -- 10 = Short Character
  -- 11-15 = Jump LvX in Darkness
  
  local AddAbilities =
    function(PlayerAbilities,NewAbilities)
      for i = 1,#NewAbilities,1 do
        if NewAbilities[i] > 0 then
          if NewAbilities[i] <= 5 then --Jump abilities
            for a = NewAbilities[i],1,-1 do
              PlayerAbilities[a] = true
            end
          else --Anything else
            PlayerAbilities[ NewAbilities[i] ] = true
          end
        end
      end
      if PlayerAbilities[8] then --DarkJump
        for i = 1,5,1 do
          if PlayerAbilities[i] then
            PlayerAbilities[10+i] = true
          end
        end
      end
      return PlayerAbilities
    end
  
  local StagesThatUnlockAbilities = {}
  for a = 1,#CharsWithAbility,1 do
    local CharSet = CharsWithAbility[a]
    if a == 7 then
      if RandoSetting["SoloCharacterChallenge"] then --Can't guarantee the selected character has ice
        CharSet = {}
      elseif RandoSetting["RandomizeAttacks"] then --Ice drop is randomized with this setting
        local _,CharsWithIce = ShuffleCharAttacks()
        CharSet = CharsWithIce
      end
    end
    for b = 1,#CharSet,1 do
      local Data = CharSet[b]
      if type(Data) == "number" then
        local Stage = CharStages[Data]
        if not StagesThatUnlockAbilities[Stage] then
          StagesThatUnlockAbilities[Stage] = {}
        end
        table.insert(StagesThatUnlockAbilities[Stage],a)
      end
    end
  end
  
  for i = 0,24,1 do
    local Stage = CharStages[i]
    if StagesThatUnlockAbilities[Stage] then
      DebugPrint(i,Stage,"-",table.concat(StagesThatUnlockAbilities[Stage],", "))
    end
  end
  
  
  --StagesThatUnlockAbilities[9] = {8,10} --Rumia: Night Vision, Short
  --StagesThatUnlockAbilities[24] = {10} --Dai: Short
  --StagesThatUnlockAbilities[25] = {10} --Cirno: Short
  --StagesThatUnlockAbilities[92] = {10} --Youmu: Short
  --StagesThatUnlockAbilities[113] = {2} --Remilia: Jump Lv2
  --StagesThatUnlockAbilities[129] = {2} --Yuyuko: Jump Lv2
  --StagesThatUnlockAbilities[135] = {2,10} --Tewi: Jump Lv2, Short
  --StagesThatUnlockAbilities[139] = {2,10} --Reisen: Jump Lv2, Short
  --StagesThatUnlockAbilities[148] = {2} --Flandre: Jump Lv2
  --StagesThatUnlockAbilities[176] = {2,6} --Aya: Jump Lv2, Cloud-Walking
  --StagesThatUnlockAbilities[200] = {2,9} --Kanako: Jump Lv2, Kanako Beaten
  --StagesThatUnlockAbilities[220] = {3,10} --Suwako: Jump Lv3, Short
    
local GetReachableDoorsFromEntrance =
  function(Room,Index,Abilities,TagSet,BranchTwo)
    local InUseOffset = 0
    if BranchTwo then
      InUseOffset = 2
    end
    if not Abilities then
      Abilities = {}
    end
    local Test = true
    local ReachableDoors = {}
    local DoorData = DoorConnections[Room][Index]
    if not (DoorData[6] == 0) then --Ensure can reach any door at all
      if (not DoorData[6]) or Abilities[ DoorData[6] ] then --Check outgoing ability requirement
        local RootRoom = math.floor(Room/10)*10
        for Room2 = RootRoom,RootRoom+5,1 do
          if DoorConnections[Room2] then
            for i = 1,#DoorConnections[Room2],1 do
              if not ((Room == Room2) and (Index == i)) then --Not the same door
                local DoorData2 = DoorConnections[Room2][i]
                if not ((DoorData2[7] == 0) or (DoorData2[7] == -1) or DoorData2[5] or DoorData2[11+InUseOffset]) then --Can connect and not shortcut or in use
                  if (not DoorData2[7]) or Abilities[ DoorData2[7] ] then --Check incoming ability requirement
                    if (not TagSet) or TagSet[ DoorData2[10] ] then --Tag search check
                      local RequireAbility = DoorData[6]
                      if not RequireAbility then
                        RequireAbility = DoorData2[7]
                      elseif DoorData2[7] then --Combine Jump and Darkness into a DarkJump entry
                        if DoorData[6] == 8 and DoorData2[7] >= 1 and DoorData2[7] <= 5 then
                          RequireAbility = 10 + DoorData2[7]
                        elseif DoorData2[7] == 8 and DoorData[6] >= 1 and DoorData[6] <= 5 then
                          RequireAbility = 10 + DoorData[6]
                        end
                      end
                      if DoorData2[8] then --Check against the target door's paired doors table, if it exists
                        for r = 1,#DoorData2[8],1 do
                          if (Room == DoorData2[8][r][1]) and (Index == DoorData2[8][r][2]) then
                            if (not DoorData2[8][r][3]) or Abilities[ DoorData2[8][r][3] ] then --Paired door ability check
                              if not RequireAbility then
                                RequireAbility = DoorData2[8][r][3]
                              end
                              table.insert(ReachableDoors,{Room2,i,RequireAbility})
                            end
                            break
                          end
                        end
                      else
                        table.insert(ReachableDoors,{Room2,i,RequireAbility})
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
    return ReachableDoors
  end
    
  local BoolLoopComp = {nil,true}
  local TotalStagesInUse = 1
  local StageInUse = {}
  local StageOnRoute = {}
    
  local ChooseDestination =
    function(ExitStage,CurrTag,DesireStage,Abilities,ConnectionTags,AddShortcut,PreferUntouchedStages)
      if TagConnectionOrder[CurrTag] then
        for t = 1,#TagConnectionOrder[CurrTag],1 do
          local DesireTag = TagConnectionOrder[CurrTag][t]
          local OneWayExtra = 0
          if DesireTag == "onewaytarget" then
            OneWayExtra = 1
          end
          local UntouchedExtra = 0
          local DoorTable
          if DesireStage then
            DoorTable = Doors[DesireStage]
          else
            DoorTable = Doors
            if PreferUntouchedStages then
              UntouchedExtra = 1
            end
          end
          if #DoorTable[DesireTag] > 0 then
            local NewIndex = math.random(#DoorTable[DesireTag]) --Choose initial index at random and iterate through all entries until a valid destination is found
            --print(DesireTag,NewIndex,"/",#DoorTable[DesireTag])
            for l = 1,2,1 do --First loop will ignore connections that have already been made between stages
              for u = UntouchedExtra,0,-1 do --If set, the first loop will ignore stages that have already been involved in a branch
                for o = 0,OneWayExtra,1 do --There are more One-Way doors than there are exits, so do a second loop after all exits have been filled up the first time
            
                  for i = 1,#DoorTable[DesireTag],1 do
                    local TargetRoom = DoorTable[DesireTag][NewIndex][1]
                    local TargetIndex = DoorTable[DesireTag][NewIndex][2]
                    if not (TargetRoom == 2002) then --Don't branch *to* the opposite door in Kanako 2's room (Only branch outwards from it)
                      local TargetStage = math.floor(TargetRoom/10)
                      if (StageConnectionExists[ExitStage][TargetStage] == BoolLoopComp[l])
                      and ((u == 0) or (not StageInUse[TargetStage]))
                      and (not DoorConnections[TargetRoom][TargetIndex][11+o]) then

                        if ConnectionTags then --Used for Boss Branch
                          if DesireStage or ((not RoomBossName[TargetStage]) and (TargetStage > 1)) then
                            local ReachableStages = GetReachableDoorsFromEntrance(TargetRoom,TargetIndex,Abilities,ConnectionTags)
                            if AddShortcut then
                              if (#ReachableStages > 1) and (not StageConnectionExists[TargetStage][1]) then
                                for r = 1,#ReachableStages,1 do
                                  local ShortcutRoom = ReachableStages[r][1]
                                  local ShortcutIndex = ReachableStages[r][2]
                                  if (not ((TargetRoom == ShortcutRoom) and (TargetIndex == ShortcutIndex)))
                                  and DoorConnections[ShortcutRoom][ShortcutIndex][10] == "standard" then
                                    local ReachableStages2 = GetReachableDoorsFromEntrance(ShortcutRoom,ShortcutIndex,Abilities,Tags_NoObstruct)
                                    for r2 = 1,#ReachableStages2,1 do --Ensure that the target door is also reachable from the shortcut door
                                      if TargetRoom == ReachableStages2[r2][1] and TargetIndex == ReachableStages2[r2][2] then
                                        return TargetRoom,TargetIndex,ShortcutRoom,ShortcutIndex
                                      end
                                    end
                                  end
                                end
                              end
                            elseif #ReachableStages > 0 then
                              return TargetRoom,TargetIndex
                            end
                          end
                        else
                          return TargetRoom,TargetIndex
                        end
                      end
                    end
                    NewIndex = NewIndex + 1
                    if NewIndex > #DoorTable[DesireTag] then
                      NewIndex = 1
                    end
                  end
                  
                end
              end
            end
          end
        end
      end
      --print("Error: Could not find Destination for door from Stage "..ExitStage.." with tag \""..CurrTag.."\"!")
    end
    
  local StageIsUnfinished = {}
  local StageIsBeingHandled = {}
  local RoomsHandled = 0
  local Route = {{},{},{}}
  local TotalShortcutsUsed = 0
  local LastShortcut = 1
  local NextBossRoom = 1
  local RoomsPassed = 0
  local RouteFinished = {false,false,false}
  local BossesPerRoute = 8
  
  local ConnectDoorToStageOne =
    function(ShortcutRoom,ShortcutIndex)
      TotalShortcutsUsed = TotalShortcutsUsed + 1
      local Index = math.random(#DoorConnections[10])
      for a = 1,30,1 do
        if not DoorConnections[10][Index][11] then
          WriteConnection(ShortcutRoom,ShortcutIndex,10,Index)
          break
        end
        if a < 20 then
          Index = math.random(#DoorConnections[10])
        else
          Index = Index + 1
          if Index > #DoorConnections[10] then
            Index = 1
          end
        end
      end
    end
    
  local BossBranch
  BossBranch = 
    function(ExitRoom,ExitIndex,RouteIndex,PlayerAbilities,TotalRooms)
      DebugPrint("Branching from",ExitRoom,ExitIndex)
      local DoorData = DoorConnections[ExitRoom][ExitIndex]
      local ExitStage = math.floor(ExitRoom/10)
      if not StageInUse[ExitStage] then
        StageInUse[ExitStage] = true
        TotalStagesInUse = TotalStagesInUse + 1
      end
      --StageOnRoute[ExitStage] = true
      local NextBossData = Route[RouteIndex][NextBossRoom]
      local BossNext = (RoomsPassed+1 == NextBossData[2])
      local DesireTags = Tags_NoObstruct
      if BossNext and NextBossData[1] == 200 then --The stage before Kanako 2, ensure can exit through a Dead End to get the left exit
        DesireTags = Tags_PreKanako
        DebugPrint(" kanako 2 next")
      elseif BossNext then --Before any other boss, ensure at least 1 Standard door can be chosen
        DesireTags = Tags_PreBoss
        DebugPrint(" boss room next")
      else --Check if any Dead End door can reach another door with the given abilities, and if so, enable LeadsToDeadEnd doors
        for d = 1,#Doors["deadend"],1 do
          local Room = Doors["deadend"][d][1]
          local Index = Doors["deadend"][d][2]
          local Stage = math.floor(Room/10)
          if not (StageInUse[Stage] or DoorConnections[Room][Index][11]) then
            local ReachableDoors = GetReachableDoorsFromEntrance(Room,Index,PlayerAbilities,Tags_NoObstruct)
            if #ReachableDoors > 0 then
              DesireTags = Tags_Normal
              break
            end
          end
        end
      end
      if NextBossData then
        local BossName = false
        local TargetRoom,TargetIndex,ShortcutRoom,ShortcutIndex
        if RoomsPassed >= NextBossData[2] then
          BossName = RoomBossName[ NextBossData[1] ]
          TargetRoom,TargetIndex = ChooseDestination(ExitStage,DoorData[10],NextBossData[1],PlayerAbilities,Tags_NoObstruct,false,false)
          RoomBossName[ NextBossData[1] ] = nil --Unset this so future branches can pass through extra doors in the stage
          RoomsPassed = 0
          NextBossRoom = NextBossRoom + 1
          if NextBossRoom <= BossesPerRoute and Route[RouteIndex][NextBossRoom][1] == 100 then --Add extra possible requirements for reaching Yukari (Jump Lv3, Clouds, Darkness, Short)
            PlayerAbilities = AddAbilities(PlayerAbilities,{3,6,8,10})
          end
          DebugPrint(" chose boss room door",TargetRoom,TargetIndex)
        else
          if (not BossNext) and ((NextBossRoom > LastShortcut+1) and (RoomsPassed >= 2)) and ((RoomsPassed >= NextBossData[2]-3) or math.random() < 0.5) then
            TargetRoom,TargetIndex,ShortcutRoom,ShortcutIndex = ChooseDestination(ExitStage,DoorData[10],nil,PlayerAbilities,DesireTags,true,NextBossRoom>6)
            if (not TargetRoom) then
              DebugPrint("ERROR: Can't find space for shortcut path.") --DEBUG
              TargetRoom,TargetIndex = ChooseDestination(ExitStage,DoorData[10],nil,PlayerAbilities,DesireTags,false,NextBossRoom>6)
            end
          else
            TargetRoom,TargetIndex = ChooseDestination(ExitStage,DoorData[10],nil,PlayerAbilities,DesireTags,false,BossNext or NextBossRoom>6)
          end
          RoomsPassed = RoomsPassed + 1
          DebugPrint(" chose target door",TargetRoom,TargetIndex)
        end
        if TargetRoom and TargetIndex then
          local TargetStage = math.floor(TargetRoom/10)
          if RandoSetting["IncludeSpoilerLog"] then
            if BossName then
              table.insert(Spoiler_BossRoute[RouteIndex],"["..TargetStage.." "..BossName.."]")
            elseif ShortcutRoom then
              table.insert(Spoiler_BossRoute[RouteIndex],TargetStage.."*")
            else
              table.insert(Spoiler_BossRoute[RouteIndex],TargetStage)
            end
          end
          WriteConnection(ExitRoom,ExitIndex,TargetRoom,TargetIndex)
          
          if ShortcutRoom and ShortcutIndex then --Create a shortcut after every 2 bosses (where applicable)
            LastShortcut = NextBossRoom
            ConnectDoorToStageOne(ShortcutRoom,ShortcutIndex)
          end
          
          if NextBossRoom <= BossesPerRoute then
            if StagesThatUnlockAbilities[TargetStage] then
              PlayerAbilities = AddAbilities(PlayerAbilities,StagesThatUnlockAbilities[TargetStage])
            end
            local ReachableDoors = GetReachableDoorsFromEntrance(TargetRoom,TargetIndex,PlayerAbilities,DesireTags)
            local ChooseIndex = math.random(#ReachableDoors)
            local BranchRoom = ReachableDoors[ChooseIndex][1]
            local BranchIndex = ReachableDoors[ChooseIndex][2]
            
            BossBranch(BranchRoom,BranchIndex,RouteIndex,PlayerAbilities,TotalRooms+1)
          else
            --[[if TotalShortcutsUsed < 11 and RouteIndex == 1 then
              ConnectDoorToStageOne(Doors[200]["all"][2][1],Doors[200]["all"][2][2])
            end]]
            RouteFinished[RouteIndex] = true
          end
        else
          local Count = BossesPerRoute-(NextBossRoom-1)
          local Plural = ""
          if Count > 1 then
            Plural = "s"
          end
          print("ERROR: Route",RouteIndex,"was unable to complete!",Count,"Boss Room"..Plural.." may be misplaced!")
          for b = 1,#Route[RouteIndex],1 do
            local BossStage = Route[RouteIndex][b][1]
            RoomBossName[BossStage] = nil --Unset this so future branches could potentially pick up the slack if this happens
          end
        end
      end
    end
  
  print("Generating Initial Branches...")
  local IndexInUse = {}
  local StartDoorUsed = {}
  for r = 1,3,1 do
    LastShortcut = 1
    NextBossRoom = 1
    RoomsPassed = 0
    local RoomCount = math.random(5,7)
    Route[r][BossesPerRoute] = {RouteEndBossStages[r],RoomCount}
    for i = 1,BossesPerRoute-1,1 do --Choose boss stages for this route
      RoomCount = math.random(5,7)
      local Index = math.random(1,#NormalBossStages)
      for a = 1,75,1 do
        if not IndexInUse[Index] then
          IndexInUse[Index] = true
          Route[r][i] = {NormalBossStages[Index],RoomCount}
          --print("Boss Room "..i..": ".. NormalBossStages[Index],RoomCount)
          Error = false
          break
        end
        if a <= 50 then
          Index = math.random(1,#NormalBossStages)
        else
          Index = Index + 1
          if Index > #NormalBossStages then
            Index = 1
          end
        end
      end
    end
    
    local Index = math.random(1,#RouteStartDoors)
    for a = 1,15,1 do
      if not StartDoorUsed[Index] then
        DebugPrint("Starting Boss Branch",r,"on Start Door Index",Index)
        local Abilities = {}
        if RandoSetting["HardLogic"] then --Hard Logic ignores Night Vision and Short character requirements
          AddAbilities(Abilities,{8,10})
        end
        if RandoSetting["SuperJump"] and not RandoSetting["SoloCharacterChallenge"] then
          AddAbilities(Abilities,{2})
        end
        BossBranch(RouteStartDoors[Index][1],RouteStartDoors[Index][2],r,Abilities,1)
        StartDoorUsed[Index] = true
        break
      end
      if a <= 10 then
        Index = math.random(1,#RouteStartDoors)
      else
        Index = Index + 1
        if Index > #RouteStartDoors then
          Index = 1
        end
      end
    end
    
  end
  
  --[[local DoorsHandled = 0
  for d = 1,#Doors["all"],1 do
    local Room = Doors["all"][d][1]
    local Index = Doors["all"][d][2]
    if DoorConnections[Room][Index][11] then
      DoorsHandled = DoorsHandled + 1
    end
  end
  DebugPrint("Handling",DoorsHandled.."/"..#Doors["all"],"Doors")]]
  
  print("Filling out remaining connections...")
  
  for a = 1,2,1 do
    local CurrentDoors = {{10,1}}
    local Abilities
    if a == 1 then
      Abilities = {true,true,false,false,false,false,false,true,false,true,true,true,false,false,false}
    else
      Abilities = {true,true,true,true,true,true,true,true,true,true,true,true,true,true,true}
    end
    
    for x = 0,100,1 do
      local NewAbilities = {}
      local NewDoors = {}
      DebugPrint(x,#CurrentDoors)
      for i = 1,#CurrentDoors,1 do
        local EnterRoom = CurrentDoors[i][1]
        local EnterIndex = CurrentDoors[i][2]
        local EnterStage = math.floor(EnterRoom/10)
        local EnterData = DoorConnections[EnterRoom][EnterIndex]
        if not EnterData[13] then
          EnterData[13] = true
          local ReachableDoors = GetReachableDoorsFromEntrance(EnterRoom,EnterIndex,Abilities,nil,true)
          --print("",i,"reach",#ReachableDoors)
          for r = 1,#ReachableDoors,1 do
            local ExitRoom = ReachableDoors[r][1]
            local ExitIndex = ReachableDoors[r][2]
            local ExitData = DoorConnections[ExitRoom][ExitIndex]
            local TargetStage
            if ExitData[11] then
              table.insert(NewDoors,ExitData[11])
              TargetStage = math.floor(ExitData[11][1]/10)
            else
              local TargetRoom,TargetIndex = ChooseDestination(EnterStage,ExitData[10],nil,Abilities,nil,false,x%4)
              --if not TargetRoom then
              --  TargetRoom,TargetIndex = ChooseDestination(EnterStage,ExitData[10],nil,NormalBranchAbilities,nil,false,x%4)
              --end
              WriteConnection(ExitRoom,ExitIndex,TargetRoom,TargetIndex)
              table.insert(NewDoors,{TargetRoom,TargetIndex})
              TargetStage = math.floor(TargetRoom/10)
              if not StageInUse[TargetStage] then
                StageInUse[TargetStage] = true
                TotalStagesInUse = TotalStagesInUse + 1
              end
            end
            if (a == 1) and TargetStage and StagesThatUnlockAbilities[TargetStage] then
              for ab = 1,#StagesThatUnlockAbilities[TargetStage],1 do
                table.insert(NewAbilities,StagesThatUnlockAbilities[TargetStage][ab])
              end
            end
            --ExitData[13] = true
          end
        end
      end
      if #NewDoors > 0 then
        CurrentDoors = NewDoors
        if a == 1 then
          Abilities = AddAbilities(Abilities,NewAbilities)
        end
      else
        break
      end
    end
    if a == 1 then
      for d = 1,#Doors["all"],1 do
        DoorConnections[ Doors["all"][d][1] ][ Doors["all"][d][2] ][13] = false
      end
    end
  end
  
  local DoorsHandled = 0
  for d = 1,#Doors["all"],1 do
    local Room = Doors["all"][d][1]
    local Index = Doors["all"][d][2]
    if DoorConnections[Room][Index][11] then
      DoorsHandled = DoorsHandled + 1
    else
      local DoorData = DoorConnections[Room][Index]
      DebugPrint("Unhandled Door",d..":",DoorData[1],DoorData[2],DoorData[10])
      local TargetRoom,TargetIndex = ChooseDestination(math.floor(Room/10),DoorData[10],nil,{})
      if TargetRoom and TargetIndex then
        WriteConnection(Room,Index,TargetRoom,TargetIndex)
        DebugPrint(" connected to",TargetRoom,TargetIndex,DoorConnections[TargetRoom][TargetIndex][10])
        DoorsHandled = DoorsHandled + 1
      else
        DebugPrint(" could not connect!")
      end
    end
  end
  DebugPrint("Handling",DoorsHandled.."/"..#Doors["all"],"Doors, and",TotalStagesInUse,"stages")
    
  for d = 1,#Doors["all"],1 do
    DoorConnections[ Doors["all"][d][1] ][ Doors["all"][d][2] ][13] = false
  end
    
  local AllAbilities = {true,true,true,true,true,true,true,true,true,true,true,true,true,true,true}
  local EntranceCount = 0
  for d = 1,#Doors["all"],1 do
    local Room = Doors["all"][d][1]
    local Index = Doors["all"][d][2]
    local DoorData = DoorConnections[Room][Index]
    if DoorData[15] then
      local OppositeRoom = DoorData[11][1]
      local OppositeIndex = DoorData[11][2]
      --print(Room,Index,"-",OppositeRoom,OppositeIndex)
      local ReachableDoors = GetReachableDoorsFromEntrance(OppositeRoom,OppositeIndex,AllAbilities,nil,true)
      EntranceCount = EntranceCount + 1
      file:write("EntranceList["..EntranceCount.."] = "..DoorData[15])
      if #ReachableDoors > 0 then
        file:write(",{")
        local StageIncluded = {}
        for i = 1,#ReachableDoors,1 do
          local RequireAbility = ReachableDoors[i][3]
          --[[if RequireAbility == 8 or RequireAbility == 10 then --Darkness/Short requirements not shown since they are still physically passable with anyone
            RequireAbility = nil
          elseif RequireAbility == 11 then --Demote Jump2/Darkness into just Jump2
            RequireAbility = 2
          end]]
          local ReachDoorData = DoorConnections[ ReachableDoors[i][1] ][ ReachableDoors[i][2] ]
          if ReachDoorData[11] then
            local TargetStage = math.floor(ReachDoorData[11][1]/10)
            if RequireAbility then
              file:write("{"..TargetStage..","..RequireAbility.."}")
            else
              file:write("{"..TargetStage.."}")
            end
            if i < #ReachableDoors then
              file:write(",")
            end
          end
        end
        file:write("}}\n")
      else
        file:write(",nil}\n")
      end
    end
  end
  
  print("Reconfiguring Map... (There may be a stall)")
  file:write("\nlocal MapCoords = {}")
  local StageAngles = {}
  StageAngles[0] = {}
  
  local GetDirectionVector =
    function(Angle)
      local X = math.cos(math.rad(Angle))
      local Y = math.sin(math.rad(Angle))
      return {X,Y}
    end
    
  local NormalizeVector =
    function(Vect)
      local Length = math.sqrt((Vect[1]*Vect[1])+(Vect[2]*Vect[2]))
      if Length > 0 then
        return {Vect[1]/Length,Vect[2]/Length},true
      else
        return {0,0},false
      end
    end
    
  local GetAngleBetweenVectors =
    function(VectA,VectB)
      local X = VectB[1] - VectA[1]
      local Y = VectB[2] - VectA[2]
      local Length = math.sqrt((X*X)+(Y*Y))
      --local Angle = math.deg(math.atan((Y/Length)/(X/Length)))
      local Angle = math.deg(math.atan2(Y/Length,X/Length))
      if Angle < 0 then
        Angle = Angle + 360
      end
      return Angle
    end
    
  local LineIntersectsStage =
    function(CoordA,CoordB,StageCoord,Range)
      if not Range then
        Range = 20
      end
      local ratio = (( (StageCoord[1]-CoordA[1])*(CoordB[1]-CoordA[1]) ) + ( (StageCoord[2]-CoordA[2])*(CoordB[2]-CoordA[2]) )) / ((CoordB[1]-CoordA[1])^2+(CoordB[2]-CoordA[2])^2)
      if ratio > 0 and ratio < 1 then
        local X = CoordA[1] + (ratio*(CoordB[1]-CoordA[1]))
        local Y = CoordA[2] + (ratio*(CoordB[2]-CoordA[2]))
        local Distance = GetDistanceBetweenCoords({X,Y},StageCoord)
        if Distance <= Range then
          return true
        end
      end
      return false
    end
  
  local MapCoords = {}
  local TierLookup = {}
  local RelevantStages = {}
  local RelevantStagesByTier = {}
  local PlacedConnections = {}
  local ConnectionExists = {}
  for i = 1,220,1 do
    ConnectionExists[i] = {}
  end
  
  local NoIntersectionsAtCoord =
    function(DesireStage,DesireCoord)
      for i = 1,#PlacedConnections,1 do
        local StageA = PlacedConnections[i][1]
        local StageB = PlacedConnections[i][2]
        --if not ((StageA == DesireStage) or (StageB == DesireStage)) then
          if LineIntersectsStage(MapCoords[StageA],MapCoords[StageB],DesireCoord,20) then
            return false
          end
        --end
      end
      return true
    end
  
  local PlaceMapPoint
  PlaceMapPoint =
    function(Stage,ParentStage,ParentX,ParentY,ParentAngle,DistanceFromStart)
      StageAngles[Stage] = {}
      --local AngleText = "nil"
      --if not (ParentAngle == nil) then
      --  AngleText = ParentAngle
      --end
      --print(" STAGE "..Stage..": originating from "..ParentX..","..ParentY.." with Angle "..AngleText)
      local X
      local Y
      local Angle
      if Stage == 1 then
        X = ParentX + 0
        Y = ParentY + 0
      else
        local Retries = 0
        while true do
          if ParentAngle == nil then
            Angle = math.floor(((math.random()*360)-180)/10)*10
          else
            Angle = math.floor((ParentAngle + ((math.random()-0.5)*(math.min(200,(20*DistanceFromStart))+(5*Retries))))/10)*10
            if Angle > 180 then
              Angle = Angle - 360
            elseif Angle < 180 then
              Angle = Angle + 360
            end
          end
          
          local AngleValid = true
          for i = 1,#StageAngles[ParentStage],1 do
            if math.abs(Angle - StageAngles[ParentStage][i]) < 20 then
              AngleValid = false
              break
            end
          end
          
          if AngleValid then
            local Distance = (50 * (math.ceil(math.random()*3))) + 50
            local DirVect = GetDirectionVector(Angle)
            
            X = ParentX + math.floor(Distance * DirVect[1])
            Y = ParentY + math.floor(Distance * DirVect[2])
            --print("  Selected Angle of "..Angle.." degrees, with distance "..Distance..", Located at Coordinates "..X..","..Y)
            
            if (X >= -617) and (X <= 1255) and (Y >= -617) and (Y <= 1084) and NoIntersectionsAtCoord(Stage,{X,Y}) then
              local Collides = false
              for i = 1,220,1 do
                if not (i == Stage) then
                  if not (MapCoords[i] == nil) then
                    if GetDistanceBetweenCoords(MapCoords[i],{X,Y}) < 50 then
                      Collides = true
                      break
                    end
                  end
                end
              end
              if not Collides then
                break
              end
            else
              --print("  Placement is Out of Bounds; Retrying")
            end
          end
          if Retries >= 500 then
            print(" ERROR: Encountered problem placing Stage "..Stage.." on map! Placement may be malformed!")
            break
          end
          Retries = Retries + 1
        end
      end
      
      table.insert(StageAngles[Stage],Angle)
      MapCoords[Stage] = {X,Y}
      file:write("\nMapCoords["..Stage.."] = {"..X..","..Y.."}")
      local CurrentTier = TierLookup[Stage]
      local ConnectedStages = {}
      for i = 1,#RelevantStages[Stage],1 do
        local RelStage = RelevantStages[Stage][i]
        if MapCoords[RelStage] then
          if not ((Stage == 1) or ConnectionExists[Stage][RelStage]) then
            ConnectionExists[Stage][RelStage] = true
            ConnectionExists[RelStage][Stage] = true
            table.insert(PlacedConnections,{Stage,RelStage})
            print("Registering connection between",Stage,"and",RelStage)
          end
        elseif TierLookup[RelStage] > CurrentTier then
          table.insert(ConnectedStages,{RelStage,Stage,X,Y,Angle})
        end
      end
      --[[for room = (Stage*10)+5,Stage*10,-1 do
      
        if not (DoorConnections[room] == nil) then
          for i = 1,#DoorConnections[room],1 do
            local destroom = DoorConnections[room][i][1]
            local destent = DoorConnections[room][i][2]
            if not (EntranceTable[room] == nil) then
              if not (EntranceTable[room][destroom] == nil) then
                if not (EntranceTable[room][destroom][destent] == nil) then
                  local NextStage = math.floor(EntranceTable[room][destroom][destent][1]/10)
                  if MapCoords[NextStage] == nil then
                    if (NextStage >= 1) and (NextStage <= 220) then
                      table.insert(ConnectedStages,{NextStage,Stage,X,Y,Angle})
                    end
                  end
                end
              end
            end
          end
        end
        
        if not (OneWayDoors[room] == nil) then
          for i = 1,#OneWayDoors[room],1 do
            local destroom = OneWayDoors[room][i][1]
            local destent = OneWayDoors[room][i][2]
            if not (EntranceTable[room] == nil) then
              if not (EntranceTable[room][destroom] == nil) then
                if not (EntranceTable[room][destroom][destent] == nil) then
                  local NextStage = math.floor(EntranceTable[room][destroom][destent][1]/10)
                  if MapCoords[NextStage] == nil then
                    if (NextStage >= 1) and (NextStage <= 220) then
                      table.insert(ConnectedStages,{NextStage,Stage,X,Y,Angle})
                    end
                  end
                end
              end
            end
          end
        end
        
      end]]
      return ConnectedStages
    end
    
  local HighestCount = 0
  local MapTiers = {}
  local StageIsRelevantToStage = {}
  local StageHandled = {}
  local CurrentTier = 0
  local StagesToPlace = {1}
  local StageAngle = {}
  
  while true do --Branch out the stages for the map, assign tiers based on distance from Stage 1, and track relevant stages
    local NewStagesToPlace = {}
    MapTiers[CurrentTier] = {}
    for s = 1,#StagesToPlace,1 do
      local Stage = StagesToPlace[s]
      if not StageHandled[Stage] then
      
        StageHandled[Stage] = true
        if not RelevantStages[Stage] then
          RelevantStages[Stage] = {}
        end
        table.insert(MapTiers[CurrentTier],Stage)
        TierLookup[Stage] = CurrentTier
        
        for d = 1,#Doors[Stage]["all"],1 do
          local DoorData = DoorConnections[ Doors[Stage]["all"][d][1] ][ Doors[Stage]["all"][d][2] ]
          for i = 0,1,1 do
            if DoorData[11+i] then
              local NextStage = math.floor(DoorData[11+i][1]/10)
              if not StageHandled[NextStage] then
                table.insert(NewStagesToPlace,NextStage)
              end
              table.insert(RelevantStages[Stage],NextStage)
            end
          end
        end
      end
    end
    
    if #NewStagesToPlace <= 0 then
      break
    elseif #NewStagesToPlace > HighestCount then
      HighestCount = #NewStagesToPlace
    end
    CurrentTier = CurrentTier + 1
    StagesToPlace = NewStagesToPlace
  end
  
  for Stage = 1,220,1 do
    StageIsRelevantToStage[Stage] = {}
    RelevantStagesByTier[Stage] = {}
    for Tier = 1,#MapTiers,1 do
      RelevantStagesByTier[Stage][Tier] = {}
    end
    for b = 1,#RelevantStages[Stage],1 do
      local RelStage = RelevantStages[Stage][b]
      StageIsRelevantToStage[Stage][RelStage] = true
      local Tier = TierLookup[RelStage]
      if Tier and Tier > 0 then
        table.insert(RelevantStagesByTier[Stage][Tier],RelStage)
      end
    end
  end
  
  local CenterCoord = {263,231}
  local MaxDistance = 880 --Y dist: 848
  local YRatio = 0.9636
  local RingDistance = 150 --MaxDistance / CurrentTier --/ math.min(7,CurrentTier)
  local StageRings = {}
  for i = 1,CurrentTier,1 do
    StageRings[i] = {}
  end
  
  MapCoords[1] = CenterCoord
  
  --[[local RingPositions = {}
  for i = 1,CurrentTier,1 do --Assign coordinates based on tier and position on ring
    local MinPoints = 14
    if RingPositions[i-1] then
      MinPoints = math.max(14,math.ceil(#RingPositions[i-1]/2))
    end
    local PointCount = math.max(MinPoints,#MapTiers[i])
    RingPositions[i] = {}
    local TierAngle = 360 / PointCount
    local Distance = 150 * i --RingDistance * i
    for t = 1,PointCount,1 do
      local Angle = TierAngle * t
      
      local Vector = GetDirectionVector(Angle)
      for xy = 1,2,1 do
        Vector[xy] = Vector[xy] * Distance
        if xy == 2 then
          Vector[xy] = Vector[xy] * YRatio
        end
        Vector[xy] = Vector[xy]+CenterCoord[xy]
      end
      --if (Vector[1] >= -617) and (Vector[1] <= 1255) and (Vector[2] >= -617) and (Vector[2] <= 1084) then
        table.insert(RingPositions[i],{coords = Vector,angle = Angle})
      --end
    end
  end]]
  
  local GetAngleDifference =
    function(Angle1,Angle2)
      if Angle1 + 180 < Angle2 then
        Angle1 = Angle1 + 360
      elseif Angle2 + 180 < Angle1 then
        Angle2 = Angle2 + 360
      end
      return math.abs(Angle1-Angle2)
    end
      
  --[[local NoPositionIntersectsLine =
    function(TierA,PosA,TierB,PosB)
      local CoordA = RingPositions[TierA][PosA]["coords"]
      local CoordB = RingPositions[TierB][PosB]["coords"]
      for TierC = 1,#RingPositions,1 do
        for PosC = 1,#RingPositions[TierC],1 do
          if (not ((TierA == TierC) and (PosA == PosC))) and (not ((TierB == TierC) and (PosB == PosC))) then
            local CoordC = RingPositions[TierC][PosC]["coords"]
            if LineIntersectsStage(CoordA,CoordB,CoordC) then
              return false
            end
          end
        end
      end
      return true
    end
  
  for t = 1,#RingPositions,1 do --Note all relevant map points near each point
    --print("Ring Tier",t..":")
    for p = 1,#RingPositions[t],1 do
      --print(" Position",p..":")
      for t2 = t-1,t+1,1 do
        if RingPositions[t2] then
          for p2 = 1,#RingPositions[t2],1 do
            if not ((t == t2) and (p == p2)) then
              local Difference = GetAngleDifference(RingPositions[t][p]["angle"],RingPositions[t2][p2]["angle"])
              if Difference <= 90 then --Grab positions that don't have any other stages in the way
                if NoPositionIntersectsLine(t,p,t2,p2) then
                  if not RingPositions[t][p]["validreltiers"] then
                    RingPositions[t][p]["validreltiers"] = {}
                  end
                  if not RingPositions[t][p]["validreltiers"][t2] then
                    RingPositions[t][p]["validreltiers"][t2] = {}
                  end
                  table.insert(RingPositions[t][p]["validreltiers"][t2],p2)
                end
                if not RingPositions[t][p]["fallbackreltiers"] then
                  RingPositions[t][p]["fallbackreltiers"] = {}
                end
                if not RingPositions[t][p]["fallbackreltiers"][t2] then
                  RingPositions[t][p]["fallbackreltiers"][t2] = {}
                end
                table.insert(RingPositions[t][p]["fallbackreltiers"][t2],p2)
              end
            end
          end
          --if RingPositions[t][p][3][t2] and #RingPositions[t][p][3][t2] > 0 then
            --print("  relevant tier",t2..":",#RingPositions[t][p][3][t2],"entries")
          --end
        end
      end
    end
  end]]
  
  local CountIntersectionsAtCoord =
    function(TestCoord,TestStage,StageDist,LineDist)
      if not StageDist then
        StageDist = 50
      end
      local Intersections = 0
      local RelStages = RelevantStages[TestStage]
      local ConnectionTested = {}
      for r = 1,#RelStages,1 do --Test if any other stages intersect the new coord's lines
        local CoordB = MapCoords[ RelStages[r] ]
        if CoordB then
          for OtherStage = 1,220,1 do
            if MapCoords[OtherStage] then
              if GetDistanceBetweenCoords(TestCoord,MapCoords[OtherStage]) < StageDist then --Fail if the coords collide with another stage
                return 9999
              else
                if LineIntersectsStage(TestCoord,CoordB,MapCoords[OtherStage],LineDist) then
                  Intersections = Intersections + 1
                end
              end
            end
          end
        end
      end
      for StageA = 1,220,1 do --Test if the new coord intersects any other lines
        local CoordA = MapCoords[StageA]
        if (not (StageA == TestStage)) and CoordA then
          local RelStages = RelevantStages[StageA]
          for r = 1,#RelStages,1 do
            local StageB = RelStages[r]
            local CoordB = MapCoords[StageB]
            if CoordB and ((not ConnectionTested[StageA]) or (not ConnectionTested[StageA][StageB])) then
              if not ConnectionTested[StageA] then
                ConnectionTested[StageA] = {}
              end
              ConnectionTested[StageA][StageB] = true
              if not ConnectionTested[StageB] then
                ConnectionTested[StageB] = {}
              end
              ConnectionTested[StageB][StageA] = true
              if LineIntersectsStage(CoordA,CoordB,TestCoord,LineDist) then
                Intersections = Intersections + 1
              end
            end
          end
        end
      end
      return Intersections
    end
    
  local StageDistance = 100
  local MapBounds = {CenterCoord[1]-1000,CenterCoord[2]-1000,CenterCoord[1]+1000,CenterCoord[2]+1000} --Low X, Low Y, High X, High Y
  
  
  for Tier = 1,#MapTiers,1 do
    print(" Tier",Tier.."/"..#MapTiers.."...")
    for s = 1,#MapTiers[Tier],1 do
      local Stage = MapTiers[Tier][s]
      local AvailRelStages = {}
      local BaseDir = {0,0}
      local Valid = true
      if Tier > 1 then
        local RelStages = RelevantStagesByTier[Stage][Tier-1]
        local CurrAngles = {}
        for i = 1,#RelStages,1 do
          local RelStage = RelStages[i]
          if MapCoords[RelStage] then
            table.insert(AvailRelStages,RelStage)
            local Angle = GetAngleBetweenVectors(MapCoords[1],MapCoords[RelStage])
            local Dir = GetDirectionVector(Angle)
            BaseDir[1] = BaseDir[1] + Dir[1]
            BaseDir[2] = BaseDir[2] + Dir[2]
          end
        end
        if #AvailRelStages > 1 then
          BaseDir,Valid = NormalizeVector(BaseDir)
          if not Valid then
            AvailRelStages = {}
          end
        end
      end
      local BestIntersectCount = 5555
      local BestCoords
      for i = 100,1100,1 do
        local Intensity = (i/10)*Tier
        local NewCoord
        local BaseLen = StageDistance + (25*(Tier-1))
        if #AvailRelStages > 0 then --Choose random relevant stage to start from, apply a constant distance in the direction, and then apply a random offset in any direction
          local Index = math.random(#AvailRelStages)
          local BaseCoords = MapCoords[ AvailRelStages[Index] ]
          NewCoord = {BaseCoords[1]+(BaseDir[1]*BaseLen),BaseCoords[2]+(BaseDir[2]*BaseLen)}
        else
          
          BaseDir = GetDirectionVector(math.random()*360)
          NewCoord = {CenterCoord[1]+(BaseDir[1]*BaseLen),CenterCoord[2]+(BaseDir[2]*BaseLen)}
        end
        
        local OffsetDir = GetDirectionVector(math.random()*360)
        local OffsetLen = math.random(math.ceil(Intensity))
        NewCoord[1] = NewCoord[1] + (OffsetDir[1]*OffsetLen)
        NewCoord[2] = NewCoord[2] + (OffsetDir[2]*OffsetLen)
        local LineDist = 20
        if i > 600 then
          LineDist = 10
        end
        local Intersections = CountIntersectionsAtCoord(NewCoord,Stage,50,LineDist)
        if Intersections == 0 then
          MapCoords[Stage] = NewCoord
          --print("Placed Stage",Stage,"at coords",math.floor(NewCoord[1]),math.floor(NewCoord[2]),"with no problems")
          break
        elseif Intersections < BestIntersectCount then
          BestIntersectCount = Intersections
          BestCoords = NewCoord
        end
        if i == 1100 then
          if BestCoords then
            MapCoords[Stage] = BestCoords
          --  print("Placed Stage",Stage,"at coords",math.floor(BestCoords[1]),math.floor(BestCoords[2]),"with",BestIntersectCount,"intersections")
         else
            print("Couldn't find space on map for Stage",Stage.."!")
          end
        end
      end
    end
  end
    
  local AccessibleStages = 0
  local XAdd = 0
  for i = 1,220,1 do
    if MapCoords[i] == nil then
      local X = -617 + XAdd
      local Y = -617
      MapCoords[i] = {X,Y}
      file:write("\nMapCoords["..i.."] = {"..X..","..Y.."}")
      XAdd = XAdd + 50
    else
      AccessibleStages = AccessibleStages + 1
      file:write("\nMapCoords["..i.."] = {"..MapCoords[i][1]..","..MapCoords[i][2].."}")
    end
  end
  DebugPrint("Finished map with",AccessibleStages,"Stages")
  
else
  file:write("\nlocal MapCoords = {}")
end

file:write("\n\nreturn EntranceList,MapCoords")
file:close()

if RandoSetting["RandomizeDoors"] then
  print("Randomization Finished!")
else
  print("Settings Applied!")
end

CreateSpoilerLog(Spoiler_BossRoute)