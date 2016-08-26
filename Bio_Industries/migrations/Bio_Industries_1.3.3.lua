
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

		if game.item_prototypes["bi-cellulose"] then	
			if technologies["bi-organic-plastic"].researched then
				recipes["bi-plastic"].enabled = true
				recipes["bi-plastic"].reload()
			end
		end
end
