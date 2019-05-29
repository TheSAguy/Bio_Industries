
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


 
  	if game.technology_prototypes["bi-tech-coal-processing-1"] then	
		if game.item_prototypes["wood-bricks"] then
				
			recipes["bi_recipe_wood_fuel_brick"].enabled = true
			recipes["bi_recipe_wood_fuel_brick"].reload()
			recipes["bi_recipe_solid_fuel"].enabled = true
			recipes["bi_recipe_solid_fuel"].reload()
			
		end
		
	end

  	if game.technology_prototypes["bi-tech-coal-processing-2"] then	
				
		recipes["bi_recipe_pellet_coke"].enabled = true
		recipes["bi_recipe_pellet_coke"].reload()
		
	end	

  	if game.technology_prototypes["bi_tech_bio_farming"] then	
				
		recipes["bi_recipe_woodpulp"].enabled = true
		recipes["bi_recipe_woodpulp"].reload()
		
	end	
	
  force.reset_recipes()
  force.reset_technologies()

	

end