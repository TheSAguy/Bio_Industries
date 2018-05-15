  data:extend(
  {

    {
      type = "recipe",
      name = "bi_recipe_pure_water",
	  category = "chemistry",
      energy_required = 1,
      ingredients =
      {
	    {type = "fluid", name = "pure-water", amount = 100}
      },
      results = 
      {
        {type = "fluid", name = "water", amount = 100}
      },
      subgroup = "bob-fluid-pump",
      icon = "__base__/graphics/icons/fluid/water.png",
      icon_size = 32,
      order = "b[fluid-chemistry]-b[water]"
    },
	
})