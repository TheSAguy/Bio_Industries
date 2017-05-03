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
	
	-- solar mat
	{
		type = "recipe",
		name = "bi_solar_mat",
		enabled = false,
		energy_required = 5,
		ingredients = 
		{
		  {"steel-plate", 1},
		  {"electronic-circuit", 3},
		  {"copper-plate", 1}						
		},
		result = "bi-solar-mat"
	},
	

	
 })

