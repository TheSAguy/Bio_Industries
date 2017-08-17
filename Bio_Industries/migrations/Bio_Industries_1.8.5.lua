
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	
	if game.entity_prototypes["bi-stone-crusher"] then	
		if technologies["automation-2"].researched then
			recipes["bi-stone-crusher"].enabled = true
			recipes["bi-stone-crusher"].reload()
			recipes["bi-crushed-stone"].enabled = true
			recipes["bi-crushed-stone"].reload()
		end
	end
		

end