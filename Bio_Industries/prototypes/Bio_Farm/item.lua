data:extend({

 {
    type = "item",
    name = "bi-seedling",
    icon = "__Bio_Industries__/graphics/icons/Seedling.png",
    flags = { "goes-to-quickbar" },
	subgroup = "raw-material",
    stack_size= 50,
  },
  {
    type= "item",
    name= "bi_bio_farm",
    icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Icon.png",
    flags= { "goes-to-quickbar" },
    subgroup = "production-machine",
    place_result = "bi_bio_farm",
    stack_size= 10,
  },
  
  {
    type= "item",
    name= "bi_light_for_Bio_Farm",
    icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Lamp.png",
    flags = {"hidden"},
    subgroup = "production-machine",
    place_result = "bi_light_for_Bio_Farm",
    stack_size= 10,
	enable = false,
  },
  
  {
    type = "item",
    name = "bi_medium-electric-pole_for_Bio_Farm",
    icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Cabeling.png",
    flags = {"hidden"},
    subgroup = "energy-pipe-distribution",
    place_result = "bi_medium-electric-pole_for_Bio_Farm",
    stack_size = 50,
	enable = false,
  },
  {
    type = "item",
    name = "bi_solar-panel_for_Bio_Farm",
    icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Solar.png",
    flags = {"hidden"},
    subgroup = "energy",
    place_result = "bi_solar-panel_for_Bio_Farm",
    stack_size = 50,
	enable = false,
  },
  
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

  
  
})


   data:extend(
{
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

	{
		type = "item",
		name = "bi-ash",
		icon = "__Bio_Industries__/graphics/icons/ash.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "b[ash]",
		stack_size = 200
	},

	{
		type = "item",
		name = "bi-crushed-stone",
		icon = "__Bio_Industries__/graphics/icons/crushed-stone.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "raw-material",
		order = "b[crushed-stone]",
		stack_size = 100
	},

	{
		type = "item",
		name = "bi-fertilizer",
		icon = "__Bio_Industries__/graphics/icons/fertilizer_32.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[fertilizer]",
		stack_size = 200
	},
	{
		type = "item",
		name = "bi-adv-fertilizer",
		icon = "__Bio_Industries__/graphics/icons/advanced_fertilizer_32.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "c[fertilizer]",
		stack_size = 200
	},	

	{
		type = "item",
		name = "bi-cellulose",
		icon = "__Bio_Industries__/graphics/icons/cellulose.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "intermediate-product",
		order = "b[cellulose]",
		stack_size = 200
	},

	{
		type = "item",
		name = "bi-cokery",
		icon = "__Bio_Industries__/graphics/icons/cokery.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "zzz[cokery]",
		place_result = "bi-cokery",
		stack_size = 10
	},

	{
		type = "item",
		name = "bi-stone-crusher",
		icon = "__Bio_Industries__/graphics/icons/stone-crusher.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "zzz[stone-crusher]",
		place_result = "bi-stone-crusher",
		stack_size = 10
	},

	{
		type = "item",
		name = "bi-bioreactor",
		icon = "__Bio_Industries__/graphics/icons/bioreactor.png",
		flags = {"goes-to-quickbar"},
		subgroup = "production-machine",
		order = "zzz[bioreactor]",
		place_result = "bi-bioreactor",
		stack_size = 10
	},
	
})
