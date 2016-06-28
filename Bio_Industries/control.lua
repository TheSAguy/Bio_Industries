---Bio Industries - v.1.0.0

--require ("defines")
require ("util")
require ("scripts.util_ext")
require ("control_bio_cannon")


local loaded
if not BI_Config then BI_Config = {} end
require ("config")

--------------------------------------------------------------------
script.on_load(function()

	if not loaded then
		loaded = true
		if global.Bio_Cannon_Table ~= nil then
			script.on_event(defines.events.on_tick, function(event)	ticker(event) end)			
		end
	end
	
	if global.ts == nil then
		global.ts = {}
		global.ts.growing = {}
	end
	
	if not global.numSeedlings then
          global.numSeedlings = 0
	elseif global.numSeedlings < 0 then
          global.numSeedlings = 0
	end
	
	if global.numSeedlings ~= nil then
		script.on_event(defines.events.on_tick, function(event)	ticker(event) end)		
	end
	
end)


script.on_init(function()
	loaded = true
	
	if global.Bio_Cannon_Table ~= nil then
		script.on_event(defines.events.on_tick, function(event)	ticker(event) end)
	end
	
	if global.ts == nil then
		global.ts = {}
		global.ts.growing = {}
	end
		
	if not global.numSeedlings then
          global.numSeedlings = 0
	elseif global.numSeedlings < 0 then
          global.numSeedlings = 0
	end

	if global.numSeedlings ~= nil then
		script.on_event(defines.events.on_tick, function(event)	ticker(event) end)		
	end
	
end)
---------------------------------------------------------------------


script.on_event({defines.events.on_built_entity,}, function(event) On_Built(event) end)
script.on_event({defines.events.on_robot_built_entity,}, function(event) On_Built(event) end)
script.on_event({defines.events.on_preplayer_mined_item,}, function(event) On_Remove(event) end)
script.on_event({defines.events.on_robot_pre_mined,}, function(event) On_Remove(event) end)
script.on_event({defines.events.on_entity_died,}, function(event) On_Death(event) end)
	
---------------------------------------------
function On_Built(event)
    local entity = event.created_entity
   
   
	--- Seedling planted
	if entity.name == "bi-seedling" then
		global.ts.growing[entity.position] = math.floor(game.tick / 60)
		global.numSeedlings = global.numSeedlings + 1
		writeDebug("The the number of Seedlings planted is: " .. global.numSeedlings)
	end
	
    --- Bio Farm has been built
	if entity and entity.name == "bi_bio_farm" then
	writeDebug("Bio Farm has been built")
		local surface = entity.surface
		local force = entity.force
		local position = entity.position		   
		local b_farm = entity
		local pole_name = "bi_medium-electric-pole_for_Bio_Farm"  
		local panel_name = "bi_solar-panel_for_Bio_Farm"  
		local lamp_name = "bi_light_for_Bio_Farm"      
		  
		local create_pole = surface.create_entity({name = pole_name, position = position, force = force})
		local create_panel = surface.create_entity({name = panel_name, position = position, force = force})
		local create_lamp = surface.create_entity({name = lamp_name, position = position, force = force})
		  
		create_pole.minable = false
		create_pole.destructible = false
		create_panel.minable = false
		create_panel.destructible = false
		create_lamp.minable = false
		create_lamp.destructible = false
		
		group_entities(cantor(position.x,position.y), { b_farm, create_pole, create_panel, create_lamp })	  

	end
	
	--- Bio Garden has been built
	if entity and entity.name == "bi-Bio_Garden" then
	writeDebug("Bio Garden has been built")
		local surface = entity.surface
		local force = entity.force
		local position = entity.position		   
		local b_garden = entity
		local g_lamp_name = "bi_light_for_Bio_Garden"      
	  
		local create_g_lamp = surface.create_entity({name = g_lamp_name, position = position, force = force})
		  
		create_g_lamp.minable = false
		create_g_lamp.destructible = false
		
		group_entities(cantor(position.x,position.y), { b_garden, create_g_lamp })	  

	end
	
	--- Bio Solar Farm has been built
	if entity and entity.name == "bi_bio_Solar_Farm" then
	writeDebug("Bio Solar Farm has been built")
		local surface = entity.surface
		local force = entity.force
		local position = entity.position		   
		local solar_farm = entity
		local pole_name = "bi_medium-electric-pole_for_Bio_Farm"  		
		local sf_image = "bi_bio_Solar_Farm_Image"   
		
		local create_sf_pole = surface.create_entity({name = pole_name, position = position, force = force})
		local create_sf_image = surface.create_entity({name = sf_image, position = position, force = force})
		
		create_sf_pole.minable = false
		create_sf_pole.destructible = false 
		create_sf_image.minable = false
		create_sf_image.destructible = false
		
		group_entities(cantor(position.x,position.y), { solar_farm, create_sf_pole, create_sf_image })	  

	end
	
	--- Bio Cannon has been built


	if entity.name == "Bio_Cannon_Area" then
	
	local New_Bio_Cannon
	local New_Bio_CannonI
	local New_Bio_CannonR
	
	writeDebug("Bio Cannon has been built")				
		local surface = entity.surface
		local force = entity.force
		local position = entity.position
	
		New_Bio_Cannon  = surface.create_entity({name = "Bio_Cannon", position = position, direction = event.created_entity.direction, force = force})
		New_Bio_CannonI = surface.create_entity({name = "Bio_Cannon".."i", position = position, direction = event.created_entity.direction, force = force})
		New_Bio_CannonR = surface.create_entity({name = "Bio_Cannon".."r", position = position, direction = event.created_entity.direction, force = force})
		
		New_Bio_CannonI.health = event.created_entity.health
		
		event.created_entity.destroy()

		New_Bio_Cannon.destructible = false
		New_Bio_Cannon.operable = false
		New_Bio_Cannon.minable = false
		
		New_Bio_CannonI.operable = true
		New_Bio_CannonI.minable = true
		
		New_Bio_CannonR.operable = false
		New_Bio_CannonR.destructible = false
		New_Bio_CannonR.minable = false
		
		if global.Bio_Cannon_Table == nil then
			global.Bio_Cannon_Table = {}
			script.on_event(defines.events.on_tick, function(event)	ticker(event) end)
		end

		table.insert(global.Bio_Cannon_Table, {New_Bio_Cannon,New_Bio_CannonI,New_Bio_CannonR,0})
		
	end
	
