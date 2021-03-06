local BioInd = require('common')('Bio_Industries')

BI.Settings.BI_Game_Tweaks_Emissions_Multiplier = settings.startup["BI_Game_Tweaks_Emissions_Multiplier"].value


-- 5dim Stack changes
if settings.startup["5d-change-stack"] and settings.startup["5d-change-stack"].value then
   if data.raw.item["wood"] then
      data.raw.item["wood"].stack_size = math.max(210, data.raw.item["wood"].stack_size)
   end
end


---- Game Tweaks ---- Recipes
if BI.Settings.BI_Game_Tweaks_Recipe then
  --- Concrete Recipe Tweak
  thxbob.lib.recipe.remove_ingredient("concrete", "iron-ore")
  thxbob.lib.recipe.add_new_ingredient("concrete", {type = "item", name = "iron-stick", amount = 2})

  --- Stone Wall
  thxbob.lib.recipe.add_new_ingredient("stone-wall", {type = "item", name = "iron-stick", amount = 1})

  --- Rail (Remove Stone and Add Crushed Stone)
  if data.raw.item["stone-crushed"] then
    thxbob.lib.recipe.remove_ingredient("rail", "stone")
    thxbob.lib.recipe.add_new_ingredient("rail", {type = "item", name = "stone-crushed", amount = 6})
    thxbob.lib.recipe.remove_ingredient("bi-rail-wood", "stone")
    thxbob.lib.recipe.add_new_ingredient("bi-rail-wood", {type = "item", name = "stone-crushed", amount = 6})
  end

  -- vanilla rail recipe update
  thxbob.lib.recipe.add_new_ingredient("rail", {type = "item", name = "concrete", amount = 6})
end

---- Game Tweaks ---- Tree
if BI.Settings.BI_Game_Tweaks_Tree then

  --- Trees Give Random 1 - 6 Wood.
  for _, tree in pairs(data.raw["tree"]) do
    --CHECK FOR SINGLE RESULTS
    if tree.minable and tree.minable.result then
      --CHECK FOR VANILLA TREES WOOD x 4
      if tree.minable.result == "wood" and tree.minable.count == 4 then
       tree.minable = {
         mining_particle = "wooden-particle",
         mining_time = 1.5,
         results = {{
           type = "item",
           name = "wood",
           amount_min = 1,
           amount_max = 6}}
      }
      end
    else
      --CHECK FOR RESULTS TABLE
      if tree.minable and tree.minable.results then
       for k, results in pairs(tree.minable.results) do
        --CHECK FOR RESULT WOOD x 4
        if results.name == "wood" and results.amount == 4 then
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
  local chr = data.raw.character.character

  --- Loot Picup
  if chr.loot_pickup_distance < 5 then
    chr.loot_pickup_distance = 5 -- default 2
  end

  if chr.build_distance < 20 then -- Vanilla 6
    chr.build_distance = 20
  end

  if chr.drop_item_distance < 20 then -- Vanilla 6
    chr.drop_item_distance = 20
  end

  if chr.reach_distance < 20 then -- Vanilla 6
    chr.reach_distance = 20
  end

  if chr.item_pickup_distance < 6 then -- Vanilla 1
    chr.item_pickup_distance = 6
  end

  if chr.reach_resource_distance <  6 then -- Vanilla 2.7
    chr.reach_resource_distance = 6
  end

  if chr.resource_reach_distance and chr.resource_reach_distance <  6 then -- Vanilla 2.7
    chr.resource_reach_distance = 6
  end
end


---- Game Tweaks ---- Disassemble Recipes
require("prototypes.Bio_Tweaks.recipe")
if BI.Settings.BI_Game_Tweaks_Disassemble then
  for tech, recipe in pairs({
    ["advanced-material-processing"] = "bi-steel-furnace-disassemble",
    ["automation-2"] = "bi-burner-mining-drill-disassemble",
    ["automation-2"] = "bi-stone-furnace-disassemble",
    ["automation-2"] = "bi-burner-inserter-disassemble",
  }) do
    thxbob.lib.tech.add_recipe_unlock(tech, recipe)
  end

  if data.raw.item["bi-burner-pump"] then
    thxbob.lib.tech.add_recipe_unlock("automation-2", "bi-basic-pumpjack-disassemble")
  end
end

---- Game Tweaks ---- Production science pack recipe
if data.raw.recipe["bi-production-science-pack"] then
  BI_Functions.lib.allow_productivity("bi-production-science-pack")
  thxbob.lib.tech.add_recipe_unlock("production-science-pack", "bi-production-science-pack")
  BioInd.writeDebug("Unlock for recipe \"bi-production-science-pack\" added.")
end

