
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

  			
	if game.entity_prototypes["bi-solar-mat"] then
		if game.entity_prototypes["solar-panel-large"] then
			if technologies["bob-solar-energy-2"].researched then
					recipes["bi_solar_mat"].enabled = true
					recipes["bi_solar_mat"].reload()
			else
				if technologies["solar-energy"].researched then
					recipes["bi_solar_mat"].enabled = true
					recipes["bi_solar_mat"].reload()
				end
			end	
		end
	end  
	
	

end
