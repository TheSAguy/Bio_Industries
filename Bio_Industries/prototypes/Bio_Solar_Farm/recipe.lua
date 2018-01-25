if BI.Settings.BI_Solar_Farm then
	data:extend({

		--- Bio Solar Farm
		{
			type = "recipe",
			name = "bi_bio_Solar_Farm",
			enabled = false,
			energy_required = 200,
			ingredients = 
			{
				{"solar-panel",50},
				{"medium-electric-pole",25},
				{"concrete",400},
						
			},
			result = "bi_bio_Solar_Farm"
		},
	})
end
	
data:extend({
	-- solar mat
	{
		type = "recipe",
		name = "bi_solar_mat",
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
})

if BI.Settings.BI_Accumulator then
	data:extend({	
		--- BI Accumulator
		{
			type = "recipe",
			name = "bi_accumulator",
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
		name = "bi_large_substation",
		enabled = false,
		ingredients =
		{
		  {"steel-plate", 10},
		  {"concrete",200},
		  {"substation", 4}
		},
		result = "bi-large-substation"
	  },
	  
		
	 })
end

