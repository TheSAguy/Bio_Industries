
if not BI_Config then BI_Config = {} end
if not BI_Config.mod then BI_Config.mod = {} end

if not bobmods then bobmods = {} end
if not bobmods.lib then bobmods.lib = {} end

if not BI_Functions then BI_Functions = {} end

--- Help Files
require ("scripts.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("scripts.item-functions") -- From Bob's Libary 
require ("scripts.recipe-functions") -- From Bob's Libary 
require ("scripts.technology-functions") -- From Bob's Libary 

--- Bio Farm
require("prototypes.Bio_Farm.entities")
require("prototypes.Bio_Farm.item")
require("prototypes.Bio_Farm.recipe")
require("prototypes.Bio_Farm.liquids")
require("prototypes.Bio_Farm.recipe-categories")
require("prototypes.Bio_Farm.pipeConnectors")

--- Bio Solar Farm
require("prototypes.Bio_Solar_Farm.entities")
require("prototypes.Bio_Solar_Farm.item")
require("prototypes.Bio_Solar_Farm.recipe")


-- Bio Garden
require("prototypes.Bio_Garden.entities")
require("prototypes.Bio_Garden.item")
require("prototypes.Bio_Garden.recipe")

-- Tech
require("prototypes.technology")

