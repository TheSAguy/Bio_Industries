
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	
	if game.entity_prototypes["bi-large-wooden-chest"] then	
		if technologies["logistics-2"].researched then

			recipes["bi_large_wooden_chest"].enabled = true
			recipes["bi_large_wooden_chest"].reload()
				
		end
			
	end
		

end