---- Game Tweaks ---- Bots
if BI.Settings.BI_Game_Tweaks_Bot then
  -- Logistic & Construction bots can't catch fire or be Mined
  local function immunify(bot)
  if not bot.flags then
    bot.flags = {}
  end
  if not bot.resistances then
    bot.resistances = {}
  end
  table.insert(bot.flags, "not-flammable")
  table.insert(bot.resistances, {type = "fire", percent = 100})
  bot.minable = nil
  end

  --catches modded bots too
  for _, bot in pairs(data.raw['construction-robot']) do
    immunify(bot)
  end

  for _, bot in pairs(data.raw['logistic-robot']) do
    immunify(bot)
  end
end


---- Game Tweaks ----
if BI.Settings.BI_Game_Tweaks_Stack_Size then
  ---- Increase Wood Stack Size
  if data.raw.item["wood"] and data.raw.item["wood"].stack_size < 400 then
    data.raw.item["wood"].stack_size = 400
  end

  --- Stone Stack Size
  if data.raw.item["stone"] and data.raw.item["stone"].stack_size < 400 then
    data.raw.item["stone"].stack_size = 400
  end

  --- Crushed Stone Stack Size
  if data.raw.item["stone-crushed"] and data.raw.item["stone-crushed"].stack_size < 800 then
    data.raw.item["stone-crushed"].stack_size = 800
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


--- Update fuel_emissions_multiplier values
if BI.Settings.BI_Game_Tweaks_Emissions_Multiplier then
  for item, factor in pairs({
    ["pellet-coke"] = 0.80,
    ["enriched-fuel"] = 0.90,
    ["solid-fuel"] = 1.00,
    ["solid-carbon"] = 1.05,
    ["carbon"] = 1.05,
    ["wood-bricks"] = 1.20,
    ["rocket-fuel"] = 1.20,
    ["bi-seed"] = 1.30,
    ["seedling"] = 1.30,
    ["bi-wooden-pole-big"] = 1.30,
    ["bi-wooden-pole-huge"] = 1.30,
    ["bi-wooden-fence"] = 1.30,
    ["bi-wood-pipe"] = 1.30,
    ["bi-wood-pipe-to-ground"] = 1.30,
    ["bi-wooden-chest-large"] = 1.30,
    ["bi-wooden-chest-huge"] = 1.30,
    ["bi-wooden-chest-giga"] = 1.30,
    ["bi-ash"] = 1.30,
    ["ash"] = 1.30,
    ["wood-charcoal"] = 1.25,
    ["cellulose-fiber"] = 1.40,
    ["bi-woodpulp"] = 1.40,
    ["solid-coke"] = 1.40,
    ["wood-pellets"] = 1.40,
    ["coal-crushed"] = 1.50,
    ["wood"] = 1.60,
    ["coal"] = 2.00,
    -- Removed in 0.17.48/0.18.16
    --~ ["thorium-fuel-cell"] = 5.00,
  }) do
    BI_Functions.lib.fuel_emissions_multiplier_update(item, factor)
  end
end




-- Make vanilla and Bio boilers exchangeable
if BI.Settings.BI_Bio_Fuel then
  local boiler = data.raw["boiler"]["boiler"]
  local boiler_group = boiler.fast_replaceable_group or "boiler"

  boiler.fast_replaceable_group = boiler_group
  data.raw["boiler"]["bi-bio-boiler"].fast_replaceable_group = boiler_group
end


if mods["Krastorio2"] then
  -- Krastorio² needs much more wood than usually provided by Bio Industries. If Krastorio² is
  -- active, BI should produce much more wood/wood pulp. For better baĺancing, our recipes should
  -- also be changed to require more wood/wood pulp as ingredients.
  -- Recipes for making wood should also use/produce more seeds, seedlings, and water. It shouldn't
  -- be necessary to increase the input of ash and fertilizer in these recipes as they already
  -- require more wood/wood pulp.
  local update = {
    "wood", "bi-woodpulp",
    "bi-seed", "seedling", "water",
  }
  for _, recipe in pairs(data.raw.recipe) do
    BioInd.writeDebug("Recipe has \"mod\" property: " .. tostring(recipe.mod and true or false))
    if recipe.mod == "Bio_Industries" then
      krastorio.recipes.multiplyIngredients(recipe.name, update, 4)
      krastorio.recipes.multiplyProducts(recipe.name, update, 4)
      BioInd.writeDebug("Changed ingredients for " .. tostring(recipe.name) .. ": " .. serpent.block(recipe.ingredients))
      BioInd.writeDebug("Changed results for " .. tostring(recipe.name) .. ": " .. serpent.block(recipe.results))
    end
  end


  --~ -- Remove recipes for liquid air and nitrogen
  --~ thxbob.lib.tech.remove_recipe_unlock("bi-tech-fertiliser", "bi-liquid-air")
  --~ thxbob.lib.tech.remove_recipe_unlock("bi-tech-fertiliser", "bi-nitrogen")
  --~ data.raw.recipe["bi-liquid-air"].hidden = true
  --~ data.raw.recipe["bi-nitrogen"].hidden = true

  --~ -- Replace liquid air with oxygen in Algae Biomass 2 and 3
  --~ thxbob.lib.recipe.replace_ingredient("bi-biomass-2", "liquid-air", "oxygen")
  --~ thxbob.lib.recipe.replace_ingredient("bi-biomass-3", "liquid-air", "oxygen")
