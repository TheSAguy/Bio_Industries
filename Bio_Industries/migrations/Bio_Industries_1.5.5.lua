
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	if game.entity_prototypes["bi_bio_farm"] then	
		if technologies["bi-coal-processing"].researched then
			recipes["bi-woodpulp"].enabled = true
			recipes["bi-woodpulp"].reload()

		end
		
	end

			
	if game.entity_prototypes["bi_bio_Solar_Farm"] then
		if game.entity_prototypes["solar-panel-large"] then
			if technologies["bob-solar-energy-2"].researched then
					recipes["bi_bio_Solar_Farm"].enabled = true
					recipes["bi_bio_Solar_Farm"].reload()
			else
				if technologies["solar-energy"].researched then
					recipes["bi_bio_Solar_Farm"].enabled = true
					recipes["bi_bio_Solar_Farm"].reload()
				end
			end	
		end
	end  
	
	

end
