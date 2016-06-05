
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
	recipes["bi-Bio_Garden"].enabled = true
    recipes["bi-Bio_Garden"].reload()
	recipes["bi-Clean_Air"].enabled = true
    recipes["bi-Clean_Air"].reload()
	end
	
	
	
	if technologies["bi-fertilizer"].researched then
		recipes["bi-Logs_Mk2"].enabled = true
		recipes["bi-Logs_Mk2"].reload()
		recipes["bi-fertilizer"].enabled = true
		recipes["bi-fertilizer"].reload()
	end
	
	
end
