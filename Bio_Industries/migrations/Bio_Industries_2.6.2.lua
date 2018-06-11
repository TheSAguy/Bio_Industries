
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


    if game.item_prototypes["bi-large-wooden-chest"] and technologies["logistics"].researched then
		
		recipes["bi_recipe_large_wooden_chest"].enabled = true
		recipes["bi_recipe_large_wooden_chest"].reload()

	end
	
  	if game.item_prototypes["bi-huge-wooden-chest"] and technologies["logistics-2"].researched then
		
		recipes["bi_recipe_huge_wooden_chest"].enabled = true
		recipes["bi_recipe_huge_wooden_chest"].reload()

	end
 
   	if game.item_prototypes["bi-giga-wooden-chest"] and technologies["logistics-3"].researched then
		
		recipes["bi_recipe_giga_wooden_chest"].enabled = true
		recipes["bi_recipe_giga_wooden_chest"].reload()

	end
	
	
  	if game.item_prototypes["resin"] and technologies["bi_tech_bio_farming"].researched then

		recipes["bi_recipe_resin_pulp"].enabled = true
		recipes["bi_recipe_resin_pulp"].reload()
		recipes["bi_recipe_press_wood"].enabled = true
		recipes["bi_recipe_press_wood"].reload()
		
	end
 
  	if game.item_prototypes["resin"] and game.recipe_prototypes["bi_recipe_resin_wood"] and technologies["bi_tech_bio_farming"].researched then
		
		recipes["bi_recipe_resin_wood"].enabled = true
		recipes["bi_recipe_resin_wood"].reload()

		
	end 
  
 
  	if technologies["bi-tech-coal-processing-1"].researched then
		
		recipes["bi_recipe_stone_brick"].enabled = true
		recipes["bi_recipe_stone_brick"].reload()

		
	end 
 
  force.reset_recipes()
  force.reset_technologies()

	

end