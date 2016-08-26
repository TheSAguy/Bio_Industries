
--- Bio Tweaks
data:extend(
{
 
	{
		type = "recipe",
		name = "bi-burner-mining-drill-disassemble",
		icon = "__Bio_Industries__/graphics/icons/burner-mining-drill_disassemble.png",
		subgroup = "extraction-machine",
		category = "advanced-crafting",
		order = "a[items]-a[burner-mining-drill]",
		energy_required = 2,
		ingredients =
		{
		 -- {type="fluid", name="water", amount=50},
		  {type="item", name="burner-mining-drill", amount=1},   	  
		},
		results=
		{
			{"stone", 4},
			{"iron-plate", 6}
		},
	},

	{
		type = "recipe",
		name = "bi-steel-furnace-disassemble",
		icon = "__Bio_Industries__/graphics/icons/steel-furnace_disassemble.png",
		subgroup = "smelting-machine",
		category = "advanced-crafting",
		order = "b[steel-furnace]",
		energy_required = 2,
		ingredients =
			{
			--  {type="fluid", name="water", amount=50},
			  {type="item", name="steel-furnace", amount=1},   	  
			},
		results=		
			{
			  {"steel-plate", 6},
			  {"stone-brick", 6}
			},
			
		enabled = false
  },

})

