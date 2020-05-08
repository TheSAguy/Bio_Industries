local BioInd = require('common')('Bio_Industries')

local Event = require('__stdlib__/stdlib/event/event').set_protected_mode(true)
require ("util")
require ("libs/util_ext")
require ("control_tree")
require ("control_bio_cannon")
require ("control_arboretum")


---************** Used for Testing -----
--require ("Test_Spawn")
---*************

-- 0.17.42/0.18.09 fixed a bug where musk floor was created for the force "enemy".
-- Because it didn't belong to any player, in map view the electric grid overlay wasn't
-- shown for musk floor. Somebody complained about seeing it now, so starting with version
-- 0.17.45/0.18.13, there is a setting to hide the overlay again. If it is set to "true",
-- a new force will be created that the hidden electric poles of musk floor belong to.
local MuskForceName = "BI-Musk_floor_general_owner"
local UseMuskForce = settings.startup["BI_Hide_musk_floor_in_mapview"].value

local function Create_dummy_force()
  -- Create dummy force for musk floor if electric grid overlay should NOT be shown in map view
    local f = game.create_force(MuskForceName)
    -- Set new force as neutral to every other force
    for name, force in pairs(game.forces) do
      if name ~= MuskForceName then
        f.set_friend(force, false)
        f.set_cease_fire(force, true)
      end
    end
    -- New force won't share chart data with any other force
    f.share_chart = false

    BioInd.writeDebug("Created force: " .. serpent.block(game.forces[MuskForceName].name))
end

--------------------------------------------------------------------
local function On_Init()
  --~ game.check_prototype_translations()
  if global.Bio_Cannon_Table ~= nil then
    Event.register(defines.events.on_tick, function(event) end)
  end

  if global.bi == nil then
    global.bi = {}
    global.bi.tree_growing = {}
    global.bi.tree_growing_stage_1 = {}
    global.bi.tree_growing_stage_2 = {}
    global.bi.tree_growing_stage_3 = {}
    global.bi.tree_growing_stage_4 = {}
    global.bi.terrains = {}
    global.bi.trees = {}
  end

  global.bi.seed_bomb = {}
  global.bi.seed_bomb["seedling"] = "seedling"
  global.bi.seed_bomb["seedling-2"] = "seedling-2"
  global.bi.seed_bomb["seedling-3"] = "seedling-3"

  -- Global table for bio farm
  if global.bi_bio_farm_table == nil then
    global.bi_bio_farm_table = {}
  end

  -- Global table for solar boiler
  if global.bi_solar_boiler_table == nil then
    global.bi_solar_boiler_table = {}
  end

  -- Global table for solar farm
  if global.bi_solar_farm_table == nil then
    global.bi_solar_farm_table = {}
  end

  -- Global table for power rail
  if global.bi_power_rail_table == nil then
    global.bi_power_rail_table = {}
  end

  -- Global table for arboretum
  if global.Arboretum_Table == nil then
    global.Arboretum_Table = {}
  end

  -- enable researched recipes
  for i, force in pairs(game.forces) do
    force.reset_technologies()
    force.reset_recipes()
  end

  -- Create dummy force for musk floor if electric grid overlay should NOT be shown in map view
  if UseMuskForce and not game.forces[MuskForceName] then
    --~ BioInd.writeDebug("Force for musk floor is required but doesn't exist.")
    Create_dummy_force()
  end


  --[[
  if QC_Mod then
    ---*************
    --local surface = game.surfaces['nauvis']
    Test_Spawn()
    ---*************
  end
  ]]
end

--------------------------------------------------------------------
local function On_Load()
  if global.Bio_Cannon_Table ~= nil then
    Event.register(defines.events.on_tick, function(event) end)
  end
end


