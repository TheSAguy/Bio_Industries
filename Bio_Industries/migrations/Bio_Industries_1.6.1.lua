
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


	if game.entity_prototypes["Bio_Cannon"] then	
		if technologies["military-2"].researched then
			recipes["Bio_Cannon"].enabled = true
			recipes["Bio_Cannon"].reload()
			recipes["Bio_Cannon_Basic_Ammo"].enabled = true
			recipes["Bio_Cannon_Basic_Ammo"].reload()
			recipes["Bio_Cannon_Poison_Ammo"].enabled = true
			recipes["Bio_Cannon_Poison_Ammo"].reload()
		end
	end	
		

			
	if game.entity_prototypes["bi_accumulator"] then
		if game.entity_prototypes["solar-panel-large"] then
			if technologies["bob-electric-energy-accumulators-2"].researched then
					recipes["bi_accumulator"].enabled = true
					recipes["bi_accumulator"].reload()
			else
				if technologies["solar-energy"].researched then
					recipes["bi_accumulator"].enabled = true
					recipes["bi_accumulator"].reload()
				end
			end	
		end
	end  


end
