
BI.Settings.Bio_Cannon = settings.startup["BI_Bio_Cannon"].value
BI.Settings.BI_Bio_Fuel = settings.startup["BI_Bio_Fuel"].value
BI.Settings.BI_Game_Tweaks_Stack_Size = settings.startup["BI_Game_Tweaks_Stack_Size"].value
BI.Settings.BI_Game_Tweaks_Recipe = settings.startup["BI_Game_Tweaks_Recipe"].value
BI.Settings.BI_Game_Tweaks_Tree = settings.startup["BI_Game_Tweaks_Tree"].value
BI.Settings.BI_Game_Tweaks_Player = settings.startup["BI_Game_Tweaks_Player"].value
BI.Settings.BI_Game_Tweaks_Disassemble = settings.startup["BI_Game_Tweaks_Disassemble"].value
BI.Settings.BI_Game_Tweaks_Bot = settings.startup["BI_Game_Tweaks_Bot"].value
BI.Settings.BI_Solar_Additions = settings.startup["BI_Solar_Additions"].value


----Update the Wood Pipe Images
require ("prototypes.Wood_Products.pipes")
--- Update the Rail Images


require ("prototypes.Wood_Products.wooden_rail_bridge_update")
--- Bridge Rail Remnants
require ("prototypes.Wood_Products.update_bridge_rails_remnants")
require ("prototypes.Wood_Products.tint_rails_remnants_function")

-- add Assembling Machine catagory.
--thxbob.lib.machine.type_if_add_category("assembling-machine", "crafting-machine")

	-- Concrete Rail
	---- Update Standard Rails to use and look like concrete
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

	--- Power Rail
	set_tint_to_rails ({
	data.raw["straight-rail"]["straight-rail"],
	data.raw["curved-rail"]["curved-rail"]}, 
	{r = 150/255, g = 150/255, b = 150/255, a = 1}) -- mix
	
-- vanilla rail recipe update
thxbob.lib.recipe.add_new_ingredient("rail", {type="item", name="concrete", amount=8})

-- vanilla rail icon & images update
data.raw["straight-rail"]["straight-rail"].icon = "__Bio_Industries__/graphics/icons/straight-rail-concrete.png"
data.raw["curved-rail"]["curved-rail"].icon = "__Bio_Industries__/graphics/icons/curved-rail-concrete.png"
data.raw["rail-planner"]["rail"].icon = "__Bio_Industries__/graphics/icons/rail-concrete.png"


--- Wood Rail added to Tech 
thxbob.lib.tech.add_recipe_unlock("railway", "bi_recipe_rail_wood")
	
	
--- If Bob, move Vanilla Rail to Rail 2 also add Power Rail.
if data.raw.technology["bob-railway-2"] then
	thxbob.lib.tech.remove_recipe_unlock ("railway", "rail")
	thxbob.lib.tech.add_recipe_unlock("bob-railway-2", "rail")
	thxbob.lib.tech.add_recipe_unlock("bob-railway-2", "bi_recipe_rail_wood_bridge")
	thxbob.lib.tech.add_recipe_unlock("bob-railway-2", "bi_rail_power")
	thxbob.lib.tech.add_recipe_unlock("bob-railway-2", "bi_recipe_power_to_rail_pole")
else
	thxbob.lib.tech.add_recipe_unlock("rail-signals", "bi_recipe_rail_wood_bridge")
	thxbob.lib.tech.add_recipe_unlock("rail-signals", "bi_rail_power")
	thxbob.lib.tech.add_recipe_unlock("rail-signals", "bi_recipe_power_to_rail_pole")
end
	
-- Damage Bonus to Ammo
-- Don't duplicate what NE does

if not mods["Natural_Evolution_Buildings"] then
	
	thxbob.lib.tech.add_recipe_unlock ("military", "bi_recipe_standard_dart_magazine")
	thxbob.lib.tech.add_recipe_unlock ("military-2", "bi_recipe_enhanced_dart_magazine")
	thxbob.lib.tech.add_recipe_unlock ("military-3", "bi_recipe_poison_dart_magazine")
	require("prototypes.Bio_Turret.technology-updates")

