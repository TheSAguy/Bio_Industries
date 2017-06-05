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
		  {"raw-wood", 6}
		},
		result = "bi-rail-wood",
		result_count = 2,
		requester_paste_multiplier = 4
  },

--- Bridge Rail
    {
		type = "recipe",
		name = "bi-rail-wood-bridge",
		enabled = false,
		ingredients =
		{	  
		  {"iron-stick", 4},
		  {"steel-plate", 1},
		  {"raw-wood", 24}
		},
		result = "bi-rail-wood-bridge",
		result_count = 2,
		requester_paste_multiplier = 4
  },

  
  
 })

