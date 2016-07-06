
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	if game.entity_prototypes["bi_bio_farm"] then	
		if technologies["bi_bio_farming"].researched then
			recipes["bi-seedling"].enabled = true
			recipes["bi-seedling"].reload()
			recipes["bi-Logs_Mk1"].enabled = true
			recipes["bi-Logs_Mk1"].reload()
			recipes["bi_bio_farm"].enabled = true
			recipes["bi_bio_farm"].reload()		
		end
		
		if technologies["bi-fertiliser"].researched then
			recipes["bi-Logs_Mk2"].enabled = true
			recipes["bi-Logs_Mk2"].reload()
			recipes["bi-fertiliser"].enabled = true
			recipes["bi-fertiliser"].reload()
			recipes["bi-nitrogen"].enabled = true
			recipes["bi-nitrogen"].reload()
			recipes["bi-liquid-air"].enabled = true
			recipes["bi-liquid-air"].reload()
			if game.entity_prototypes["bi-Bio_Garden"] then	
				recipes["bi-Bio_Garden"].enabled = true
				recipes["bi-Bio_Garden"].reload()
				recipes["bi-Clean_Air"].enabled = true
				recipes["bi-Clean_Air"].reload()
			end
		end
		
	end

	if game.entity_prototypes["bi-stone-crusher"] then	
		if technologies["automation-2"].researched then
			recipes["bi-stone-crusher"].enabled = true
			recipes["bi-stone-crusher"].reload()
			recipes["bi-crushed-stone"].enabled = true
			recipes["bi-crushed-stone"].reload()
		end
	end
	
	if game.entity_prototypes["bi-big-wooden-pole"] then	
		if technologies["logistics"].researched then
			recipes["bi-big-wooden-pole"].enabled = true
			recipes["bi-big-wooden-pole"].reload()
		end
	
		if technologies["railway"].researched then
			recipes["bi-rail-wood"].enabled = true
			recipes["bi-rail-wood"].reload()
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
