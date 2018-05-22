


-- 5dim Stack changes
if settings.startup["5d-change-stack"] and settings.startup["5d-change-stack"].value then
   if data.raw.item["raw-wood"] then
      data.raw.item["raw-wood"].stack_size = math.max(210, data.raw.item['raw-wood'].stack_size)
   end
end


	---- Bio Drill Enable!
if settings.startup["BI_Bio_Infinite_Fluids"] and settings.startup["BI_Bio_Infinite_Fluids"].value == true then
	
	-- New Fluid Ores
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
	--- Make it so that the normal off-shore pump needs a battery
	thxbob.lib.recipe.add_new_ingredient("offshore-pump", {type="item", name="battery", amount=4})

		
	infinite_fluids = require("prototypes.Bio_Drill.supported-resources")	
	--- Mk1 Recipies
	for _, resource in pairs(infinite_fluids) do
		local r1_name = "bi_recipe_mk1_" .. resource.fluid
		if mods[resource.dependency] then
			thxbob.lib.tech.add_recipe_unlock("bi-tech-bio-prospecting-1", r1_name)
		end
	end
	--- Mk2 Recipies
	for _, resource in pairs(infinite_fluids) do
		local r2_name = "bi_recipe_mk2_" .. resource.fluid
		if mods[resource.dependency] then
			thxbob.lib.tech.add_recipe_unlock("bi-tech-bio-prospecting-2", r2_name)
		end
	end
	--- Mk3 Recipies
	for _, resource in pairs(infinite_fluids) do
		local r3_name = "bi_recipe_mk3_" .. resource.fluid
		if mods[resource.dependency] then
			thxbob.lib.tech.add_recipe_unlock("bi-tech-bio-prospecting-3", r3_name)
		end 
	end

	--[[
	-- Support for Bob's Pure Water
	if settings.startup["bobmods-plates-purewater"] and settings.startup["bobmods-plates-purewater"].value == true and data.raw.fluid["pure-water"] then

		require("prototypes.Bio_Drill.bob-over-rides")	
			
	end
	]]
	
	if mods["angelsrefining"] then
		require("prototypes.Bio_Drill.angel-over-rides")
	end
	
	if settings.startup["BI_Bio_Alter_Water_Appearance"] and settings.startup["BI_Bio_Alter_Water_Appearance"].value == true then
	
	-- update the look of Saline Water
	data.raw.fluid["water-saline"].base_color = {r = 0.3, g = 0.4, b = 0.9}
	data.raw.fluid["water-saline"].flow_color = {r = 0.3, g = 0.4, b = 0.9}


		--- Update water tiles
		data.raw.tile["deepwater"].variants =
		{
		  main =
		  {
			{
			  picture = "__Bio_Industries__/graphics/terrain/deepwater/deepwater1.png",
			  count = 8,
			  size = 1,
			  hr_version = {
				picture = "__Bio_Industries__/graphics/terrain/deepwater/hr-deepwater1.png",
				count = 8,
				scale = 0.5,
				size = 1
			  }
			},
			{
			  picture = "__Bio_Industries__/graphics/terrain/deepwater/deepwater2.png",
			  count = 8,
			  size = 2,
			  hr_version = {
				picture = "__Bio_Industries__/graphics/terrain/deepwater/hr-deepwater2.png",
				count = 8,
				scale = 0.5,
				size = 2
			  }
			},
			{
			  picture = "__Bio_Industries__/graphics/terrain/deepwater/deepwater4.png",
			  count = 6,
			  size = 4,
			  hr_version = {
				picture = "__Bio_Industries__/graphics/terrain/deepwater/hr-deepwater4.png",
				count = 8,
				scale = 0.5,
				size = 4
			  }
			}
		  },
		  inner_corner =
		  {
			picture = "__Bio_Industries__/graphics/terrain/deepwater/deepwater-inner-corner.png",
			count = 6,
			hr_version = {
			  picture = "__Bio_Industries__/graphics/terrain/deepwater/hr-deepwater-inner-corner.png",
			  count = 6,
			  scale = 0.5
			}
		  },
		  outer_corner =
		  {
			picture = "__Bio_Industries__/graphics/terrain/deepwater/deepwater-outer-corner.png",
			count = 6,
			hr_version = {
			  picture = "__Bio_Industries__/graphics/terrain/deepwater/hr-deepwater-outer-corner.png",
			  count = 6,
			  scale = 0.5
			}
		  },
		  side =
		  {
			picture = "__Bio_Industries__/graphics/terrain/deepwater/deepwater-side.png",
			count = 8,
			hr_version = {
			  picture = "__Bio_Industries__/graphics/terrain/deepwater/hr-deepwater-side.png",
			  count = 8,
			  scale = 0.5
			}
		  }
		}
		
		
		data.raw.tile["water"].variants =
		{
		  main =
		  {
			{
			  picture = "__Bio_Industries__/graphics/terrain/water/water1.png",
			  count = 8,
			  size = 1,
			  hr_version =
			  {
				picture = "__Bio_Industries__/graphics/terrain/water/hr-water1.png",
				count = 8,
				scale = 0.5,
				size = 1
			  },
			},
			{
			  picture = "__Bio_Industries__/graphics/terrain/water/water2.png",
			  count = 8,
			  size = 2,
			  hr_version =
			  {
				picture = "__Bio_Industries__/graphics/terrain/water/hr-water2.png",
				count = 8,
				scale = 0.5,
				size = 2
			  },
			},
			{
			  picture = "__Bio_Industries__/graphics/terrain/water/water4.png",
			  count = 6,
			  size = 4,
			  hr_version =
			  {
				picture = "__Bio_Industries__/graphics/terrain/water/hr-water4.png",
				count = 8,
				scale = 0.5,
				size = 4
			  },
			}
		  },
		  inner_corner =
		  {
			picture = "__Bio_Industries__/graphics/terrain/water/water-inner-corner.png",
			count = 0
		  },
		  outer_corner =
		  {
			picture = "__Bio_Industries__/graphics/terrain/water/water-outer-corner.png",
			count = 0
		  },
		  side =
		  {
			picture = "__Bio_Industries__/graphics/terrain/water/water-side.png",
			count = 0
		  }
		}
	end
end



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