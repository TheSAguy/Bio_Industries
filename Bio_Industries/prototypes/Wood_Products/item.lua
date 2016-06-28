data:extend({

	{
		type = "item",
		name = "bi-big-wooden-pole",
		icon = "__Bio_Industries__/graphics/icons/big-wooden-pole.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy-pipe-distribution",
		order = "a[energy]-b[small-electric-pole]",
		place_result = "bi-big-wooden-pole",
		stack_size = 50,
		fuel_value = "20MJ"

	},

	{
		type = "item",
		name = "bi-wooden-fence",
		icon = "__Bio_Industries__/graphics/icons/wooden-fence.png",
		flags = {"goes-to-quickbar"},
		subgroup = "defensive-structure",
		order = "a-a[stone-wall]-a[wooden-fence]",
		place_result = "bi-wooden-fence",
		fuel_value = "24MJ",
		stack_size = 50
	},

	{
		type = "rail-planner",
		name = "bi-rail-wood",
		icon = "__Bio_Industries__/graphics/icons/rail-wood.png",
		icon = "__Bio_Industries__/graphics/icons/rail-wood.png",
		flags = {"goes-to-quickbar"},
		subgroup = "transport",
		order = "a[train-system]-a[rail]",
		place_result = "bi-straight-rail-wood",
		stack_size = 100,
		straight_rail = "bi-straight-rail-wood",
		curved_rail = "bi-curved-rail-wood"
	},

	
})

