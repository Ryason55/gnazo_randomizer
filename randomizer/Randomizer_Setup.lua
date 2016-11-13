--Destination Door, Destination Entrance ID, Self Entrance ID, Door Color, Is Shortcut, Cannot access other doors, Cannot be accessed from other doors, Is a soft one-way, Can *only* be accessed by this door, Leads to Dead End (auto), Leads to Soft One-Way (auto), Is in use (auto)
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
DoorConnections[20] = {}
DoorConnections[20][1] = {11,0,0,1,false}
DoorConnections[22] = {}
DoorConnections[22][1] = {30,0,0,2,false}
DoorConnections[22][2] = {170,0,1,1,false}
DoorConnections[30] = {}
DoorConnections[30][1] = {22,0,0,2,false}
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
DoorConnections[70] = {}
DoorConnections[70][1] = {31,0,0,3,false}
DoorConnections[70][2] = {92,0,1,3,false,false,false,false,{{120,0}} }
DoorConnections[70][3] = {120,0,2,3,false,false,false,false,{{92,0}} }
DoorConnections[71] = {}
DoorConnections[71][1] = {80,0,0,3,false}
DoorConnections[71][2] = {350,0,1,2,false}
DoorConnections[80] = {}
DoorConnections[80][1] = {71,0,0,3,false}
DoorConnections[80][2] = {150,0,1,2,false}
DoorConnections[82] = {}
DoorConnections[82][1] = {90,0,0,3,false}
DoorConnections[90] = {}
DoorConnections[90][1] = {82,0,0,3,false}
DoorConnections[92] = {}
DoorConnections[92][1] = {70,1,0,3,false}
DoorConnections[100] = {}
DoorConnections[100][1] = {52,0,0,1,false}
DoorConnections[100][2] = {130,0,1,1,false}
DoorConnections[101] = {}
DoorConnections[101][1] = {142,0,0,1,false}
DoorConnections[101][2] = {133,0,1,1,false}
DoorConnections[120] = {}
DoorConnections[120][1] = {70,2,0,3,false}
DoorConnections[120][2] = {10,1,1,3,false}
DoorConnections[120][3] = {270,2,2,3,false}
DoorConnections[120][4] = {721,1,3,3,false}
DoorConnections[130] = {}
DoorConnections[130][1] = {100,1,0,1,false}
DoorConnections[132] = {}
DoorConnections[132][1] = {160,0,0,1,false}
DoorConnections[133] = {}
DoorConnections[133][1] = {101,1,0,1,false,false,true}
DoorConnections[140] = {}
DoorConnections[140][1] = {50,1,0,1,false}
DoorConnections[142] = {}
DoorConnections[142][1] = {101,0,0,1,false}
DoorConnections[150] = {}
DoorConnections[150][1] = {80,1,0,2,false}
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
DoorConnections[180][2] = {232,0,1,1,false,false,true}
DoorConnections[183] = {}
DoorConnections[183][1] = {200,0,0,1,false}
DoorConnections[190] = {}
DoorConnections[190][1] = {201,0,0,1,false}
DoorConnections[190][2] = {880,0,1,3,false}
DoorConnections[191] = {}
DoorConnections[191][1] = {210,0,0,1,false}
DoorConnections[191][2] = {202,0,1,1,false}
DoorConnections[191][3] = {242,0,2,1,false,false,true}
DoorConnections[191][4] = {1421,0,3,3,false}
DoorConnections[200] = {}
DoorConnections[200][1] = {183,0,0,1,false,false,false,false,{{190,0}} }
DoorConnections[201] = {}
DoorConnections[201][1] = {190,0,0,1,false,false,false,false,{{183,0}} }
DoorConnections[201][2] = {230,0,1,2,false,false,false,false,{{191,1}} }
DoorConnections[201][3] = {260,0,2,2,false,false,false,false,{{740,2}} }
DoorConnections[201][4] = {740,2,3,1,false,false,false,false,{{260,0}} }
DoorConnections[202] = {}
DoorConnections[202][1] = {191,1,0,1,false,false,false,false,{{230,0}} }
DoorConnections[210] = {}
DoorConnections[210][1] = {191,0,0,1,false}
DoorConnections[210][2] = {240,0,1,1,false}
DoorConnections[220] = {}
DoorConnections[220][1] = {53,0,0,1,false}
DoorConnections[230] = {}
DoorConnections[230][1] = {201,1,0,1,false,false,true}
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
DoorConnections[270][1] = {253,0,0,1,false,false,false,false,{{10,2}} }
DoorConnections[270][2] = {10,2,1,1,false,false,false,false,{{253,0}} }
DoorConnections[270][3] = {120,2,2,1,false,false,true}
DoorConnections[272] = {}
DoorConnections[272][1] = {280,0,0,1,false,false,false,true}
DoorConnections[280] = {}
DoorConnections[280][1] = {272,0,0,1,false}
DoorConnections[281] = {}
DoorConnections[281][1] = {290,1,0,2,false,false,true}
DoorConnections[282] = {}
DoorConnections[282][1] = {291,0,0,2,false,false,false,true}
DoorConnections[283] = {}
DoorConnections[283][1] = {290,0,0,1,false}
DoorConnections[290] = {}
DoorConnections[290][1] = {283,0,0,1,false}
DoorConnections[290][2] = {281,0,1,2,false,false,false,false,{{282,0}} }
DoorConnections[291] = {}
DoorConnections[291][1] = {282,0,0,2,false,false,false,false,{{281,0}} }
DoorConnections[293] = {}
DoorConnections[293][1] = {300,0,0,1,false}
DoorConnections[293][2] = {320,0,1,1,false}
DoorConnections[293][3] = {310,0,3,1,false}
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
DoorConnections[310][1] = {293,3,0,1,false,false,false,true}
DoorConnections[310][2] = {260,1,1,2,false,false,true}
DoorConnections[320] = {}
DoorConnections[320][1] = {293,1,0,1,false,false,false,true}
DoorConnections[320][2] = {350,1,1,2,false,false,true}
DoorConnections[330] = {}
DoorConnections[330][1] = {301,0,0,3,false,false,false,false,{{340,0}} }
DoorConnections[330][2] = {341,0,1,1,false,false,false,true}
DoorConnections[331] = {}
DoorConnections[331][1] = {340,0,0,1,false,false,false,false,{{301,0}} }
DoorConnections[340] = {}
DoorConnections[340][1] = {331,0,0,1,false,false,true,false,{{330,1},{360,0}} }
DoorConnections[340][2] = {360,1,1,1,false,false,false,false,{{381,1}} }
DoorConnections[340][3] = {381,1,2,1,false,false,false,false,{{360,1}} }
DoorConnections[341] = {}
DoorConnections[341][1] = {330,1,0,1,false,false,false,false,{{331,0},{360,0}} }
DoorConnections[342] = {}
DoorConnections[342][1] = {360,0,0,1,false,false,false,false,{{331,0},{330,1}} }
DoorConnections[342][2] = {380,1,1,1,false,true,true} --Dead End; Red Orb
DoorConnections[350] = {}
DoorConnections[350][1] = {71,1,0,2,false}
DoorConnections[350][2] = {320,1,1,2,false}
DoorConnections[360] = {}
DoorConnections[360][1] = {342,0,0,1,false}
DoorConnections[360][2] = {340,1,1,1,false,false,true,true} --Ice Drop into enclosed space
DoorConnections[360][3] = {370,0,2,2,false}
DoorConnections[360][4] = {410,0,3,3,false}
DoorConnections[370] = {}
DoorConnections[370][1] = {360,2,0,2,false,false,true}
DoorConnections[372] = {}
DoorConnections[372][1] = {380,0,0,1,false,false,false,true} --Requires high jump
DoorConnections[380] = {}
DoorConnections[380][1] = {372,0,0,1,false}
DoorConnections[380][2] = {342,1,1,1,false}
DoorConnections[381] = {}
DoorConnections[381][1] = {390,0,0,1,false}
DoorConnections[381][2] = {340,2,1,1,false,false,true}
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
DoorConnections[410][1] = {360,3,0,3,false,false,true,true} --Requires high jump
DoorConnections[410][2] = {530,0,1,3,false,false,true,true}
DoorConnections[430] = {}
DoorConnections[430][1] = {162,0,0,1,false}
DoorConnections[430][2] = {10,3,1,2,false}
DoorConnections[431] = {}
DoorConnections[431][1] = {450,0,0,2,false}
DoorConnections[440] = {}
DoorConnections[440][1] = {461,0,0,2,false}
DoorConnections[440][2] = {571,1,1,1,false}
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
DoorConnections[480] = {}
DoorConnections[480][1] = {471,1,0,3,false}
DoorConnections[480][2] = {492,0,1,2,false,false,false,true} --Requires high jump
DoorConnections[480][3] = {1020,0,2,4,false}
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
DoorConnections[501][3] = {590,0,2,4,false,true,true} --Ice Drop into enclosed space
DoorConnections[510] = {}
DoorConnections[510][1] = {501,0,0,2,false}
DoorConnections[511] = {}
DoorConnections[511][1] = {1640,0,0,2,false}
DoorConnections[513] = {}
DoorConnections[513][1] = {690,0,0,2,false}
DoorConnections[520] = {}
DoorConnections[520][1] = {501,1,0,3,false}
DoorConnections[520][2] = {560,2,1,2,false}
DoorConnections[530] = {}
DoorConnections[530][1] = {410,1,0,3,false}
DoorConnections[540] = {}
DoorConnections[540][1] = {491,0,0,1,false}
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
DoorConnections[580][1] = {642,1,0,3,false}
DoorConnections[590] = {}
DoorConnections[590][1] = {501,2,0,4,false,false,true}
DoorConnections[590][2] = {550,0,1,4,false,false,false,true}
DoorConnections[600] = {}
DoorConnections[600][1] = {640,0,2,3,false}
DoorConnections[610] = {}
DoorConnections[610][1] = {571,0,0,3,false}
DoorConnections[610][2] = {572,0,1,2,false,false,true}
DoorConnections[611] = {}
DoorConnections[611][1] = {620,0,0,3,false}
DoorConnections[620] = {}
DoorConnections[620][1] = {611,0,0,3,false}
DoorConnections[622] = {}
DoorConnections[622][1] = {641,0,0,2,false}
DoorConnections[631] = {}
DoorConnections[631][1] = {661,0,0,3,false}
DoorConnections[640] = {}
DoorConnections[640][1] = {600,2,0,3,false,false,true}
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
DoorConnections[661][1] = {631,0,0,3,false,false,false,false,{{680,0}} }
DoorConnections[661][2] = {680,0,1,3,false,false,false,false,{{631,0}} }
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
DoorConnections[700][1] = {750,2,0,3,false,false,true,true} --Requires high jump
DoorConnections[700][2] = {850,2,1,2,false,false,true,true}
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
DoorConnections[760] = {}
DoorConnections[760][1] = {740,1,0,2,false}
DoorConnections[771] = {}
DoorConnections[771][1] = {780,0,0,2,false}
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
DoorConnections[820][2] = {890,1,1,2,false,false,true}
DoorConnections[821] = {}
DoorConnections[821][1] = {860,0,0,1,false}
DoorConnections[830] = {}
DoorConnections[830][1] = {792,0,0,1,false}
DoorConnections[830][2] = {10,6,1,3,false}
DoorConnections[830][3] = {850,0,2,2,false}
DoorConnections[840] = {}
DoorConnections[840][1] = {550,1,0,4,false}
DoorConnections[850] = {}
DoorConnections[850][1] = {830,2,0,2,false}
DoorConnections[850][2] = {800,0,1,1,false}
DoorConnections[850][3] = {700,1,2,2,false}
DoorConnections[860] = {}
DoorConnections[860][1] = {821,0,0,1,false}
DoorConnections[861] = {}
DoorConnections[861][1] = {870,0,0,3,false}
DoorConnections[861][2] = {1160,1,1,2,false,false,true}
DoorConnections[870] = {}
DoorConnections[870][1] = {861,0,0,3,false}
DoorConnections[870][2] = {900,0,1,1,false}
DoorConnections[880] = {}
DoorConnections[880][1] = {190,1,0,3,false}
DoorConnections[890] = {}
DoorConnections[890][1] = {801,1,0,3,false}
DoorConnections[890][2] = {820,1,1,2,false}
DoorConnections[890][3] = {1030,0,2,4,false}
DoorConnections[900] = {}
DoorConnections[900][1] = {870,1,0,1,false}
DoorConnections[902] = {}
DoorConnections[902][1] = {910,0,0,3,false}
DoorConnections[902][2] = {680,1,1,2,false}
DoorConnections[910] = {}
DoorConnections[910][1] = {902,0,0,3,false}
DoorConnections[911] = {}
DoorConnections[911][1] = {920,0,0,1,false}
DoorConnections[911][2] = {1010,0,2,4,false,true,true}
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
DoorConnections[940][3] = {2202,0,2,4,false}
DoorConnections[950] = {}
DoorConnections[950][1] = {940,1,0,4,false}
DoorConnections[950][2] = {960,0,1,4,false}
DoorConnections[960] = {}
DoorConnections[960][1] = {950,1,0,4,false}
DoorConnections[960][2] = {970,0,1,4,false}
DoorConnections[970] = {}
DoorConnections[970][1] = {960,1,0,4,false}
DoorConnections[970][2] = {980,0,1,4,false}
DoorConnections[980] = {}
DoorConnections[980][1] = {970,1,0,4,false}
DoorConnections[991] = {}
DoorConnections[991][1] = {1000,0,0,4,false}
DoorConnections[1000] = {}
DoorConnections[1000][1] = {991,0,0,4,false}
DoorConnections[1010] = {}
DoorConnections[1010][1] = {911,2,0,4,false,false,true}
DoorConnections[1010][2] = {800,1,1,4,false,false,false,true}
DoorConnections[1020] = {}
DoorConnections[1020][1] = {480,2,0,4,false,false,true}
DoorConnections[1020][2] = {1120,0,1,4,false,false,false,true}
DoorConnections[1030] = {}
DoorConnections[1030][1] = {890,2,0,4,false}
DoorConnections[1040] = {}
DoorConnections[1040][1] = {1490,3,0,4,false}
DoorConnections[1050] = {}
DoorConnections[1050][1] = {672,0,0,2,false,false,false,false,{{302,2}} }
DoorConnections[1050][2] = {302,2,1,3,false,false,false,false,{{672,0}} }
DoorConnections[1051] = {}
DoorConnections[1051][1] = {1060,0,0,1,false}
DoorConnections[1051][2] = {810,2,1,1,false}
DoorConnections[1060] = {}
DoorConnections[1060][1] = {1051,0,0,1,false,false,false,false,{{1070,0}} }
DoorConnections[1062] = {}
DoorConnections[1062][1] = {1070,0,0,3,false,false,false,false,{{1051,0}} }
DoorConnections[1062][2] = {1120,1,1,3,false,false,false,false,{{1090,1}} }
DoorConnections[1063] = {}
DoorConnections[1063][1] = {1090,1,0,3,false,false,false,false,{{1120,1}} }
DoorConnections[1070] = {}
DoorConnections[1070][1] = {1062,0,0,3,false}
DoorConnections[1071] = {}
DoorConnections[1071][1] = {1090,0,0,1,false}
DoorConnections[1080] = {}
DoorConnections[1080][1] = {1101,0,0,2,false}
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
DoorConnections[1120] = {}
DoorConnections[1120][1] = {1020,1,0,4,false,false,true}
DoorConnections[1120][2] = {1062,1,1,3,false,false,false,true}
DoorConnections[1130] = {}
DoorConnections[1130][1] = {1112,0,0,3,false}
DoorConnections[1132] = {}
DoorConnections[1132][1] = {1150,0,0,1,false}
DoorConnections[1140] = {}
DoorConnections[1140][1] = {1111,0,0,2,false}
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
DoorConnections[1170][1] = {1240,1,0,2,false}
DoorConnections[1170][2] = {1310,1,1,3,false}
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
DoorConnections[1201] = {}
DoorConnections[1201][1] = {1220,1,0,2,false}
DoorConnections[1210] = {}
DoorConnections[1210][1] = {1192,0,0,2,false}
DoorConnections[1211] = {}
DoorConnections[1211][1] = {1220,0,0,1,false}
DoorConnections[1220] = {}
DoorConnections[1220][1] = {1211,0,0,1,false,false,false,false,{{1201,0},{1240,0}} }
DoorConnections[1220][2] = {1201,0,1,2,false,false,false,false,{{1211,0},{1240,0}} }
DoorConnections[1221] = {}
DoorConnections[1221][1] = {1240,0,0,1,false,false,false,false,{{1211,0},{1201,0}} }
DoorConnections[1221][2] = {1490,2,1,1,false,false,false,false,{{1260,2}} }
DoorConnections[1221][3] = {1260,2,2,3,false,false,false,false,{{1490,2}} }
DoorConnections[1231] = {}
DoorConnections[1231][1] = {1270,1,0,1,false}
DoorConnections[1240] = {}
DoorConnections[1240][1] = {1221,0,0,1,false}
DoorConnections[1240][2] = {1170,0,1,2,false}
DoorConnections[1241] = {}
DoorConnections[1241][1] = {1250,0,0,1,false}
DoorConnections[1241][2] = {930,0,1,4,false}
DoorConnections[1250] = {}
DoorConnections[1250][1] = {1241,0,0,1,false}
DoorConnections[1253] = {}
DoorConnections[1253][1] = {1260,0,0,2,false}
DoorConnections[1260] = {}
DoorConnections[1260][1] = {1253,0,0,2,false}
DoorConnections[1260][2] = {1270,0,1,2,false}
DoorConnections[1260][3] = {1221,2,2,3,false,false,true}
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
DoorConnections[1310][1] = {1301,0,0,1,false}
DoorConnections[1310][2] = {1170,1,1,3,false}
DoorConnections[1312] = {}
DoorConnections[1312][1] = {1330,0,0,3,false}
DoorConnections[1320] = {}
DoorConnections[1320][1] = {1331,0,1,1,false,false,true,true}
DoorConnections[1320][2] = {1390,1,2,3,false,true,true}
DoorConnections[1330] = {}
DoorConnections[1330][1] = {1312,0,0,3,false}
DoorConnections[1331] = {}
DoorConnections[1331][1] = {1320,1,0,1,false,false,true}
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
DoorConnections[1360][2] = {1352,0,1,1,false,false,true}
DoorConnections[1360][3] = {1370,0,2,1,false}
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
DoorConnections[1440] = {}
DoorConnections[1440][1] = {1460,1,0,4,false}
DoorConnections[1450] = {}
DoorConnections[1450][1] = {1431,0,0,1,false}
DoorConnections[1450][2] = {1470,0,1,2,false}
DoorConnections[1450][3] = {1470,1,2,3,false}
DoorConnections[1460] = {}
DoorConnections[1460][1] = {1471,0,0,2,false}
DoorConnections[1460][2] = {1440,0,1,4,false}
DoorConnections[1470] = {}
DoorConnections[1470][1] = {1450,1,0,2,false,false,false,false,{{1480,0}} }
DoorConnections[1470][2] = {1450,2,1,3,false,false,false,false,{{1460,0}} }
DoorConnections[1470][3] = {1480,0,2,4,false,false,false,false,{{1450,1}} }
DoorConnections[1471] = {}
DoorConnections[1471][1] = {1460,0,0,2,false,false,false,false,{{1450,2}} }
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
DoorConnections[1510][1] = {1370,1,0,2,false}
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
DoorConnections[1591][2] = {1582,0,1,2,false,false,true}
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
DoorConnections[1640][1] = {511,0,0,2,false}
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
DoorConnections[1671][2] = {1680,0,1,2,false}
DoorConnections[1680] = {}
DoorConnections[1680][1] = {1671,1,0,2,false}
DoorConnections[1680][2] = {1690,0,1,1,false}
DoorConnections[1690] = {}
DoorConnections[1690][1] = {1680,1,0,1,false,false,true}
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
DoorConnections[1720][1] = {1700,1,0,2,false}
DoorConnections[1730] = {}
DoorConnections[1730][1] = {1710,1,0,3,false}
DoorConnections[1733] = {}
DoorConnections[1733][1] = {1740,0,0,3,false}
DoorConnections[1740] = {}
DoorConnections[1740][1] = {1733,0,0,3,false}
DoorConnections[1740][2] = {1760,0,1,1,false}
DoorConnections[1750] = {}
DoorConnections[1750][1] = {1611,1,0,1,false}
DoorConnections[1760] = {}
DoorConnections[1760][1] = {1740,1,0,2,false}
DoorConnections[1763] = {}
DoorConnections[1763][1] = {1790,0,0,3,false}
DoorConnections[1770] = {}
DoorConnections[1770][1] = {1700,2,0,1,false,false,true,true} --Clouds
DoorConnections[1772] = {}
DoorConnections[1772][1] = {1811,1,0,1,false,false,true,true} --Clouds
DoorConnections[1780] = {}
DoorConnections[1780][1] = {1502,1,0,2,false,false,true,true} --Clouds
DoorConnections[1781] = {}
DoorConnections[1781][1] = {1890,1,0,3,false,false,true,true} --Clouds
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
DoorConnections[1812][1] = {1820,1,0,3,false,false,false,true}
DoorConnections[1820] = {}
DoorConnections[1820][1] = {1811,0,0,2,false}
DoorConnections[1820][2] = {1812,0,1,3,false,false,true}
DoorConnections[1820][3] = {1840,0,2,1,false}
DoorConnections[1820][4] = {1910,0,3,4,false}
DoorConnections[1830] = {}
DoorConnections[1830][1] = {1850,2,0,3,false}
DoorConnections[1840] = {}
DoorConnections[1840][1] = {1820,2,0,1,false}
DoorConnections[1841] = {}
DoorConnections[1841][1] = {1850,0,0,1,false}
DoorConnections[1841][2] = {1850,1,1,2,false}
DoorConnections[1850] = {}
DoorConnections[1850][1] = {1841,0,0,1,false,false,false,false,{{1860,0}} }
DoorConnections[1850][2] = {1841,1,1,2,false,false,false,false,{{1830,0}} }
DoorConnections[1850][3] = {1830,0,2,3,false,false,false,false,{{1841,1}} }
DoorConnections[1850][4] = {1860,0,3,1,false,false,false,false,{{1841,0}} }
DoorConnections[1860] = {}
DoorConnections[1860][1] = {1850,3,0,1,false}
DoorConnections[1862] = {}
DoorConnections[1862][1] = {1870,0,0,1,false}
DoorConnections[1870] = {}
DoorConnections[1870][1] = {1862,0,0,1,false,false,true}
DoorConnections[1870][2] = {1880,0,1,2,false,false,false,true}
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
DoorConnections[1900][1] = {1892,0,0,4,false,false,true}
DoorConnections[1901] = {}
DoorConnections[1901][1] = {1920,0,0,2,false,false,false,true}
DoorConnections[1910] = {}
DoorConnections[1910][1] = {1820,3,0,4,false}
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
DoorConnections[1970][1] = {2102,0,0,4,false,true,true}
DoorConnections[1980] = {}
DoorConnections[1980][1] = {1961,0,0,4,false}
DoorConnections[1980][2] = {1990,0,1,4,false}
DoorConnections[1990] = {}
DoorConnections[1990][1] = {1980,1,0,4,false}
DoorConnections[1992] = {}
DoorConnections[1992][1] = {2000,0,0,4,false,false,false,true} --Blocked by Kanako 1
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
DoorConnections[2040] = {}
DoorConnections[2040][1] = {2020,2,0,3,false}
DoorConnections[2040][2] = {2051,0,1,1,false}
DoorConnections[2050] = {}
DoorConnections[2050][1] = {2030,1,0,2,false,false,true}
DoorConnections[2051] = {}
DoorConnections[2051][1] = {2040,1,0,1,false}
DoorConnections[2052] = {}
DoorConnections[2052][1] = {2060,0,0,3,false}
DoorConnections[2060] = {}
DoorConnections[2060][1] = {2052,0,0,3,false}
DoorConnections[2060][2] = {2080,0,1,2,false}
DoorConnections[2070] = {}
DoorConnections[2070][1] = {2030,2,1,4,false}
DoorConnections[2080] = {}
DoorConnections[2080][1] = {2060,1,0,2,false}
DoorConnections[2082] = {}
DoorConnections[2082][1] = {2090,0,0,3,false}
DoorConnections[2090] = {}
DoorConnections[2090][1] = {2082,0,0,3,false}
DoorConnections[2090][2] = {2100,0,1,4,false}
DoorConnections[2100] = {}
DoorConnections[2100][1] = {2090,1,0,4,false}
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
DoorConnections[2150][1] = {2140,1,0,2,false,false,true}
DoorConnections[2151] = {}
DoorConnections[2151][1] = {2160,0,0,1,false,false,false,true}
DoorConnections[2160] = {}
DoorConnections[2160][1] = {2151,0,0,1,false}
DoorConnections[2160][2] = {2170,0,1,4,false}
DoorConnections[2170] = {}
DoorConnections[2170][1] = {2160,1,0,4,false}
DoorConnections[2170][2] = {2180,0,1,4,false}
DoorConnections[2180] = {}
DoorConnections[2180][1] = {2170,1,0,4,false}
DoorConnections[2180][2] = {2190,0,1,4,false}
DoorConnections[2190] = {}
DoorConnections[2190][1] = {2180,1,0,4,false,false,true}
DoorConnections[2190][2] = {2200,0,1,4,false,false,false,true}
DoorConnections[2200] = {}
DoorConnections[2200][1] = {2190,1,0,4,false}

