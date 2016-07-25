
--- Bio Tweaks
data:extend(
{
 
	{
		type = "recipe",
		name = "bi-burner-mining-drill-disassemble",
		icon = "__Bio_Industries__/graphics/icons/burner-mining-drill_disassemble.png",
		subgroup = "extraction-machine",
		order = "a[items]-a[burner-mining-drill]",
		energy_required = 2,
		ingredients =
		{
		  {"burner-mining-drill", 1},
		},
		results=
		{
		  {"iron-gear-wheel", 2},
		  {"stone-furnace", 1},
		  {"iron-plate", 2}
		},
		--enabled = false
	},

	{
		type = "recipe",
		name = "bi-steel-furnace-disassemble",
		icon = "__Bio_Industries__/graphics/icons/steel-furnace_disassemble.png",
		subgroup = "smelting-machine",
		order = "b[steel-furnace]",
		energy_required = 2,
		ingredients =
			{
			  {"steel-furnace", 1},
			},
		results=		
			{
			  {"steel-plate", 6},
			  {"stone-brick", 6}
			},
			
		enabled = false
  },

})

