
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

  
  
  	if game.entity_prototypes["bi_bio_farm"] then	
		if technologies["bi-coal-processing"].researched then
			recipes["bi-Logs_Mk2"].enabled = true
			recipes["bi-Logs_Mk2"].reload()
		end
		if technologies["bi-fertiliser"].researched then
			recipes["bi-Logs_Mk3"].enabled = true
			recipes["bi-Logs_Mk3"].reload()
		end
		if technologies["bi-advanced-biotechnology"].researched then
			recipes["bi-Logs_Mk4"].enabled = true
			recipes["bi-Logs_Mk4"].reload()
			recipes["bi-adv-fertiliser-2"].enabled = true
			recipes["bi-adv-fertiliser-2"].reload()			
		end

		
	end

  	if game.entity_prototypes["bi-bioreactor"] then	
		if technologies["bi-advanced-biotechnology"].researched then
			recipes["bi-cellulose-1"].enabled = true
			recipes["bi-cellulose-1"].reload()
			recipes["bi-cellulose-2"].enabled = true
			recipes["bi-cellulose-2"].reload()
			recipes["bi-biomass-1"].enabled = true
			recipes["bi-biomass-1"].reload()
			recipes["bi-biomass-2"].enabled = true
			recipes["bi-biomass-2"].reload()
			recipes["bi-biomass-3"].enabled = true
			recipes["bi-biomass-3"].reload()
			recipes["bi-battery"].enabled = true
			recipes["bi-battery"].reload()
			recipes["bi-biomass_conversion-1"].enabled = true
			recipes["bi-biomass_conversion-1"].reload()
			recipes["bi-biomass_conversion-2"].enabled = true
			recipes["bi-biomass_conversion-2"].reload()
			recipes["bi-acid"].enabled = true
			recipes["bi-acid"].reload()
			recipes["bi-sulfur"].enabled = true
			recipes["bi-sulfur"].reload()
			recipes["bio_boiler"].enabled = true
			recipes["bio_boiler"].reload()
			
		end
		
	end
  
  

	

end