end

if not mods["Natural_Evolution_Buildings"] and BI.Settings.Bio_Cannon then
	-- Don't duplicate what NE does
	if not mods["Natural_Evolution_Buildings"] then
		require("prototypes.Bio_Cannon.technology-updates")
	end
	-- add Prototype Artillery as pre req for artillery
	thxbob.lib.tech.add_prerequisite("artillery", "bi_tech_bio_cannon")
end

--- Move Stone Crusher up in tech tree
thxbob.lib.tech.add_recipe_unlock("automation", "bi_recipe_stone_crusher")
thxbob.lib.tech.add_recipe_unlock("automation", "bi_recipe_crushed_stone")

-- Add Wooden Chests
thxbob.lib.tech.add_recipe_unlock("logistics", "bi_recipe_large_wooden_chest")
thxbob.lib.tech.add_recipe_unlock("logistics-2", "bi_recipe_huge_wooden_chest")
thxbob.lib.tech.add_recipe_unlock("logistics-3", "bi_recipe_giga_wooden_chest")

	-- Add Big and Huge electric poles to tech tree
thxbob.lib.tech.add_recipe_unlock ("logistics", "bi_recipe_big_wooden_pole")
thxbob.lib.tech.add_recipe_unlock ("electric-energy-distribution-2", "bi_recipe_huge_wooden_pole")
	
--- Wood Floors
data.raw.item["wood"].place_as_tile =
	{
		result = "bi-wood-floor",
		condition_size = 4,
		condition = { "water-tile" }
	}
	


--- Make it so that the Base game tile "grass" can't be placed in blueprints
--- New as of 0.16
data.raw["tile"]["grass-1"].can_be_part_of_blueprint = false
data.raw["tile"]["grass-2"].can_be_part_of_blueprint = false
data.raw["tile"]["grass-3"].can_be_part_of_blueprint = false
data.raw["tile"]["grass-4"].can_be_part_of_blueprint = false


