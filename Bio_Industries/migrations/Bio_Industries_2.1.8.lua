
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


  	if game.entity_prototypes["bi-huge-wooden-pole"] then	
		if technologies["electric-energy-distribution-2"].researched then
		
			recipes["bi_huge_wooden_pole"].enabled = true
			recipes["bi_huge_wooden_pole"].reload()

		end
		
	end
  

  	if game.technology_prototypes ["bob-solar-energy-2"] and game.entity_prototypes["bi-Solar-Boiler-panel"] then	
		if technologies["bob-solar-energy-2"].researched then
		
			recipes["bi_Solar_Boiler_panel"].enabled = true
			recipes["bi_Solar_Boiler_panel"].reload()
		

		end
	
	elseif  technologies["solar-energy"].researched and game.entity_prototypes["bi-Solar-Boiler-panel"] then
		
			recipes["bi_Solar_Boiler_panel"].enabled = true
			recipes["bi_Solar_Boiler_panel"].reload()
		
	end
	

  force.reset_recipes()
  force.reset_technologies()

	

end