data:extend({
  

	--- Basic Dart
	{
		type = "recipe",
		name = "bi_recipe_basic_dart_magazine",
		
		normal =
		{
			enabled = true,
			energy_required = 5,
			ingredients = 
			{
				{"raw-wood", 5},
			},
		  result = "basic-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
				{"raw-wood", 5},
			},
		  result = "basic-dart-magazine",
		  result_count = 8,
		},
	}, 	
	
		--- Enhanced Dart
	{
		type = "recipe",
		name = "bi_recipe_enhanced_dart_magazine",
		--category = "crafting-with-fluid",
		
		normal =
		{
			enabled = true,
			energy_required = 5,
			ingredients = 
			{
				{"raw-wood", 5},
				{"copper-plate", 5},
			},
		  result = "enhanced-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
				{"raw-wood", 5},
				{"copper-plate", 5},
			},
		  result = "enhanced-dart-magazine",
		  result_count = 8,
		},
	}, 	


	--- Dart Turret
  {
    type = "recipe",
    name = "bi_recipe_dart_turret",
    	
	normal =
		{
			enabled = true,
			energy_required = 8,
			ingredients = 
			{
			  {"iron-gear-wheel", 5},
			  {"raw-wood", 20},
			},
		  result = "bio-turret",
		  result_count = 1,
		},
	
		expensive =
		{
			enabled = true,
			energy_required = 16,
			ingredients = 
			{
			  {"iron-gear-wheel", 10},
			  {"raw-wood", 25},
			},
		  result = "bio-turret",
		  result_count = 1,
		},
	

  },
	
	
})