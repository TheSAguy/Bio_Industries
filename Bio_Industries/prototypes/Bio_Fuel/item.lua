
   data:extend(
{
	

	---- Celluluse
	{
		type = "item",
		name = "bi-cellulose",
		icon = "__Bio_Industries__/graphics/icons/cellulose.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[cellulose]",
		stack_size = 200
	},

	--- BioReactor
	{
		type = "item",
		name = "bi-bioreactor",
		icon = "__Bio_Industries__/graphics/icons/bioreactor.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "z[bi]-a[bi-bioreactor]",
		place_result = "bi-bioreactor",
		stack_size = 10
	},
	--- Bio Boiler
	{
		type = "item",
		name = "bio_boiler",
		icon = "__Bio_Industries__/graphics/icons/bio_boiler.png",
		flags = {"goes-to-quickbar"},
		subgroup = "energy",
		order = "b[steam-power]-b[boiler]",
		place_result = "bio_boiler",
		stack_size = 50
	},
	
})
