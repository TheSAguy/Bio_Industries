
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	

  	if game.entity_prototypes["seed-bomb-projectile-1"] then	
		if technologies["bi-fertiliser"].researched then
		
			recipes["bi_seed_bomb_basic"].enabled = true
			recipes["bi_seed_bomb_basic"].reload()
			recipes["bi_seed_bomb_standard"].enabled = true
			recipes["bi_seed_bomb_standard"].reload()
		end
		
	end
  
    if game.item_prototypes["bi-adv-fertiliser"] then	
		if technologies["bi-advanced-biotechnology"].researched then
		
			recipes["bi_seed_bomb_advanced"].enabled = true
			recipes["bi_seed_bomb_advanced"].reload()

		end
		
	end
  

end