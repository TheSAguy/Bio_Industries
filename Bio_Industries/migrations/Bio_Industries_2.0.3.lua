
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	

  	if game.entity_prototypes["bi-bioreactor"] then	
		if technologies["bi_tech_advanced_biotechnology"].researched then

			recipes["bi_recipe_biomass_conversion_3"].enabled = true
			recipes["bi_recipe_biomass_conversion_3"].reload()

			
		end
		
	end
  
  

end