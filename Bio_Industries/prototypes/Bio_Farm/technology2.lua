

data:extend(
{


	{
		type = "technology",
		name = "bi-advanced-biotechnology",
		icon_size = 128,
		icon = "__Bio_Industries__/graphics/technology/Biomass_128.png",
		effects = {
			
			{
				type = "unlock-recipe",
				recipe = "bi_seed_4"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-Seedling_Mk4"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-Logs_Mk4"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-adv-fertiliser-2"
			},
		},
		prerequisites = {
			"bi-fertiliser"
		},
		unit = {
			count = 200,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1},
			},
			time = 30
		}
	},

})

