data:extend({

	---- Seed
	{
		type = "item",
		name = "bi-seed",
		icon = "__Bio_Industries__/graphics/icons/bio_seed.png",
		icon_size = 32,
		category = "biofarm-mod-greenhouse",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "x[bi]-a[bi-seed]",
		fuel_value = "0.5MJ",
		fuel_category = "chemical",
		stack_size= 800
	},


	---- Seedling
	{
		type = "item",
		name = "seedling",
		icon = "__Bio_Industries__/graphics/icons/Seedling.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "x[bi]-b[bi-seedling]",
		place_result="seedling",
		fuel_value = "1MJ",
		fuel_category = "chemical",
		stack_size= 400
	},

  ----Bio Farm
	{
		type= "item",
		name= "bi_bio_farm",
		icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon.png",
		icon_size = 32,
		flags= { "goes-to-quickbar" },
		subgroup = "production-machine",
		order = "x[bi]-a[bi_bio_farm]",
		place_result = "bi_bio_farm",
		stack_size= 10,
	},
  
  ---- Light inside Bio Farm (Hidden)
	{
		type= "item",
		name= "bi_light_for_Bio_Farm",
		icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Lamp.png",
		icon_size = 32,
		flags = {"hidden"},
		subgroup = "production-machine",
		order = "x[bi]-a[bi_bio_farm]",
		place_result = "bi_light_for_Bio_Farm",
		stack_size= 10,
		enable = false,
	},
  
  ---- Electric pole inside Bio Farm (Hidden)
	{
		type = "item",
		name = "bi_medium-electric-pole_for_Bio_Farm",
		icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Cabeling.png",
		icon_size = 32,
		flags = {"hidden"},
		subgroup = "energy-pipe-distribution",
		order = "x[bi]-a[bi_bio_farm]",
		place_result = "bi_medium-electric-pole_for_Bio_Farm",
		stack_size = 50,
		enable = false,
	},
  
  ----- Solar Panel inside Bio Farm (Hidden)
	{
		type = "item",
		name = "bi_solar-panel_for_Bio_Farm",
		icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Solar.png",
		icon_size = 32,
		flags = {"hidden"},
		subgroup = "energy",
		order = "x[bi]-a[bi_bio_farm]",
		place_result = "bi_solar-panel_for_Bio_Farm",
		stack_size = 50,
		enable = false,
	},
  
  
  ----Bio Greenhouse (Nursery)
	{
		type= "item",
		name= "bio-greenhouse",
		icon = "__Bio_Industries__/graphics/icons/bio_greenhouse.png",
		icon_size = 32,
		flags= { "goes-to-quickbar" },
		subgroup = "production-machine",
		order = "x[bi]-a[bi_bio_greenhouse]",
		place_result = "bio-greenhouse",
		stack_size= 10,
	},
  
 	--- Cokery
	{
		type = "item",
		name = "bi-cokery",
		icon = "__Bio_Industries__/graphics/icons/cokery.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "x[bi]-b[bi-cokery]",
		place_result = "bi-cokery",
		stack_size = 10
	},

	--- Stone Crusher
	{
		type = "item",
		name = "bi-stone-crusher",
		icon = "__Bio_Industries__/graphics/icons/stone_crusher.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "x[bi]-c[bi-stone-crusher]",
		place_result = "bi-stone-crusher",
		stack_size = 10
	},

  --- Wood Pulp
	{
		type = "item",
		name = "bi-woodpulp",
		icon = "__Bio_Industries__/graphics/icons/Woodpulp_32.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		fuel_value = "2MJ",
		fuel_category = "chemical",
		subgroup = "raw-material",	
		order = "b[woodpulp]",			
		order = "a-b[bi-woodpulp]",
		stack_size = 800
	},  

		--- Ash 
	{
		type = "item",
		name = "bi-ash",
		icon = "__Bio_Industries__/graphics/icons/ash.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "a[bi]-a-b[bi-ash]",
		stack_size = 400
	},
	
	--- Charcoal
	{
		type = "item",
		name = "bi-charcoal",
		icon = "__Bio_Industries__/graphics/icons/charcoal.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		fuel_value = "6MJ",
		fuel_category = "chemical",
		subgroup = "raw-material",
		order = "a[bi]-a-c[charcoal]",
		stack_size = 400
	},  

	--- Coke Coal
	{
		type = "item",
		name = "bi-coke-coal",
		icon = "__Bio_Industries__/graphics/icons/coke-coal.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		fuel_value = "18MJ",
		fuel_category = "chemical",
		fuel_acceleration_multiplier = 1.1,
		fuel_top_speed_multiplier = 1.025,
		subgroup = "raw-material",
		order = "a[bi]-a-e[bi-coke-coal]",
		stack_size = 400
	},


	--- Crushed Stone
	{
		type = "item",
		name = "stone-crushed",
		icon = "__Bio_Industries__/graphics/icons/crushed-stone.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "a[bi]-a-z[stone-crushed]",
		stack_size = 800
	},

--- Intermediate items
	--- Fertiliser
	{
		type = "item",
		name = "fertiliser",
		icon = "__Bio_Industries__/graphics/icons/fertiliser_32.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[fertiliser]",
		stack_size = 200,
	    place_as_tile =
		{
			result = "grass-3",
			condition_size = 1,
			condition = { "water-tile" }
		},	
	},
	
	--- Adv Fertiliser
	{
		type = "item",
		name = "bi-adv-fertiliser",
		icon = "__Bio_Industries__/graphics/icons/advanced_fertiliser_32.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[fertiliser]-b[bi-adv-fertiliser]",
		stack_size = 200,
		place_as_tile =
		{
			result = "grass-1",
			condition_size = 1,
			condition = { "water-tile" }
		},	
	},	

	
})
