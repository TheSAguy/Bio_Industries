data:extend({

	
	{
		type = "recipe",
		name = "bi-big-wooden-pole",
		normal =
		{
			enabled = false,
			ingredients = 
			{
			  {"wood", 10},    
			  {"small-electric-pole", 2},  
			},
		  result = "bi-big-wooden-pole"
		},
		expensive =
		{
			enabled = false,
			ingredients = 
			{
			  {"wood", 20},    
			  {"small-electric-pole", 4},  
			},
		  result = "bi-big-wooden-pole"
		},	
	},
	
	
	{
		type = "recipe",
		name = "bi-wooden-fence",
		normal =
		{
			enabled = false,
			ingredients = 
			{
			  {"wood", 2},
			  {"raw-wood", 2}, 
			},
			result = "bi-wooden-fence",
		},
		expensive =
		{
			enabled = false,
			ingredients = 
			{
			  {"wood", 4},
			  {"raw-wood", 4}, 
			},
			result = "bi-wooden-fence",
		},	
	},
  

    {
		type = "recipe",
		name = "bi-rail-wood",	
		normal =
		{
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
		expensive =
		{
			enabled = false,
			ingredients = 
			{
			
			  {"stone", 1},
			  {"iron-stick", 1},
			  {"steel-plate", 1},
			  {"raw-wood", 6}
			},
			result = "bi-rail-wood",
			result_count = 1,
			requester_paste_multiplier = 4
		},	

  },

--- Bridge Rail
    {
		type = "recipe",
		name = "bi-rail-wood-bridge",	
		normal =
		{
			enabled = false,
			ingredients = 
			
			{	  
			  {"iron-stick", 4},
			  {"steel-plate", 1},
			  {"raw-wood", 32}
			},
			result = "bi-rail-wood-bridge",
			result_count = 2,
			requester_paste_multiplier = 4
		},
		expensive =
		{
			enabled = false,
			ingredients = 
			
			{	  
			  {"iron-stick", 4},
			  {"steel-plate", 1},
			  {"raw-wood", 32}
			},
			result = "bi-rail-wood-bridge",
			result_count = 1,
			requester_paste_multiplier = 4
		},

  },

  {
		type = "recipe",
		name = "bi_wood_pipe",
		normal =
		{
			energy_required = 1,
			enabled = false,
			ingredients = 
			{	  
			  {"copper-plate", 1},
			  {"raw-wood", 10}
			},
		  result = "bi-wood-pipe",
		  result_count = 4,
		  requester_paste_multiplier = 15
		},
		expensive =
		{
			energy_required = 2,
			enabled = false,
			ingredients = 
			{	  
			  {"copper-plate", 1},
			  {"raw-wood", 10}
			},
		  result = "bi-wood-pipe",
		  result_count = 4,
		  requester_paste_multiplier = 15
		},
  },
  
  
  
 })