--Destination Door, Destination Entrance ID, Self Entrance ID, Door Color, Reverse Destination Override, Reverse Entrance ID Override, Is in use (applied automatically by script)
local OneWayDoors = {}
OneWayDoors[12] = {}
OneWayDoors[12][1] = {110,1,nil,2}
OneWayDoors[30] = {}
OneWayDoors[30][1] = {60,0,nil,3}
OneWayDoors[60] = {}
OneWayDoors[60][1] = {140,1,nil,2}
OneWayDoors[101] = {}
OneWayDoors[101][1] = {2070,0,2,4}
OneWayDoors[110] = {}
OneWayDoors[110][1] = {71,2,nil,2}
OneWayDoors[110][2] = {330,2,nil,2,10,0}
OneWayDoors[293] = {}
OneWayDoors[293][1] = {420,0,2,2}
OneWayDoors[342] = {}
OneWayDoors[342][1] = {370,1,nil,1,10,0}
OneWayDoors[520] = {}
OneWayDoors[520][1] = {911,1,2,4}
OneWayDoors[530] = {}
OneWayDoors[530][1] = {520,2,1,2}
OneWayDoors[600] = {}
OneWayDoors[600][1] = {630,0,nil,2}
OneWayDoors[621] = {}
OneWayDoors[621][1] = {600,0,nil,2,10,0}
OneWayDoors[630] = {}
OneWayDoors[630][1] = {640,1,1,2}
OneWayDoors[750] = {}
OneWayDoors[750][1] = {770,0,1,2}
OneWayDoors[760] = {}
OneWayDoors[760][1] = {770,0,nil,1}
OneWayDoors[840] = {}
OneWayDoors[840][1] = {590,2,1,4}
OneWayDoors[980] = {}
OneWayDoors[980][1] = {990,0,1,4}
OneWayDoors[1002] = {}
OneWayDoors[1002][1] = {1901,1,0,4}
OneWayDoors[1010] = {}
OneWayDoors[1010][1] = {1200,1,2,4}
OneWayDoors[1030] = {}
OneWayDoors[1030][1] = {1360,3,1,4}
OneWayDoors[1040] = {}
OneWayDoors[1040][1] = {1170,2,1,4}
OneWayDoors[1313] = {}
OneWayDoors[1313][1] = {1320,0,0,2}
OneWayDoors[1440] = {}
OneWayDoors[1440][1] = {1331,1,1,4}
OneWayDoors[1970] = {}
OneWayDoors[1970][1] = {1990,1,1,4}
OneWayDoors[2202] = {}
OneWayDoors[2202][1] = {940,2,0,4}

