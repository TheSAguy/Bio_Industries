
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


 
  	if game.technology_prototypes["steel-processing"] and technologies["steel-processing"].researched then
	
	
		recipes["bi_recipe_crushed_stone"].enabled = true
		recipes["bi_recipe_crushed_stone"].reload()

	
	end
	

  force.reset_recipes()
  force.reset_technologies()

	

end