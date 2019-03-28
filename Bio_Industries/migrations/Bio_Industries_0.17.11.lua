
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;


 
  	if game.technology_prototypes["bi_tech_bio_cannon"] and technologies["bi_tech_bio_cannon"].researched then
	
	
		recipes["bi_recipe_bio_cannon_proto_ammo"].enabled = true
		recipes["bi_recipe_bio_cannon_proto_ammo"].reload()

	
	end
	

  force.reset_recipes()
  force.reset_technologies()

	

end