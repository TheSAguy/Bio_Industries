 

 
 data:extend(
  {

    {
      type = "recipe",
      name = "bi_recipe_pure_water",
      icon = "__bobplates__/graphics/icons/pure-water.png",
      icon_size = 32,
	  order = "b[fluid-chemistry]-b[pure-water-1]",
	  category = "distillery",
      energy_required = 1,
      ingredients =
      {
	            {type = "fluid", name = "water", amount = 100}
      },
      results = 
      {
		{type = "fluid", name = "pure-water", amount = 100}
      },
      subgroup = "bob-fluid",

    },
	
})

