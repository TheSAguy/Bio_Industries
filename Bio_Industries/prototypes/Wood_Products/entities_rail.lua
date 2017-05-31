
require("prototypes.Wood_Products.demo-railpictures-wood")
require("prototypes.Wood_Products.demo-remnants-wood")


rail_pictures_w = function()
  return rail_pictures_internal_w({{"metals", "metals", mipmap = true},
                                 {"backplates", "backplates", mipmap = true},
                                 {"ties", "ties", variations = 3},
                                 {"stone_path", "stone-path", variations = 3},
                                 {"stone_path_background", "stone-path-background", variations = 3}})
end



data:extend({

  --------------- Rail


    {
    type = "straight-rail",
    name = "bi-straight-rail-wood",   
	icon = "__Bio_Industries__/graphics/icons/straight-rail-wood.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
	collision_mask = { "object-layer", "not-colliding-with-itself" },
    minable = {mining_time = 0.5, result = "bi-rail-wood"},
    max_health = 60,
    corpse = "straight-rail-remnants-wood",
    collision_box = {{-0.7, -0.8}, {0.7, 0.8}},
    selection_box = {{-0.7, -0.8}, {0.7, 0.8}},
    rail_category = "regular",
    pictures = rail_pictures_w(),
  },
  {
    type = "curved-rail",
    name = "bi-curved-rail-wood",   
	icon = "__Bio_Industries__/graphics/icons/curved-rail-wood.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
	collision_mask = { "object-layer", "not-colliding-with-itself" },
    minable = {mining_time = 0.5, result = "bi-rail-wood", count = 4},
    max_health = 120,
    corpse = "curved-rail-remnants-wood",
    collision_box = {{-0.75, -0.55}, {0.75, 1.6}},
    secondary_collision_box = {{-0.65, -2.43}, {0.65, 2.43}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    rail_category = "regular",
    pictures = rail_pictures_w(),
	placeable_by = { item="bi-rail-wood", count = 4}
  },

  ------- Rail Pole
  {
    type = "electric-pole",
    name = "bi_electric_pole_rail_hidden",
    icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Cabeling.png",	
	flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable", "not-blueprintable"},
	selectable_in_game = false,
    max_health = 1,
    resistances = {{type = "fire", percent = 100}},
    collision_box = {{-0, -0}, {0, 0}},
	drawing_box = {{0, 0}, {0, 0}},
	collision_mask = {},
    maximum_wire_distance = 3.99,
    supply_area_distance = 0,
	pictures =
	{
      filename = "__Bio_Industries__/graphics/icons/empty-electric-pole.png",
      line_length = 1,
      width = 123,
      height = 124,
      direction_count = 1,
      shift = {0, 0}
    },	
	
	connection_points =
    {
      {
        shadow =
        {
          copper = {0, 0},
          red = {0, 0},
          green = {0, 0}
        },
        wire =
        {
          copper = {0, 0},
          red = {0, 0},
          green = {0, 0}
        }
      },
	},

	
    radius_visualisation_picture =
    {
      filename = "__Bio_Industries__/graphics/icons/empty.png",
      width = 0,
      height = 0,
      priority = "low"
    },
  },

  
    {
    type = "electric-pole",
    name = "bi-electric-to-rail",
    icon = "__Bio_Industries__/graphics/icons/electric-to-rail.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "bi-electric-to-rail"},
    max_health = 100,
    corpse = "small-remnants",
    track_coverage_during_build_by_moving = true,
    resistances =
    {
      {
        type = "fire",
        percent = 100
      }
    },
    collision_box = {{-0.15, -0.15}, {0.15, 0.15}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    drawing_box = {{-0.5, -2.8}, {0.5, 0.5}},
    maximum_wire_distance = 3,
    supply_area_distance = 2,
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    pictures =
    {
      filename = "__Bio_Industries__/graphics/entities/wood_products/rail/electric_to_rail.png",
      priority = "high",
      width = 136,
      height = 122,
      direction_count = 4,
      shift = {1.4, -1.0}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {2.55, 0.4},
          green = {2.0, 0.4},
          red = {3.05, 0.4}
        },
        wire =
        {
          copper = {-0.03125, -2.46875},
          green = {-0.34375, -2.46875},
          red = {0.25, -2.46875}
        }
      },
      {
        shadow =
        {
          copper = {2.9, 0.1},
          green = {2.6, -0.15},
          red = {3.25, 0.35}
        },
        wire =
        {
          copper = {0.0625, -2.65625},
          green = {-0.15625, -2.84375},
          red = {0.28125, -2.5}
        }
      },
      {
        shadow =
        {
          copper = {1.5, -0.2},
          green = {1.5, -0.55},
          red = {1.5, 0.1}
        },
        wire =
        {
          copper = {-0.4375, -2.28125},
          green = {-0.4375, -2.5625},
          red = {-0.4375, -2.0625}
        }
      },
      {
        shadow =
        {
          copper = {2.88, 0.2},
          green = {3.2, -0.1},
          red = {2.45, 0.4}
        },
        wire =
        {
          copper = {-0.0625, -2.5625},
          green = {0.15625, -2.75},
          red = {-0.28125, -2.4375}
        }
      }
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    },
   },	
  
  -------------
  --- Items
  
  	{
		type = "rail-planner",
		name = "bi-rail-wood",
		icon = "__Bio_Industries__/graphics/icons/rail-wood-bridge.png",
		flags = {"goes-to-quickbar"},
		subgroup = "transport",
		order = "a[train-system]-a[rail]",
		place_result = "bi-straight-rail-wood",
		stack_size = 100,
		straight_rail = "bi-straight-rail-wood",
		curved_rail = "bi-curved-rail-wood"
	},

  
  	  ---- Electric pole for Rail
	{
		type = "item",
		name = "bi_electric_pole_rail_hidden",
		icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Cabeling.png",
		flags = {"hidden"},
		subgroup = "energy-pipe-distribution",
		order = "x[bi]-a[bi_bio_farm]",
		place_result = "bi_electric_pole_rail",
		stack_size = 50,
		enable = false,
	},
  

  	  ---- Electric to Rail Connector
	{
		type = "item",
		name = "bi-electric-to-rail",
		icon = "__Bio_Industries__/graphics/icons/electric-to-rail.png",
		flags = {"hidden"},
		subgroup = "energy-pipe-distribution",
		order = "x[bi]-a[bi_bio_farm]",
		place_result = "bi-electric-to-rail",
		stack_size = 50,

	},
  
  
  --- Recipe
    {
    type = "recipe",
    name = "bi-electric-to-rail",
    enabled = true,
    ingredients =
    {
      {"steel-plate", 1},
      {"copper-cable", 2}
    },
    result = "bi-electric-to-rail",
    requester_paste_multiplier = 4
  },
  
  
})
