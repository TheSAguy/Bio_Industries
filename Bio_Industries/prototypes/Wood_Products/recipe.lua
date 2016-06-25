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
		enabled = "false",
	},
	
	
	{
		type = "recipe",
		name = "bi-wooden-fence",
		
		ingredients =
		{
		  {"wood", 4},
		  {"raw-wood", 2},
		},
		result = "bi-wooden-fence",
		enabled = "true",
	},
  
  
    {
    type = "recipe",
    name = "bi-straight-rail-wood",
    enabled = false,
    ingredients =
    {
      {"stone", 1},
      {"iron-stick", 1},
      {"steel-plate", 1},
	  {"raw-wood", 4}
    },
    result = "bi-straight-rail-wood",
    result_count = 2
  },
  
  
  {
    type = "recipe",
    name = "bi-curved-rail-wood",
    enabled = false,
    ingredients = {{"stone", 4}, {"iron-stick", 4}, {"steel-plate", 4}, {"raw-wood", 12}},
    result = "bi-curved-rail-wood",
    result_count = 2
  },
  
 })

