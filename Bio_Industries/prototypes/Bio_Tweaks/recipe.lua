
--- Bio Tweaks
data:extend(
{
  {
    type = "item-subgroup",
    name = "Disassemble",
    group = "production",
    order = "zzzz",
  },
 

 
	{
		type = "recipe",
		name = "bi_burner_mining_drill_disassemble",
		icon = "__Bio_Industries__/graphics/icons/burner-mining-drill_disassemble.png",
		icon_size = 32,
		subgroup = "Disassemble",
		category = "advanced-crafting",
		order = "a[Disassemble]-a[bi_burner_mining_drill_disassemble]",
		energy_required = 2,
		ingredients =
			{
			  {type="item", name="burner-mining-drill", amount=1},   	  
			},
		results=
			{
				{"stone", 4},
				{"iron-plate", 4}
			},
		enabled = false
	},

  
  	{
		type = "recipe",
		name = "bi_stone_furnace_disassemble",
		icon = "__Bio_Industries__/graphics/icons/stone_furnace_disassemble.png",
		icon_size = 32,
		subgroup = "Disassemble",
		category = "advanced-crafting",
		order = "a[Disassemble]-b[bi_stone_furnace_disassemble]",
		energy_required = 2,
		ingredients =
			{
			  {type="item", name="stone-furnace", amount=1},   	  
			},
		results=		
			{
			  {"stone", 3},
			},
			
		enabled = false
  },
  
   
	
	{
		type = "recipe",
		name = "bi_burner_inserter_disassemble",
		icon = "__Bio_Industries__/graphics/icons/burner_inserter_disassemble.png",
		icon_size = 32,
		subgroup = "Disassemble",
		category = "advanced-crafting",
		order = "a[Disassemble]-c[bi_burner_inserter_disassemble]",
		energy_required = 2,
		ingredients =
			{
			  {type="item", name="burner-inserter", amount=1},   	  
			},
		results=		
			{
			  {"iron-plate", 2},
			},
			
		enabled = false
  },
  
	
	{
		type = "recipe",
		name = "bi_long_handed_inserter_disassemble",
		icon = "__Bio_Industries__/graphics/icons/long_handed_inserter_disassemble.png",
		icon_size = 32,
		subgroup = "Disassemble",
		category = "advanced-crafting",
		order = "a[Disassemble]-d[bi_long_handed_inserter_disassemble]",
		energy_required = 2,
		ingredients =
			{
			  {type="item", name="long-handed-inserter", amount=1},   	  
			},
		results=		
			{
			  {"iron-gear-wheel", 1},
			  {"iron-plate", 1},
			  {"electronic-circuit", 1},
			},
			
		enabled = false
  },



	{
		type = "recipe",
		name = "bi_steel_furnace_disassemble",
		icon = "__Bio_Industries__/graphics/icons/steel-furnace_disassemble.png",
		icon_size = 32,
		subgroup = "Disassemble",
		category = "advanced-crafting",
		order = "a[Disassemble]-e[bi_steel_furnace_disassemble]",
		energy_required = 2,
		ingredients =
			{
			  {type="item", name="steel-furnace", amount=1},   	  
			},
		results=		
			{
			  {"steel-plate", 4},
			  {"stone-brick", 4}
			},
			
		enabled = false
  },

  
})

