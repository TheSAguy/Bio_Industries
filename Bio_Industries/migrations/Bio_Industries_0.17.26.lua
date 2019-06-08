
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


  	if game.technology_prototypes["bi-tech-coal-processing-3"] then	
				
		recipes["bi_recipe_coke_coal"].enabled = true
		recipes["bi_recipe_coke_coal"].reload()
		
	end	

	
  force.reset_recipes()
  force.reset_technologies()

	

end