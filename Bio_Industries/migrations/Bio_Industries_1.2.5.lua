
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

	
	if technologies["advanced-material-processing"].researched and force.recipes["bi_steel_furnace_disassemble"] then
		recipes["bi_steel_furnace_disassemble"].enabled = true
		recipes["bi_steel_furnace_disassemble"].reload()
	end
	
	
end
