data:extend({


  {
    type = "item",
    name = "bi-big-wooden-pole",
    icon = "__Bio_Industries__/graphics/icons/big-wooden-pole.png",
    flags = {"goes-to-quickbar"},
    subgroup = "energy-pipe-distribution",
    order = "a[energy]-a[big-wooden-pole]",
    place_result = "bi-big-wooden-pole",
    stack_size = 50,
	fuel_value = "20MJ"

  },

  {
    type = "item",
    name = "bi-wooden-fence",
    icon = "__Bio_Industries__/graphics/icons/wooden-fence.png",
    flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "a[stone-wall]-b[wooden-fence]",
    place_result = "bi-wooden-fence",
	fuel_value = "24MJ",
    stack_size = 50
  },

})
