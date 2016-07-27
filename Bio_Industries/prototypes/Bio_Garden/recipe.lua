
--- Bio Gardens
data:extend({



	{
		type = "recipe",
		name = "bi-Bio_Garden",
		icon = "__Bio_Industries__/graphics/icons/bio_garden_icon.png",
		energy_required = 10.0,
		enabled = "false",
		ingredients =
		{
		  {"stone-wall", 12},
		  {"stone-crushed", 50},
		  {"seedling", 50}
		},
		result = "bi-Bio_Garden",
	},
 
 

	{
    type = "recipe",
    name = "bi-Clean_Air",
    category = "clean-air",
    enabled = "false",
    --hidden = "true",
    energy_required = 40,
    ingredients =
    {
      {type="fluid", name="water", amount=50},
	  {type="item", name="fertiliser", amount=1}  
    },
    results=
    {
      {type="item", name="bi-Purified_Air", amount=1, probability=0},
    },
    icon = "__Bio_Industries__/graphics/icons/clean-air.png",
    order = "zzz-clean-air"
	},


	{
    type = "recipe",
    name = "bi-Clean_Air2",
    category = "clean-air",
    enabled = "false",
    --hidden = "true",
    energy_required = 100,
    ingredients =
    {
      {type="fluid", name="water", amount=50},
	  {type="item", name="bi-adv-fertiliser", amount=1},     
    },
    results=
    {
      {type="item", name="bi-Purified_Air", amount=1, probability=0},
    },
    icon = "__Bio_Industries__/graphics/icons/clean-air.png",
    order = "zzz-clean-air2"
	},
	
  }
)

