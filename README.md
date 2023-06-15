Mystery of Gensokyo Randomizer V3.9
===================================

Hello. Here's a randomizer for The Mystery of Gensokyo (ゲンソウキョウの謎). Currently only works with Version 1.01e of the game.

This repository, for future updates:  
https://github.com/Ryason55/gnazo_randomizer/tree/development

If there are any problems, you can contact me here:  
https://twitter.com/RyasonDoesStuff


Installation
---------------------------
Extract and place the `randomizer` and `ex` folders in the same folder as your game's executable, putting them alongside file and manual. The `randomizer` folder can actually be placed wherever, but the `ex` folder needs to be in that exact place since I make the game read from it for a couple things.

Also, your antivirus (read: Norton) will probably think `gnazorandomizer.exe` is a virus. This is because it's effectively a stripped down version of Cheat Engine (a Cheat Engine "trainer"), which is able to access and modify computer memory. Cheat Engine itself would also get picked up... except it has a large userbase behind it, all of which flag it as okay to use.


Setting Up
---------------------------
When you have the randomizer program open, you'll first want to set up the seed. Click on `Set Seed`, put in the seed you want to use, select the randomization options you want, and then click `Save Settings`. After the generation finishes, you can load up the game, and it should automatically connect to the game (the game executable *must* be named `gnazo.exe`). Once the console output says `Randomizer Ready!`, you should be good to go. While it will reconnect if you close and reopen the game, be sure you wait until the console reports `Game Closed` before opening the game again.


Randomization Options
---------------------------
[Randomize Doors]  
The point of the randomizer. Randomizes the door connections so you can experience Gnazo all over again.

[Randomize Player Attacks]  
Randomizes the shot and charge attacks that each character uses.

[Randomize Enemies]  
Non-boss enemies and their shot patterns are randomized. Certain enemy types will change class, affecting their HP and damage. The level of randomization is scaled to difficulty, but in general the game is harder with this enabled.

[Randomize Backgrounds]  
Randomizes the stage backgrounds and music. Also affects which rooms Remilia and Flandre take damage in. Note that stages containing rooms with static backgrounds (usually 1-screen wide rooms) won't change area, and any scrolling backgrounds in the stage will swap with backgrounds within the same area. Also, some backgrounds don't reach all the way to the right, so you might notice some weirdness/blackness at the very right edge of some screens.

[Randomize Cosmetics]  
Randomizes miscellaneous cosmetics, including fairy sprites and bullet colors.


Quality of Life Options
---------------------------
[Include Spoiler Log]  
When a seed using certain settings is generated, the randomizer will output a text file outlining the following information:
- `Randomize Doors`: Guaranteed paths through all of the bosses.
- `Randomize Player Attacks`: The attacks that each character have been assigned.

[Skip End Credits]  
Beating Kanako won't trigger the credits when beaten, and will instead be collectable like other bosses. Good for if your goal isn't just beating Kanako. Note that you won't be awarded with the difficulty clear medals with this on.

[Reveal Hidden Doors]  
All hidden doors are visible, but won't display a number until hit or entered.

[Increased Survivability]  
You start with 5 lives instead of 3, and 1up items will spawn in Stage 1 to bring you back up to 5 if you're under that. There is also a respawning Full item there as well.

[V1.0 Super Jumps]  
Re-enables the bug from V1.0 of the game where you can jump with a fast character and switch to a floaty one to get a higher jump. Having this enabled will put Marisa to Reimu super jumps into logic.


Extra Options
---------------------------
[Harder Door Logic]  
For use with `Randomize Doors`. Makes it so you can be expected to go through dark rooms without Rumia, and through the gauntlet rooms and 144 without a short character.

[Max Enemy Randomization]  
For use with `Randomize Enemies`. All enemies that can be randomized will be randomized on all difficulties, instead of just on Lunatic. Has no effect on Lunatic.


Bingo
---------------------------
Included with the randomizer is an automated bingo program. It's set up similarly to the main randomizer. Once active, tiles will automatically be marked off as they're achieved in the game. Mousing over a tile will tell you what the condition is. Note that a random bingo seed will only be chosen the first time; If you want a new board past that, you'll have to put in something yourself.

While it's not required, I would recommend playing on a completely clean set of save files (including medal and boss data). A number of the conditions are matched up to the medal unlocks, so the medal unlock sound will give you good idea of when you've achieved something.


Known Bugs
---------------------------
- I encountered a bug one time where the music and backgrounds stopped loading, and my computer was very unhappy until I rebooted. I have no idea what caused it, or how to debug it. I'm hoping it was only a problem with Solo Character Mode (which is disabled now) or maybe just a thing with my computer, but if you encounter this otherwise, shut down the game and randomizer immediately and let me know.
- Closing the game while the randomizer is running may sometimes produce an error in the console. This can be ignored.
- Running the randomizer a second time while the game's running will cause the game to crash
- The randomizer may make the game run slowly on some computers.
- Sometimes when exiting from a door, the number above the door will still be blue.
- Fairies that are randomized to short characters have their sprite stick into the floor a bit.


