
BI.Settings.Bio_Cannon = settings.startup["BI_Bio_Cannon"].value
BI.Settings.BI_Bio_Fuel = settings.startup["BI_Bio_Fuel"].value
BI.Settings.BI_Game_Tweaks_Stack_Size = settings.startup["BI_Game_Tweaks_Stack_Size"].value
BI.Settings.BI_Game_Tweaks_Recipe = settings.startup["BI_Game_Tweaks_Recipe"].value
BI.Settings.BI_Game_Tweaks_Tree = settings.startup["BI_Game_Tweaks_Tree"].value
BI.Settings.BI_Game_Tweaks_Player = settings.startup["BI_Game_Tweaks_Player"].value
BI.Settings.BI_Game_Tweaks_Disassemble = settings.startup["BI_Game_Tweaks_Disassemble"].value
BI.Settings.BI_Game_Tweaks_Bot = settings.startup["BI_Game_Tweaks_Bot"].value
BI.Settings.BI_Solar_Additions = settings.startup["BI_Solar_Additions"].value


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




---- Game Tweaks ---- Recipes
if BI.Settings.BI_Game_Tweaks_Recipe then
	--- Concrete Recipe Tweak
	thxbob.lib.recipe.remove_ingredient ("concrete", "iron-ore")
	thxbob.lib.recipe.add_new_ingredient ("concrete", {type="item", name="iron-stick", amount=2})
	--- Stone Wall
	thxbob.lib.recipe.add_new_ingredient ("stone-wall", {type="item", name="iron-stick", amount=1})

	-- Make Steel Axe use Iron Axe as an upgrade
	thxbob.lib.recipe.remove_ingredient ("steel-axe", "iron-stick")
	thxbob.lib.recipe.add_new_ingredient ("steel-axe", {type="item", name="iron-axe", amount=1})
	
	--- Rail (Remove Stone and Add Crushed Stone)
	if data.raw.item["stone-crushed"] then
		thxbob.lib.recipe.remove_ingredient ("rail", "stone")
		thxbob.lib.recipe.add_new_ingredient ("rail", {type="item", name="stone-crushed", amount=6})
		thxbob.lib.recipe.remove_ingredient ("bi_recipe_rail_wood", "stone")
		thxbob.lib.recipe.add_new_ingredient ("bi_recipe_rail_wood", {type="item", name="stone-crushed", amount=6})
	end
	
end

---- Game Tweaks ---- Tree
if BI.Settings.BI_Game_Tweaks_Tree then
	
		--- Trees Give Random 1 - 6 Raw Wood.
	for _, tree in pairs(data.raw["tree"]) do
   --CHECK FOR SINGLE RESULTS
		if tree.minable and tree.minable.result then
		  --CHECK FOR VANILLA TREES RAW WOOD x 4
		  if tree.minable.result == "raw-wood" and tree.minable.count == 4 then
			 tree.minable = {mining_particle = "wooden-particle", mining_time = 1.5, results = {{type = "item", name = "raw-wood", amount_min = 1, amount_max = 6}}}
		  end
		else
		  --CHECK FOR RESULTS TABLE
		  if tree.minable and tree.minable.results then
			 for k, results in pairs(tree.minable.results) do
				--CHECK FOR RESULT RAW-WOOD x 4
				if results.name == "raw-wood" and results.amount == 4 then
				   results.amount = nil
				   results.amount_min = 1
				   results.amount_max = 6
				end
			 end      
		  end
		end
	end
end	

---- Game Tweaks ---- Player
if BI.Settings.BI_Game_Tweaks_Player then	
	
	--- Loot Picup	
	if data.raw.player.player.loot_pickup_distance < 5 then
		data.raw.player.player.loot_pickup_distance = 5 -- default 2
	end	

	--- Run Speed
	if data.raw.player.player.running_speed < 0.15 then
		data.raw.player.player.running_speed = 0.25 -- default 0.15
	end	

	if data.raw.player.player.build_distance < 20 then -- Vanilla 6
		data.raw.player.player.build_distance = 20
	end
	if data.raw.player.player.drop_item_distance < 20 then -- Vanilla 6
		data.raw.player.player.drop_item_distance = 20
	end
	if data.raw.player.player.reach_distance < 20 then -- Vanilla 6
		data.raw.player.player.reach_distance = 20
	end
	if data.raw.player.player.item_pickup_distance < 4 then -- Vanilla 1
		data.raw.player.player.item_pickup_distance = 4
	end
	if data.raw.player.player.reach_resource_distance <  4 then -- Vanilla 2.7
		data.raw.player.player.reach_resource_distance = 4
	end


end	
	
---- Game Tweaks ---- Disassemble Recipes
if BI.Settings.BI_Game_Tweaks_Disassemble then		

	require("prototypes.Bio_Tweaks.recipe")
	thxbob.lib.tech.add_recipe_unlock("advanced-material-processing", "bi_recipe_steel_furnace_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_recipe_burner_mining_drill_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_recipe_stone_furnace_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_recipe_burner_inserter_disassemble")
	thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_recipe_long_handed_inserter_disassemble")
	
	if data.raw.item["bi-burner-pump"] then
		thxbob.lib.tech.add_recipe_unlock("automation-2", "bi_recipe_basic_pumpjack_disassemble")
	end

end

---- Game Tweaks ---- Bots
if BI.Settings.BI_Game_Tweaks_Bot then	

-- Logistic & Construction bots can't catch fire or be Mined
	local function immunify(bot)
	  if not bot.flags then bot.flags = {} end
	  if not bot.resistances then bot.resistances = {} end
	  table.insert(bot.flags,"not-flammable")
	  table.insert(bot.resistances, {type = "fire", percent = 100})
	  bot.minable = nil
	  end

	--catches modded bots too
	for _,bot in pairs(data.raw['construction-robot']) do
		immunify(bot)
	end

	for _,bot in pairs(data.raw['logistic-robot']) do
		immunify(bot)
	end
	
	
end

---- Game Tweaks ----
if BI.Settings.BI_Game_Tweaks_Stack_Size then

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

