writeBytes("gnazo.exe+2298A",{0xE9,0xA2,0x02,0x00,0x00,0x90}) --Credits sequence won't trigger when Kanako is defeated
writeBytes("gnazo.exe+36451",{0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90,0x90}) --Downed bosses will be collectable in Kanako's room

--Picking up Kanako will actually add her to your party (I rewrote some ASM to make it more efficient, since the original ASM was pretty much copy/pasted for each valid character)
writeBytes("gnazo.exe+364D7",{0x81,0xB8,0xDC,0x1A,0x00,0x00,0xD6,0x00,0x00,0x00,0x0F,0x8C,0x7B,0x03,0x00,0x00,0x81,0xB8,0xDC,0x1A,0x00,0x00,0xE0,0x00,0x00,0x00,0x0F,0x8F,0x6B,0x03,0x00,0x00,0x8B,0x90,0xDC,0x1A,0x00,0x00,0x81,0xEA,0xC8,0x00,0x00,0x00,0x89,0x15,0xB4,0xCF,0x43,0x01,0xB9,0xE8,0x43,0x37,0x01,0x29,0xDA,0x83,0xC1,0x2C,0x83,0xFA,0x00,0x7F,0xF6,0xDB,0x01,0x83,0xE9,0x08,0xD9,0x11,0x83,0xC1,0x04,0xD9,0x19,0x83,0xE9,0x08,0x8B,0x11,0x83,0xE9,0x04,0x89,0x11,0x83,0xC1,0x28,0xC6,0x01,0x01,0x41,0xC6,0x01,0x00,0xE8,0x13,0x76,0x01,0x00,0xE9,0x20,0x03,0x00,0x00,0x90,0x90,0x90})
writeInteger("gnazo.exe+36505",GameMemoryOffset+0x91CFB4)
writeInteger("gnazo.exe+3650A",GameMemoryOffset+0x8543E8)

writeBytes("gnazo.exe+2211C",{0xE8,0x34,0x76,0x03,0x00}) --Jump to new code, which makes Kanako 2 actually drop a Full item
writeBytes("gnazo.exe+59755",{0x8A,0x5C,0x24,0x1C,0xDD,0xD8,0xBF,0x11,0x00,0x00,0x00,0x8B,0xF5,0xE8,0x99,0x2A,0xFC,0xFF,0xB8,0x01,0x00,0x00,0x00,0xC3})