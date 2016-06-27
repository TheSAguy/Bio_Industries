--require ("defines")
require ("util")

--[[
function ticker()
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
		script.on_event(defines.events.on_tick, nil)
	end
end

]]

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

			spawner = Bio_Cannon.surface.find_entities_filtered({area = {{x = Bio_Cannon.position.x - 75, y = Bio_Cannon.position.y - 75}, {x = Bio_Cannon.position.x + 75, y = Bio_Cannon.position.y + 75}}, type = "unit-spawner", force= "enemy"})
			writeDebug("The Number of Spawners are: " .. #spawner)
			--Find Spawner Target
			if #spawner > 0 and target == nil then
				for _,enemy in pairs(spawner) do
					local distance = math.sqrt(((Bio_Cannon.position.x - enemy.position.x)^2) +((Bio_Cannon.position.y - enemy.position.y)^2) )
					writeDebug("The Distance is: " .. distance)
					if (distance > 10) and (distance < 76) then
					
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
			--event.created_entity.surface.set_multi_command{command = {type=defines.command.attack, target=event.created_entity, distraction=defines.distraction.by_enemy},unit_count = math.floor(100 * game.evolution_factor), unit_search_distance = 500}
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

---------------------------------------------------------------------


--- DeBug Messages 
function writeDebug(message)
	if QC_Check then 
	--if NEConfig.QCCode then 
		for i, player in ipairs(game.players) do
			player.print(tostring(message))
		end
	end
end






