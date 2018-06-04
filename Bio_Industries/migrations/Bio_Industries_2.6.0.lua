
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


  	if game.item_prototypes["bi-big-wooden-pole"] and technologies["logistics"].researched then
		
		recipes["bi_recipe_big_wooden_pole"].enabled = true
		recipes["bi_recipe_big_wooden_pole"].reload()

	end
 
  	if game.item_prototypes["bi-rail-wood"] and technologies["railway"].researched then
		
		recipes["bi_recipe_rail_wood"].enabled = true
		recipes["bi_recipe_rail_wood"].reload()

	end
  
 
  	if game.item_prototypes["bi-rail-wood-bridge"] and game.technology_prototypes["bob-railway-2"] and technologies["bob-railway-2"].researched then
	
	
		recipes["bi_recipe_rail_wood_bridge"].enabled = true
		recipes["bi_recipe_rail_wood_bridge"].reload()

	elseif game.item_prototypes["bi-rail-wood-bridge"] and technologies["rail-signals"].researched then
	
		recipes["bi_recipe_rail_wood_bridge"].enabled = true
		recipes["bi_recipe_rail_wood_bridge"].reload()
	
	end
	
	 
  	if game.item_prototypes["bi-bioreactor"] and game.technology_prototypes["bi_tech_advanced_biotechnology"] and technologies["bi_tech_advanced_biotechnology"].researched then
		
		recipes["bi_recipe_bioreactor"].enabled = true
		recipes["bi_recipe_bioreactor"].reload()

	end
  force.reset_recipes()
  force.reset_technologies()

	

end