local RoomsWithDoors = {10,11,12,20,22,30,31,40,42,50,52,53,70,71,80,82,90,92,100,101,120,130,132,133,140,142,150,160,162,170,172,180,183,190,191,200,201,202,210,220,230,232,240,242,250,253,260,270,272,280,281,282,283,290,291,293,300,301,302,310,320,330,331,340,341,342,350,360,370,372,380,381,390,391,400,402,410,430,431,440,450,453,460,461,462,470,471,480,490,491,492,500,501,510,511,513,520,530,540,550,560,570,571,572,580,590,600,610,611,620,622,631,640,641,642,650,651,660,661,662,670,672,680,690,700,710,720,721,730,731,740,742,750,760,771,780,790,792,800,801,810,820,821,830,840,850,860,861,870,880,890,900,902,910,911,920,922,930,931,940,950,960,970,980,991,1000,1010,1020,1030,1040,1050,1051,1060,1062,1063,1070,1071,1080,1090,1092,1100,1101,1102,1110,1111,1112,1120,1130,1132,1140,1150,1151,1160,1170,1180,1181,1190,1191,1192,1200,1201,1210,1211,1220,1221,1231,1240,1241,1250,1253,1260,1270,1280,1281,1290,1292,1300,1301,1310,1312,1320,1330,1331,1332,1340,1341,1350,1352,1360,1370,1371,1380,1381,1390,1392,1400,1401,1410,1411,1420,1421,1422,1430,1431,1440,1450,1460,1470,1471,1480,1482,1490,1500,1502,1510,1520,1522,1530,1540,1541,1550,1560,1561,1570,1580,1582,1590,1591,1600,1601,1610,1611,1620,1630,1632,1640,1650,1651,1660,1661,1670,1671,1680,1690,1691,1692,1700,1701,1710,1720,1730,1733,1740,1750,1760,1763,1770,1772,1780,1781,1790,1791,1800,1801,1810,1811,1812,1820,1830,1840,1841,1850,1860,1862,1870,1880,1890,1892,1900,1901,1910,1920,1921,1930,1931,1940,1950,1960,1961,1970,1980,1990,1992,2000,2002,2010,2011,2020,2030,2040,2050,2051,2052,2060,2070,2080,2082,2090,2100,2102,2110,2111,2120,2130,2140,2150,2151,2160,2170,2180,2190,2200}
local RoomsWithOneWays = {12,30,60,101,110,293,342,520,530,600,621,630,750,760,840,980,1002,1010,1030,1040,1313,1440,1970,2202}

