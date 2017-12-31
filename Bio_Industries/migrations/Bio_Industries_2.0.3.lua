
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	

  	if game.entity_prototypes["bi-bioreactor"] then	
		if technologies["bi-advanced-biotechnology"].researched then

			recipes["bi-biomass_conversion-3"].enabled = true
			recipes["bi-biomass_conversion-3"].reload()

			
		end
		
	end
  
  

end