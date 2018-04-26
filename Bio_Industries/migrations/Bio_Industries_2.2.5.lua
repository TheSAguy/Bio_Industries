
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


  	if game.entity_prototypes["bi-arboretum-area"] then	
		if  game.technology_prototypes["bi_tech_bio_farming"] and technologies["bi_tech_bio_farming"].researched then
		
			recipes["bi_recipe_arboretum"].enabled = true
			recipes["bi_recipe_arboretum"].reload()
			recipes["bi_recipe_arboretum_r1"].enabled = true
			recipes["bi_recipe_arboretum_r1"].reload()

		end


		if  game.technology_prototypes["bi_tech_fertiliser"] and technologies["bi_tech_fertiliser"].researched then
		
			recipes["bi_recipe_arboretum_r2"].enabled = true
			recipes["bi_recipe_arboretum_r2"].reload()
			recipes["bi_recipe_arboretum_r4"].enabled = true
			recipes["bi_recipe_arboretum_r4"].reload()

		end	

		if game.technology_prototypes["bi_tech_advanced_biotechnology"] and technologies["bi_tech_advanced_biotechnology"].researched then
						 
			recipes["bi_recipe_arboretum_r3"].enabled = true
			recipes["bi_recipe_arboretum_r3"].reload()
			recipes["bi_recipe_arboretum_r5"].enabled = true
			recipes["bi_recipe_arboretum_r5"].reload()

		end	
		
	end
  

  force.reset_recipes()
  force.reset_technologies()

	

end