Changelog
---------------------------
V3.9
- Made various improvements to the Randomizer interface, including multiple pages for settings, the ability to use letters (A-Z) as part of the seed, and a menu for easily sharing seeds/settings with other players.
- Your Bingo board is now saved when you close the randomizer, allowing you to resume later without losing squares with temporary conditions. Since this would mean the Bingo board would always be up, there is also a new button to clear the Bingo board entirely.
- Added `Randomizer` to the game's name on the main menu, as well as a seed hash in the bottom-right corner. The hash can be used to confirm if multiple players are playing with the same seed and settings.
- New Option: `Include Spoiler Log`. Upon generation, a text file is created that outlines a method to reach all of the bosses if `Randomize Doors` is on, and the attacks each character has if `Randomize Player Attacks` is on. Will affect the randomization result if it's enabled.
- New Option: `Skip End Credits`. Defeating Kanako 2 will instead drop her as a collectable character instead of triggering the credits sequence. Currently will not award you the game clear medals.
- New Option: `Reveal Hidden Doors`. Hidden doors will always be visible, but will not display a number until either hit or entered (depending on the type).
- New Option: `V1.0 Super Jumps`. Allows the player to jump higher than normal by jumping with a fast character, and switching to a floaty character, as you could in Version 1.0 of the game. Only Marisa to Reimu Super Jumps are in logic, and its not recommended to enter high doors (one-way exits) with Door Randomization enabled, as there's no protection against the door on the opposite side dropping you in a pit forever, or inside a wall.
- Pre-existing quality of life features are now options. `Quick Backtracking` makes it so you can go back through a door you entered through with a single hit, and `Increased Survivability` is a revamped version of the guaranteed 5 lives in Stage 1, which now also includes a respawning Full item.
- Randomize Doors:
  - Completely rewrote the Door Randomization logic to make it more efficient and fix several generation bugs. As a part of this, One-Way doors are now properly included in logic, and the use of certain character abilities may be necessary.
  - The Stage 42 Yukari is now included in door randomization.
  - The map now includes "hint arrows" that show map connections that can be made from stages you've been to.
  - Doors now appear as what they're randomized to during the fade-in when changing rooms.
  - An attempt was made to improve the map layout, but its still bad. I couldn't get an actual good organization method to work after 4-6 months of ramming my face against it. At the very least, it now does try to minimize lines crossing over other stages... But that's at the cost of it stalling when generating the map during the randomization process. I hate it.
- Randomize Player Attacks:
  - On the character menu, mini-portraits of the characters your character is inheriting attacks from will show up in the character selection screen. Currently this only shows up for Player 1 ingame.
- Randomize Enemies:
  - Rewrote this as well. There is now a database of every non-boss enemy attack pattern in the game, which is used instead of randomly fiddling with attack stats.
  - For Fairies, they will try to pick an appropriate attack for how they're moving, and also try to pick an attack and bullet of similar rank (difficulty) to what they were using. However, they can also mutate attack or bullet rank up or down, and it's possible for a single fairy in the room to get "promoted", getting 2 points of increase between attack and bullet rank. Promoted fairies can also become named characters depending on the bullet selected.
  - Special characters can now be randomized to be other special characters, including their attack patterns and bullets.
  - Metal Kedamas can no longer be generated on Kedamas that aren't moving.
- Randomize Cosmetics
  - Disabled color randomization for the following boss bullets since they were causing problems: Kanako 1's screen-wrapping knives, Mokou's falling fire, and (I think) Meiling's rainbow spear bullets.
  - The extra alternatively-colored fairy sprites in the `ex` folder are now in PNG format instead of BMP.
- Solo Character Mode:
  - I made a bunch of improvements on this, but I encountered some whack-ass memory bug that messed with my computer, which I have no idea what's about. I have no idea how I'd debug it, or if it's even related to this mode, but for safety I've disabled this mode for the time being.

V3.5
- The ingame map is now rearranged depending on the seed, and should be (slightly) more legible, with stages actually branching out from 1
- The door randomization should now no longer be able to fail (for real this time)
- Added WIP implementation for having additional enemy sprites (currently only fairies) injected into the game and randomly swapped with existing sprites. Main problem is that it only works if the randomizer starts running before the intro text scroll starts.
- Misc changes that I made 2 years ago and completely forgot about by now

V3.02
- Improved the fix for the door randomization (It was randomly breaking shortcuts)
- Bosses in Solo Character mode no longer respawn (This was necessary for Kanako)
- Added a couple more bullet types to the availible enemy bullets

V3.01
- Potentially fixed the issue where doors very rarely don't randomize
- Fixed a problem where you weren't able to delete save files due to the Solo Character handlers
- The random platforms are now part of Background Randomization

V3.0
- Added Background Randomization
- Added the ability to toggle Door Randomization
- Fixed a bug that was preventing a number of one-way doors from being randomized
- The Spirit/RP of each player character is now changed depending on the attacks they're randomized to have
- It's slightly less likely that Kedamas will turn into Metal Kedamas with Enemy Randomization
- The differently colored spirits now have different behaviours
- Flying fairies now have a reduced chance of being assigned new attacks
- Scaled back the Fairy HP multipliers for when fairies change color
- Leveled out the bullet speeds across all difficulties, since the game handles this itself
- Tall Rocks have been removed from Platform Randomization, and now large rocks can only be pushed by Meiling and Yuyuko (The required rock in Keine's room cannot become a large rock)
- Boss bullets and some player bullets can now have randomized colors
- The 4 "Chest" Bingo tiles have been changed to require a specific number of each chest, and there's now a single Score tile of one million

V2.0
- Door randomization has been significantly improved
- Implemented Enemy Randomization
- Marisa and Reimu can now have their attacks randomized
- Characters that dealt absurd/zero damage with certain attacks can no longer recieve those attacks
- Fixed the sound bug that happened with certain charge attacks
- Platform sprites are now randomized
- Implemented the seed setup script into the randomizer program
- Added Bingo to the randomizer program
- Added an Instant Deathwarp button to the randomizer program
- Probably other things I forgot

V1.0 Initial Proof-of-Concept Release
