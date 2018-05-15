


-- 5dim Stack changes
if settings.startup["5d-change-stack"] and settings.startup["5d-change-stack"].value then
   if data.raw.item["raw-wood"] then
      data.raw.item["raw-wood"].stack_size = math.max(210, data.raw.item['raw-wood'].stack_size)
   end
end

--[[
	---- Bio Drill Enable!
if settings.startup["BI_Bio_Infinite_Fluids"] and settings.startup["BI_Bio_Infinite_Fluids"].value then
	
	require("prototypes.Bio_Drill.resources")
	
	infinite_fluids = require("prototypes.Bio_Drill.supported-resources")
	for _, resource in pairs(infinite_fluids) do

		if settings.startup["bi_" .. resource.name] ~= nil and settings.startup["bi_" .. resource.name].value == true and data.raw["resource"][resource.name] ~= nil then
			data.raw["resource"][resource.name]["infinite"] = false
			data.raw["resource"][resource.name]["minimum"]	= 0
		end
	end	
	
	--- Override the vanilla offshore-pump output from "water" to "water-saline"
	data.raw["offshore-pump"]["offshore-pump"].fluid = "water-saline"

	-- Support for Bob's Pure Water
	if settings.startup["bobmods-plates-purewater"] and settings.startup["bobmods-plates-purewater"].value == true then

		require("prototypes.Bio_Drill.bob-pure-water-over-rides")	

	end
	

end
]]


if settings.startup["angels-use-angels-barreling"] and settings.startup["angels-use-angels-barreling"].value then
   data.raw.technology["bi_tech_fertiliser"].prerequisites = 
      {
         "bi_tech_bio_farming",
         -- AND (
         "water-treatment", -- sulfur
         -- OR
         "angels-fluid-barreling", -- barreling (needed 'water-treatment' as prerequisites)
         -- )
      }
end

----- Angels Merge ----
if mods["angelspetrochem"] then

    data.raw.item["pellet-coke"].icon = "__angelspetrochem__/graphics/icons/pellet-coke.png"
	data.raw.item["pellet-coke"].fuel_acceleration_multiplier = 1.1
	data.raw.item["pellet-coke"].fuel_top_speed_multiplier = 1.025
	
	data.raw.recipe["pellet-coke"].category = "biofarm-mod-smelting"	
	thxbob.lib.tech.remove_recipe_unlock ("angels-coal-processing-2", "pellet-coke")
	thxbob.lib.tech.add_recipe_unlock("angels-coal-cracking", "pellet-coke")

end

---- Game Tweaks ----
if BI.Settings.BI_Recipe_Tweaks then

	---- Inrease Wood Stack Size
	if data.raw.item["raw-wood"] and data.raw.item["raw-wood"].stack_size < 400 then
		data.raw.item["raw-wood"].stack_size = 400
	end

	--- Stone Stack Size	
	if data.raw.item["stone"] and data.raw.item["stone"].stack_size < 400 then
		data.raw.item["stone"].stack_size = 400
	end	
	
	--- Crushed Stone Stack Size	
	if data.raw.item["stone-crushed"] and data.raw.item["stone-crushed"].stack_size < 600 then
		data.raw.item["stone-crushed"].stack_size = 600
	end		
	
	--- Concrete Stack Size	
	if data.raw.item["concrete"] and data.raw.item["concrete"].stack_size < 400 then
		data.raw.item["concrete"].stack_size = 400
	end		
	
	--- Slag Stack Size	
	if data.raw.item["slag"] and data.raw.item["slag"].stack_size < 800 then
		data.raw.item["slag"].stack_size = 800
	end		
		
end