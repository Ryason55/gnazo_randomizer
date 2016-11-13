========== Mystery of Gensokyo Randomizer V3.0 ==========

Hello. Here's a randomizer for The Mystery of Gensokyo (ゲンソウキョウの謎). Currently only works with Version 1.01e of the game.

Future updates and fixes can be found here:
https://github.com/Ryason55/gnazo_randomizer

And you can contact me here:
https://twitter.com/ryason55


-------Installation-------
Extract and place the "randomizer" folder in the same folder as your game's executable, putting it alongside file and manual. It uh, doesn't actually *need* to go there, but it seems like a good place for it. Just note that all of the files contained (and the BingoThumbnails folder) need to be in the same folder in order to work. And maybe put the Readme in there too, just in case you suddenly forget everything.

Also, your antivirus (read: Norton) will probably think "GnazoRandomizer.exe" is a virus. This is because it's effectively a stripped down version of Cheat Engine, which is able to access and modify computer memory. Cheat Engine itself would also get picked up... except it has a large userbase behind it, all of which flag it as okay to use.


-------Setting Up-------
When you have the randomizer program open, you'll first want to set up the seed. Click on "Set Seed", put in the seed you want to use, select the randomization options you want, and then click "Save Settings". At this point, you can load up the game, and it should automatically connect to the game (the game executable *must* be named "gnazo.exe"). Once the console output says "Randomizer Ready!", you should be good to go. While it will reconnect if you close and reopen the game, be sure you wait until the console reports "Game Closed" before opening the game again.


-------Randomization Options-------

[Door Randomization]
The point of the randomizer. Randomizes the door connections so you can experience Gnazo all over again.

[Character Attack Randomization]
Randomizes the shot and charge attacks that each character uses.

[Enemy Randomization]
Non-boss enemies and their shot patterns are randomized. Certain enemy types will change class, affecting their HP and damage. The level of randomization is scaled to difficulty, but in general the game is harder with this enabled. I'm progressively balancing this as I go along, so there's always a chance of encountering Calamity Fairies.

[Background Randomization]
Randomizes the stage backgrounds and music. Also affects which rooms Remilia and Flandre take damage in. Note that stages containing rooms with static backgrounds (usually 1-screen wide rooms) won't change area, and any scrolling backgrounds in the stage will swap with backgrounds within the same area. Also, some backgrounds don't reach all the way to the right, so you might notice some weirdness/blackness at the very right edge of some screens.


-------Bingo-------
Included with the randomizer is an automated bingo program. It's set up similarly to the main randomizer. Once active, tiles will automatically be marked off as they're achieved in the game. Mousing over a tile will tell you what the condition is. Note that a random bingo seed will only be chosen the first time; If you want a new board past that, you'll have to put in something yourself.

While it's not required, I would recommend playing on a completely clean set of save files (including medal and boss data). A number of the conditions are matched up to the medal unlocks, so the medal unlock sound will give you good idea of when you've achieved something.


-------Solo Character Challenge-------
A new feature to the randomizer is the ability to play through the game with a single character. In the Boss Challenge menu, there's a new entry for Reimu. Selecting a Difficulty and Character will put you in Stage 1 with that character alone. You can then play through the game with that character. Any characters you defeat will join you, but you'll be unable to select them. As well, 2 Player mode will not work, as only the one player will spawn in.

While the game will be properly saved, note that the save file will only be loadable while using the randomizer. It'll appear as a "New Game" file when you're not using the randomizer.

This function is sorta in beta at the moment. Here are some problems I'd like to look into at some point:
-The save file it writes to is the last one you've used
-Bosses will always respawn, even after you pick them up
-The character you're playing as will *not* spawn as a boss
-Characters that can't jump high may not be able to access everything when Door Randomization is in use


-------Known Bugs-------
-Very, very rarely, doors may fail to randomize.
-Closing the game while the randomizer is running may sometimes produce an error in the console. This can be ignored.
-Running the randomizer a second time while the game's running will cause the game to crash
-The randomizer may make the game run slowly on some computers.


-------Changelog-------
V3.0
 -Added Background Randomization
 -Added the ability to toggle Door Randomization
 -Fixed a bug that was preventing a number of one-way doors from being randomized
 -The Spirit/RP of each player character is now changed depending on the attacks they're randomized to have
 -It's slightly less likely that Kedamas will turn into Metal Kedamas with Enemy Randomization
 -The differently colored spirits now have different behaviours
 -Flying fairies now have a reduced chance of being assigned new attacks
 -Scaled back the Fairy HP multipliers for when fairies change color
 -Leveled out the bullet speeds across all difficulties, since the game handles this itself
 -Tall Rocks have been removed from Platform Randomization, and now large rocks can only be pushed by Meiling and Yuyuko (The required rock in Keine's room cannot become a large rock)
 -Boss bullets and some player bullets can now have randomized colors
 -The 4 "Chest" Bingo tiles have been changed to require a specific number of each chest, and there's now a single Score tile of one million

V2.0
 -Door randomization has been significantly improved
 -Implemented Enemy Randomization
 -Marisa and Reimu can now have their attacks randomized
 -Characters that dealt absurd/zero damage with certain attacks can no longer recieve those attacks
 -Fixed the sound bug that happened with certain charge attacks
 -Platform sprites are now randomized
 -Implemented the seed setup script into the randomizer program
 -Added Bingo to the randomizer program
 -Added an Instant Deathwarp button to the randomizer program
 -Probably other things I forgot

V1.0 Release Version
