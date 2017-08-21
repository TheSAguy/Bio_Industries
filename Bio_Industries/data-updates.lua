


--- Help Files
require ("libs.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 

----Update the Wood Pipe Images
require ("prototypes.Wood_Products.pipes")
--- Update the Rail Images
require ("prototypes.Wood_Products.wooden_rail_bridge_update")
require ("prototypes.Wood_Products.tint_rails_remnants_function")

	-- Concrete Rail
set_tint_to_rails ({
	data.raw["straight-rail"]["straight-rail"],
	data.raw["curved-rail"]["curved-rail"]}, 
	{r = 183/255, g = 183/255, b = 183/255, a = 1}) -- concrete
	
set_tint_to_remnants ({
	data.raw["rail-remnants"]["straight-rail-remnants"],
	data.raw["rail-remnants"]["curved-rail-remnants"]}, 
	{r = 183/255, g = 183/255, b = 183/255, a = 1}) -- concrete

	-- Wood Rail
	set_tint_to_rails ({
	data.raw["straight-rail"]["bi-straight-rail-wood"],
	data.raw["curved-rail"]["bi-curved-rail-wood"]}, 
	{r = 183/255, g = 125/255, b = 62/255, a = 1}) -- wood
	
set_tint_to_remnants ({
	data.raw["rail-remnants"]["straight-rail-remnants-wood"],
	data.raw["rail-remnants"]["curved-rail-remnants-wood"]}, 
	{r = 183/255, g = 125/255, b = 62/255, a = 1}) -- wood

--[[
	-- Wood Bridge Rail
	set_tint_to_rails ({
	data.raw["straight-rail"]["bi-straight-rail-wood-bridge"],
	data.raw["curved-rail"]["bi-curved-rail-wood-bridge"]}, 
	{r = 139/255, g = 69/255, b = 19/255, a = 1}) -- wood

set_tint_to_remnants ({
	data.raw["rail-remnants"]["straight-rail-remnants-wood"],
	data.raw["rail-remnants"]["curved-rail-remnants-wood"]}, 
	{r = 139/255, g = 69/255, b = 19/255, a = 1}) -- wood
]]

--- Move Stone Crusher up in tech tree
thxbob.lib.tech.add_recipe_unlock("automation", "bi-stone-crusher")
thxbob.lib.tech.add_recipe_unlock("automation", "bi-crushed-stone")


-- Add Large Wooden Chest
thxbob.lib.tech.add_recipe_unlock("logistics-2", "bi_large_wooden_chest")


---- Game Tweaks ----
if BI.Settings.BI_Recipe_Tweaks then
	--- Concrete Recipe Tweak
	thxbob.lib.recipe.remove_ingredient ("concrete", "iron-ore")
	thxbob.lib.recipe.add_new_ingredient ("concrete", {type="item", name="iron-stick", amount=2})
	--- Stone Wall
	thxbob.lib.recipe.add_new_ingredient ("stone-wall", {type="item", name="iron-stick", amount=1})


	--- Rail
	if data.raw.item["stone-crushed"] then
		thxbob.lib.recipe.remove_ingredient ("rail", "stone")
		thxbob.lib.recipe.add_new_ingredient ("rail", {type="item", name="stone-crushed", amount=6})
		thxbob.lib.recipe.remove_ingredient ("bi-rail-wood", "stone")
		thxbob.lib.recipe.add_new_ingredient ("bi-rail-wood", {type="item", name="stone-crushed", amount=6})
	end

	
	--- Trees Give Random 1 - 6 Raw Wood.
	for _,tree in pairs(data.raw["tree"]) do
		tree.collision_box = {{-0.05, -0.05}, {0.05, 0.05}}	
		if not (tree.name =="dead-tree" or tree.name == "dry-tree" or tree.name == "green-coral" or tree.name == "dead-grey-trunk" or tree.name == "dry-hairy-tree" or tree.name == "dead-dry-hairy-tree") then  
		tree.minable = 	{mining_particle = "wooden-particle", mining_time = 1.5, results = {{type = "item", name = "raw-wood", amount_min = 1, amount_max = 6},}}
		end
	end
	

	-- Make Steel Axe use Iron Axe as an upgrade
	thxbob.lib.recipe.remove_ingredient ("steel-axe", "iron-stick")
	thxbob.lib.recipe.add_new_ingredient ("steel-axe", {type="item", name="iron-axe", amount=1})
	
	--- Loot Picup	
	if data.raw.player.player.loot_pickup_distance < 4 then
		data.raw.player.player.loot_pickup_distance = 4 -- default 2
	end	

	--- Run Speed
	if data.raw.player.player.running_speed < 0.15 then
		data.raw.player.player.running_speed = 0.25 -- default 0.15
	end	
	
	
	--- Disassemble of Burner Miner Drill and Steel Furnace
	require("prototypes.Bio_Tweaks.recipe")
	thxbob.lib.tech.add_recipe_unlock("advanced-material-processing", "bi_steel_furnace_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_burner_mining_drill_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_stone_furnace_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_burner_inserter_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_long_handed_inserter_disassemble")
	
	
end



--- Wood Floors
data.raw.item["wood"].place_as_tile =
	{
		result = "bi-wood-floor",
		condition_size = 4,
		condition = { "water-tile" }
	}
thxbob.lib.tech.add_recipe_unlock ("logistics", "bi-big-wooden-pole")


---- Update Standard Rails to use and look like concrete
--require("prototypes.Wood_Products.demo-railpictures-concrete")
--require("prototypes.Wood_Products.demo-remnants-concrete")
	
-- vanilla rail recipe update
thxbob.lib.recipe.add_new_ingredient("rail", {type="item", name="concrete", amount=8})


-- vanilla rail icon & images update
--data.raw["straight-rail"]["straight-rail"].pictures = rail_pictures_c()
--data.raw["curved-rail"]["curved-rail"].pictures = rail_pictures_c()
data.raw["straight-rail"]["straight-rail"].icon = "__Bio_Industries__/graphics/icons/straight-rail-concrete.png"
data.raw["curved-rail"]["curved-rail"].icon = "__Bio_Industries__/graphics/icons/curved-rail-concrete.png"
data.raw["rail-planner"]["rail"].icon = "__Bio_Industries__/graphics/icons/rail-concrete.png"

--- Wood Rail added to Tech 
thxbob.lib.tech.add_recipe_unlock("railway", "bi-rail-wood")
thxbob.lib.tech.add_recipe_unlock("railway", "bi-rail-wood-bridge")	
	
--- If Bob, move Vanilla Rail to Rail 2.
if data.raw.technology["bob-railway-2"] then
	thxbob.lib.tech.remove_recipe_unlock ("railway", "rail")
	thxbob.lib.tech.add_recipe_unlock("bob-railway-2", "rail")
end	

--- Make it so that the Base game tile "grass-medium" can't be placed in blueprints
data.raw["tile"]["grass-medium"].can_be_part_of_blueprint = false

--- Adds Bio Accumulator Tech
if BI.Settings.BI_Accumulator then
	if data.raw.technology["bob-solar-energy-2"] then
		
		thxbob.lib.tech.add_recipe_unlock("bob-electric-energy-accumulators-2", "bi_accumulator")
		
--[[		
		--- Change Bi Accumulator Recipe if Bob's
		if data.raw.item["large-accumulator"]  then
			thxbob.lib.recipe.replace_ingredient("bi_accumulator", "accumulator", "large-accumulator")
		end
	]]
	
		
	else

		thxbob.lib.tech.add_recipe_unlock("electric-energy-accumulators-1", "bi_accumulator")
		
	end	
end


if data.raw.technology["bob-solar-energy-2"] then
	if BI.Settings.BI_Solar_Farm then
		thxbob.lib.tech.add_recipe_unlock("bob-solar-energy-2", "bi_bio_Solar_Farm")
		--thxbob.lib.recipe.replace_ingredient("bi_bio_Solar_Farm", "solar-panel", "solar-panel-large")
	end
	-- Solar Mat
	thxbob.lib.tech.add_recipe_unlock("bob-solar-energy-2", "bi_solar_mat")
	
else
	if BI.Settings.BI_Solar_Farm then
		thxbob.lib.tech.add_recipe_unlock("solar-energy", "bi_bio_Solar_Farm")
	end
	-- Solar mat
	thxbob.lib.tech.add_recipe_unlock("solar-energy", "bi_solar_mat")

	
end	



--- Changes fertiliser recipes if bob's
if data.raw.item["sodium-hydroxide"] then
	thxbob.lib.recipe.add_new_ingredient ("bi-fertiliser-2", {type="item", name="sodium-hydroxide", amount=10})
	thxbob.lib.tech.add_recipe_unlock("bi-fertiliser", "bi-fertiliser-2")
	
end	
	
if BI.Settings.BI_Bio_Fuel or BI_Config.mod.NEBuildings then
	require("prototypes.Bio_Farm.technology2")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-Clean_Air2")
end

-- Adds Bio recipes
if BI.Settings.BI_Bio_Fuel then 
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-bioreactor")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-cellulose-1")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-cellulose-2")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass-1")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass-2")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass-3")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-battery")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass_conversion-1")	
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-biomass_conversion-2")
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-acid")	
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-sulfur")	
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bio_boiler")
	
	thxbob.lib.recipe.add_new_ingredient("bi-adv-fertiliser-1", {type="fluid", name="bi-biomass", amount=10})
	thxbob.lib.recipe.add_new_ingredient("bi-adv-fertiliser-2", {type="fluid", name="bi-biomass", amount=10})
	