--------------------------------------------------------------------
local function On_Config_Change(ConfigurationChangedData)
--~ BioInd.writeDebug("On Configuration changed: " .. serpent.block(ConfigurationChangedData))
  if global.Bio_Cannon_Table ~= nil then
    Event.register(defines.events.on_tick, function(event) end)
  end

  if global.bi == nil then
    global.bi = {}
    global.bi.tree_growing = {}
    global.bi.tree_growing_stage_1 = {}
    global.bi.tree_growing_stage_2 = {}
    global.bi.tree_growing_stage_3 = {}
    global.bi.tree_growing_stage_4 = {}
    global.bi.terrains = {}
    global.bi.trees = {}
  end

  global.bi.seed_bomb = {}
  global.bi.seed_bomb["seedling"] = "seedling"
  global.bi.seed_bomb["seedling-2"] = "seedling-2"
  global.bi.seed_bomb["seedling-3"] = "seedling-3"

  -- Global table for bio farm
  if global.bi_bio_farm_table == nil then
    global.bi_bio_farm_table = {}
  end

  -- Global table for solar boiler
  if global.bi_solar_boiler_table == nil then
    global.bi_solar_boiler_table = {}
  end

  -- Global table for solar farm
  if global.bi_solar_farm_table == nil then
    global.bi_solar_farm_table = {}
  end

  -- Global table for power rail
  if global.bi_power_rail_table == nil then
    global.bi_power_rail_table = {}
  end

  -- Global table for arboretum
  if global.Arboretum_Table == nil then
    global.Arboretum_Table = {}
  end

  -- enable researched recipes
  for i, force in pairs(game.forces) do
    for _, tech in pairs(force.technologies) do
      if tech.researched then
        for _, effect in pairs(tech.effects) do
          if effect.type == "unlock-recipe" then
            force.recipes[effect.recipe].enabled = true
          end
        end
      end
    end
  end

  -- Has setting BI_Hide_musk_floor_in_mapview changed?
  if ConfigurationChangedData.mod_startup_settings_changed then
    -- Create dummy force if necessary
    if UseMuskForce and not game.forces[MuskForceName] then
      Create_dummy_force()
    end

  -- Look for solar panels on every surface. They determine the force poles will use
  -- if the electric grid overlay will be shown in mapview.
    local sm_panel_name = "bi-musk-mat-solar-panel"
    local sm_pole_name = "bi-musk-mat-pole"

    -- If dummy force is not used, force of a hidden pole should be that of the hidden solar panel.
    -- That force will be "enemy" for poles/solar panels created with versions of Bio Industries
    -- prior to 0.17.45/0.18.13 because of the bug. We can fix that for singleplayer games by setting
    -- the force to player force. In multiplayer games, we can do this as well if all players are
    -- on the same force. If there are several forces that have players, it's impossible to find out
    -- which force built a certain musk floor tile, so "enemy" will still be used.
    -- (Only fix in this case: Players must remove and rebuild all existing musk floor tiles!)
    --~ local single_player_force = game.is_multiplayer() and nil or game.players[1].force.name
    local force = nil

    -- Always use dummy force if option is set
    if UseMuskForce then
      force = MuskForceName
    -- Singleplayer mode: use force of first player
    elseif not game.is_multiplayer() then
      force = game.players[1].force.name
    -- Multiplayer game
    else
      local count = 0
      -- Count forces with players
      for _, check_force in pairs(game.forces) do
        if check_force.players ~= {} then
          force = check_force.name
          count = count + 1
        end
      end
      -- Several forces with players: reset force to nil now and use force of panel later
      -- (If this happens in a game were musk floor was created the buggy way with "force == nil",
      --  it will be impossible to determine which force built it, so the force will still be
      --  the default, i.e. "enemy".)
      if count > 1 then
        --~ force = panel.force
        force = nil
      end
    end

    for name, surface in pairs(game.surfaces) do
      BioInd.writeDebug("Looking for " .. sm_panel_name .. " on surface " .. name)
      local sm_panel = surface.find_entities_filtered{name = sm_panel_name}
      local sm_pole = {}

      -- Look for hidden poles on position of hidden panels
      for p, panel in ipairs(sm_panel) do
        sm_pole = surface.find_entities_filtered{
          name = sm_pole_name,
          position = panel.position,
          --~ limit = 1
        }
        -- If more than one hidden pole exists at that position for some reason, remove all but the first!
        if #sm_pole > 1 then
