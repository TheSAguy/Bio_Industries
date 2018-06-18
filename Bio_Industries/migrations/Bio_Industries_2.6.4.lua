
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


 
  	if game.technology_prototypes["bi-tech-bio-prospecting-2"] and technologies["bi-tech-bio-prospecting-2"].researched then
	
	
		recipes["bi_recipe_fresh_water_2"].enabled = true
		recipes["bi_recipe_fresh_water_2"].reload()

	
	end
	

  force.reset_recipes()
  force.reset_technologies()

	

end