end

--update crushed stone icon
data.raw.item["stone-crushed"].icon = "__Bio_Industries__/graphics/icons/crushed-stone.png"
	
	
--- Make Bio Farm use glass if Bob's
if data.raw.item.glass  then
	thxbob.lib.recipe.replace_ingredient("bi_bio_farm", "copper-cable", "glass")
end
	

	
--- if the Alien Artifact is in the game, use if for some recipes
if data.raw.item["alien-artifact"] then
	--- Advanced Fertiliser will use Alien Artifact
	thxbob.lib.recipe.add_new_ingredient("bi-adv-fertiliser-1", {type="item", name="alien-artifact", amount=5})
	thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-adv-fertiliser-1")
	
end	



------- Adds a Mk3 recipe for wood if you're playing with Natural Evolution Buildings
if BI_Config.mod.NEBuildings then
		
	thxbob.lib.recipe.remove_ingredient ("bi-adv-fertiliser-1", "alien-artifact")
	thxbob.lib.recipe.add_new_ingredient ("bi-adv-fertiliser-1", {type="fluid", name="NE_enhanced-nutrient-solution", amount=50})

end
	



if BI.Settings.Bio_Cannon then
	------- Adds a Biological Bio Cannon Ammo
	if BI_Config.mod.NEBuildings then

	-- Add Bio Projectile
		require("prototypes.Bio_Cannon.damage-type")
		require("prototypes.Bio_Cannon.bio-projectile")
		thxbob.lib.tech.add_recipe_unlock("Bio_Cannon", "Bio_Cannon_Bio_Ammo")

	------- Changes Bio Cannon Recipe
		thxbob.lib.recipe.remove_ingredient ("Bio_Cannon", "advanced-circuit")
		thxbob.lib.recipe.remove_ingredient ("Bio_Cannon", "steel-plate")
		thxbob.lib.recipe.add_new_ingredient ("Bio_Cannon", {type="item", name="Building_Materials", amount=30})

	end
