data:extend({

  {
    type = "recipe",
    name = "bi-living-wall",
    enabled = false,
	--enabled = true,
    ingredients = {{"stone-brick", 5}},
    result = "living-wall",
    requester_paste_multiplier = 10
  },
  
  {
    type = "recipe",
    name = "bi-living-gate",
    enabled = false,
    ingredients = {{"living-wall", 1}, {"steel-plate", 2}, {"electronic-circuit", 2}},
    result = "living-gate"
  },
  
  })
