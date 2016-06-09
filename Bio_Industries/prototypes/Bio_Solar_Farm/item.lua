data:extend({



  {
    type = "item",
    name = "bi_bio_Solar_Farm",
    icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon.png",
	flags= { "goes-to-quickbar" },
    subgroup = "energy",
	order = "d[solar-panel]-a[solar-panel]-a[bi_bio_Solar_Farm]",
    place_result = "bi_bio_Solar_Farm",
    stack_size = 10,
	enable = false,
  },

  {
  type= "item",
    name= "bi_bio_Solar_Farm_Image",
    icon = "__Bio_Industries__/graphics/icons/Bio_Solar_Farm_Icon.png",
    flags = {"hidden"},
    subgroup = "energy",
	order = "d[solar-panel]-a[solar-panel]-a[bi_bio_Solar_Farm]",
    place_result = "bi_bio_Solar_Farm_Image",
    stack_size= 10,
	enable = false,
  },


})
