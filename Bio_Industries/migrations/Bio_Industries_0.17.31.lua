
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;



  	if game.technology_prototypes["bi_tech_bio_farming"] then	
				
		recipes["bi_recipe_wood_from_pulp"].enabled = true
		recipes["bi_recipe_wood_from_pulp"].reload()
		
	end	
	
  force.reset_recipes()
  force.reset_technologies()

	

end