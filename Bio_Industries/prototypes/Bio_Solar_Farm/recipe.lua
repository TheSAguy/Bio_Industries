if BI.Settings.BI_Solar_Additions then

	data:extend({

		--- Bio Solar Farm
		{
			type = "recipe",
			name = "bi_recipe_bio_solar_farm",
			enabled = false,
			energy_required = 80,
			ingredients = 
			{
				{"solar-panel",50},
				{"medium-electric-pole",25},
				{"concrete",400},
						
			},
			result = "bi_bio_Solar_Farm"
		},


	-- solar mat
	{
		type = "recipe",
		name = "bi_recipe_solar_mat",
		enabled = false,
		energy_required = 5,
		ingredients = 
		{
		  {"steel-plate", 1},
		  {"advanced-circuit", 3},
		  {"copper-cable", 4}						
		},
		result = "bi-solar-mat"
	},
	

		--- BI Accumulator
		{
			type = "recipe",
			name = "bi_recipe_accumulator",
			energy_required = 80,
			enabled = false,
			ingredients =
			{
			  {"accumulator", 50},
			  {"copper-cable", 50},
			  {"concrete",200},
			},
			result = "bi_accumulator"
		},
		
		-- Large Substation	
	  {
		type = "recipe",
		name = "bi_recipe_huge_substation",
		enabled = false,
		ingredients =
		{
		  {"steel-plate", 10},
		  {"concrete",200},
		  {"substation", 4}
		},
		result = "bi-large-substation"
	  },
	  

			-- solar boiler
	{
		type = "recipe",
		name = "bi_recipe_solar_boiler_panel",
		enabled = false,
		energy_required = 5,
		ingredients = 
		{
		  {"solar-panel", 20},
		  {"storage-tank", 2},
		  {"boiler", 1}						
		},
		result = "bi-Solar-Boiler-panel"
	},
	
	
})

end
