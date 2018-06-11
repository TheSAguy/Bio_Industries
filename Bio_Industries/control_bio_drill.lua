---Bio Drill Stuff

require ("stdlib/event/event")
require ("prototypes.Bio_Drill.resources_odds")


-- Box up the drill after finding a resource
local function box_it_up(bi_drill_table, pos, force, surface)

		--- Create a box
		local box = surface.create_entity{name="wooden-chest",amount=1, position=pos, force=force}
		
		---- Get the count of Worn Drill Bits and put it in the box
		local Inventory_in = bi_drill_table.inventory.get_inventory(defines.inventory.assembling_machine_input)
		for i = 1, #Inventory_in do
			local stack = Inventory_in[i]
			if Inventory_in[i].valid_for_read and stack.count > 0 then
				box.insert({name = stack.name, count = stack.count})
			end
		end
			
		---- Get the count of Worn Drill Bits and put it in the box
		local Inventory_out = bi_drill_table.inventory.get_inventory(defines.inventory.assembling_machine_output)
		for i = 1, #Inventory_out do
			local stack = Inventory_out[i]
			if Inventory_out[i].valid_for_read and stack.count > 0 then
				box.insert({name = stack.name, count = stack.count})
			end
		end
		---- Put a Drill in the Box
		box.insert({name = "bi-drill-base", count = 1})
						
		---- Remove the Drill and Radar
		bi_drill_table.inventory.destroy()
		bi_drill_table.drill_bit.destroy()
		bi_drill_table = nil					
	
end

--- Select the Resource to Spawn												
function get_resource_to_spawn(input)
	local resource_options = 
		{
		  {spawn=input , weight=479},
		  {spawn="ground-water" , weight=10},
		  {spawn="crude-oil", weight=5},
		  {spawn="bi-ground-steam" , weight=5},
		  {spawn="bi-ground-sulfuric-acid" , weight=1}
		}
					  
	local calculate_odds = {}
	for k,spawn in ipairs(resource_options) do
		for i=1, spawn.weight do
			calculate_odds[#calculate_odds+1] = k
		end
	end

	local random_num = #calculate_odds
	return resource_options[calculate_odds[math.random(random_num)]]

	end

	
function Process_Bio_Drill(bi_drill_table, event)
				
		--- Check to make sure the table is not nil
		if bi_drill_table == nil then
			global.bi_drill_table = {}
			return
		else
		
		--- Check if a recipe is selected
		local recipe = bi_drill_table.inventory.get_recipe()
		--writeDebug("The Recipe is: "..recipe.name)
		if recipe ~= nil then
			
			--- Make sure there are ingriedents loaded
			local Inventory = bi_drill_table.inventory.get_inventory(defines.inventory.assembling_machine_input)
			local pass_qc = true
			for i = 1, #Inventory do
				if not Inventory[i].valid_for_read then
					pass_qc = false
					break
				end
			end		
	
			if pass_qc then
				--writeDebug("Passed QC Check")
				local recipe_name = bi_drill_table.inventory.get_recipe().name
				local pos = bi_drill_table.inventory.position
				local force = bi_drill_table.inventory.force
				local surface = bi_drill_table.inventory.surface			
				local find_chance = math.random(100) 
				
				---- Prospecting Mk1		
				if resource_odds.bi_resource_table[recipe_name].group == "mk1"  then										
					
					--writeDebug("The Random Number is: "..find_chance)
					writeDebug("Recipe Group Mk1")
					
					------- Recipe Mk1 starts with a 2% chance to find a resource -------
					if find_chance > (98 - global.prospect_chance) then

				input = resource_odds.bi_resource_table[recipe_name].output_name
				local r_to_s = get_resource_to_spawn(input)
				local a_to_s = (resource_odds.bi_resource_table[recipe_name].amount + global.prospect_richness)
						
						local new_fluid_patch = surface.create_entity{name = r_to_s.spawn, amount = a_to_s, position = pos, force = force}
						new_fluid_patch.destructible = false						

						box_it_up(bi_drill_table, pos, force, surface)		
								
					end
			
				---- Prospecting Mk2
				elseif resource_odds.bi_resource_table[recipe_name].group == "mk2"  then
				
		 
					writeDebug("The Random Number is: "..find_chance)
					writeDebug("Recipe Group Mk2")
					
					------- Recipe Mk2 starts with a 6% chance to find a resource -------
					if find_chance > (94 - global.prospect_chance) then
													
						local new_fluid_patch = surface.create_entity{name = resource_odds.bi_resource_table[recipe_name].output_name, amount = resource_odds.bi_resource_table[recipe_name].amount, position = pos, force = force}
						new_fluid_patch.destructible = false						
						
						box_it_up(bi_drill_table, pos, force, surface)		
								
					end
				
				---- Prospecting Mk3
				elseif resource_odds.bi_resource_table[recipe_name].group == "mk3"  then
				
			
					writeDebug("The Random Number is: "..find_chance)
					writeDebug("Recipe Group Mk3")
		
					------- Recipe Mk3 starts with a 10% chance to find a resource -------
					if find_chance > (90 - global.prospect_chance) then
													
						local new_fluid_patch = surface.create_entity{name = resource_odds.bi_resource_table[recipe_name].output_name, amount = resource_odds.bi_resource_table[recipe_name].amount, position = pos, force = force}
						new_fluid_patch.destructible = false						
						
						box_it_up(bi_drill_table, pos, force, surface)		
								
					end
					
				else
				
					writeDebug("no recipe")
					
				end
		
			end		

		end
	end
		  
		  
end


 
--------------------------------------------------------------------

