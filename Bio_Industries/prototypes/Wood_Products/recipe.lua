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
		name = "bi_wooden_fence",
		normal =
		{
			enabled = true,
			ingredients = 
			{
			  {"wood", 2},
			  {"raw-wood", 2}, 
			},
			result = "bi-wooden-fence",
		},
		expensive =
		{
			enabled = true,
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
			  {"bi-rail-wood", 1},
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
			  {"bi-rail-wood", 1},
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
			enabled = true,
			ingredients = 
			{	  
			  {"copper-plate", 1},
			  {"raw-wood", 12}
			},
		  result = "bi-wood-pipe",
		  result_count = 4,
		  requester_paste_multiplier = 15
		},
		expensive =
		{
			energy_required = 2,
			enabled = true,
			ingredients = 
			{	  
			  {"copper-plate", 1},
			  {"raw-wood", 16}
			},
		  result = "bi-wood-pipe",
		  result_count = 4,
		  requester_paste_multiplier = 15
		},
  },
  
  
  {
		type = "recipe",
		name = "bi_pipe_to_ground_wood",
		normal =
		{
			energy_required = 2,
			enabled = true,
			ingredients = 
			{	  
			  {"copper-plate", 4},
			  {"bi-wood-pipe", 5}
			},
		  result = "bi-pipe-to-ground-wood",
		  result_count = 2,
		},
		expensive =
		{
			energy_required = 4,
			enabled = true,
			ingredients = 
			{	  
			  {"copper-plate", 5},
			  {"bi-wood-pipe", 6}
			},
		  result = "bi-pipe-to-ground-wood",
		  result_count = 2,
		},
  },

  {
    type = "recipe",
    name = "bi_large_wooden_chest",
	normal =
		{
			energy_required = 2,
			enabled = false,
			ingredients = 
			{	  
			  {"copper-plate", 2},
			  {"wooden-chest", 8}
			},
		  result = "bi-large-wooden-chest",
		  result_count = 1,
		  requester_paste_multiplier = 4
		},
	expensive =
		{
			energy_required = 4,
			enabled = false,
			ingredients = 
			{	  
			  {"copper-plate", 4},
			  {"wooden-chest", 8}
			},
		  result = "bi-large-wooden-chest",
		  result_count = 1,
		  requester_paste_multiplier = 4,
		},

  },
  

 })

