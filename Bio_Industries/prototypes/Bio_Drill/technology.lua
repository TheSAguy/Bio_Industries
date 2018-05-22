
---- Prospecting
data:extend({

		
	{
		type = "technology",
		name = "bi-tech-bio-inf-prospecting-1",
		icon = "__Bio_Industries__/graphics/technology/Prospecting_Inf_128.png",
		icon_size = 128,
		effects =
		{
		
		},
		prerequisites = {"bi-tech-bio-prospecting-3"},
		unit =
		{
			count_formula = "150+2^(L-10)*1000",
			ingredients =
			{
			  {"science-pack-1", 1},
			  {"science-pack-2", 1},
			  {"science-pack-3", 1},
			  {"high-tech-science-pack", 1},
			},
			time = 20
		},
		max_level = "infinite",
		upgrade = true,
		order = "d",
	},

	
  
	{
		type = "technology",
		name = "bi-tech-bio-prospecting-1",
		icon = "__Bio_Industries__/graphics/technology/Prospecting_128.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "bi_recipe_bio_drill"
			},
			{
				type = "unlock-recipe",
				recipe = "bi_recipe_drill_fix"
			},
			{
				type = "unlock-recipe",
				recipe = "bi_recipe_drill_mk1"
			},
			
		},
		prerequisites = {},
		unit =
		{
			count = 25,
			ingredients =
			{
			  {"science-pack-1", 1},
			},
			time = 20
		},
		upgrade = true,
		order = "a",
	},

	{
		type = "technology",
		name = "bi-tech-bio-prospecting-2",
		icon = "__Bio_Industries__/graphics/technology/Prospecting_128.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "bi_recipe_drill_mk2"
			},
			
		},
		prerequisites = {"bi-tech-bio-prospecting-1"},
		unit =
		{
			count = 50,
			ingredients =
			{
			  {"science-pack-1", 1},
			  {"science-pack-2", 1},
			},
			time = 20
		},
		upgrade = true,
		order = "b",
	},
	
	{
		type = "technology",
		name = "bi-tech-bio-prospecting-3",
		icon = "__Bio_Industries__/graphics/technology/Prospecting_128.png",
		icon_size = 128,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "bi_recipe_drill_mk3"
			},
			{
				type = "unlock-recipe",
				recipe = "bi_recipe_fresh_water"
			},		
		},
		prerequisites = {"bi-tech-bio-prospecting-2"},
		unit =
		{
			count = 100,
			ingredients =
			{
			  {"science-pack-1", 1},
			  {"science-pack-2", 1},
			  {"science-pack-3", 1},
			},
			time = 20
		},
		upgrade = true,
		order = "c",
	},


	
})