local DoorsPerStage = {}
local DoorsPerStage_NoOneWays = {}
local DoorsUsedInStage = {}
local RoomsPerStage = {}
local StageHasUnreachableEntrances = {}
local StageConnectionExists = {}
for r = 10,2202,1 do
  local Stage = math.floor(r * 0.1)
  local RoomNumber = r - (Stage*10)
  if StageHasUnreachableEntrances[Stage] == nil then
    StageHasUnreachableEntrances[Stage] = false
  end
  if RoomsPerStage[Stage] == nil then
    RoomsPerStage[Stage] = 0
  end
  if DoorsPerStage[Stage] == nil then
    DoorsPerStage[Stage] = 0
    DoorsPerStage_NoOneWays[Stage] = 0
    DoorsUsedInStage[Stage] = 0
  end
  if StageConnectionExists[Stage] == nil then
    StageConnectionExists[Stage] = {}
  end
  if not (DoorConnections[r] == nil) then
    RoomsPerStage[Stage] = math.max(RoomsPerStage[Stage],RoomNumber)
    for d = 1,#DoorConnections[r],1 do
      if not DoorConnections[r][d][5] then
        DoorsPerStage[Stage] = DoorsPerStage[Stage] + 1
        DoorsPerStage_NoOneWays[Stage] = DoorsPerStage_NoOneWays[Stage] + 1
      end
      if DoorConnections[r][d][7] == true then
        StageHasUnreachableEntrances[Stage] = true
      end
    end
  end
  if not (OneWayDoors[r] == nil) then
    RoomsPerStage[Stage] = math.max(RoomsPerStage[Stage],RoomNumber)
    for d = 1,#OneWayDoors[r],1 do
      DoorsPerStage[Stage] = DoorsPerStage[Stage] + 1
    end
  end
end

for i = 1,2,1 do
  for s = 1,220,1 do --Apply traits to doors that can be assumed from the connections to other stages
    for r = 0,RoomsPerStage[s],1 do
      local RoomID = (s*10)+r
      if not (DoorConnections[RoomID] == nil) then
        for d = 1,#DoorConnections[RoomID],1 do
          if i == 1 then
            if (DoorsPerStage[s] <= 1) then
              --print("Applying 'Is Dead End' to",RoomID,d)
              DoorConnections[RoomID][d][6] = true --Is Dead End
            end
          else
            local TargetRoomID = DoorConnections[RoomID][d][1]
            local TargetEntranceID = DoorConnections[RoomID][d][2]
            local TargetStage = math.floor(TargetRoomID/10)
            local ThisDoorIsDeadEnd = DoorConnections[RoomID][d][6]
            local ThisDoorIsSoftOneWay = DoorConnections[RoomID][d][8]
            local ReverseTargetDoorIsDeadEnd = (DoorsPerStage[TargetStage] == 1)
            local ReverseTargetDoorIsSoftOneWay = false
            if not (DoorConnections[TargetRoomID] == nil) then
              for t = 1,#DoorConnections[TargetRoomID],1 do
                if (DoorConnections[TargetRoomID][t][1] == RoomID) and (DoorConnections[TargetRoomID][t][2] == DoorConnections[RoomID][d][3]) then
                  ReverseTargetDoorIsDeadEnd = ReverseTargetDoorIsDeadEnd or DoorConnections[TargetRoomID][t][6]
                  ReverseTargetDoorIsSoftOneWay = DoorConnections[TargetRoomID][t][8]
                  break
                end
              end
            end
            if ReverseTargetDoorIsDeadEnd then
              --print("Applying 'Leads to Dead End' to",RoomID,d)
              DoorConnections[RoomID][d][10] = true --Leads to Dead End
            end
            if ReverseTargetDoorIsSoftOneWay then
              --print("Applying 'Leads to Soft One-Way' to",RoomID,d)
              DoorConnections[RoomID][d][11] = true --Leads to Soft One-Way
            end
          end
        end
      end
    end
  end
end

local BossStages = {9,16,24,25,30,40,51,67,79,92,100,113,129,135,139,148,158,163,176,189,199,200,210,220}
local IsBossStage = {}
for i = 1,#BossStages,1 do
  IsBossStage[BossStages[i]] = true
end

--New Target Room, New Target Entrance ID, Door Color, Shortcut to Unlock
local EntranceTable = {}

math.randomseed(RandomSeed)

local file = io.open(TrainerOrigin.."Randomizer_CurrentSettings.lua","wb")
file:write("local SeedToUse = " .. RandomSeed .. "\n")
if RandomizeDoors then
  file:write("local RandomizeDoors = true\n")
else
  file:write("local RandomizeDoors = false\n")
