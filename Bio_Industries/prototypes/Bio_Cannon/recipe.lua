data:extend({

-- Hive Buster Turret
 {
    type = "recipe",
    name = "Bio_Cannon",

	normal =
		{
			enabled = false,
			energy_required = 50,
			ingredients = 
			{
			  {"advanced-circuit", 25},    
			  {"radar", 1},
			  {"steel-plate", 80},
			  {"electric-engine-unit", 5},
			},
		  result = "Bio_Cannon_Area",
		  result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 100,
			ingredients = 
			{
			  {"advanced-circuit", 25},    
			  {"radar", 1},
			  {"steel-plate", 120},
			  {"electric-engine-unit", 15},
			},
		  result = "Bio_Cannon_Area",
		  result_count = 1,
		},
	
 },
 
})