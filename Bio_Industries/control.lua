require ("defines")
require ("util")
require ("scripts.util_ext")


script.on_init(function()
    init_bio_industries()
end)

script.on_load(function()
    init_bio_industries()
end)

function init_bio_industries()
    script.on_event(defines.events.on_built_entity, On_Built)
    script.on_event(defines.events.on_robot_built_entity, On_Built)
    script.on_event(defines.events.on_preplayer_mined_item, On_Remove)
    script.on_event(defines.events.on_robot_pre_mined, On_Remove)
    --script.on_event(defines.events.on_entity_died, On_Remove)
	script.on_event(defines.events.on_entity_died, On_Death)
end

---------------------------------------------
function On_Built(event)
    local entity = event.created_entity
    --- Bio Farm has been built
	
	if entity and entity.name == "bi_bio_farm" then
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

	
	
end




--- Utils
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
