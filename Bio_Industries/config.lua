local BI = BI_Config
--[[---------------------------------------------------------------------------
------------------------------------- Credits ---------------------------------
-------------------------------------------------------------------------------

drs9999 - Treefarm Mod
SpeedDaemon - Greenhouse Mod
Simdezimon - Wood Floors
Klonan  - Big Wooden Pole and Wooden Fence
LukeM212 - Tree Sapling Mod
Bobingabout - Bob's Mods - Learned a lot from looking at your amazing work. (and those wonderful functions)

YuokiTani - Art - Amazing Work!!


---------------------------------------------------------------------------
---------------------------------------------------------------------------
------------------------ On / Off Toggles ---------------------------------
---------------------------------------------------------------------------
--- true = On / Yes
--- false = Off / No
-- NOTE -- When changing most of the below values, this will only affect new games, not existing games.
---------------------------------------------------------------------------]]



BI.Bio_Garden = true -- Bio Farm must be true. It uses fertiliser...
--- Enable the Bio Garden
--- Helps clean up the pollution you're producing.


BI.Bio_Solar_Farm = true
--- Enable the Bio Solar Farm. 
--- Tierd of having half your map covered with solar panels... Well, now you can condense them.


BI.Bio_Cannon = true
--- Enable the Bio Conno - Turrent that only fires at Spawners. Has a range of 75.


BI.Bio_Fuel = true -- Bio Farm must be true and you have to play with Natural Evolution Buildings mod.
--- Enable the Bio Fuel. Make fuel from plants and animals. (You'll need Natural Evolution Buildings mod for this to work.)
--- Enable Plastic


BI.Wood_Products = true
--- Enables wood products like:
	-- Wood Fence
	-- Big Wood Pole
	-- Wood Flooring
	-- Wood Rail (Uses wood. Vanilla rail now uses Concrete)


	
BI.Recipe_Tweaks = true
--- Making some Vanilla recipe's more realistic.
--*********************
--- Recipe Changes might not take affect on existing games if you don't run:
-- "/c game.player.force.reset_recipes()""
--*********************

--- Stone Wall: adds Iron Sticks (Rebarb) to recipe
--- Concrete: Uses Iron Sticks (Rebarb) and not Iron-Ore
--- Rail (Vanilla and Wood): Uses Crushed Stone and not Stone
--- Trees Give Random 1 - 6 Raw Wood
--- Tree Collision box made smaller
--- Steel Axe requires Iron Axe
--- Player running speed slightly increased from 0.15 to 0.25
--- Loot Pickup distance doubled
--- Reach
	BI.Reach = false
	--- Double player Reach
	
	
	
	
----------------------------- END -------------------------------------------


BI.Bio_Farm = true -- Just leave that as True! (Core Module)
--- Enable the Bio Farm
--- Base part of the mod. 


BI.QCCode = false
-- Used for QC
-- Displays messages used for checking my code



