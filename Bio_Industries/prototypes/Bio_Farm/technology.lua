
---- Bio Farm
data:extend({
  
	{
		type = "technology",
		name = "bi_bio_farming",
		icon_size = 128,
		icon = "__Bio_Industries__/graphics/technology/Bio_Farm_Tech_128.png",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "bi-Seedling_Mk1"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-Logs_Mk1"
			},
			{
				type = "unlock-recipe",
				recipe = "bi_seed_1"
			},
			{
				type = "unlock-recipe",
				recipe = "bi_bio_farm"
			},		
			{
				type = "unlock-recipe",
				recipe = "bio_greenhouse"
			},	

		},
		prerequisites = {"optics"},
		unit =
		{
			count = 20,
			ingredients =
			{
			  {"science-pack-1", 1}
			},
			time = 20
		},
	},

	{
		type = "technology",
		name = "bi-coal-processing",
		icon_size = 128,
		icon = "__Bio_Industries__/graphics/technology/Coal_128.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "bi-charcoal"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-charcoal-2"
			},

			{
				type = "unlock-recipe",
				recipe = "bi-ash"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-ash-2"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-woodpulp"
			},
			{
				type = "unlock-recipe",
				recipe = "bi_seed_2"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-Seedling_Mk2"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-Logs_Mk2"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-cokery"
			}
		},
		prerequisites = {"advanced-material-processing"},
		unit = 
		{
			count = 100,
			ingredients = {
				{"science-pack-1", 2},
				{"science-pack-2", 1}
			},
			time = 30
		},
	},

	{
		type = "technology",
		name = "bi-coal-processing-2",
		icon_size = 128,
		icon = "__Bio_Industries__/graphics/technology/Coal_128.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "bi-coal"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-coke-coal"
			},
		},
		prerequisites =	{"bi-coal-processing"},
		unit = 
		{
			count = 100,
			ingredients = {
				{"science-pack-1", 3},
				{"science-pack-2", 2},
				{"science-pack-3", 1},
			},
			time = 35
		},
		upgrade = true,
	},

	{
		type = "technology",
		name = "bi-coal-processing-3",
		icon_size = 128,
		icon = "__Bio_Industries__/graphics/technology/Coal_128.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "bi-coal-2"
			},
		},
		prerequisites = {"bi-coal-processing-2"},
		unit = 
		{
			count = 100,
			ingredients = {
				{"science-pack-1", 3},
				{"science-pack-2", 2},
				{"science-pack-3", 1},
				{"production-science-pack", 1},
			},
			time = 40
		},
		upgrade = true,
	},

	{
		type = "technology",
		name = "bi-fertiliser",
		icon_size = 128,
		icon = "__Bio_Industries__/graphics/technology/Fertiliser_128.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "bi-liquid-air"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-nitrogen"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-fertiliser"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-Seedling_Mk3"
			},
			{
				type = "unlock-recipe",
				recipe = "bi_seed_3"
			},	
			{
            type = "unlock-recipe",
            recipe = "bi-Logs_Mk3"
			},
			{
            type = "unlock-recipe",
            recipe = "bi-Bio_Garden"
			},
			{
            type = "unlock-recipe",
            recipe = "bi-Clean_Air"
			}

		},
		prerequisites = 
		{
			"fluid-handling",
			"bi_bio_farming"
		},
		unit = {
			count = 200,
			ingredients = {
				{"science-pack-1", 2},
				{"science-pack-2", 1}
			},
			time = 30
		}
	},

})