end



if mods["Krastorio"] then
  --~ -- Remove recipes for liquid air and nitrogen
  --~ thxbob.lib.tech.remove_recipe_unlock("bi-tech-fertiliser", "bi-liquid-air")
  --~ thxbob.lib.tech.remove_recipe_unlock("bi-tech-fertiliser", "bi-nitrogen")
  --~ data.raw.recipe["bi-liquid-air"].hidden = true
  --~ data.raw.recipe["bi-nitrogen"].hidden = true

  -- Replace liquid air with oxygen in Algae Biomass 2 and 3
  --~ thxbob.lib.recipe.replace_ingredient("bi-biomass-2", "liquid-air", "oxygen")
  --~ thxbob.lib.recipe.replace_ingredient("bi-biomass-3", "liquid-air", "oxygen")
end


if mods["angelspetrochem"] then
  --~ -- "Angel's Petro Chemical Processing" replaces petroleum-gas with gas-methane.
  --~ -- That doesn't make sense for our recipe, so we revert this change -- the
  --~ -- petroleum gas can still be converted to methane-gas with the converter-valve.
  --~ thxbob.lib.recipe.remove_result("bi-basic-gas-processing", "gas-methane")
  --~ thxbob.lib.recipe.add_result("bi-basic-gas-processing", {
      --~ amount = 15,
      --~ name = "petroleum-gas",
      --~ type = "fluid"
  --~ })

  -- Liquid air and nitrogen aren't needed -- remove unlock recipes!
  --~ thxbob.lib.tech.remove_recipe_unlock("bi-tech-fertiliser", "bi-liquid-air")
  --~ thxbob.lib.tech.remove_recipe_unlock("bi-tech-fertiliser", "bi-nitrogen")
  --~ data.raw.recipe["bi-liquid-air"] = nil
  --~ data.raw.recipe["bi-nitrogen"] = nil
end

-- "Alien Biomes" overwrites tiles in item definitions even if these tiles have been
-- disabled via start-up settings. (This has been fixed in "Alien Biomes" 0.5.2 for
-- Factorio 0.18, but let's keep it the code for easier maintainability as long as
--  Factorio 0.17.79 is stable!)
local AlienBiomes = data.raw.tile["vegetation-green-grass-3"] and
                    data.raw.tile["vegetation-green-grass-1"] and true or false

if not AlienBiomes then
  data.raw.item["fertiliser"].place_as_tile.result = "grass-3"
  data.raw.item["bi-adv-fertiliser"].place_as_tile.result = "grass-1"
end

if mods["pycoalprocessing"] and BI.Settings.BI_Bio_Fuel then
    -- Bio_Fuel/recipe.lua:30:      {type = "item", name = "bi-ash", amount = 15}
    thxbob.lib.recipe.remove_result ("bi-basic-gas-processing", "bi-ash")
    thxbob.lib.recipe.add_result("bi-basic-gas-processing", {
      type = "item",
      name = "ash",
      amount = 15
    })
end


-- "Transport drones" ruins rails by removing object-layer from the collision mask. That
-- causes problems for our "Wooden rail bridges" as they will also pass through cliffs.
-- Fix the collision masks for rail bridges if "Transport drones" is active!

--~  common.RAIL_BRIDGE_MASK = {"floor-layer", "object-layer", "consider-tile-transitions"}
--~  common.RAIL_MASK = {"item-layer", "floor-layer", "object-layer", "water-tile", "consider-tile-transitions"}
if mods["Transport_Drones"] then
  for _, type in pairs({"straight-rail", "curved-rail"}) do
        data.raw[type]["bi-" .. type .. "-wood-bridge"].collision_mask = BioInd.RAIL_BRIDGE_MASK
  end
end



---TESTING!
--~ for k,v in pairs(data.raw["curved-rail"]) do
--~ log(v.name .. " collision_mask: " .. serpent.line(v.collision_mask))
--~ end
--~ for k,v in pairs(data.raw["straight-rail"]) do
--~ log(v.name .. " collision_mask: " .. serpent.line(v.collision_mask))
--~ end