end


------------ Changing order/sorting/groups
if data.raw["item"]["solar-panel-large-3"] and data.raw["item-subgroup"]["bob-energy-solar-panel"] then 
	if BI.Settings.BI_Solar_Farm then
		data.raw["item"]["bi_bio_Solar_Farm"].subgroup = "bob-energy-solar-panel"
		data.raw["item"]["bi_bio_Solar_Farm"].order="d[solar-panel]-x[bi_bio_Solar_Farm]"	
		data.raw["item"]["bi_bio_Solar_Farm_Image"].subgroup = "bob-energy-solar-panel"
		data.raw["item"]["bi_bio_Solar_Farm_Image"].order="d[solar-panel]-x[bi_bio_Solar_Farm]"
	end
	data.raw["item"]["bi-solar-mat"].subgroup = "bob-energy-solar-panel"

end


------------ Changing order/sorting/groups
if data.raw["item-subgroup"]["bob-energy-accumulator"] and BI.Settings.BI_Accumulator then 
	data.raw["item"]["bi_accumulator"].subgroup = "bob-energy-accumulator"
	data.raw["item"]["bi_accumulator"].order="e[accumulator]-a[accumulator]-x"	
end


if data.raw["item-subgroup"]["bob-fluid"] then 
	if BI.Settings.BI_Bio_Fuel and BI_Config.mod.NEBuildings then
		data.raw["recipe"]["bi-biomass_conversion-1"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi-biomass_conversion-1"].order = "b[fluid-chemistry]-a[coal-cracking]-y[bi-Fuel_Conversion]"	
		data.raw["recipe"]["bi-biomass_conversion-2"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi-biomass_conversion-2"].order = "b[fluid-chemistry]-a[coal-cracking]-z[bi-Fuel_Conversion]"	
		data.raw["recipe"]["bi-plastic-1"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-plastic-1"].order = "g[plastic-bar-1]"
		data.raw["recipe"]["bi-plastic-2"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-plastic-2"].order = "g[plastic-bar-2]"
		data.raw["recipe"]["bi-cellulose-1"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-cellulose-1"].order = "g[cellulose-1]"
		data.raw["recipe"]["bi-cellulose-2"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi-cellulose-2"].order = "g[cellulose-2]"
	end
end

if data.raw["item-subgroup"]["bob-material"] then 

	data.raw["recipe"]["bi-charcoal"].subgroup = "bob-material"
	data.raw["recipe"]["bi-charcoal-2"].subgroup = "bob-material"
	data.raw["recipe"]["bi-coal"].subgroup = "bob-material"
	data.raw["recipe"]["bi-coal-2"].subgroup = "bob-material"
	data.raw["recipe"]["bi-coke-coal"].subgroup = "bob-material"
	data.raw["recipe"]["bi-ash"].subgroup = "bob-material"
	data.raw["recipe"]["bi-ash-2"].subgroup = "bob-material"
	data.raw["recipe"]["bi-woodpulp"].subgroup = "bob-material"
	data.raw["recipe"]["bi-crushed-stone"].subgroup = "bob-material"

end


if data.raw["item-subgroup"]["pipe"] then 

	data.raw["item"]["bi-wood-pipe"].subgroup = "pipe"
	data.raw["item"]["bi-wood-pipe"].order = "a[pipe]-a[pipe]-1-0"	
	data.raw["item"]["bi-pipe-to-ground-wood"].subgroup = "pipe-to-ground"
	data.raw["item"]["bi-pipe-to-ground-wood"].order = "a[pipe]-b[pipe-to-ground]-1-0"	
	
end



------------ Support for Bob's Greenhouse
if data.raw["item"]["bob-greenhouse"] then 
	data.raw["item"]["seedling"].place_result="seedling"
	data.raw["item"]["seedling"].icon = "__Bio_Industries__/graphics/icons/Seedling.png"
	data.raw["item"]["fertiliser"].place_as_tile = {result = "grass-medium",	condition_size = 1,	condition = { "water-tile" }}
	data.raw["item"]["fertiliser"].icon = "__Bio_Industries__/graphics/icons/fertiliser_32.png"
		
end

	

-------- Use Alternative Solar Farm Image
if BI.Settings.BI_Solar_Farm and settings.startup["BI_Alt_Solar_Farm_Image"] and settings.startup["BI_Alt_Solar_Farm_Image"].value then


data.raw["lamp"]["bi_bio_Solar_Farm_Image"].icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon_alt.png"
data.raw["solar-panel"]["bi_bio_Solar_Farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon_alt.png"
data.raw["item"]["bi_bio_Solar_Farm_Image"].icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon_alt.png"
data.raw["item"]["bi_bio_Solar_Farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon_alt.png"


data.raw["lamp"]["bi_bio_Solar_Farm_Image"].picture_off =
    {
      filename = "__Bio_Industries__/graphics/entities/bio_solar_farm/Bio_Solar_Farm_On_alt.png",
      priority = "high",
      width = 319,
      height = 298,
      frame_count = 1,
      direction_count = 1,
    }



data.raw["lamp"]["bi_bio_Solar_Farm_Image"].picture_on =
    {
      filename = "__Bio_Industries__/graphics/entities/bio_solar_farm/Bio_Solar_Farm_Off_alt.png",
      priority = "high",
      width = 319,
      height = 298,
      frame_count = 1,
      direction_count = 1,
    }


data.raw["solar-panel"]["bi_bio_Solar_Farm"].picture =
    {
      filename = "__Bio_Industries__/graphics/entities/bio_solar_farm/Bio_Solar_Farm_On_alt.png",
      priority = "low",
      width = 319,
      height = 298,
      frame_count = 1,
      direction_count = 1,
    }


	
end
	
	
------- DyTech Support (Might be outdated....
if BI_Config.mod.DyTechCore then

require("prototypes.Bio_Farm.dytech_recipe")
		
	thxbob.lib.tech.add_recipe_unlock("bi_bio_farming", "bi-resin")
	thxbob.lib.tech.add_recipe_unlock("bi-fertiliser", "bi-resin_Mk2")
	thxbob.lib.tech.add_recipe_unlock("bi_bio_farming", "bi-sulfur-wood")
	thxbob.lib.tech.add_recipe_unlock("bi-fertiliser", "bi-sulfur-wood_Mk2")

	
	if data.raw.item["sulfur-seed"].stack_size < 400 then
	data.raw.item["sulfur-seed"].stack_size = 400
	end

	if data.raw.item["sulfur-wood"].stack_size < 400 then
	data.raw.item["sulfur-wood"].stack_size = 400
	end

	if data.raw.item["rubber-seed"].stack_size < 400 then
	data.raw.item["rubber-seed"].stack_size = 400
	end

	--- If you're using NE Buildings, add an advanced recipe
	if BI_Config.mod.NEBuildings then
		thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-resin_Mk3")
		thxbob.lib.tech.add_recipe_unlock("bi-advanced-biotechnology", "bi-sulfur-wood_Mk3")
		thxbob.lib.recipe.add_new_ingredient ("bi-resin_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})
		thxbob.lib.recipe.add_new_ingredient ("bi-sulfur-wood_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})

	end

end


	