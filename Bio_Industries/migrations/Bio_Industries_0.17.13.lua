
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


 
  	if game.technology_prototypes["electric-energy-accumulators"] and technologies["electric-energy-accumulators"].researched then
	
	
		recipes["bi_recipe_accumulator"].enabled = true
		recipes["bi_recipe_accumulator"].reload()

	
	end
	

  force.reset_recipes()
  force.reset_technologies()

	

end