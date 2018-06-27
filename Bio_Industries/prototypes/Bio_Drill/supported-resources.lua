	-- prepare fluid resource array
	local infinite_fluids = {}
	
	table.insert(infinite_fluids, {dependency = "base", name = "crude-oil", fluid = "crude-oil", default = true})							-- Vanilla crude oil
	
	table.insert(infinite_fluids, {dependency = "Bio_Industries", name = "bi-ground-water", fluid = "water",  default = true})					-- Bio Industries (& Bob's ground water)
	
	table.insert(infinite_fluids, {dependency = "bobores", name = "lithia-water", fluid = "lithia-water",  default = true})					-- Bob's lithia water
	
	table.insert(infinite_fluids, {dependency = "angelsrefining", name = "angels-fissure", fluid = "thermal-water",  default = true})			-- Angel's Refining fissure (Thermal Water)
	table.insert(infinite_fluids, {dependency = "angelspetrochem", name = "angels-natural-gas", fluid = "gas-natural-1",  default = true})		-- Angel's Petrochem natural gas (Natural Gas)

	
	return infinite_fluids