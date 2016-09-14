-------------------------
-- Cross Mod Detection --
-------------------------

if not BI_Config then BI_Config = {} end
if not BI_Config.mod then BI_Config.mod = {} end


---------------------------

--Detect N.E. Buildings
if data.raw["radar"]["AlienControlStation"] ~= nil and data.raw["assembling-machine"]["Alien_Hatchery"] ~= nil then
	BI_Config.mod.NEBuildings=true
else 
	BI_Config.mod.NEBuildings=false
end

--Detect DyTechWar
if data.raw["unit"]["young-berserk-biter"] ~= nil and data.raw["unit"]["young-berserk-spitter"] ~= nil then
	BI_Config.mod.DyTechWar=true
else 
	BI_Config.mod.DyTechWar=false
end

--Detect DyTech Core
if data.raw["item"]["sulfur-seed"] ~= nil and data.raw["item"]["rubber-seed"] ~= nil then
	BI_Config.mod.DyTechCore=true
else 
	BI_Config.mod.DyTechCore=false
end

--Detect Bob's Enemies
if data.raw["unit"]["bob-big-piercing-biter"] ~= nil and data.raw["unit"]["bob-big-electric-spitter"] ~= nil then
	BI_Config.mod.BobEnemies=true
else 
	BI_Config.mod.BobEnemies=false
end

--Detect Supreme Warfare
if data.raw["technology"]["artillery"] ~= nil and data.raw["technology"]["advanced-artillery"] ~= nil then
	BI_Config.mod.SupremeWarfare=true
else 
	BI_Config.mod.SupremeWarfare=false
end


--Detect N.E. Enemies
if data.raw["unit"]["small-biter-Mk2"] ~= nil or data.raw["unit"]["small-spitter-Mk2"] ~= nil or data.raw["logistic-container"]["Artifact-collector-area"] ~= nil then
	BI_Config.mod.NEEnemies=true
else 
	BI_Config.mod.NEEnemies=false
end