end

---------------------------------------------
function On_Remove(event)
	
	--- Bio Farm has been removed
	local entity = event.entity
   	if entity and entity.name == "bi_bio_farm" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

		
	--- Bio Garden has been removed
	local entity = event.entity
   	if entity and entity.name == "bi-Bio_Garden" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

			
	--- Bio Solar Farm has been removed
	local entity = event.entity
   	if entity and entity.name == "bi_bio_Solar_Farm" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

	--- Seedling Removed
	if event.entity.name == "bi-seedling" then
		global.numSeedlings = global.numSeedlings - 1
		if global.numSeedlings < 0 then
			global.numSeedlings = 0
		end
		writeDebug("The the number of Seedlings planted is: " .. global.numSeedlings)
	end
	
end

---------------------------------------------
function On_Death(event)
	
	--- Bio Farm has been destroyed
	local entity = event.entity
   	if entity and entity.name == "bi_bio_farm" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    --vx.die()
					vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

			
	--- Bio Garden has been destroyed
	local entity = event.entity
   	if entity and entity.name == "bi-Bio_Garden" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

		--- Bio Solar Farm has been destroyed
	local entity = event.entity
   	if entity and entity.name == "bi_bio_Solar_Farm" then
		local pos_hash = cantor(entity.position.x,entity.position.y)
        local entity_group = getGroup_entities(pos_hash)
        if entity_group then
            for ix, vx in ipairs(entity_group) do
                if vx == entity then
                    --vx.destroy()
                else
                    vx.destroy()
                end
            end
        end
        ungroup_entities(pos_hash)
	end

	--- Seedling Removed
	if event.entity.name == "bi-seedling" then
		global.numSeedlings = global.numSeedlings - 1
		if global.numSeedlings < 0 then
			global.numSeedlings = 0
		end
		writeDebug("The the number of Seedlings planted is: " .. global.numSeedlings)
	end
	
end

--------------------


