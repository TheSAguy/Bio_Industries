
game.reload_script()


for index, force in pairs(game.forces) do
  local technologies = force.technologies;
  local recipes = force.recipes;

  force.reset_recipes()
  force.reset_technologies()

  

	if settings.startup["BI_Recipe_Tweaks"] and settings.startup["BI_Recipe_Tweaks"].value then  

			if technologies["automation-2"].researched then
					recipes["bi_burner_mining_drill_disassemble"].enabled = true
					recipes["bi_burner_mining_drill_disassemble"].reload()
					recipes["bi_stone_furnace_disassemble"].enabled = true
					recipes["bi_stone_furnace_disassemble"].reload()
					recipes["bi_burner_inserter_disassemble"].enabled = true
					recipes["bi_burner_inserter_disassemble"].reload()
					recipes["bi_long_handed_inserter_disassemble"].enabled = true
					recipes["bi_long_handed_inserter_disassemble"].reload()					
	
					
			end	

	end  
	
	

end
