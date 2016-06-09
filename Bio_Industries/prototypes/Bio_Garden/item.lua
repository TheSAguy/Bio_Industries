
-------- Bio Garden

data:extend({
  
    {
    type = "item",
    name = "bi-Bio_Garden",
    icon = "__Bio_Industries__/graphics/icons/bio_garden_icon.png",
    flags = { "goes-to-quickbar" },
    subgroup = "production-machine",
    order = "x[bi]-b[bi-Bio_Garden]",
    place_result = "bi-Bio_Garden",
    stack_size = 10
  },
  
  {
    type= "item",
    name= "bi_light_for_Bio_Garden",
    icon = "__base__/graphics/icons/small-lamp.png",
    flags = {"hidden"},
    subgroup = "production-machine",
	order = "x[bi]-b[bi-Bio_Garden]",
    place_result = "bi_light_for_Bio_Garden",
    stack_size= 10,
	enable = false,
  },
  
  {
    type = "item",
    name = "bi-Purified_Air",
    icon = "__Bio_Industries__/graphics/icons/Clean_Air2.png",
    flags = {"goes-to-main-inventory", "hidden"},
    subgroup = "raw-material",
    order = "bi-Purified_Air",
    stack_size = 100
  },
  
  
  
  })