if mods["alien-biomes"] then

	data.raw["tile"]["frozen-snow-0"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-7"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-8"].can_be_part_of_blueprint = false
	data.raw["tile"]["frozen-snow-9"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-aubergine-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-beige-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-black-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-brown-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-cream-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-dustyrose-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-grey-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-purple-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-red-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-tan-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-violet-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-5"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-dirt-6"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-sand-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-sand-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["mineral-white-sand-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-blue-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-blue-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-green-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-green-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-green-grass-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-green-grass-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-mauve-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-mauve-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-olive-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-olive-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-orange-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-orange-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-purple-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-purple-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-red-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-red-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-turquoise-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-turquoise-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-violet-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-violet-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-yellow-grass-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["vegetation-yellow-grass-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-blue-heat-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-blue-heat-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-blue-heat-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-blue-heat-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-green-heat-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-green-heat-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-green-heat-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-green-heat-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-orange-heat-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-orange-heat-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-orange-heat-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-orange-heat-4"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-purple-heat-1"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-purple-heat-2"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-purple-heat-3"].can_be_part_of_blueprint = false
	data.raw["tile"]["volcanic-purple-heat-4"].can_be_part_of_blueprint = false

end


--- Adds Solar Farm, Solar Plant, Musk Floor, Bio Accumulator and Substation to Tech tree
if BI.Settings.BI_Solar_Additions then

	if data.raw.technology["bob-solar-energy-2"] then
		
		thxbob.lib.tech.add_recipe_unlock("bob-electric-energy-accumulators-2", "bi_recipe_accumulator")
		thxbob.lib.tech.add_recipe_unlock("electric-energy-distribution-2", "bi_recipe_huge_substation")
		thxbob.lib.tech.add_recipe_unlock("bob-solar-energy-2", "bi_recipe_bio_solar_farm")
		thxbob.lib.tech.add_recipe_unlock("bob-solar-energy-2", "bi_recipe_solar_boiler_panel")
		
	else

		thxbob.lib.tech.add_recipe_unlock("electric-energy-accumulators-1", "bi_recipe_accumulator")
		thxbob.lib.tech.add_recipe_unlock("electric-energy-distribution-2", "bi_recipe_huge_substation")
		thxbob.lib.tech.add_recipe_unlock("solar-energy", "bi_recipe_bio_solar_farm")
		thxbob.lib.tech.add_recipe_unlock("solar-energy", "bi_recipe_solar_boiler_panel")
		
	end	
	
	if data.raw.technology["bob-solar-energy-3"] then
		
		thxbob.lib.tech.add_recipe_unlock("bob-solar-energy-3", "bi_recipe_solar_mat")
		
	else

		thxbob.lib.tech.add_recipe_unlock("solar-energy", "bi_recipe_solar_mat")
	
	end	
	
	
	--- Electric redo if Bob' Electric
	-- Huge Electric Pole
	if data.raw.item["tinned-copper-cable"] then
	
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_huge_wooden_pole", "wood")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_huge_wooden_pole", {type = "item", name = "tinned-copper-cable", amount = 15})
		
	end

	-- Solar Farm
	if data.raw.item["solar-panel-large-2"] then
	
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_bio_solar_farm", "solar-panel")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_bio_solar_farm", {type = "item", name = "solar-panel-large-2", amount = 20})
		
	end

	-- Huge Sub Station
	if data.raw.item["substation-3"] then
	
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_huge_substation", "substation")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_huge_substation", {type = "item", name = "substation-3", amount = 6})
		
	end
	if data.raw.item["electrum-alloy"] then
	
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_huge_substation", "steel-plate")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_huge_substation", {type = "item", name = "electrum-alloy", amount = 10})
		
	end

	-- Huge Accumulator
	if data.raw.item["large-accumulator-2"] then
	
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_accumulator", "accumulator")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_accumulator", {type = "item", name = "large-accumulator-2", amount = 20})
		
	end
	if data.raw.item["aluminium-plate"] then
	
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_accumulator", "copper-cable")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_accumulator", {type = "item", name = "aluminium-plate", amount = 50})
		
	end
	
	-- Solar Mat
	if data.raw.item["aluminium-plate"] then
	
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_solar_mat", "steel-plate")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_solar_mat", {type = "item", name = "aluminium-plate", amount = 1})
		
	end
	if data.raw.item["silicon-wafer"] then
	
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_solar_mat", "copper-cable")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_solar_mat", {type = "item", name = "silicon-wafer", amount = 4})
		
	end

	-- Solar Boiler / Plant
	if data.raw.item["angels-electric-boiler"] then
	
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_solar_boiler_panel", "boiler")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_solar_boiler_panel", {type = "item", name = "angels-electric-boiler", amount = 1})
		
	end
end



require("prototypes.Bio_Farm.compatible_recipes") -- Bob and Angels mesh
	
if BI.Settings.BI_Bio_Fuel or mods["Natural_Evolution_Buildings"] then

	require("prototypes.Bio_Farm.technology2")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_clean_air_2")
	
end

-- Adds Bio recipes
if BI.Settings.BI_Bio_Fuel then 

	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_bioreactor")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_cellulose_1")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_cellulose_2")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_biomass_1")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_biomass_2")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_biomass_3")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_battery")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_biomass_conversion_1")	
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_biomass_conversion_2")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_biomass_conversion_3")
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_acid")	
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_boiler")

	if mods["angelspetrochem"] then
		thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_sulfur_angels")	
	else
		thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_sulfur")	
	end
	
	thxbob.lib.recipe.add_new_ingredient("bi_recipe_adv_fertiliser_1", {type="fluid", name="bi-biomass", amount=10})
	thxbob.lib.recipe.add_new_ingredient("bi_recipe_adv_fertiliser_2", {type="fluid", name="bi-biomass", amount=10})
	
end


	
--- if the Alien Artifact is in the game, use if for some recipes
if data.raw.item["alien-artifact"] then
	--- Advanced Fertiliser will use Alien Artifact
	thxbob.lib.recipe.add_new_ingredient("bi-adv-fertiliser-1", {type="item", name="alien-artifact", amount=5})
	thxbob.lib.tech.add_recipe_unlock("bi_tech_advanced_biotechnology", "bi_recipe_adv_fertiliser_1")	
end	


