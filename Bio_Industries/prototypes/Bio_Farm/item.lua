data:extend({


  ----Bio Farm
		{
		type= "item",
		name= "bi_bio_farm",
		icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon.png",
		flags= { "goes-to-quickbar" },
		subgroup = "production-machine",
		order = "a[bi]-a[bi_bio_farm]",
		place_result = "bi_bio_farm",
		stack_size= 10,
	},
  
  ---- Light inside Bio Farm
	{
		type= "item",
		name= "bi_light_for_Bio_Farm",
		icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Lamp.png",
		flags = {"hidden"},
		subgroup = "production-machine",
		order = "a[bi]-a[bi_bio_farm]",
		place_result = "bi_light_for_Bio_Farm",
		stack_size= 10,
		enable = false,
	},
  
  ---- Electric pole inside Bio Farm
	{
		type = "item",
		name = "bi_medium-electric-pole_for_Bio_Farm",
		icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Cabeling.png",
		flags = {"hidden"},
		subgroup = "energy-pipe-distribution",
		order = "a[bi]-a[bi_bio_farm]",
		place_result = "bi_medium-electric-pole_for_Bio_Farm",
		stack_size = 50,
		enable = false,
	},
  
  ----- Solar Panel inside Bio Farm
	{
		type = "item",
		name = "bi_solar-panel_for_Bio_Farm",
		icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Solar.png",
		flags = {"hidden"},
		subgroup = "energy",
		order = "a[bi]-a[bi_bio_farm]",
		place_result = "bi_solar-panel_for_Bio_Farm",
		stack_size = 50,
		enable = false,
	},
  
 	--- Cokery
	{
		type = "item",
		name = "bi-cokery",
		icon = "__Bio_Industries__/graphics/icons/cokery.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "a[bi]-b[bi-cokery]",
		place_result = "bi-cokery",
		stack_size = 10
	},

	--- Stone Crusher
	{
		type = "item",
		name = "bi-stone-crusher",
		icon = "__Bio_Industries__/graphics/icons/stone-crusher.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "a[bi]-c[bi-stone-crusher]",
		place_result = "bi-stone-crusher",
		stack_size = 10
	},

	
  -- Raw Msterials
  ---- Seedling
	{
		type = "item",
		name = "bi-seedling",
		icon = "__Bio_Industries__/graphics/icons/Seedling.png",
		flags = { "goes-to-quickbar" },
		subgroup = "raw-material",
		stack_size= 50,
	},
  
  --- Wood Pulp
	{
		type = "item",
		name = "bi-woodpulp",
		icon = "__Bio_Industries__/graphics/icons/Woodpulp_32.png",
		flags = {"goes-to-main-inventory"},
		fuel_value = "2MJ",
		subgroup = "raw-material",	
		order = "b[woodpulp]",
		stack_size = 200
	},  

	--- Charcoal
	{
		type = "item",
		name = "bi-charcoal",
		icon = "__Bio_Industries__/graphics/icons/charcoal.png",
		flags = {"goes-to-main-inventory"},
		fuel_value = "6MJ",
		subgroup = "raw-material",
		order = "b[charcoal]",
		stack_size = 50
	},  

	--- Coke Coal
	{
		type = "item",
		name = "bi-coke-coal",
		icon = "__Bio_Industries__/graphics/icons/coke-coal.png",
		flags = {"goes-to-main-inventory"},
		fuel_value = "18MJ",
		subgroup = "raw-material",
		order = "b[coke-coal]",
		stack_size = 50
	},

	--- Ash 1
	{
		type = "item",
		name = "bi-ash",
		icon = "__Bio_Industries__/graphics/icons/ash.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "b[ash]",
		stack_size = 200
	},

	--- Crushed Stone
	{
		type = "item",
		name = "bi-crushed-stone",
		icon = "__Bio_Industries__/graphics/icons/crushed-stone.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "b[crushed-stone]",
		stack_size = 100
	},

--- Intermediate items
	--- Fertiliser
	{
		type = "item",
		name = "fertiliser",
		icon = "__Bio_Industries__/graphics/icons/fertiliser_32.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[fertiliser]",
		stack_size = 200
	},
	
	--- Adv Fertiliser
	{
		type = "item",
		name = "bi-adv-fertiliser",
		icon = "__Bio_Industries__/graphics/icons/advanced_fertiliser_32.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "c[fertiliser]",
		stack_size = 200
	},	

	
})
