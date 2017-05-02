
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

		
	

end
