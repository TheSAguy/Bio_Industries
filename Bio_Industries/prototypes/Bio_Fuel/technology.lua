


data:extend(
{

	{
		type = "technology",
		name = "bi-organic-plastic",
		icon_size = 128,
		icon = "__Bio_Industries__/graphics/technology/Cellulose_128.png",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "bi-plastic-1"
			},
			{
				type = "unlock-recipe",
				recipe = "bi-plastic-2"
			}
		},
		prerequisites = {
			"bi-advanced-biotechnology"
		},
		unit = {
			count = 150,
			ingredients = {
				{"science-pack-1", 2},
				{"science-pack-2", 2},
				{"science-pack-3", 1},
				{"production-science-pack", 1},
			},
			time = 30
		}
	},

})

