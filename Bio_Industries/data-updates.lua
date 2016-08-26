
--- Help Files
require ("libs.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others
require ("libs.item-functions") -- From Bob's Libary 
require ("libs.recipe-functions") -- From Bob's Libary 
require ("libs.technology-functions") -- From Bob's Libary 
require ("libs.legacy") -- From Bob's Libary 
require ("config")

---- Inrease Wood Stack Size
data.raw.item["raw-wood"].stack_size = 400

--- Move Stone Crusher up in tech tree
thxbob.lib.add_technology_recipe ("automation-2", "bi-stone-crusher")
thxbob.lib.add_technology_recipe ("automation-2", "bi-crushed-stone")



if BI_Config.Recipe_Tweaks then
	--- Concrete Recipe Tweak
	thxbob.lib.remove_recipe_item ("concrete", "iron-ore")
	thxbob.lib.add_new_recipe_item ("concrete", {type="item", name="iron-stick", amount=2})
	--- Stone Wall
	thxbob.lib.add_new_recipe_item ("stone-wall", {type="item", name="iron-stick", amount=1})

	--- Rail
	if data.raw.item["stone-crushed"] and BI_Config.Wood_Products then
		thxbob.lib.remove_recipe_item ("rail", "stone")
		thxbob.lib.add_new_recipe_item ("rail", {type="item", name="stone-crushed", amount=6})
		thxbob.lib.remove_recipe_item ("bi-rail-wood", "stone")
		thxbob.lib.add_new_recipe_item ("bi-rail-wood", {type="item", name="stone-crushed", amount=6})
	end
	
	--- Trees Give Random 1 - 6 Raw Wood.
	for _,tree in pairs(data.raw["tree"]) do
		tree.collision_box = {{-0.08, -0.08}, {0.08, 0.08}}	
		if not (tree.name =="dead-tree" or tree.name == "dry-tree" or tree.name == "green-coral" or tree.name == "dead-grey-trunk" or tree.name == "dry-hairy-tree" or tree.name == "dead-dry-hairy-tree") then  
		tree.minable = 	{mining_particle = "wooden-particle", mining_time = 1.5, results = {{type = "item", name = "raw-wood", amount_min = 1, amount_max = 6},}}
		end
	end
	

	-- Make Steel Axe use Iron Axe as an upgrade
	thxbob.lib.remove_recipe_item ("steel-axe", "iron-stick")
	thxbob.lib.add_new_recipe_item ("steel-axe", {type="item", name="iron-axe", amount=1})
	
	--- Loot Picup	
	if data.raw.player.player.loot_pickup_distance < 4 then
		data.raw.player.player.loot_pickup_distance = 4 -- default 2
	end	

	--- Run Speed
	if data.raw.player.player.running_speed < 0.15 then
		data.raw.player.player.running_speed = 0.25 -- default 0.15
	end	
	
	--- Reach
	if BI_Config.Reach and data.raw.player.player.build_distance < 24 then
		data.raw.player.player.build_distance = 24
		data.raw.player.player.reach_distance = 20
		data.raw.player.player.reach_resource_distance = 20
		data.raw.player.player.drop_item_distance = 20
	end	
	
	
	--- Disassemble of Burner Miner Drill and Steel Furnace
	require("prototypes.Bio_Tweaks.recipe")
	thxbob.lib.add_technology_recipe ("advanced-material-processing", "bi-steel-furnace-disassemble")
	
end


if BI_Config.Wood_Products then
	--- Wood Floors
	data.raw.item["wood"].place_as_tile =
	{
		result = "bi-wood-floor",
		condition_size = 4,
		condition = { "water-tile" }
	}
	thxbob.lib.add_technology_recipe ("logistics", "bi-big-wooden-pole")

	---- Update Rails 
	require("prototypes.Wood_Products.demo-railpictures-concrete")
	
	-- vanilla rail recipe update
	thxbob.lib.add_new_recipe_item ("rail", {type="item", name="concrete", amount=8})
	
	-- vanilla rail icon & images update
	data.raw["straight-rail"]["straight-rail"].pictures = railpictures_c()
	data.raw["curved-rail"]["curved-rail"].pictures = railpictures_c()
	data.raw["straight-rail"]["straight-rail"].icon = "__Bio_Industries__/graphics/icons/straight-rail-concrete.png"
	data.raw["curved-rail"]["curved-rail"].icon = "__Bio_Industries__/graphics/icons/curved-rail-concrete.png"
	data.raw["rail-planner"]["rail"].icon = "__Bio_Industries__/graphics/icons/rail-concrete.png"

	--- Wood Rail added to Tech 
	thxbob.lib.add_technology_recipe ("railway", "bi-rail-wood")
	
	
	--- If Bob, move Vanilla Rail to Rail 2.
	if data.raw.technology["bob-railway-2"] then
		thxbob.lib.remove_technology_recipe ("railway", "rail")
		thxbob.lib.add_technology_recipe ("bob-railway-2", "rail")
	end	
	
end



--- Adds Solar Farm to solar-energy Tech
if BI_Config.Bio_Solar_Farm then
	if data.raw.technology["bob-solar-energy-2"] then
		thxbob.lib.add_technology_recipe ("bob-solar-energy-2", "bi_bio_Solar_Farm")
		thxbob.lib.replace_recipe_item("bi_bio_Solar_Farm", "solar-panel", "solar-panel-large")
		
	else
		thxbob.lib.add_technology_recipe ("solar-energy", "bi_bio_Solar_Farm")
	end	
end

	
if BI_Config.Bio_Farm then	
	--- Changes fertiliser recipes if bob's
	if data.raw.item["sodium-hydroxide"] then
		thxbob.lib.add_new_recipe_item ("bi-fertiliser-2", {type="item", name="sodium-hydroxide", amount=10})
		thxbob.lib.add_technology_recipe ("bi-fertiliser", "bi-fertiliser-2")
		
	end	
	
	if BI_Config.Bio_Fuel or BI_Config.mod.NEBuildings or BI_Config.Bio_Garden then
	require("prototypes.Bio_Farm.technology2")
	end
	
	--update crushed stone icon
	data.raw.item["stone-crushed"].icon = "__Bio_Industries__/graphics/icons/crushed-stone.png"
	
	
	--- Make Bio Farm use glass if Bob's
	if data.raw.item.glass  then
		thxbob.lib.replace_recipe_item("bi_bio_farm", "copper-cable", "glass")
	end

			
	---- Add Bio Fuel & Plastic
		if BI_Config.Bio_Fuel then 
			require("prototypes.Bio_Fuel.item")
			require("prototypes.Bio_Fuel.fluid")
			require("prototypes.Bio_Fuel.recipe")
			require("prototypes.Bio_Fuel.entities")
			require("prototypes.Bio_Fuel.technology")
			thxbob.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-bioreactor")
			thxbob.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-liquid-co2")
			thxbob.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-cellulose")
			thxbob.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-biomass-0")
			thxbob.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-Bio_Fuel")
			thxbob.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-Fuel_Conversion")
			
		end
	
	------- Adds a Mk3 recipe for wood if you're playing with Natural Evolution Buildings
		if BI_Config.mod.NEBuildings then
			
			thxbob.lib.remove_recipe_item ("bi-adv-fertiliser", "alien-artifact")
			thxbob.lib.add_new_recipe_item ("bi-adv-fertiliser", {type="fluid", name="NE_enhanced-nutrient-solution", amount=50})

			--- Adds Clean Air 2 recipe - Using Advanced fertiliser

			
			--- Change the recipe of Bio Fuel to use Revitalization Solution.
			thxbob.lib.remove_recipe_item ("bi-Bio_Fuel", "alien-artifact")
			thxbob.lib.add_new_recipe_item ("bi-Bio_Fuel", {type="fluid", name="NE_revitalization-solution", amount=10})
			
		end

	
	

	------- DyTech Support
	if BI_Config.mod.DyTechCore then

	require("prototypes.Bio_Farm.dytech_recipe")
		
		thxbob.lib.add_technology_recipe ("bi_bio_farming", "bi-resin")
		thxbob.lib.add_technology_recipe ("bi-fertiliser", "bi-resin_Mk2")
		thxbob.lib.add_technology_recipe ("bi_bio_farming", "bi-sulfur-wood")
		thxbob.lib.add_technology_recipe ("bi-fertiliser", "bi-sulfur-wood_Mk2")

		
		--- If you're using NE Buildings, add an advanced recipe
		if BI_Config.mod.NEBuildings then
			thxbob.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-resin_Mk3")
			thxbob.lib.add_technology_recipe ("bi-advanced-biotechnology", "bi-sulfur-wood_Mk3")
			thxbob.lib.add_new_recipe_item ("bi-resin_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})
			thxbob.lib.add_new_recipe_item ("bi-sulfur-wood_Mk3", {type="item", name="bi-adv-fertiliser", amount=5})

		end

	end

end



if BI_Config.Bio_Cannon then
	------- Adds a Biological Hive Buster Ammo
	if BI_Config.mod.NEBuildings then

	-- Add Bio Projectile
		require("prototypes.Bio_Cannon.damage-type")
		require("prototypes.Bio_Cannon.bio-projectile")
		thxbob.lib.add_technology_recipe ("Bio_Cannon", "Bio_Cannon_Bio_Ammo")
		data.raw.recipe["Bio_Cannon_Bio_Ammo"].category = "crafting-with-fluid"
		thxbob.lib.remove_recipe_item ("Bio_Cannon_Bio_Ammo", "alien-artifact")
		thxbob.lib.add_new_recipe_item ("Bio_Cannon_Bio_Ammo", {type="fluid", name="NE_alien_toxin", amount=50})


	------- Changes Hive Buster Recipe


		thxbob.lib.remove_recipe_item ("Bio_Cannon", "advanced-circuit")
		thxbob.lib.remove_recipe_item ("Bio_Cannon", "steel-plate")
		thxbob.lib.add_new_recipe_item ("Bio_Cannon", {type="item", name="Building_Materials", amount=30})

	end
end

------------ Changing order/sorting/groups
if data.raw["item"]["solar-panel-large-3"] then 
	if BI_Config.Bio_Solar_Farm then
		data.raw["item"]["bi_bio_Solar_Farm"].subgroup = "bob-energy-solar-panel"
		data.raw["item"]["bi_bio_Solar_Farm"].order="d[solar-panel]-x[bi_bio_Solar_Farm]"	
		data.raw["item"]["bi_bio_Solar_Farm_Image"].subgroup = "bob-energy-solar-panel"
		data.raw["item"]["bi_bio_Solar_Farm_Image"].order="d[solar-panel]-x[bi_bio_Solar_Farm]"
	end
end


if data.raw["item-subgroup"]["bob-fluid"] then 
	if BI_Config.Bio_Fuel then
		if BI_Config.mod.NEBuildings then
			data.raw["recipe"]["bi-Bio_Fuel"].subgroup = "bob-fluid"
			data.raw["recipe"]["bi-Bio_Fuel"].order = "b[fluid-chemistry]-a[coal-cracking]-z[bi-Bio_Fuel]"	
			data.raw["recipe"]["bi-Fuel_Conversion"].subgroup = "bob-fluid"
			data.raw["recipe"]["bi-Fuel_Conversion"].order = "b[fluid-chemistry]-a[coal-cracking]-y[bi-Fuel_Conversion]"	
			data.raw["recipe"]["bi-plastic"].subgroup = "bob-resource-chemical"
			data.raw["recipe"]["bi-plastic"].order = "g[plastic-bar]"
			data.raw["recipe"]["bi-cellulose"].subgroup = "bob-resource-chemical"
			data.raw["recipe"]["bi-cellulose"].order = "g[plastic-bar]"
		end
	end
end

if data.raw["item-subgroup"]["bob-material"] then 
	if BI_Config.Bio_Farm then
		data.raw["recipe"]["bi-charcoal"].subgroup = "bob-material"
		data.raw["recipe"]["bi-charcoal-2"].subgroup = "bob-material"
		data.raw["recipe"]["bi-coal"].subgroup = "bob-material"
		data.raw["recipe"]["bi-coal-2"].subgroup = "bob-material"
		data.raw["recipe"]["bi-coke-coal"].subgroup = "bob-material"
		data.raw["recipe"]["bi-ash"].subgroup = "bob-material"
		data.raw["recipe"]["bi-ash-2"].subgroup = "bob-material"
		data.raw["recipe"]["bi-crushed-stone"].subgroup = "bob-material"
	end	
end

------------ Support for Bob's Greenhouse
if data.raw["item"]["bob-greenhouse"] then 
	data.raw["item"]["seedling"].place_result="seedling"
	data.raw["item"]["seedling"].icon = "__Bio_Industries__/graphics/icons/Seedling.png"
	data.raw["item"]["fertiliser"].place_as_tile = {result = "grass",	condition_size = 1,	condition = { "water-tile" }}
	data.raw["item"]["fertiliser"].icon = "__Bio_Industries__/graphics/icons/fertiliser_32.png"
		
end

	
	
	
	
	