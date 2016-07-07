data:extend(
{

  {
    type = "item",
    name = "living-wall",
    icon = "__base__/graphics/icons/stone-wall.png",
	icon = "__Bio_Industries__/graphics/icons/living_wall.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[stone-wall]-a[living-wall]",
    place_result = "living-wall",
    stack_size = 50
  },

  {
    type = "item",
    name = "living-gate",
    icon = "__base__/graphics/icons/gate.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[wall]-b[living-gate]",
    place_result = "living-gate",
    stack_size = 50
  },
  
  
})
