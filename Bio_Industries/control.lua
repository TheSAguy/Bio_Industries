---Bio Industries - v.1.4.0

require ("util")
require ("libs/util_ext")
require ("libs/event")



if not BI_Config then BI_Config = {} end
require ("config")

local max_grow_time = 5000


--------------------------------------------------------------------
script.on_load(function()

	if global.Bio_Cannon_Table ~= nil then
		Event.register(defines.events.on_tick, function(event) end)
	end
	
end)

script.on_init(function()
	
	if global.bi == nil then
		global.bi = {}	
		global.bi.tree_growing = {}
	end
	
end)

script.on_configuration_changed(function()
	
	if global.Bio_Cannon_Table ~= nil then
		Event.register(defines.events.on_tick, function(event) end)
	end
	
	if global.bi == nil then
		global.bi = {}
		global.bi.tree_growing = {}
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
	if entity.name == "seedling" then

		table.insert(global.bi.tree_growing, {position = event.created_entity.position, time = event.tick + max_grow_time})
		table.sort(global.bi.tree_growing, function(a, b) return a.time < b.time end)

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
			Event.register(defines.events.on_tick, function(event) end)
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
	if event.entity.name == "seedling" then
	
		for k, v in pairs(global.bi.tree_growing) do
			if v.position.x == event.entity.position.x and v.position.y == event.entity.position.y then
				table.remove(global.bi.tree_growing, k)
				return
			end
		end

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
	
	if event.entity.name == "seedling" then
	
		for k, v in pairs(global.bi.tree_growing) do
			if v.position.x == event.entity.position.x and v.position.y == event.entity.position.y then
				table.remove(global.bi.tree_growing, k)
				return
			end
		end

	end
	
end

--------------------

---- Growing Tree
Event.register(defines.events.on_tick, function(event)	

	while #global.bi.tree_growing > 0 do
		if event.tick < global.bi.tree_growing[1].time then
			break 
		end
		Grow_tree(global.bi.tree_growing[1].position)
		table.remove(global.bi.tree_growing, 1)
	end

end)


function Grow_tree(pos)
	
	local foundtree = false
	local surface = game.surfaces['nauvis']
	local tree = surface.find_entity("seedling", pos)
	local currentTilename = surface.get_tile(pos.x, pos.y).name
	writeDebug("The current tile is: " .. currentTilename)
				
	if tree then
		foundtree = true
		tree.destroy()
		
		--- Depending on Terain, choose tree type & Convert seedling into a tree
		local growth_chance = math.random(100)
		if 	currentTilename == "grass" then 
			treetype = "tree-05"
			if foundtree and surface.can_place_entity({ name=treetype, position=pos}) then
				surface.create_entity({ name=treetype, amount=1, position=pos})
			end
					
		elseif currentTilename == "grass-medium" then 
			treetype = "tree-04"
			if growth_chance > 15 and foundtree and surface.can_place_entity({ name=treetype, position=pos}) then
				surface.create_entity({ name=treetype, amount=1, position=pos})
			end
		
		elseif currentTilename == "grass-dry" then 
			treetype = math.random(2)
			treetype = "tree-0".. treetype
			if growth_chance > 25 and foundtree and surface.can_place_entity({ name=treetype, position=pos}) then
				surface.create_entity({ name=treetype, amount=1, position=pos})
			end
		
		elseif currentTilename == "dirt" or currentTilename == "dirt-dark" then 
			treetype = math.random(2)
			treetype = treetype + 5
			treetype = "tree-0".. treetype
			if growth_chance > 85 and foundtree and surface.can_place_entity({ name=treetype, position=pos}) then
				surface.create_entity({ name=treetype, amount=1, position=pos})
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
			if growth_chance > 70 and foundtree and surface.can_place_entity({ name=treetype, position=pos}) then
				surface.create_entity({ name=treetype, amount=1, position=pos})
			end
				
		end		

	end
	
end



----- Bio Cannon Stuff
 Event.register(defines.events.on_tick, function(event)	 

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

		-- Event.register(defines.events.on_tick, function() end)
		
	end
  
end)




function Bio_Cannon_Check(Bio_Cannon_List)
	
	local Bio_Cannon=Bio_Cannon_List[1]
	local Bio_Cannoni=Bio_Cannon_List[2]
	local inventory = Bio_Cannoni.get_inventory(1)
	local inventoryContent = inventory.get_contents()
	local AmmoType
	local ammo = 0
	local spawner
	local target
	local delay

	
	if inventoryContent ~= nil then
		for n,a in pairs(inventoryContent) do
			AmmoType=n
			ammo=a
		end
	end
	
	if ammo > 0 and Bio_Cannon_List[3].energy > 0 then	
			
			local radius = 75
			local pos = Bio_Cannon.position
			local area = {{pos.x - radius, pos.y - radius}, {pos.x + radius, pos.y + radius}}
	
			--- Look for spawners
			spawner = Bio_Cannon.surface.find_entities_filtered({area = area, type = "unit-spawner", force= "enemy"})
				
			writeDebug("The Number of Spawners are: " .. #spawner)
			--Find Spawner Target
			if #spawner > 0 and target == nil then
				for _,enemy in pairs(spawner) do
					local distance = math.sqrt(((Bio_Cannon.position.x - enemy.position.x)^2) +((Bio_Cannon.position.y - enemy.position.y)^2) )
					writeDebug("The Distance is: " .. distance)
					if (distance > 10) and (distance < (radius+1)) then
					
						if target == nil then
							target={enemy}
						end
					end
				end
			end


		--Fire at Spawner
		if target ~= nil then

			Bio_Cannon.surface.create_entity({name=AmmoType, position = {x = Bio_Cannon.position.x - 0.5, y = Bio_Cannon.position.y - 4.5}, force = Bio_Cannon.force, target = target[1], speed= 0.1})
			Bio_Cannon.surface.pollute(Bio_Cannon.position,100) -- The firing of the Hive Buster will causes Pollution
			Bio_Cannon.surface.set_multi_command{command = {type=defines.command.attack, target=Bio_Cannon, distraction=defines.distraction.by_enemy},unit_count = math.floor(100 * game.evolution_factor), unit_search_distance = 500}
			
			--Reduce Ammo
			ammo = ammo-1
			inventory.clear()
			if ammo > 0 then
				inventory.insert({name = AmmoType, count = ammo})
			end
			
			--Delay between shots
			if AmmoType == "Bio_Cannon_Basic_Ammo" then 
				delay = 10
			elseif AmmoType == "Bio_Cannon_Poison_Ammo" then 
				delay = 15
			else 
			delay = 20
			end
			
			Bio_Cannon_List[4]=delay
			
		end
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
		for i, player in pairs(game.players) do
			player.print(tostring(message))
		end
	end
end