------- Adds a Mk3 recipe for wood if you're playing with Natural Evolution Buildings
if mods["Natural_Evolution_Buildings"] then

		
	thxbob.lib.recipe.remove_ingredient ("bi-adv-fertiliser-1", "alien-artifact")
	thxbob.lib.recipe.add_new_ingredient ("bi-adv-fertiliser-1", {type="fluid", name="NE_enhanced-nutrient-solution", amount=50})

end

--- Bio Industries not has it's own Group!
--[[
------------ Changing order/sorting/groups
if BI.Settings.BI_Solar_Additions and data.raw["item"]["solar-panel-large-3"] and data.raw["item-subgroup"]["bob-energy-solar-panel"] then 
	
	data.raw["item"]["bi-bio-solar-farm"].subgroup = "bob-energy-solar-panel"
	data.raw["item"]["bi-bio-solar-farm"].order="d[solar-panel]-x[bi-bio-solar-farm]"	
	data.raw["item"]["bi-solar-mat"].subgroup = "bob-energy-solar-panel"

end


------------ Changing order/sorting/groups
if data.raw["item-subgroup"]["bob-energy-accumulator"] and BI.Settings.BI_Solar_Additions then 
	
	data.raw["item"]["bi-bio-accumulator"].subgroup = "bob-energy-accumulator"
	data.raw["item"]["bi-bio-accumulator"].order="e[accumulator]-a[accumulator]-x"	
	data.raw["item"]["bi-large-substation"].subgroup = "bob-energy-accumulator"
	
end


if data.raw["item-subgroup"]["bob-fluid"] then 
	
	if BI.Settings.BI_Bio_Fuel and mods["Natural_Evolution_Buildings"] then
		data.raw["recipe"]["bi_recipe_biomass_conversion_1"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi_recipe_biomass_conversion_1"].order = "b[fluid-chemistry]-a[coal-cracking]-z[bi-Fuel_Conversion-1]"	
		data.raw["recipe"]["bi_recipe_biomass_conversion_2"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi_recipe_biomass_conversion_2"].order = "b[fluid-chemistry]-a[coal-cracking]-z[bi-Fuel_Conversion-2]"	
		data.raw["recipe"]["bi_recipe_biomass_conversion_3"].subgroup = "bob-fluid"
		data.raw["recipe"]["bi_recipe_biomass_conversion_3"].order = "b[fluid-chemistry]-a[coal-cracking]-z[bi-Fuel_Conversion-3]"		
		data.raw["recipe"]["bi_recipe_plastic_1"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi_recipe_plastic_1"].order = "g[plastic-bar-1]"
		data.raw["recipe"]["bi_recipe_plastic_2"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi_recipe_plastic_2"].order = "g[plastic-bar-2]"
		data.raw["recipe"]["bi_recipe_cellulose_1"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi_recipe_cellulose_1"].order = "g[cellulose-1]"
		data.raw["recipe"]["bi_recipe_cellulose_2"].subgroup = "bob-resource-chemical"
		data.raw["recipe"]["bi_recipe_cellulose_2"].order = "g[cellulose-2]"
	end
	
end

if data.raw["item-subgroup"]["bob-material"] then 

	data.raw["recipe"]["bi_recipe_charcoal"].subgroup = "bob-material"
	data.raw["recipe"]["bi_recipe_charcoal_2"].subgroup = "bob-material"
	data.raw["recipe"]["bi_recipe_coal"].subgroup = "bob-material"
	data.raw["recipe"]["bi_recipe_coal_2"].subgroup = "bob-material"
	data.raw["recipe"]["bi_recipe_coke_coal"].subgroup = "bob-material"
	if data.raw["recipe"]["bi_recipe_pellete_coal_2"] then
		data.raw["recipe"]["bi_recipe_pellete_coal_2"].subgroup = "bob-material"
	end
	data.raw["recipe"]["bi_recipe_ash_1"].subgroup = "bob-material"
	data.raw["recipe"]["bi_recipe_ash_2"].subgroup = "bob-material"
	data.raw["recipe"]["bi_recipe_woodpulp"].subgroup = "bob-material"
	data.raw["recipe"]["bi_recipe_crushed_stone"].subgroup = "bob-material"

end


if data.raw["item-subgroup"]["pipe"] then 

	data.raw["item"]["bi-wood-pipe"].subgroup = "pipe"
	data.raw["item"]["bi-wood-pipe"].order = "a[pipe]-a[pipe]-1-0"	
	data.raw["item"]["bi-pipe-to-ground-wood"].subgroup = "pipe-to-ground"
	data.raw["item"]["bi-pipe-to-ground-wood"].order = "a[pipe]-b[pipe-to-ground]-1-0"	
	
end

]]

------------ Support for Bob's Greenhouse
if data.raw["item"]["bob-greenhouse"] then 

	data.raw["item"]["seedling"].place_result = "seedling"
	data.raw["item"]["seedling"].icon = "__Bio_Industries__/graphics/icons/Seedling.png"
	data.raw["item"]["fertiliser"].icon = "__Bio_Industries__/graphics/icons/fertiliser_32.png"
	
	if mods["alien-biomes"] then
		data.raw["item"]["fertiliser"].place_as_tile = {result = "vegetation-green-grass-3",	condition_size = 1,	condition = { "water-tile" }}
	else
		data.raw["item"]["fertiliser"].place_as_tile = {result = "grass-3",	condition_size = 1,	condition = { "water-tile" }}
	end
		
end

	

-------- Use Alternative Solar Farm Image
if BI.Settings.BI_Solar_Additions and settings.startup["BI_Alt_Solar_Farm_Image"] and settings.startup["BI_Alt_Solar_Farm_Image"].value then


	
	data.raw["solar-panel"]["bi-bio-solar-farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon_alt.png"
	data.raw["item"]["bi-bio-solar-farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon_alt.png"


	


	data.raw["solar-panel"]["bi-bio-solar-farm"].picture =
		{
		  filename = "__Bio_Industries__/graphics/entities/bio_solar_farm/Bio_Solar_Farm_On_alt.png",
		  priority = "low",
		  width = 208,
		  height = 192,
		  frame_count = 1,
		  direction_count = 1,
		  scale = 3/2,
		}


	
end


-------- Use Alternative Solar Farm Image
if settings.startup["BI_Alt_Farm_Image"] and settings.startup["BI_Alt_Farm_Image"].value then


	data.raw["assembling-machine"]["bi_recipe_bio_farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon_alt.png"
	data.raw["lamp"]["bi-bio-farm-light"].icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon_alt.png"
	data.raw["item"]["bi_recipe_bio_farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon_alt.png"
	data.raw["recipe"]["bi_recipe_bio_farm"].icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon_alt.png"
	
	data.raw["assembling-machine"]["bi_recipe_bio_farm"].animation =
		{
			filename = "__Bio_Industries__/graphics/entities/biofarm/Bio_Farm_Idle_alt.png",
			priority = "high",
			width = 320,
			height = 320,
			frame_count = 1,
			shift = {0.75, 0},
		}



	data.raw["assembling-machine"]["bi_recipe_bio_farm"].working_visualisations =
		{

			animation =
			{
				filename = "__Bio_Industries__/graphics/entities/biofarm/Bio_Farm_Working_alt.png",
				priority = "high",
				width = 320,
				height = 320,
				frame_count = 1,
				shift = {0.75, 0},
			},
		}


	data.raw["lamp"]["bi-bio-farm-light"].picture_off =
		{
			  filename = "__Bio_Industries__/graphics/entities/biofarm/Bio_Farm_Idle.png",
			  priority = "low",
			  width = 0,
			  height = 0,
			  frame_count = 1,
			  axially_symmetrical = false,
			  direction_count = 1,
			  shift = {0.75, 0},
		}



	data.raw["lamp"]["bi-bio-farm-light"].picture_on =
			{
			  filename = "__Bio_Industries__/graphics/entities/biofarm/Bio_Farm_Idle.png",
			  priority = "low",
			  width = 0,
			  height = 0,
			  frame_count = 1,
			  axially_symmetrical = false,
			  direction_count = 1,
			  shift = {0.75, 0},
			}


	
end


