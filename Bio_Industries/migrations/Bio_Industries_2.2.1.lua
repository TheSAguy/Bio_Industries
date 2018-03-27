
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


  	if game.entity_prototypes["bi-Arboretum-Area"] then	
		if technologies["bi_bio_farming"].researched then
		
			recipes["bi_Arboretum"].enabled = true
			recipes["bi_Arboretum"].reload()
			recipes["bi_Arboretum_r1"].enabled = true
			recipes["bi_Arboretum_r1"].reload()

		end


		if technologies["bi-fertiliser"].researched then
		
			recipes["bi_Arboretum_r2"].enabled = true
			recipes["bi_Arboretum_r2"].reload()
			recipes["bi_Arboretum_r4"].enabled = true
			recipes["bi_Arboretum_r4"].reload()

		end	

		if technologies["bi-advanced-biotechnologyr"].researched then
		
			recipes["bi_Arboretum_r3"].enabled = true
			recipes["bi_Arboretum_r3"].reload()
			recipes["bi_Arboretum_r5"].enabled = true
			recipes["bi_Arboretum_r5"].reload()

		end	
		
	end
  

  force.reset_recipes()
  force.reset_technologies()

	

end