function ticker(event) 
---- Growing Tree
  if game.tick % 60 == 0 and global.numSeedlings > 0 then

    for k, v in pairs(global.ts.growing) do
      if math.random() < ((game.tick / 60) - (v + 60)) / 3600 then
        local foundtree = false
		local surface = game.surfaces['nauvis']
  		local force = k.force
		local entities = surface.find_entities_filtered{area = {{k.x - .25, k.y - .25}, {k.x + .25, k.y + .25}}, name = "bi-seedling"}
		local currentTilename = surface.get_tile(k.x, k.y).name
		writeDebug("The current tile is: " .. currentTilename)
		
		for _,entity in pairs(entities) do
			entity.destroy()
			global.numSeedlings = global.numSeedlings - 1
		if global.numSeedlings < 0 then
			global.numSeedlings = 0
		end
			writeDebug("The the number of Seedlings planted is: " .. global.numSeedlings)
			foundtree = true
        end
        
		--- Depending on Terain, choose tree type & Convert seedling into a tree
		local growth_chance = math.random(100)
		if 	currentTilename == "grass" then 
			treetype = "tree-05"
			if growth_chance > 5 and foundtree then
				surface.create_entity({ name=treetype, amount=1, position=k})
			end
			
		elseif currentTilename == "grass-medium" then 
			treetype = "tree-04"
			if growth_chance > 10 and foundtree then
				surface.create_entity({ name=treetype, amount=1, position=k})
			end
		
		elseif currentTilename == "grass-dry" then 
			treetype = math.random(2)
			treetype = "tree-0".. treetype
			if growth_chance > 20 and foundtree then
				surface.create_entity({ name=treetype, amount=1, position=k})
			end
		
		elseif currentTilename == "dirt" or currentTilename == "dirt-dark" then 
			treetype = math.random(2)
			treetype = treetype + 5
			treetype = "tree-0".. treetype
			if growth_chance > 80 and foundtree then
				surface.create_entity({ name=treetype, amount=1, position=k})
			end
		
		else
			treetype = math.random(3)
			if treetype == 1 then
				treetype = "tree-03"
			elseif treetype == 2 then
				treetype = "tree-08"
			else
				treetype = "tree-09"
			end
			if growth_chance > 50 and foundtree then
				surface.create_entity({ name=treetype, amount=1, position=k})
			end
		
		end		
        global.ts.growing[k] = nil
      end
    end
  end
  
  --- Bio Cannon stuff
  	if global.Bio_Cannon_Table ~= nil then
		if global.Bio_Cannon_Counter == 0 or global.Bio_Cannon_Counter == nil then
			global.Bio_Cannon_Counter = 60		
			for ix, vx in pairs(global.Bio_Cannon_Table) do
				if vx[1].valid and vx[2].valid and vx[3].valid then
				vx[4]=vx[4]-1
					if vx[4] <=0 then
						Bio_Cannon_Check(vx)
					end
				else
				if vx[1].valid then
					vx[1].destroy()
				end
				if vx[2].valid then
					vx[2].destroy()
				end	
				if vx[3].valid then
					vx[3].destroy()
				end	
				end
				
			end		
		else
			global.Bio_Cannon_Counter = global.Bio_Cannon_Counter - 1
		end
	else
		--script.on_event(defines.events.on_tick, nil)
		script.on_event(defines.events.on_tick, function(event)	ticker() end)
		--script.on_event(defines.events.on_tick, function(event)
		
	end
  
end

--- Utils for grouping
function group_entities(entity_list)
    return group_entities(nil, entity_list)
end

function group_entities(entity_groupid, entity_list)
    return group("entities", entity_groupid, entity_list)
end

function getGroup_entities(entity_groupid)
    return getGroup("entities", entity_groupid)
end

function getGroup_entities_by_member(entity_id)
    return getGroup_byMember("entities", entity_id)
end

function ungroup_entities(entity_groupid)
    return ungroup("entities", entity_groupid)
end

--- DeBug Messages 
function writeDebug(message)
	if BI_Config.QCCode then 
		for i, player in ipairs(game.players) do
			player.print(tostring(message))
		end
	end
end

if BI_Config.QCCode then 

	script.on_event(defines.events.on_player_created, function(event)
		local player = game.players[event.player_index]
		start_items(player)

	end)


	function start_items(player)

		player.insert{name="iron-plate", count=100}
		player.insert{name="electronic-circuit", count=200}
		player.insert{name="steel-plate", count=50}
		player.insert{name="copper-plate", count=50}
		player.insert{name="iron-gear-wheel", count=50}
		player.insert{name="stone", count=50}
		player.insert{name="steel-axe", count=3}				  
		player.insert{name="submachine-gun", count=1}
		player.insert{name="piercing-rounds-magazine", count=150}  
		player.insert{name="combat-shotgun", count=1}
		player.insert{name="piercing-shotgun-shell", count=50}  
		player.insert{name="rail", count=50}  
		player.insert{name="bi-rail-wood", count=50}  
		player.insert{name="bi_bio_farm", count=5}  
		player.insert{name="Bio_Cannon_Area", count=2}
		player.insert{name="Bio_Cannon_Basic_Ammo", count=20}
		player.insert{name="Bio_Cannon_Poison_Ammo", count=20}
		player.insert{name="bi_bio_Solar_Farm", count=2}
		player.insert{name="burner-inserter", count=50}
		player.insert{name="inserter", count=30}
		player.insert{name="transport-belt", count=200}
		player.insert{name="small-electric-pole", count=20}
		player.insert{name="burner-mining-drill", count=20}
		player.insert{name="stone-furnace", count=35}
		player.insert{name="assembling-machine-1", count=20}
		player.insert{name="bi-seedling", count=50}

	end

end