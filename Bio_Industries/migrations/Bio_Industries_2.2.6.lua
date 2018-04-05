
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


  	if game.entity_prototypes["bi-straight-rail-power"] then	
		if  game.technology_prototypes["bob-railway-2"] and technologies["bob-railway-2"].researched then
		
			recipes["bi_rail_power"].enabled = true
			recipes["bi_recipe_power_to_rail_pole"].reload()
		
		elseif  game.technology_prototypes["railway"] and technologies["railway"].researched then
		
			recipes["bi_rail_power"].enabled = true
			recipes["bi_recipe_power_to_rail_pole"].reload()
		end


	end
  

  force.reset_recipes()
  force.reset_technologies()

	

end