---Bio Drill Stuff

require ("stdlib/event/event")
require ("prototypes.Bio_Drill.resources_odds")

Prospect_recipes = {

["bi_recipe_mk1_crude-oil"] = 1,
["bi_recipe_mk1_water"] = 1,
["bi_recipe_mk1_lithia-water"] = 1,
["bi_recipe_mk1_thermal-water"] = 1,
["bi_recipe_mk1_gas-natural-1"] = 1,
["bi_recipe_mk2_crude-oil"] = 2,
["bi_recipe_mk2_water"] = 2,
["bi_recipe_mk2_lithia-water"] = 2,
["bi_recipe_mk2_thermal-water"] = 2,
["bi_recipe_mk2_gas-natural-1"] = 2,
["bi_recipe_mk3_crude-oil"] = 3,
["bi_recipe_mk3_water"] = 3,
["bi_recipe_mk3_lithia-water"] = 3,
["bi_recipe_mk3_thermal-water"] = 3,
["bi_recipe_mk3_gas-natural-1"] = 3,

}
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



function Process_Bio_Drill(bi_drill_table, event)
				
		--- Check to make sure the table is not nil
		if bi_drill_table == nil then
			global.bi_drill_table = {}
			return
		else
		
		--- Check if a recipe is selected
		local recipe = bi_drill_table.inventory.get_recipe()
		
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
			
				local recipe_name = bi_drill_table.inventory.get_recipe().name
				local pos = bi_drill_table.inventory.position
				local force = bi_drill_table.inventory.force
				local surface = bi_drill_table.inventory.surface			
					
				---- Prospecting #1

				
				if resource_odds.hello[recipe_name].group == "mk1"  then
								
						
					local find_chance = math.random(100) 
					writeDebug("The Random Number is: "..find_chance)
					writeDebug("Recipe Group Mk1")
		
					if find_chance > 10 then
													
						local new_fluid_patch = surface.create_entity{name = resource_odds.hello[recipe_name].output_name, amount = resource_odds.hello[recipe_name].amount, position = pos, force = force}
						new_fluid_patch.destructible = false						
						
						box_it_up(bi_drill_table, pos, force, surface)		
								
					end

					
				elseif resource_odds.hello[recipe_name].group == "mk2"  then
				
					local find_chance = math.random(100) 
					writeDebug("The Random Number is: "..find_chance)
					writeDebug("Recipe Group Mk2")
		
					if find_chance > 20 then
													
						local new_fluid_patch = surface.create_entity{name = resource_odds.hello[recipe_name].output_name, amount = resource_odds.hello[recipe_name].amount, position = pos, force = force}
						new_fluid_patch.destructible = false						
						
						box_it_up(bi_drill_table, pos, force, surface)		
								
					end
					
				elseif resource_odds.hello[recipe_name].group == "mk3"  then
				
					local find_chance = math.random(100) 
					writeDebug("The Random Number is: "..find_chance)
					writeDebug("Recipe Group Mk3")
		
					if find_chance > 30 then
													
						local new_fluid_patch = surface.create_entity{name = resource_odds.hello[recipe_name].output_name, amount = resource_odds.hello[recipe_name].amount, position = pos, force = force}
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

