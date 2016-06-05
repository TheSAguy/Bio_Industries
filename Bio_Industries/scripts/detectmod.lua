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


--Detect DyTech Core
if data.raw["item"]["stone-gear-wheel"] ~= nil or data.raw["item"]["rubber-seed"] ~= nil then
	BI_Config.mod.DyTechCore=true
else 
	BI_Config.mod.DyTechCore=false
end
