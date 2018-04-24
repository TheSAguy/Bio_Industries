data:extend({
  

	--- Basic Dart Ammo
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
		  result = "bi-basic-dart-magazine",
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
		  result = "bi-basic-dart-magazine",
		  result_count = 8,
		},
	}, 	

	--- Standard Dart Ammo
	{
		type = "recipe",
		name = "bi_recipe_standard_dart_magazine",
		normal =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
				{"bi-basic-dart-magazine", 10},
				{"copper-plate", 5},
			},
		  result = "bi-standard-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"bi-basic-dart-magazine", 8},
				{"copper-plate", 5},
			},
		  result = "bi-standard-dart-magazine",
		  result_count = 8,
		},
	}, 	

	
	--- Enhanced Dart Ammo
	{
		type = "recipe",
		name = "bi_recipe_enhanced_dart_magazine",
		normal =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
				{"bi-standard-dart-magazine", 10},
				{"plastic-bar", 5},
			},
		  result = "bi-enhanced-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"bi-standard-dart-magazine", 8},
				{"plastic-bar", 5},
			},
		  result = "bi-enhanced-dart-magazine",
		  result_count = 8,
		},
	}, 	

	--- Poison Dart Ammo
	{
		type = "recipe",
		name = "bi_recipe_poison_dart_magazine",
		normal =
		{
			enabled = false,
			energy_required = 5,
			ingredients = 
			{
				{"bi-enhanced-dart-magazine", 10},
				{"poison-capsule", 5},
			},
		  result = "bi-poison-dart-magazine",
		  result_count = 10,
		},
		expensive =
		{
			enabled = false,
			energy_required = 8,
			ingredients = 
			{
				{"bi-enhanced-dart-magazine", 8},
				{"poison-capsule", 5},
			},
		  result = "bi-poison-dart-magazine",
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