end
if RandomizeAttacks then
  file:write("local RandomizeAttacks = true\n")
else
  file:write("local RandomizeAttacks = false\n")
end
if RandomizeEnemyBullets then
  file:write("local RandomizeEnemyBullets = true\n")
else
  file:write("local RandomizeEnemyBullets = false\n")
end
if RandomizeBackgrounds then
  file:write("local RandomizeBackgrounds = true\n")
else
  file:write("local RandomizeBackgrounds = false\n")
end

file:write("\nlocal EntranceTable = {}\n")

if RandomizeDoors then
  local WriteConnection =
    function(RoomID,d,NewRoomID,n)
      local DoorColor = 1
      if DoorConnections[RoomID][d][4] == 4 or DoorConnections[NewRoomID][n][4] == 4 then
        DoorColor = 4
      elseif math.random() < 0.5 then
        DoorColor = DoorConnections[RoomID][d][4]
      else
        DoorColor = DoorConnections[NewRoomID][n][4]
      end
      
      local TargetRoomID = DoorConnections[RoomID][d][1]
      local TargetEntranceID = DoorConnections[RoomID][d][2]
      local ShortcutUnlock = nil
      if DoorConnections[NewRoomID][n][5] then
        ShortcutUnlock = {math.floor(DoorConnections[NewRoomID][n][1]/10),math.floor(NewRoomID/10)}
      end
      if EntranceTable[RoomID] == nil then
        EntranceTable[RoomID] = {}
        file:write("EntranceTable["..RoomID.."] = {}\n")
      end
      if EntranceTable[RoomID][TargetRoomID] == nil then
        EntranceTable[RoomID][TargetRoomID] = {}
        file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."] = {}\n")
      end
      EntranceTable[RoomID][TargetRoomID][TargetEntranceID] = {NewRoomID,DoorConnections[NewRoomID][n][3],DoorColor,ShortcutUnlock}
      if ShortcutUnlock == nil then
        file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."]["..TargetEntranceID.."] = {"..NewRoomID..","..DoorConnections[NewRoomID][n][3]..","..DoorColor..",nil}\n")
      else
        file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."]["..TargetEntranceID.."] = {"..NewRoomID..","..DoorConnections[NewRoomID][n][3]..","..DoorColor..",{"..ShortcutUnlock[1]..","..ShortcutUnlock[2].."}}\n")
      end
      
      local OppositeTargetRoomID = DoorConnections[NewRoomID][n][1]
      local OppositeTargetEntranceID = DoorConnections[NewRoomID][n][2]
      local ShortcutUnlock = nil
      if DoorConnections[RoomID][d][5] then
        ShortcutUnlock = {math.floor(DoorConnections[RoomID][d][1]/10),math.floor(RoomID/10)}
      end
      if EntranceTable[NewRoomID] == nil then
        EntranceTable[NewRoomID] = {}
        file:write("EntranceTable["..NewRoomID.."] = {}\n")
      end
      if EntranceTable[NewRoomID][OppositeTargetRoomID] == nil then
        EntranceTable[NewRoomID][OppositeTargetRoomID] = {}
        file:write("EntranceTable["..NewRoomID.."]["..OppositeTargetRoomID.."] = {}\n")
      end
      EntranceTable[NewRoomID][OppositeTargetRoomID][OppositeTargetEntranceID] = {RoomID,DoorConnections[RoomID][d][3],DoorColor,ShortcutUnlock}
      if ShortcutUnlock == nil then
        file:write("EntranceTable["..NewRoomID.."]["..OppositeTargetRoomID.."]["..OppositeTargetEntranceID.."] = {"..RoomID..","..DoorConnections[RoomID][d][3]..","..DoorColor..",nil}\n")
      else
        file:write("EntranceTable["..NewRoomID.."]["..OppositeTargetRoomID.."]["..OppositeTargetEntranceID.."] = {"..RoomID..","..DoorConnections[RoomID][d][3]..","..DoorColor..",{"..ShortcutUnlock[1]..","..ShortcutUnlock[2].."}}\n")
      end
      
      local Stage = math.floor(RoomID/10)
      local NewStage = math.floor(NewRoomID/10)
      StageConnectionExists[Stage][NewStage] = true
      StageConnectionExists[NewStage][Stage] = true
    end

  local StageIsUnfinished = {}
  local StageIsBeingHandled = {}
  local RoomsHandled = 0
  local Route = {{},{}}
  local NextBossRoom
  local RoomsPassed
  local RouteFinished = {false,false}

  local CanReachPairedDoor =
    function(EntranceDoor,PairedDoors)
      if PairedDoors == nil then
        return true
      else
        if not (EntranceDoor == nil) then
          for i = 1,#PairedDoors,1 do
            if (PairedDoors[i][1] == EntranceDoor[1]) and (PairedDoors[i][2] == EntranceDoor[2]) then
              return true
            end
          end
        end
      end
      return false
    end
    
  local ConcoctBool = 
    function(Bool)
      if Bool then
        return "true"
      else
        return "false"
      end
    end

  local BranchFromOne

  BranchFromOne =
    function(Stage,RouteIndex,EntranceDoor)
      StageIsUnfinished[Stage] = true
      local RoomCount = RoomsPerStage[Stage]
      local CurrentRoom = math.random(0,RoomCount)
      local CurrentDoor = 1
      
      for i = 0,RoomCount,1 do
        local RoomID = (Stage*10)+CurrentRoom
        if not (DoorConnections[RoomID] == nil) then
          CurrentDoor = math.random(1,#DoorConnections[RoomID])
          for d = 1,#DoorConnections[RoomID],1 do
            if not RouteFinished[RouteIndex] then
              if (Stage > 1) or (((RouteIndex == 1) and (RoomID == 11)) or ((RouteIndex == 2) and (RoomID == 12))) then
                if not DoorConnections[RoomID][CurrentDoor][5] then --if not Shortcut
                  if not DoorConnections[RoomID][CurrentDoor][12] then --if not in use
                    local TargetRoomID = DoorConnections[RoomID][CurrentDoor][1]
                    local TargetEntranceID = DoorConnections[RoomID][CurrentDoor][2]
                    local TargetStage = math.floor(TargetRoomID * 0.1)
                    if CanReachPairedDoor(EntranceDoor,DoorConnections[RoomID][CurrentDoor][9]) then
                      local TargetDoorIsInaccessible = DoorConnections[RoomID][CurrentDoor][7]
                      if not TargetDoorIsInaccessible then
                        local ThisDoorIsDeadEnd = DoorConnections[RoomID][d][6] or (DoorsPerStage_NoOneWays[Stage] <= 1)
                        local ThisDoorLeadsToDeadEnd = DoorConnections[RoomID][d][10] or (DoorsPerStage_NoOneWays[TargetStage] <= 1)
                        local ThisDoorLeadsToOneWay = DoorConnections[RoomID][d][11]
                        if not (ThisDoorIsDeadEnd or ThisDoorLeadsToDeadEnd or ThisDoorLeadsToOneWay) then
                          local ThisDoorIsSoftOneWay = DoorConnections[RoomID][d][8]

                          local NewTarget = math.random(1,#RoomsWithDoors)
                          local BreakLoop = false
                          for a = 1,#RoomsWithDoors*3,1 do
                            local NewRoomID = RoomsWithDoors[NewTarget]
                            local NewStage = math.floor(NewRoomID * 0.1)
                            if not ((NewStage == 1) or (NewStage == Stage)) then
                              if (not StageIsUnfinished[NewStage]) or (a > #RoomsWithDoors*2) then
                                for n = 1,#DoorConnections[NewRoomID],1 do
                                  if not DoorConnections[NewRoomID][n][5] then
                                    local IsInaccessibleDoor = DoorConnections[NewRoomID][n][7]
                                    if ((StageHasUnreachableEntrances[NewStage] == false) or IsInaccessibleDoor) then
                                      if (DoorsPerStage_NoOneWays[NewStage] - DoorsUsedInStage[NewStage] > 1) or IsBossStage[NewStage] then
                                        local NewTargetRoomID = DoorConnections[NewRoomID][n][1]
                                        local NewTargetEntranceID = DoorConnections[NewRoomID][n][2]
                                        local NewTargetStage = math.floor(NewTargetRoomID/10)
                                        local NewDoorIsDeadEnd = DoorConnections[NewRoomID][n][6] or (DoorsPerStage_NoOneWays[NewStage] <= 1)
                                        local NewDoorLeadsToDeadEnd = DoorConnections[NewRoomID][n][10] or (DoorsPerStage_NoOneWays[NewTargetStage] <= 1)
                                        local NewDoorIsSoftOneWay = DoorConnections[NewRoomID][n][8]
                                        if (not (NewDoorIsDeadEnd or NewDoorLeadsToDeadEnd or NewDoorIsSoftOneWay)) or IsBossStage[NewStage] then
                                          local NewDoorLeadsToOneWay = DoorConnections[NewRoomID][n][11]
                                          if (ThisDoorIsSoftOneWay and NewDoorLeadsToOneWay) or ((not ThisDoorIsSoftOneWay) and (not NewDoorLeadsToOneWay)) or (IsBossStage[NewStage] and (a > #RoomsWithDoors))then
                                            if ((not IsBossStage[NewStage]) and (RoomsPassed < Route[RouteIndex][NextBossRoom][2]))
                                            or ((RoomsPassed >= Route[RouteIndex][NextBossRoom][2]) and (Route[RouteIndex][NextBossRoom][1] == NewStage)) then
                                              if not DoorConnections[NewRoomID][n][12] then
                                                DoorConnections[RoomID][CurrentDoor][12] = true
                                                DoorsUsedInStage[Stage] = DoorsUsedInStage[Stage] + 1
                                                DoorConnections[NewRoomID][n][12] = true
                                                DoorsUsedInStage[NewStage] = DoorsUsedInStage[NewStage] + 1
                                                if StageHasUnreachableEntrances[NewStage] == true then
                                                  StageHasUnreachableEntrances[NewStage] = false
                                                end
                                                if (RoomsPassed >= Route[RouteIndex][NextBossRoom][2]) and (Route[RouteIndex][NextBossRoom][1] == NewStage) then
                                                  Route[RouteIndex][NextBossRoom] = nil
                                                  --print("Boss Room "..NextBossRoom.." placed after "..RoomsPassed.." rooms")
                                                  RoomsPassed = 0
                                                  NextBossRoom = NextBossRoom + 1
                                                  if NextBossRoom > 12 then
                                                    RouteFinished[RouteIndex] = true
                                                  end
                                                end
                                                WriteConnection(RoomID,CurrentDoor,NewRoomID,n)
                                                RoomsPassed = RoomsPassed + 1
                                                BranchFromOne(NewStage,RouteIndex,{DoorConnections[NewRoomID][n][1],DoorConnections[NewRoomID][n][2]})
                                                
                                                BreakLoop = true
                                                break
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
                            if BreakLoop then
                              break
                            end
                            NewTarget = NewTarget + 1
                            if NewTarget > #RoomsWithDoors then
                              NewTarget = 1
                            end
                          end
                        end
                      end 
                    end
                  end
                end
              end
            end
            CurrentDoor = CurrentDoor + 1
            if CurrentDoor > #DoorConnections[RoomID] then
              CurrentDoor = 1
            end
            
          end
        end
        CurrentRoom = CurrentRoom + 1
        if CurrentRoom > RoomCount then
          CurrentRoom = 0
        end
        
      end            
    end
    
  print("Generating Initial Branches...")
  local IndexInUse = {}
  for r = 1,2,1 do
    NextBossRoom = 1
    RoomsPassed = 0
    local TotalPerRoute = math.floor(#BossStages/2)
    for i = 1,TotalPerRoute,1 do
      local RoomCount = math.random(5,7)
      local Error = true
      local Index = math.random(1,24)
      for a = 1,125,1 do
        if not IndexInUse[Index] then
          if (BossStages[Index] == 200) then
            if (i == TotalPerRoute-1) then
              IndexInUse[Index] = true
              Route[r][i] = {BossStages[Index],RoomCount}
              --print("Boss Room "..i..": ".. BossStages[Index],RoomCount)
              Error = false
              break
            end
          elseif ((BossStages[Index] == 100) or (BossStages[Index] == 220)) or (i == TotalPerRoute) then
            if ((BossStages[Index] == 100) or (BossStages[Index] == 220)) and (i == TotalPerRoute) then
              IndexInUse[Index] = true
              Route[r][i] = {BossStages[Index],RoomCount}
              --print("Boss Room "..i..": ".. BossStages[Index],RoomCount)
              Error = false
              break
            end
          else
            IndexInUse[Index] = true
            Route[r][i] = {BossStages[Index],RoomCount}
            --print("Boss Room "..i..": ".. BossStages[Index],RoomCount)
            Error = false
            break
          end
        end
        if a <= 100 then
          Index = math.random(1,24)
        else
          Index = Index + 1
          if Index > #BossStages then
            Index = 1
          end
        end
      end
      if Error then
        print("ERROR: Branch "..r..", Index "..i.." - Boss stage was not assigned!")
      end
    end
    --print("Generating path...")
    BranchFromOne(1,r,{10,0})
    if not RouteFinished[r] then
      --print("Ran out of doors; Branching from unfinished rooms...")
      local BreakLoop = false
      for a = 1,10,1 do
        for s = 2,220,1 do
          if StageIsUnfinished[s] or (a > 5) then
            BranchFromOne(s,r,nil)
            if RouteFinished[r] then
              BreakLoop = true
              break
            end
          end
        end
        if BreakLoop then
          break
        end
      end
      if not RouteFinished[r] then
        print("ERROR: Branch "..r.." was unable to complete!")
      end
    end
  end

  local BranchFromOneWay

  BranchFromOneWay =
    function(Stage,HeadingOutwards,BranchLevel)
      if not StageIsUnfinished[Stage] then
        StageIsUnfinished[Stage] = true
        local RoomCount = RoomsPerStage[Stage]
        
        for i = 0,RoomCount,1 do
          local RoomID = (Stage*10)+i
          if not (DoorConnections[RoomID] == nil) then
            for d = 1,#DoorConnections[RoomID],1 do
              if not DoorConnections[RoomID][d][5] then --if not Shortcut
                if not DoorConnections[RoomID][d][12] then --if not in use
                  local TargetRoomID = DoorConnections[RoomID][d][1]
                  local TargetEntranceID = DoorConnections[RoomID][d][2]
                  local TargetStage = math.floor(TargetRoomID * 0.1)
                  local ThisDoorLeadsToOneWay = DoorConnections[RoomID][d][11]
                  local ThisDoorIsDeadEnd = DoorConnections[RoomID][d][6]
                  local ThisDoorLeadsToDeadEnd = DoorConnections[RoomID][d][10]
                  local ThisDoorIsSoftOneWay = DoorConnections[RoomID][d][8]
                  local NewTarget = math.random(1,#RoomsWithDoors)
                  local BreakLoop = false
                  local Error = true
                  for a = 1,#RoomsWithDoors*4,1 do
                    local NewRoomID = RoomsWithDoors[NewTarget]
                    local NewStage = math.floor(NewRoomID * 0.1)
                    if not ((NewStage == 1) or (NewStage == Stage)) then
                      if ((BranchLevel < 2) and (not StageIsUnfinished[NewStage])) or ((BranchLevel >= 2) and StageIsUnfinished[NewStage]) or (a > #RoomsWithDoors) then
                        for n = 1,#DoorConnections[NewRoomID],1 do
                          if not DoorConnections[NewRoomID][n][5] then
                            local IsInaccessibleDoor = DoorConnections[NewRoomID][n][7]
                            if ((not HeadingOutwards) and (not IsInaccessibleDoor))
                            or (HeadingOutwards and ((StageHasUnreachableEntrances[NewStage] == false) or IsInaccessibleDoor)) then
                              local NewTargetRoomID = DoorConnections[NewRoomID][n][1]
                              local NewTargetEntranceID = DoorConnections[NewRoomID][n][2]
                              local NewTargetStage = math.floor(NewTargetRoomID/10)
                              local NewDoorIsDeadEnd = DoorConnections[NewRoomID][n][6]
                              local NewDoorLeadsToDeadEnd = DoorConnections[NewRoomID][n][10]
                              if (ThisDoorIsDeadEnd and NewDoorLeadsToDeadEnd) or (NewDoorIsDeadEnd and ThisDoorLeadsToDeadEnd)
                              or ((not ThisDoorIsDeadEnd) and (not NewDoorLeadsToDeadEnd) and (not NewDoorIsDeadEnd) and (not ThisDoorLeadsToDeadEnd))
                              or (a > #RoomsWithDoors*3) then
                                local NewDoorIsSoftOneWay = DoorConnections[NewRoomID][n][8]
                                local NewDoorLeadsToOneWay = DoorConnections[NewRoomID][n][11]
                                if (HeadingOutwards and (ThisDoorIsSoftOneWay and NewDoorLeadsToOneWay)) or ((not HeadingOutwards) and (NewDoorIsSoftOneWay and ThisDoorLeadsToOneWay))
                                or ((not ThisDoorIsSoftOneWay) and (not NewDoorLeadsToOneWay) and (not NewDoorIsSoftOneWay) and (not ThisDoorLeadsToOneWay))
                                or (a > #RoomsWithDoors*2) then
                                  if not DoorConnections[NewRoomID][n][12] then
                                    DoorConnections[RoomID][d][12] = true
                                    DoorsUsedInStage[Stage] = DoorsUsedInStage[Stage] + 1
                                    DoorConnections[NewRoomID][n][12] = true
                                    DoorsUsedInStage[NewStage] = DoorsUsedInStage[NewStage] + 1
                                    if (StageHasUnreachableEntrances[NewStage] == true) and HeadingOutwards then
                                      StageHasUnreachableEntrances[NewStage] = false
                                    end
                                    WriteConnection(RoomID,d,NewRoomID,n)
                                    if not NewDoorIsDeadEnd then
                                      BranchFromOneWay(NewStage,HeadingOutwards,BranchLevel+1)
                                    end
                                    
                                    Error = false
                                    BreakLoop = true
                                    break
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    if BreakLoop then
                      break
                    end
                    NewTarget = NewTarget + 1
                    if NewTarget > #RoomsWithDoors then
                      NewTarget = 1
                    end
                  end
                  --[[if Error then
                    print(" ERROR: Stage "..Stage..", Room "..i..", Door Index " .. d .. " - Door could not branch!")
                    local Color = 3
                    if not (EntranceTable[420] == nil) then
                      if not (EntranceTable[420][293] == nil) then
                        if not (EntranceTable[420][293][2] == nil) then
                          Color = EntranceTable[420][293][2][3]
                        end
                      end
                    end
                    if EntranceTable[RoomID] == nil then
                      EntranceTable[RoomID] = {}
                      file:write("EntranceTable["..RoomID.."] = {}\n")
                    end
                    if EntranceTable[RoomID][TargetRoomID] == nil then
                      EntranceTable[RoomID][TargetRoomID] = {}
                      file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."] = {}\n")
                    end
                    EntranceTable[RoomID][TargetRoomID][TargetEntranceID] = {420,0,Color,nil}
                    file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."]["..TargetEntranceID.."] = {420,0,"..Color..",nil}\n")
                  end]]
                end
              end
            end
          end
        end  
      end
    end
    
  print("Randomizing One-Way Doors...")
  for i = 1,#RoomsWithOneWays,1 do
    local RoomID = RoomsWithOneWays[i]
    local Stage = math.floor(RoomID * 0.1)
    local RoomNumber = RoomID - (Stage*10)
    if not (Stage == 1) then
      --print("One-Way #"..i..": "..Stage,RoomNumber.." inward branch...")
      BranchFromOneWay(Stage,false,1)
    end
    if not (OneWayDoors[RoomID] == nil) then
      for d = 1,#OneWayDoors[RoomID],1 do
        local TargetRoomID = OneWayDoors[RoomID][d][1]
        local TargetEntranceID = OneWayDoors[RoomID][d][2]
        local TargetStage = math.floor(TargetRoomID * 0.1)
        local SelfEntranceID = 0
        if not (OneWayDoors[RoomID][d][3] == nil) then
          SelfEntranceID = OneWayDoors[RoomID][d][3]
        end
        local NewTarget = math.ceil((#RoomsWithOneWays - (i-1)) * math.random()) + (i-1)
        local BreakLoop = false
        local Error = true
        for a = 1,#RoomsWithOneWays,1 do --Try for as many rooms as there are
          local NewRoomID = RoomsWithOneWays[NewTarget]
          local NewStage = math.floor(NewRoomID * 0.1)
          if (not (Stage == NewStage)) then
            for n = 1,#OneWayDoors[NewRoomID],1 do
              if not OneWayDoors[NewRoomID][n][7] then
                OneWayDoors[NewRoomID][n][7] = true
                
                local DoorColor = OneWayDoors[NewRoomID][n][4]
                
                if EntranceTable[RoomID] == nil then
                  EntranceTable[RoomID] = {}
                  file:write("EntranceTable["..RoomID.."] = {}\n")
                end
                if EntranceTable[RoomID][TargetRoomID] == nil then
                  EntranceTable[RoomID][TargetRoomID] = {}
                  file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."] = {}\n")
                end
                EntranceTable[RoomID][TargetRoomID][TargetEntranceID] = {OneWayDoors[NewRoomID][n][1],OneWayDoors[NewRoomID][n][2],DoorColor,nil}
                file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."]["..TargetEntranceID.."] = {"..OneWayDoors[NewRoomID][n][1]..","..OneWayDoors[NewRoomID][n][2]..","..DoorColor..",nil}\n")
                
                local ReverseTargetRoomID = OneWayDoors[NewRoomID][n][1]
                local NewRoomIDOverride = NewRoomID + 0
                if not (OneWayDoors[NewRoomID][n][5] == nil) then
                  NewRoomIDOverride = OneWayDoors[NewRoomID][n][5]
                end
                local ReverseTargetEntranceID = 0
                if not (OneWayDoors[NewRoomID][n][6] == nil) then
                  ReverseTargetEntranceID = OneWayDoors[NewRoomID][n][6]
                elseif not (OneWayDoors[NewRoomID][n][3] == nil) then
                  ReverseTargetEntranceID = OneWayDoors[NewRoomID][n][3]
                end
                
                if EntranceTable[ReverseTargetRoomID] == nil then
                  EntranceTable[ReverseTargetRoomID] = {}
                  file:write("EntranceTable["..ReverseTargetRoomID.."] = {}\n")
                end
                if EntranceTable[ReverseTargetRoomID][NewRoomIDOverride] == nil then
                  EntranceTable[ReverseTargetRoomID][NewRoomIDOverride] = {}
                  file:write("EntranceTable["..ReverseTargetRoomID.."]["..NewRoomIDOverride.."] = {}\n")
                end
                if EntranceTable[ReverseTargetRoomID][NewRoomIDOverride][ReverseTargetEntranceID] == nil then
                  EntranceTable[ReverseTargetRoomID][NewRoomIDOverride][ReverseTargetEntranceID] = {RoomID,SelfEntranceID,DoorColor,nil}
                  file:write("EntranceTable["..ReverseTargetRoomID.."]["..NewRoomIDOverride.."]["..ReverseTargetEntranceID.."] = {"..RoomID..","..SelfEntranceID..","..DoorColor..",nil}\n")
                end
                
                if not (math.floor(ReverseTargetRoomID/10) == 1) then
                  local ReverseTargetStage = math.floor(ReverseTargetRoomID * 0.1)
                  --print("One-Way #"..i..": "..ReverseTargetStage,ReverseTargetRoomID-(ReverseTargetStage*10).." outward branch...")
                  BranchFromOneWay(ReverseTargetStage,true,1)
                end
                
                StageConnectionExists[Stage][NewStage] = true
                
                BreakLoop = true
                Error = false
                break
              end
            end
          end
          if BreakLoop then
            break
          end
          NewTarget = NewTarget + 1
          if NewTarget > #RoomsWithOneWays then
            NewTarget = 1
          end
        end
        if Error then
          print(" ERROR: Stage "..Stage..", Room "..RoomNumber..", Door Index " .. d .. " - Entrance was not redirected!")
        end
      end
    end
  end

  local StagesInMap = 0
  local StagesHandled = 0
  local BranchNormal

  BranchNormal =
    function(Stage,BranchLevel)
      if not StageIsBeingHandled[Stage] then
        StageIsBeingHandled[Stage] = true
        StagesHandled = StagesHandled + 1
        local RoomCount = RoomsPerStage[Stage]
        for i = 0,RoomCount,1 do
          local RoomID = (Stage*10)+i
          if not (DoorConnections[RoomID] == nil) then
            for d = 1,#DoorConnections[RoomID],1 do
              --if not DoorConnections[RoomID][d][5] then --if not Shortcut
                if not DoorConnections[RoomID][d][12] then --if not in use
                  local TargetRoomID = DoorConnections[RoomID][d][1]
                  local TargetEntranceID = DoorConnections[RoomID][d][2]
                  local TargetStage = math.floor(TargetRoomID * 0.1)
                  local ThisDoorLeadsToOneWay = DoorConnections[RoomID][d][11]
                  local ThisDoorIsDeadEnd = DoorConnections[RoomID][d][6]
                  local ThisDoorLeadsToDeadEnd = DoorConnections[RoomID][d][10]
                  local ThisDoorIsSoftOneWay = DoorConnections[RoomID][d][8]
                  local NewTarget = math.random(1,#RoomsWithDoors)
                  local BreakLoop = false
                  local Error = true
                  for a = 1,#RoomsWithDoors*5,1 do
                    local NewRoomID = RoomsWithDoors[NewTarget]
                    local NewStage = math.floor(NewRoomID * 0.1)
                    if not (NewStage == Stage) then
                      if (not StageConnectionExists[Stage][NewStage]) or (a > #RoomsWithDoors) then
                        if ((BranchLevel < 3) and (not StageIsUnfinished[NewStage]))
                        or ((BranchLevel >= 3) and StageIsUnfinished[NewStage])
                        or DoorConnections[RoomID][d][5] or (a > #RoomsWithDoors*2) then
                          for n = 1,#DoorConnections[NewRoomID],1 do
                            if not ((DoorConnections[RoomID][d][5] and DoorConnections[NewRoomID][n][7]) or (DoorConnections[NewRoomID][n][5] and DoorConnections[RoomID][d][7])) then
                              local NewTargetRoomID = DoorConnections[NewRoomID][n][1]
                              local NewTargetEntranceID = DoorConnections[NewRoomID][n][2]
                              local NewTargetStage = math.floor(NewTargetRoomID/10)
                              local NewDoorIsDeadEnd = DoorConnections[NewRoomID][n][6]
                              local NewDoorLeadsToDeadEnd = DoorConnections[NewRoomID][n][10]
                              if not (DoorConnections[RoomID][d][5] and NewDoorIsDeadEnd) then
                                if (ThisDoorIsDeadEnd and NewDoorLeadsToDeadEnd) or (NewDoorIsDeadEnd and ThisDoorLeadsToDeadEnd)
                                or ((not ThisDoorIsDeadEnd) and (not NewDoorLeadsToDeadEnd) and (not NewDoorIsDeadEnd) and (not ThisDoorLeadsToDeadEnd))
                                or (a > #RoomsWithDoors*4) then
                                  local NewDoorIsSoftOneWay = DoorConnections[NewRoomID][n][8]
                                  local NewDoorLeadsToOneWay = DoorConnections[NewRoomID][n][11]
                                  if (ThisDoorIsSoftOneWay and NewDoorLeadsToOneWay) or (NewDoorIsSoftOneWay and ThisDoorLeadsToOneWay)
                                  or ((not ThisDoorIsSoftOneWay) and (not NewDoorLeadsToOneWay) and (not NewDoorIsSoftOneWay) and (not ThisDoorLeadsToOneWay))
                                  or (a > #RoomsWithDoors*3) then
                                    if not DoorConnections[NewRoomID][n][12] then
                                      DoorConnections[RoomID][d][12] = true
                                      DoorsUsedInStage[Stage] = DoorsUsedInStage[Stage] + 1
                                      DoorConnections[NewRoomID][n][12] = true
                                      DoorsUsedInStage[NewStage] = DoorsUsedInStage[NewStage] + 1
                                      WriteConnection(RoomID,d,NewRoomID,n)
                                      BranchNormal(NewStage,BranchLevel+1)
                                      
                                      Error = false
                                      BreakLoop = true
                                      break
                                    end
                                  end
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                    if BreakLoop then
                      break
                    end
                    NewTarget = NewTarget + 1
                    if NewTarget > #RoomsWithDoors then
                      NewTarget = 1
                    end
                  end
                  if Error then
                    print(" ERROR: Stage "..Stage..", Room "..i..", Door Index "..d.." - Door could not branch!")
                    --[[local Color = 3
                    if not (EntranceTable[420] == nil) then
                      if not (EntranceTable[420][293] == nil) then
                        if not (EntranceTable[420][293][2] == nil) then
                          Color = EntranceTable[420][293][2][3]
                        end
                      end
                    end
                    if EntranceTable[RoomID] == nil then
                      EntranceTable[RoomID] = {}
                      file:write("EntranceTable["..RoomID.."] = {}\n")
                    end
                    if EntranceTable[RoomID][TargetRoomID] == nil then
                      EntranceTable[RoomID][TargetRoomID] = {}
                      file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."] = {}\n")
                    end
                    EntranceTable[RoomID][TargetRoomID][TargetEntranceID] = {420,0,Color,nil}
                    file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."]["..TargetEntranceID.."] = {420,0,"..Color..",nil}\n")]]
                  end
                end
              --end
            end
          end
        end  
      end
    end
    
  print("Connecting Everything Together...")
  --for i = 1,2,1 do
    for s = 1,220,1 do
      --if i == 1 then
        if StageIsUnfinished[s] then
          BranchNormal(s,1)
        end
      --else
      --  BranchNormal(s,1)
      --end
    end
  --  if (i == 1) then
      StagesInMap = StagesHandled + 0
  --  end
  --end

  local AutoUnlockShortcuts = {}

  BranchCleanup =
    function(Stage)
      local RoomCount = RoomsPerStage[Stage]
      for i = 0,RoomCount,1 do
        local RoomID = (Stage*10)+i
        if not (DoorConnections[RoomID] == nil) then
          local CurrentDoor = math.random(1,#DoorConnections[RoomID])
          for d = 1,#DoorConnections[RoomID],1 do
            if not DoorConnections[RoomID][CurrentDoor][12] then --if not in use
              local TargetRoomID = DoorConnections[RoomID][CurrentDoor][1]
              local TargetEntranceID = DoorConnections[RoomID][CurrentDoor][2]
              local TargetStage = math.floor(TargetRoomID * 0.1)
              local NewTarget = math.random(1,#RoomsWithDoors)
              local BreakLoop = false
              local Error = true
              for a = 1,#RoomsWithDoors*2,1 do
                local NewRoomID = RoomsWithDoors[NewTarget]
                local NewStage = math.floor(NewRoomID * 0.1)
                if not (NewStage == Stage) then
                  if (not StageConnectionExists[Stage][NewStage]) or (a > #RoomsWithDoors) then
                    for n = 1,#DoorConnections[NewRoomID],1 do
                      local NewTargetRoomID = DoorConnections[NewRoomID][n][1]
                      local NewTargetEntranceID = DoorConnections[NewRoomID][n][2]
                      local NewTargetStage = math.floor(NewTargetRoomID/10)
                      if not DoorConnections[NewRoomID][n][12] then
                        DoorConnections[RoomID][CurrentDoor][12] = true
                        DoorsUsedInStage[Stage] = DoorsUsedInStage[Stage] + 1
                        DoorConnections[NewRoomID][n][12] = true
                        DoorsUsedInStage[NewStage] = DoorsUsedInStage[NewStage] + 1
                        WriteConnection(RoomID,CurrentDoor,NewRoomID,n)
                        if DoorConnections[RoomID][CurrentDoor][5] and DoorConnections[NewRoomID][n][5] then
                          if RoomID > NewRoomID then
                            table.insert(AutoUnlockShortcuts,{Stage,TargetStage})
                          else
                            table.insert(AutoUnlockShortcuts,{NewStage,NewTargetStage})
                          end
                        elseif DoorConnections[RoomID][CurrentDoor][5] then
                          table.insert(AutoUnlockShortcuts,{Stage,TargetStage})
                        elseif DoorConnections[NewRoomID][n][5] then
                          table.insert(AutoUnlockShortcuts,{NewStage,NewTargetStage})
                        end
                        BranchCleanup(NewStage)
                        
                        Error = false
                        BreakLoop = true
                        break
                      end
                    end
                  end
                end
                if BreakLoop then
                  break
                end
                NewTarget = NewTarget + 1
                if NewTarget > #RoomsWithDoors then
                  NewTarget = 1
                end
              end
              if Error then
                --print(" ERROR: Stage "..Stage..", Room "..i..", Door Index "..CurrentDoor.." - Door could not branch!")
                local Color = 3
                if not (EntranceTable[420] == nil) then
                  if not (EntranceTable[420][293] == nil) then
                    if not (EntranceTable[420][293][2] == nil) then
                      Color = EntranceTable[420][293][2][3]
                    end
                  end
                end
                if EntranceTable[RoomID] == nil then
                  EntranceTable[RoomID] = {}
                  file:write("EntranceTable["..RoomID.."] = {}\n")
                end
                if EntranceTable[RoomID][TargetRoomID] == nil then
                  EntranceTable[RoomID][TargetRoomID] = {}
                  file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."] = {}\n")
                end
                EntranceTable[RoomID][TargetRoomID][TargetEntranceID] = {420,0,Color,nil}
                file:write("EntranceTable["..RoomID.."]["..TargetRoomID.."]["..TargetEntranceID.."] = {420,0,"..Color..",nil}\n")
              end
            end
            CurrentDoor = CurrentDoor + 1
            if CurrentDoor > #DoorConnections[RoomID] then
              CurrentDoor = 1
            end
          end
        end 
      end
    end
    
  print("Cleaning Up Unused Connections...")

  for s = 1,220,1 do
    BranchCleanup(s)
  end

  if not (EntranceTable[302] == nil) then
    file:write("EntranceTable[302][402] = {}\nEntranceTable[302][402][0] = {10,0,1,nil}\n")
  end
  
  file:write("\nlocal AutoUnlocks = {")
  for i = 1,#AutoUnlockShortcuts,1 do
    local Comma = ","
    if i == #AutoUnlockShortcuts then
      Comma = ""
    end
    file:write("{"..AutoUnlockShortcuts[i][1]..","..AutoUnlockShortcuts[i][2].."}"..Comma)
  end
else
  file:write("\nlocal AutoUnlocks = {")
end

file:write("}\n\nreturn SeedToUse,RandomizeDoors,RandomizeAttacks,RandomizeEnemyBullets,RandomizeBackgrounds,EntranceTable,AutoUnlocks")
file:close()

--print("Finished Randomization with ".. StagesInMap+1 .."/220 Stages!")
if RandomizeDoors then
  print("Randomization Finished!")
else
  print("Settings Applied!")
end