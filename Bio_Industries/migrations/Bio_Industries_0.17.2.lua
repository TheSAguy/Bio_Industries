
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


 
  	if game.technology_prototypes["steel-processing"] and technologies["steel-processing"].researched then
	
	
		recipes["bi_recipe_stone_crusher"].enabled = true
		recipes["bi_recipe_stone_crusher"].reload()

	
	end
	

  force.reset_recipes()
  force.reset_technologies()

	

end