BioInd.writeDebug("Number of poles for panel " .. tostring(p) .. ": " .. tostring(#sm_pole))
          for i = 2, #sm_pole do
BioInd.writeDebug("Destroying pole number " .. tostring(i))
            sm_pole[i].destroy()
          end
        end

        -- Set force of the pole
        sm_pole[1].force = force or panel.force
        --~ sm_pole[1].force = force
--~ log("Force for panel " .. tostring(p) .. ": " .. tostring(force and force.valid and force.name or force))
      end
    end
    --~ if UseMuskForce then
      BioInd.writeDebug("Electric grid overlay of musk floor will be " ..
                        tostring(UseMuskForce and "hidden" or "displayed") .. " in map view.")
    --~ else
      --~ BioInd.writeDebug("Electric grid overlay of musk floor will be displayed in map view.")
    --~ end
  end
end

--------------------------------------------------------------------
--- Used for some compatibility with Angels Mods
Event.register(defines.events.on_player_joined_game, function(event)
   local player = game.players[event.player_index]
   local force = player.force
   local techs = force.technologies

  if settings.startup["angels-use-angels-barreling"] and
     settings.startup["angels-use-angels-barreling"].value then
      techs['fluid-handling'].researched = false
      techs['bi-tech-fertiliser'].reload()
      local _t = techs['angels-fluid-barreling'].researched
      techs['angels-fluid-barreling'].researched = false
      techs['angels-fluid-barreling'].researched = _t
   end
end)

---------------------------------------------
Event.register(defines.events.on_trigger_created_entity, function(event)
  --- Used for Seed-bomb
  local ent = event.entity
  local surface = ent.surface
  local position = ent.position

  local AlienBiomes = BioInd.AB_tiles()

  -- Basic
  if global.bi.seed_bomb[ent.name] == "seedling" then
    BioInd.writeDebug("Seed Bomb Activated - Basic")
    seed_planted_trigger(event)

  -- Standard
  elseif global.bi.seed_bomb[ent.name] == "seedling-2" then
    BioInd.writeDebug("Seed Bomb Activated - Standard")
    local terrain_name_s
    --~ if game.active_mods["alien-biomes"] then
    if AlienBiomes then
      terrain_name_s = "vegetation-green-grass-3"
    else
      terrain_name_s = "grass-3"
    end
    surface.set_tiles{{name = terrain_name_s, position = position}}
    seed_planted_trigger(event)

  -- Advanced
  elseif global.bi.seed_bomb[ent.name] == "seedling-3" then
    BioInd.writeDebug("Seed Bomb Activated - Advanced")
    local terrain_name_a
    --~ if game.active_mods["alien-biomes"] then
    if AlienBiomes then
      terrain_name_a = "vegetation-green-grass-1"
    else
      terrain_name_a = "grass-1"
    end
    surface.set_tiles{{name = terrain_name_a, position = position}}
    seed_planted_trigger(event)
  end
end)

--------------------------------------------------------------------
local function On_Built(event)
  local entity = event.created_entity or event.entity
  local surface = entity.surface
  local force = entity.force
  local position = entity.position

  --- Seedling planted
  if entity.valid and entity.name == "seedling" then
    seed_planted (event)
  end

    --- Bio Farm has been built
  if entity.valid and entity.name == "bi-bio-farm" then
    BioInd.writeDebug("Bio Farm has been built")
    local b_farm = entity
    local pole_name = "bi-bio-farm-electric-pole"
    local panel_name = "bi-bio-farm-solar-panel"
    local lamp_name = "bi-bio-farm-light"

    -- Hidden Power Pole
    local create_pole = surface.create_entity({
      name = pole_name,
      position = position,
      force = force
    })

    -- Hidden Solar Paner
    local create_panel = surface.create_entity({
      name = panel_name,
      position = position,
      force = force
    })

    -- Hidden Lamp
    local create_lamp = surface.create_entity({
      name = lamp_name,
      position = position,
      force = force
    })

    create_pole.minable = false
    create_pole.destructible = false
    create_panel.minable = false
    create_panel.destructible = false
    create_lamp.minable = false
    create_lamp.destructible = false

    -- Group Multiple Entities Together
    global.bi_bio_farm_table[b_farm.unit_number] = {
      base = b_farm,
      pole = create_pole,
      panel = create_panel,
      lamp = create_lamp
    }
  end

  --- Bio Solar Boiler / Solar Plant has been built
  if entity.valid and entity.name == "bi-solar-boiler" then
    BioInd.writeDebug("Bio Solar Boiler has been built")
    local solar_plant = entity
    --local boiler_solar = "bi-solar-boiler-2"
    --local boiler_solar = "bi-solar-boiler"
    local boiler_solar = "bi-solar-boiler-panel"
    local sm_pole_name = "bi-hidden-power-pole"

    -- Hidden Solar Panel
    local create_solar_boiler = surface.create_entity({
      name = boiler_solar,
      position = position,
      force = force
    })

    -- Hidden Power Pole
    local create_sm_pole = surface.create_entity({
      name = sm_pole_name,
      position = position,
      force = force
    })

    create_solar_boiler.minable = false
    create_solar_boiler.destructible = false
    create_sm_pole.minable = false
    create_sm_pole.destructible = false

    -- Group Multiple Entities Together
    global.bi_solar_boiler_table[solar_plant.unit_number] = {
      base = solar_plant,
      boiler = create_solar_boiler,
      pole = create_sm_pole
    }
  end

    --- Solar Farm has been built
  if entity.valid and entity.name == "bi-bio-solar-farm" then
    BioInd.writeDebug("Bio Solar Farm has been built")
    local solar_farm = entity
    local sm_pole_name = "bi-hidden-power-pole"

    -- Hidden Power Pole
    local create_sm_pole = surface.create_entity({
      name = sm_pole_name,
      position = position,
      force = force
    })
    create_sm_pole.minable = false
    create_sm_pole.destructible = false

    -- Group Multiple Entities Together
    global.bi_solar_farm_table[solar_farm.unit_number] = {
      base = solar_farm,
      pole = create_sm_pole
    }
  end

  --- Bio Cannon has been built
  if entity.valid and entity.name == "bi-bio-cannon-area" then
    local New_Bio_Cannon
    local New_Bio_CannonR

    BioInd.writeDebug("Bio Cannon has been built")

    -- Hidden Radar
    New_Bio_CannonR = surface.create_entity({
      name = "Bio-Cannon-r",
      position = position,
      direction = event.created_entity.direction,
      force = force
    })

    -- New Cannon, the first was just used for Radius overlay
    New_Bio_Cannon = surface.create_entity({
      name = "bi-bio-cannon",
      position = position,
      direction = event.created_entity.direction,
      force = force
    })
    --~ -- Hidden Radar
    --~ New_Bio_CannonR = surface.create_entity({name = "Bio_Cannon_r", position = position, direction = event.created_entity.direction, force = force})
    New_Bio_Cannon.health = event.created_entity.health

    New_Bio_CannonR.operable = false
    New_Bio_CannonR.destructible = false
    New_Bio_CannonR.minable = false

    if global.Bio_Cannon_Table == nil then
      global.Bio_Cannon_Table = {}
      Event.register(defines.events.on_tick, function(event) end)
    end

    -- Group Multiple Entities Together
    table.insert(global.Bio_Cannon_Table, {New_Bio_Cannon, New_Bio_CannonR, 0})

    -- Remove the "Overlay" Entity
    event.created_entity.destroy()
  end

  --- Arboretum has been built
  if entity.valid and entity.name == "bi-arboretum-area" then
    BioInd.writeDebug("Arboretum has been built")
    local arboretum_new = "bi-arboretum"
    local radar_name = "bi-arboretum-radar"
    local pole_name = "bi-hidden-power-pole"
    local lamp_name = "bi-bio-farm-light"

    -- New Arboretum, the first was just used for Radius overlay
    local create_arboretum = surface.create_entity({
      name = arboretum_new,
      position = position,
      direction = entity.direction,
      force = force
    })
    local position_c = {position.x - 3.5, position.y + 3.5}

    -- Radar
    local create_radar = surface.create_entity({
      name = radar_name,
      position = position_c,
      direction = entity.direction,
      force = force
    })

    -- Hidden pole
    local create_pole = surface.create_entity({
      name = pole_name,
      position = position,
      direction = entity.direction,
      force = force
    })

    -- Hidden Lamp
    local create_lamp = surface.create_entity({
      name = lamp_name,
      position = position,
      force = force
    })

    create_radar.minable = false
    create_radar.destructible = false
    create_pole.minable = false
    create_pole.destructible = false
    create_lamp.minable = false
    create_lamp.destructible = false

    -- Group Multiple Entities Together
    global.Arboretum_Table[create_arboretum.unit_number] = {
      inventory = create_arboretum,
      radar = create_radar,
      pole = create_pole,
      lamp = create_lamp
    }

    BioInd.writeDebug("built: entity unit_number: " .. tostring(create_arboretum.unit_number))
    BioInd.writeDebug("built: global.Arboretum_Table: " .. serpent.block(global.Arboretum_Table[create_arboretum.unit_number]))

    -- Remove the "Overlay" Entity
    event.created_entity.destroy()
  end

  -- Power Rail
  if (entity.valid and entity.name == "bi-straight-rail-power") or
     (entity.valid and entity.name == "bi-curved-rail-power") then
    BioInd.writeDebug("Power Rail has been built")
    local rail_track = entity
    local pole_name = "bi-rail-hidden-power-pole"

    -- Create Hidden Power Pole
    local create_rail_pole = surface.create_entity({
      name = pole_name,
      position = position,
      force = force
    })

    create_rail_pole.minable = false
    create_rail_pole.destructible = false

    -- Group Multiple Entities Together Together
    global.bi_power_rail_table[rail_track.unit_number] = {base = rail_track, pole = create_rail_pole}

    if global.bi_power_rail_table[rail_track.unit_number].pole.valid then
      local radius = 5
      local area = {{position.x - radius, position.y - radius}, {position.x + radius, position.y + radius}}
      local power_rail_poles = {}
      power_rail_poles = surface.find_entities_filtered{
        area = area,
        name = "bi-rail-hidden-power-pole",
        force = force
      }

      if power_rail_poles ~= nil and  #power_rail_poles >= 1 then
        for i = 1, #power_rail_poles do
          for _, neighbour in pairs(power_rail_poles[i].neighbours.copper) do
            if neighbour.name == "bi-rail-hidden-power-pole" or neighbour.name == "bi-power-to-rail-pole" then
              BioInd.writeDebug(tostring(i).. " Hidden Power Rail Pole found")
              power_rail_poles[i].connect_neighbour(neighbour)
            else
              BioInd.writeDebug(tostring(i).. " Hidden Power Rail Pole found")
              power_rail_poles[i].disconnect_neighbour(neighbour)
            end
          end
        end
      end
    end
  end

  --- Disconnect any other power lines from the rail-hidden-power pole
  if entity.valid and entity.type == "electric-pole" then
    if entity.name ~= "bi-rail-hidden-power-pole" and entity.name ~= "bi-power-to-rail-pole" then
      for _, neighbour in pairs(entity.neighbours.copper) do
        if neighbour.name == "bi-rail-hidden-power-pole" then
          entity.disconnect_neighbour(neighbour)
        end
      end
    end
  end
end


--------------------------------------------------------------------
local function On_Remove(event)
  local entity = event.created_entity or event.entity
  --- Bio Farm has been removed
  if entity.valid and entity.name == "bi-bio-farm" then
  BioInd.writeDebug("Bio Farm has been removed")
    if global.bi_bio_farm_table[entity.unit_number] then
      global.bi_bio_farm_table[entity.unit_number].pole.destroy()
      global.bi_bio_farm_table[entity.unit_number].panel.destroy()
      global.bi_bio_farm_table[entity.unit_number].lamp.destroy()
      global.bi_bio_farm_table[entity.unit_number] = nil
    end
  end

  --- Bio Solar Farm has been removed
  if entity.valid and entity.name == "bi-bio-solar-farm" then
    BioInd.writeDebug("Solar Farm has been removed")
    if global.bi_solar_farm_table[entity.unit_number] then
      global.bi_solar_farm_table[entity.unit_number].pole.destroy()
      global.bi_solar_farm_table[entity.unit_number] = nil
    end
  end

  --- Bio Solar Boiler has been removed
  if entity.valid and entity.name == "bi-solar-boiler" then
    BioInd.writeDebug("Solar Boiler has been removed")
    if global.bi_solar_boiler_table[entity.unit_number] then
      global.bi_solar_boiler_table[entity.unit_number].boiler.destroy()
      global.bi_solar_boiler_table[entity.unit_number].pole.destroy()
      global.bi_solar_boiler_table[entity.unit_number] = nil
    end
  end

  --- Power Rail has been removed
  if (entity.valid and entity.name == "bi-straight-rail-power") or
     (entity.valid and entity.name == "bi-curved-rail-power") then
    BioInd.writeDebug("Power-Rail has been removed")
    if global.bi_power_rail_table[entity.unit_number] then
      global.bi_power_rail_table[entity.unit_number].pole.destroy()
      global.bi_power_rail_table[entity.unit_number] = nil
    end
  end

  --- Arboretum has been removed
  if entity.valid and entity.name == "bi-arboretum" then
    if global.Arboretum_Table[entity.unit_number] then
    --game.print("passed if statement: global.Arboretum_Table[entity.unit_number]")  -- it does not get here now!
      global.Arboretum_Table[entity.unit_number].radar.destroy()

      if global.Arboretum_Table[entity.unit_number].pole then
        global.Arboretum_Table[entity.unit_number].pole.destroy()
      end

      if global.Arboretum_Table[entity.unit_number].lamp then
        global.Arboretum_Table[entity.unit_number].lamp.destroy()
      end

      global.Arboretum_Table[entity.unit_number] = nil
    end
  end

  --- Seedling Removed
  if entity.valid and entity.name == "seedling" then
    BioInd.writeDebug("Seedling has been removed")
    for k, v in pairs(global.bi.tree_growing) do
      if v.position.x == entity.position.x and v.position.y == entity.position.y then
        table.remove(global.bi.tree_growing, k)
        return
      end
    end
  end

  --- Tree Stage 1 Removed
  if entity.valid and entity.type == "tree" then --and global.bi.trees[entity.name] then
    BioInd.writeDebug("Tree Removed removed name: " .. tostring(entity.name))
    local tree_name = (string.find(entity.name, "bio%-tree%-"))
    BioInd.writeDebug("Tree Removed removed name: " .. tostring(tree_name))
    if tree_name then
      local tree_stage_1 = (string.find(entity.name, '1.-$'))
      if tree_stage_1 then
        BioInd.writeDebug("1: Entity Name: " .. tostring(entity.name) .. " Tree last two digits: " .. tostring(tree_stage_1))
        for k, v in pairs(global.bi.tree_growing_stage_1) do
          if v.position.x == entity.position.x and v.position.y == entity.position.y then
            table.remove(global.bi.tree_growing_stage_1, k)
            return
          end
        end
      end

      local tree_stage_2 = (string.find(entity.name, '2.-$'))
      if tree_stage_2 then
        BioInd.writeDebug("2: Entity Name: " .. tostring(entity.name) .. " Tree last two digits: " .. tostring(tree_stage_2))
        for k, v in pairs(global.bi.tree_growing_stage_2) do
          if v.position.x == entity.position.x and v.position.y == entity.position.y then
            table.remove(global.bi.tree_growing_stage_2, k)
            return
          end
        end
      end

      local tree_stage_3 = (string.find(entity.name, '3.-$'))
      if tree_stage_3 then
        BioInd.writeDebug("3: Entity Name: " .. tostring(entity.name) .. " Tree last two digits: " .. tostring(tree_stage_3))
        for k, v in pairs(global.bi.tree_growing_stage_3) do
          if v.position.x == entity.position.x and v.position.y == entity.position.y then
            table.remove(global.bi.tree_growing_stage_3, k)
            return
          end
        end
      end

      local tree_stage_4 = (string.find(entity.name, '4.-$'))
      if tree_stage_4 then
        BioInd.writeDebug("4: Entity Name: " .. tostring(entity.name) .. " Tree last two digits: " .. tostring(tree_stage_4))
        for k, v in pairs(global.bi.tree_growing_stage_4) do
          if v.position.x == entity.position.x and v.position.y == entity.position.y then
            table.remove(global.bi.tree_growing_stage_4, k)
            return
          end
        end
      end
    end
  end
end


--------------------------------------------------------------------
local function On_Death(event)
  local entity = event.created_entity or event.entity

  --- Bio Farm has been destroyed
  if entity.valid and entity.name == "bi-bio-farm" then
  BioInd.writeDebug("Bio Farm has been destroyed")
    if global.bi_bio_farm_table[entity.unit_number] then
      global.bi_bio_farm_table[entity.unit_number].pole.destroy()
      global.bi_bio_farm_table[entity.unit_number].panel.destroy()
      global.bi_bio_farm_table[entity.unit_number].lamp.destroy()
      global.bi_bio_farm_table[entity.unit_number] = nil
    end
  end

  --- Bio Solar Farm has been destroyed
  if entity.valid and entity.name == "bi-bio-solar-farm" then
  BioInd.writeDebug("Solar Farm has been destroyed")
    if global.bi_solar_farm_table[entity.unit_number] then
      global.bi_solar_farm_table[entity.unit_number].pole.destroy()
      global.bi_solar_farm_table[entity.unit_number] = nil
    end
  end

  --- Bio Solar Boiler has been destroyed
  if entity.valid and entity.name == "bi-solar-boiler" then
  BioInd.writeDebug("Solar Boiler has been destroyed")
    if global.bi_solar_boiler_table[entity.unit_number] then
      global.bi_solar_boiler_table[entity.unit_number].boiler.destroy()
      global.bi_solar_boiler_table[entity.unit_number].pole.destroy()
      global.bi_solar_boiler_table[entity.unit_number] = nil
    end
  end

  --- Power Rail has been destroyed
  if (entity.valid and entity.name == "bi-straight-rail-power") or
     (entity.valid and entity.name == "bi-curved-rail-power") then
    BioInd.writeDebug("Power-Rail has been destroyed")
    if global.bi_power_rail_table[entity.unit_number] then
      global.bi_power_rail_table[entity.unit_number].pole.destroy()
      global.bi_power_rail_table[entity.unit_number] = nil
    end
  end

  --- Arboretum has been removed
  if entity.valid and entity.name == "bi-arboretum" then
    BioInd.writeDebug("Arboretum has been removed")
    BioInd.writeDebug("entity unit_number: " .. tostring(entity.unit_number))
    BioInd.writeDebug("global.Arboretum_Table: " .. serpent.block(global.Arboretum_Table[entity.unit_number]))

    if global.Arboretum_Table[entity.unit_number] then
    --game.print("passed if statement: global.Arboretum_Table[entity.unit_number]")  -- it does not get here now!
      global.Arboretum_Table[entity.unit_number].radar.destroy()
      if global.Arboretum_Table[entity.unit_number].pole then
        global.Arboretum_Table[entity.unit_number].pole.destroy()
      end
      if global.Arboretum_Table[entity.unit_number].lamp then
        global.Arboretum_Table[entity.unit_number].lamp.destroy()
      end
      global.Arboretum_Table[entity.unit_number] = nil
    end
  end

  --- Seedling destroyed
  if entity.valid and entity.name == "seedling" then
  BioInd.writeDebug("Seedling has been destroyed")
    for k, v in pairs(global.bi.tree_growing) do
      if v.position.x == entity.position.x and v.position.y == entity.position.y then
        table.remove(global.bi.tree_growing, k)
        return
      end
    end
  end

  --- Tree Stage 1 Removed
  if entity.valid and entity.type == "tree" then --and global.bi.trees[entity.name] then
    BioInd.writeDebug("Tree Removed removed name: " .. tostring(entity.name))
    local tree_name = (string.find(entity.name, "bio%-tree%-"))
    BioInd.writeDebug("Tree Removed removed name: " .. tostring(tree_name))
    if tree_name then
      local tree_stage_1 = (string.find(entity.name, '1.-$'))
      if tree_stage_1 then
        BioInd.writeDebug("1: Entity Name: " .. tostring(entity.name) .. " Tree last two digits: " .. tostring(tree_stage_1))
        for k, v in pairs(global.bi.tree_growing_stage_1) do
          if v.position.x == entity.position.x and v.position.y == entity.position.y then
            table.remove(global.bi.tree_growing_stage_1, k)
            return
          end
        end
      end

      local tree_stage_2 = (string.find(entity.name, '2.-$'))
      if tree_stage_2 then
        BioInd.writeDebug("2: Entity Name: " .. tostring(entity.name) .. " Tree last two digits: " .. tostring(tree_stage_2))
        for k, v in pairs(global.bi.tree_growing_stage_2) do
          if v.position.x == entity.position.x and v.position.y == entity.position.y then
            table.remove(global.bi.tree_growing_stage_2, k)
            return
          end
        end
      end

      local tree_stage_3 = (string.find(entity.name, '3.-$'))
      if tree_stage_3 then
        BioInd.writeDebug("3: Entity Name: " .. tostring(entity.name) .. " Tree last two digits: " .. tostring(tree_stage_3))
        for k, v in pairs(global.bi.tree_growing_stage_3) do
          if v.position.x == entity.position.x and v.position.y == entity.position.y then
            table.remove(global.bi.tree_growing_stage_3, k)
            return
          end
        end
      end

      local tree_stage_4 = (string.find(entity.name, '4.-$'))
      if tree_stage_4 then
        BioInd.writeDebug("4: Entity Name: " .. tostring(entity.name) .. " Tree last two digits: " .. tostring(tree_stage_4))
        for k, v in pairs(global.bi.tree_growing_stage_4) do
          if v.position.x == entity.position.x and v.position.y == entity.position.y then
            table.remove(global.bi.tree_growing_stage_4, k)
            return
          end
        end
      end
    end
  end
end


----------------Radars Scanning Function, used by Terraformer (Arboretum)  -----------------------------
Event.register(defines.events.on_sector_scanned, function(event)
  ---- Each time a Arboretum-Radar scans a sector  ----
  if event.radar.name == "bi-arboretum-radar" then
    local num = (event.radar.unit_number-1) --< Unit number of arboretum assembler

    if game.active_mods["omnimatter_fluid"] then
      Get_Arboretum_Recipe_omnimatter_fluid(global.Arboretum_Table[num], event)
    else
      Get_Arboretum_Recipe(global.Arboretum_Table[num], event)
    end
  end
end)

----- Solar Mat stuff
--------------------------------------------------------------------
local function Solar_Mat (event, surface)
  for i, vv in ipairs(event.tiles) do
    local position = vv.position
    local currentTilename = surface.get_tile(position.x, position.y).name
    local force

    if currentTilename == "bi-solar-mat" then
      --~ BioInd.writeDebug("Solar Mat has been built")
      if event.force ~= nil then
        force = event.force
        --~ BioInd.writeDebug(tostring(force))
      else
        force = "player"
        --~ BioInd.writeDebug(tostring(force))
      end


BioInd.writeDebug("Building solar mat for force " .. tostring(type(force) == "table" and force.name or force))
      local solar_mat = surface.get_tile(position.x, position.y)
      local sm_pole_name = "bi-musk-mat-pole"
      local sm_panel_name = "bi-musk-mat-solar-panel"
      local create_sm_pole, create_sm_panel

      -- Create pole for same force as panel if it should be visible in map view's
      -- electric grid overlay, or use dummy force if overlay should be hidden
      local create_sm_pole = surface.create_entity({
        name = sm_pole_name,
        position = {position.x + 0.5, position.y + 0.5},
        force = UseMuskForce and MuskForceName or force
      })
      local create_sm_panel = surface.create_entity({
        name = sm_panel_name,
        position = {position.x + 0.5, position.y + 0.5},
        force = force
      })
      create_sm_pole.minable = false
      create_sm_pole.destructible = false
      create_sm_panel.minable = false
      create_sm_panel.destructible = false
  BioInd.writeDebug("Created pole: " .. serpent.block(create_sm_pole))
  BioInd.writeDebug("Created panel: " .. serpent.block(create_sm_panel))
    else
      local radius = 0.5
      local area = {
        {position.x - radius, position.y - radius},
        {position.x + radius, position.y + radius}
      }
      BioInd.writeDebug("NOT Solar Mat")
      --local entities = surface.find_entities(area)
      --local entity1 = entities[1]
      local entity1 = {}
      entity1 = surface.find_entities_filtered{
        area = area,
        name = "bi-musk-mat-pole",
        limit = 1
      }

      if entity1 ~= nil then
        BioInd.writeDebug(tostring(entity1.name))
        for _, o in pairs(surface.find_entities_filtered({
          area = area,
          name = "bi-musk-mat-pole"
        })) do
          o.destroy()
        end
        BioInd.writeDebug("bi-musk-mat-pole removed")
      else
        BioInd.writeDebug("bi-musk-mat-pole not found")
      end

      --- Remove the Hidden Solar Panel
      --local entity2 = entities[1]
      local entity2 = {}
      entity2 = surface.find_entities_filtered{
        area = area,
        name = "bi-musk-mat-solar-panel",
        limit = 1
      }

      if entity2 ~= nil then
        BioInd.writeDebug(tostring(entity2.name))
        for _, o in pairs(surface.find_entities_filtered({area = area, name = "bi-musk-mat-solar-panel"})) do
          o.destroy()
        end
        BioInd.writeDebug("bi-musk-mat-solar-panel removed")
      else
        BioInd.writeDebug("bi-musk-mat-solar-panel not found")
      end
    end
  end

end

local function Player_Tile_Built(event)
  local player = game.players[event.player_index]
  local surface = player and player.surface

  if event.tiles then
    Solar_Mat (event, surface)
  end
end

local function Robot_Tile_Built(event)
  local robot = event.robot
  local surface = robot.surface

  -- fix #2 Error while running event Bio_Industries::on_robot_built_tile
  if surface == nil then
    return
  end

  if event.tiles then
    Solar_Mat (event, surface)
  end
end

--------------------------------------------------------------------
local function solar_mat_removed_at(surface, position)
  local radius = 0.5
  local area = {{position.x - radius, position.y - radius}, {position.x + radius, position.y + radius}}
  local n = 0

  for _, o in next, surface.find_entities_filtered{name = 'bi-musk-mat-pole', area = area} or {} do
    o.destroy()
    n = n+1
  end
   BioInd.writeDebug(string.format('%g bi-musk-mat-poles removed', n))

  for _, o in next, surface.find_entities_filtered{name = 'bi-musk-mat-solar-panel', area = area} or {} do
    o.destroy()
    n = n+1
  end
   BioInd.writeDebug(string.format('bi-musk-mat-solar-panel', n))
end


local function Player_Tile_Remove(event)
   local player = game.players[event.player_index]
   if event.item_stack.name == 'bi-solar-mat' and player.mining_state.mining then
     BioInd.writeDebug(string.format('%g solar mats removed', event.item_stack.count))
    return solar_mat_removed_at(player.surface, player.mining_state.position)
   end
end

local function Robot_Tile_Remove(event)
  local robot = event.robot
  if event.item_stack.name == 'bi-solar-mat' then
     BioInd.writeDebug(string.format('%g solar mats removed', event.item_stack.count))
    return solar_mat_removed_at(robot.surface, robot.position)
  end
end
--------------------------------------------------------------------


Event.register(Event.core_events.configuration_changed, On_Config_Change)
Event.register(Event.core_events.init, On_Init)
Event.register(Event.core_events.load, On_Load)


Event.build_events = {
  defines.events.on_built_entity,
  defines.events.on_robot_built_entity,
  defines.events.script_raised_built
}
Event.pre_remove_events = {
  defines.events.on_pre_player_mined_item,
  defines.events.on_robot_pre_mined,
  defines.events.script_raised_destroy
}
Event.death_events = {
  defines.events.on_entity_died,
  defines.events.script_raised_destroy
}
Event.player_build_event = {defines.events.on_player_built_tile}
Event.robot_build_event = {defines.events.on_robot_built_tile}
Event.player_remove_events = {defines.events.on_player_mined_item}
Event.robo_remove_events = {defines.events.on_robot_mined}

Event.register(Event.build_events, On_Built)
Event.register(Event.pre_remove_events, On_Remove)
Event.register(Event.death_events, On_Death)
Event.register(Event.player_build_event, Player_Tile_Built)
Event.register(Event.robot_build_event, Robot_Tile_Built)
Event.register(Event.player_remove_events, Player_Tile_Remove)
Event.register(Event.robo_remove_events, Robot_Tile_Remove)


------------------------------------------------------------------------------------
--                    FIND LOCAL VARIABLES THAT ARE USED GLOBALLY                 --
--                              (Thanks to eradicator!)                           --
------------------------------------------------------------------------------------
setmetatable(_ENV, {
  __newindex = function (self, key, value) --locked_global_write
    error('\n\n[ER Global Lock] Forbidden global *write*:\n'
      .. serpent.line{key = key or '<nil>', value = value or '<nil>'} .. '\n')
    end,
  __index   =function (self, key) --locked_global_read
    error('\n\n[ER Global Lock] Forbidden global *read*:\n'
      .. serpent.line{key = key or '<nil>'} .. '\n')
    end ,
  })
