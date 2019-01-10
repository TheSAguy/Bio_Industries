if settings.startup["BI_Bio_Infinite_Fluids"] and settings.startup["BI_Bio_Infinite_Fluids"].value == true then

-------- Bio Drill

	data:extend({
	  
		--- Drill (Entity)
		{
		type = "item",
		name = "bi-drill-base",
		icon = "__Bio_Industries__/graphics/icons/bi_drill_icon.png",
		icon_size = 32,
		flags = { "goes-to-quickbar" },
		subgroup = "bio-bio-drill-drill",
		order = "x[bi]-a[bi-drill]",
		place_result = "bi-drill-base",
		stack_size = 10
	  },

		---- Worn Drill Bit
		{
		type = "item",
		name = "bi-worn-drill-bit",
		icon = "__Bio_Industries__/graphics/icons/worn_drill_bit_icon.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "bio-bio-drill-drill",
		order = "bi-drill_fix",
		stack_size = 50
	  },
	  
		---- Drill Bit Mk1
		{
		type = "item",
		name = "bi-drill-bit-mk1",
		icon = "__Bio_Industries__/graphics/icons/drill_bit_1_icon.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "bio-bio-drill-drill",
		order = "bi-drill_mk1",
		stack_size = 50
	  },
	  
		
		---- Drill Bit Mk2
		{
		type = "item",
		name = "bi-drill-bit-mk2",
		icon = "__Bio_Industries__/graphics/icons/drill_bit_2_icon.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "bio-bio-drill-drill",
		order = "bi-drill_mk2",
		stack_size = 50
	  },
	  
		 
		---- Drill Bit Mk3
		{
		type = "item",
		name = "bi-drill-bit-mk3",
		icon = "__Bio_Industries__/graphics/icons/drill_bit_3_icon.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "bio-bio-drill-drill",
		order = "bi-drill_mk3",
		stack_size = 50
	  },
	  
	 
		--- Burner Pump (Entity)
		{
		type = "item",
		name = "bi-burner-pump",
		icon = "__Bio_Industries__/graphics/icons/bi_basic_pumpjack.png",
		icon_size = 32,
		flags = { "goes-to-quickbar" },
		subgroup = "bio-bio-drill-drill",
		order = "0aaa",
		place_result = "bi-burner-pump",
		stack_size = 10
	  },

	  

	 --FLUIDS
	 -- "water-saline"
	{
		type = "fluid",
		name = "water-saline",
		icon = "__Bio_Industries__/graphics/icons/water-saline.png",
		icon_size = 32,
		default_temperature = 25,
		heat_capacity = "0.1KJ",
		base_color = {r = 0.9, g = 0.9, b = 1},
		flow_color = {r = 0.9, g = 0.9, b = 1},
		max_temperature = 100,
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
	},
	  
	  })
  
 end