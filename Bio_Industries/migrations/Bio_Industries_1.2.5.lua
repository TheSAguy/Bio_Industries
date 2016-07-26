
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	
	if technologies["advanced-material-processing"].researched and force.recipes["bi-steel-furnace-disassemble"] then
		recipes["bi-steel-furnace-disassemble"].enabled = true
		recipes["bi-steel-furnace-disassemble"].reload()
	end
	
	
end
