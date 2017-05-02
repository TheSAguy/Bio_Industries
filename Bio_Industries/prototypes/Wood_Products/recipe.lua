data:extend({

	
	{
		type = "recipe",
		name = "bi-big-wooden-pole",
		ingredients = 
		{
		  {"wood", 10},    
		  {"small-electric-pole", 2},  
		},
		result = "bi-big-wooden-pole",
		enabled = false,
	},
	
	
	{
		type = "recipe",
		name = "bi-wooden-fence",
		
		ingredients =
		{
		  {"wood", 2},
		  {"raw-wood", 2},
		},
		result = "bi-wooden-fence",
		enabled = "true",
	},
  

    {
		type = "recipe",
		name = "bi-rail-wood",
		enabled = false,
		ingredients =
		{
		  {"stone", 1},
		  {"iron-stick", 1},
		  {"steel-plate", 1},
		  {"raw-wood", 4}
		},
		result = "bi-rail-wood",
		result_count = 2,
		requester_paste_multiplier = 4
  },

  
  
 })

