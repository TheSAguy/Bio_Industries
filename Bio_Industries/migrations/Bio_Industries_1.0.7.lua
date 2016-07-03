
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()


	if technologies["bi_bio_farming"].researched then
		recipes["bi-seedling"].enabled = true
		recipes["bi-seedling"].reload()
		recipes["bi-Logs_Mk1"].enabled = true
		recipes["bi-Logs_Mk1"].reload()
		recipes["bi_bio_farm"].enabled = true
		recipes["bi_bio_farm"].reload()

	end
	
		
	if technologies["logistics"].researched then
		recipes["bi-big-wooden-pole"].enabled = true
		recipes["bi-big-wooden-pole"].reload()
	end
	
	if technologies["railway"].researched then
		recipes["bi-rail-wood"].enabled = true
		recipes["bi-rail-wood"].reload()
	end
	
	if technologies["bi-fertiliser"].researched then
		recipes["bi-Logs_Mk2"].enabled = true
		recipes["bi-Logs_Mk2"].reload()
		recipes["bi-fertiliser"].enabled = true
		recipes["bi-fertiliser"].reload()
		recipes["bi-nitrogen"].enabled = true
		recipes["bi-nitrogen"].reload()
		recipes["bi-Bio_Garden"].enabled = true
		recipes["bi-Bio_Garden"].reload()
		recipes["bi-Clean_Air"].enabled = true
		recipes["bi-Clean_Air"].reload()
		recipes["bi-stone-crusher"].enabled = true
		recipes["bi-stone-crusher"].reload()
		recipes["bi-crushed-stone"].enabled = true
		recipes["bi-crushed-stone"].reload()
		recipes["bi-liquid-air"].enabled = true
		recipes["bi-liquid-air"].reload()
	end
	

	if technologies["solar-energy"].researched then
		recipes["bi_Bio_Solar_Farm"].enabled = true
		recipes["bi_Bio_Solar_Farm"].reload()
	end

	  
	
end
