if BI.Settings.BI_Solar_Additions then

	data:extend({

	-- Solar Farm
	{
		type = "item",
		name = "bi_bio_Solar_Farm",
		icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon.png",
		icon_size = 32,
		flags= { "goes-to-quickbar" },
		subgroup = "energy",
		order = "d[solar-panel]-a[solar-panel]-a[bi_bio_Solar_Farm]",
		place_result = "bi_bio_Solar_Farm",
		stack_size = 10,
		--enable = false,
	  },

	--- Solar Mat
	  {
		type = "item",
		name = "bi-solar-mat",
		icon = "__Bio_Industries__/graphics/icons/solar-mat.png",
		icon_size = 32,
		flags = {"goes-to-main-inventory"},
		subgroup = "energy",
		order = "d[solar-panel]-aa[solar-panel-1-a]",
		stack_size = 400,
		place_as_tile =
			 {
			  result = "bi-solar-mat",
			  condition_size = 4,
			  condition = { "water-tile" }
			 }
	  },
		 

		--- BI Accumulator
		{
			type = "item",
			name = "bi_accumulator",
			icon = "__Bio_Industries__/graphics/icons/bi_LargeAccumulator.png",
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			subgroup = "energy",
			order = "e[accumulator]-a[bi-accumulator]",
			place_result = "bi_accumulator",
			stack_size = 5
		},
		
		
			--- Large Substation
		{
			type = "item",
			name = "bi-large-substation",
			icon = "__Bio_Industries__/graphics/icons/bi_LargeSubstation_icon.png",
			icon_size = 32,
			flags = {"goes-to-quickbar"},
			subgroup = "energy-pipe-distribution",
			order = "a[energy]-d[substation]-[large-substation]",
			place_result = "bi-large-substation",
			stack_size = 50
		},


    ----- Solar Panel for Solar Boiler
	{
		type = "item",
		name = "bi-Solar-Boiler-panel",
		icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Boiler_Icon.png",
		icon_size = 32,
		flags = {"goes-to-quickbar"},
		subgroup = "energy",
		order = "b[steam-power]-c[steam-engine]",
		place_result = "bi-Solar-Boiler-panel",
		stack_size = 50,
	--	enable = false,
	},	
	

  
  })
  
end