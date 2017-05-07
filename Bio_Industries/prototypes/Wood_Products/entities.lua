
require("prototypes.Wood_Products.demo-railpictures-wood")
require("prototypes.Wood_Products.demo-remnants-wood")
--require ("prototypes.Bio_Farm.utility-sprites_tweak")

rail_pictures_w = function()
  return rail_pictures_internal_w({{"metals", "metals", mipmap = true},
                                 {"backplates", "backplates", mipmap = true},
                                 {"ties", "ties", variations = 3},
                                 {"stone_path", "stone-path", variations = 3},
                                 {"stone_path_background", "stone-path-background", variations = 3}})
end



data:extend({

---- Wood Floor
	{
	  type = "tile",
	  name = "bi-wood-floor",
	  needs_correction = false,
	  minable = {hardness = 0.2, mining_time = 0.5, result = "wood"},
	  mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
	  collision_mask = {"ground-tile"},
	  walking_speed_modifier = 1.2,
	  layer = 62,
	  decorative_removal_probability = 0.4,
	  variants =
	  {
		main =
		{
		  {
			picture = "__Bio_Industries__/graphics/entities/wood_products/wood1.png",
			count = 4,
			size = 1
		  },
		  {
			picture = "__Bio_Industries__/graphics/entities/wood_products/wood2.png",
			count = 1,
			size = 2,
			probability = 1,
		  },
		},
		inner_corner =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-inner-corner.png",
		  count = 8
		},
		outer_corner =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-outer-corner.png",
		  count = 8
		},
		side =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-side.png",
		  count = 8
		},
		u_transition =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-u.png",
		  count = 8
		},
		o_transition =
		{
		  picture = "__Bio_Industries__/graphics/entities/wood_products/wood-o.png",
		  count = 1
		}
	  },
	  walking_sound =
	  {
		{
		  filename = "__base__/sound/walking/concrete-01.ogg",
		  volume = 1.2
		},
		{
		  filename = "__base__/sound/walking/concrete-02.ogg",
		  volume = 1.2
		},
		{
		  filename = "__base__/sound/walking/concrete-03.ogg",
		  volume = 1.2
		},
		{
		  filename = "__base__/sound/walking/concrete-04.ogg",
		  volume = 1.2
		}
	  },
	  map_color={r=139, g=115, b=85},
	  ageing=0,
	  vehicle_friction_modifier = dirt_vehicle_speed_modifer
	},
	
	---- Big Wooden Pole
	
	  {
    type = "electric-pole",
    name = "bi-big-wooden-pole",
    icon = "__Bio_Industries__/graphics/icons/big-wooden-pole.png",
    flags = {"placeable-neutral", "player-creation"},
	minable = {hardness = 0.2, mining_time = 0.5, result = "bi-big-wooden-pole"},
    max_health = 150,
    corpse = "medium-remnants",
    resistances = 
    {
      {
        type = "physical",
        percent = 10
      }
    },
    collision_box = {{-0.3,-0.3}, {0.3,0.3}},
    selection_box = {{-0.5,-0.5}, {0.5,0.5}},
    drawing_box = {{0,0}, {0,0}},
    maximum_wire_distance = 24,
    supply_area_distance = 0,
    pictures =
    
		{
      filename = "__Bio_Industries__/graphics/entities/wood_products/big-wooden-pole-01.png",
      priority = "high",
      width = 180,
      height = 180,
      axially_symmetrical = false,
      direction_count = 1,
      shift = {2.2, -2.5}
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = {3.3, -0.1},
          green = {3.3, -0.2},
          red = {3.3, -0.3}
        },
        wire =
        {
          copper = {0.7, -4.3},
          green = {0.7,-4.3},
          red = {0.7,-4.3}
        }
      }
    },
    copper_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/copper-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    green_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/green-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12
    },
    red_wire_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/red-wire.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    },
    wire_shadow_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/wire-shadow.png",
      priority = "extra-high-no-scale",
      width = 224,
      height = 46
    }
  },

  ---- Wood Fence

 {
    type = "wall",
    name = "bi-wooden-fence",
    icon = "__Bio_Industries__/graphics/icons/wooden-fence.png",
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.29, -0.09}, {0.29, 0.49}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 1, result = "bi-wooden-fence"},
    fast_replaceable_group = "wall",
    max_health = 150,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    vehicle_impact_sound =  { filename = "__base__/sound/car-wood-impact.ogg", volume = 1.0 },
   
    resistances =
    {
      {
        type = "physical",
        decrease = 2,
        percent = 15
      },
      {
        type = "impact",
        decrease = 15,
        percent = 20
      }
      
    },
    pictures =
    {
      single =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-single-1.png",
            priority = "extra-high",
            width = 7,
            height = 46,
            shift = {0, -0.15625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-single-shadow.png",
            priority = "extra-high",
            width = 38,
            height = 25,
            shift = {0.459375, 0.75},
            draw_as_shadow = true
          }
        }
      },
      straight_vertical =
      {
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-1.png",
              priority = "extra-high",
              width = 7,
              height = 53,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 39,
              height = 66,
              shift = {0.490625, 1.425},
              draw_as_shadow = true
            }
          }
        },
       {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-1.png",
              priority = "extra-high",
             width = 7,
              height = 53,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 39,
              height = 66,
              shift = {0.490625, 1.425},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-1.png",
              priority = "extra-high",
              width = 7,
              height = 53,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-vertical-shadow.png",
              priority = "extra-high",
              width = 39,
              height = 66,
              shift = {0.490625, 1.425},
              draw_as_shadow = true
            }
          }
        }
      },
      straight_horizontal =
      {
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-1.png",
              priority = "extra-high",
              width = 34,
              height = 47,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 84,
              height = 28,
              shift = {0.421875, 0.85},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-2.png",
              priority = "extra-high",
              width = 34,
              height = 47,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 84,
              height = 28,
              shift = {0.421875, 0.85},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-3.png",
              priority = "extra-high",
              width = 34,
              height = 47,
              shift = {0, -0.15625}
            },
            {
              filename = "__Bio_Industries__/graphics/entities/wood_products/fence-straight-horizontal-shadow.png",
              priority = "extra-high",
              width = 84,
              height = 28,
              shift = {0.421875, 0.85},
              draw_as_shadow = true
            }
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-corner-right-down.png",
            priority = "extra-high",
            width = 23,
            height = 53,
            shift = {0.248125, -0.07625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-corner-right-down-shadow.png",
            priority = "extra-high",
            width = 52,
            height = 56,
            shift = {0.724375, 1.30625},
            draw_as_shadow = true
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-corner-left-down.png",
            priority = "extra-high",
            width = 21,
            height = 53,
            shift = {-0.248125, -0.07625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-corner-left-down-shadow.png",
            priority = "extra-high",
            width = 60,
            height = 56,
            shift = {0.128125, 1.30625},
            draw_as_shadow = true
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-t-down.png",
            priority = "extra-high",
            width = 34,
            height = 53,
            shift = {0, -0.07625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-t-down-shadow.png",
            priority = "extra-high",
            width = 71,
            height = 55,
            shift = {0.286875, 1.280625},
            draw_as_shadow = true
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-ending-right.png",
            priority = "extra-high",
            width = 23,
            height = 47,
            shift = {0.248125, -0.15625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-ending-right-shadow.png",
            priority = "extra-high",
            width = 49,
            height = 27,
            shift = {0.684375, 0.85},
            draw_as_shadow = true
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-ending-left.png",
            priority = "extra-high",
            width = 21,
            height = 47,
            shift = {-0.248125, -0.15625}
          },
          {
            filename = "__Bio_Industries__/graphics/entities/wood_products/fence-ending-left-shadow.png",
            priority = "extra-high",
            width = 63,
            height = 27,
            shift = {0.128125, 0.85},
            draw_as_shadow = true
          }
        }
      }
    }
  },

  --------------- Rail

    {
    type = "straight-rail",
    name = "bi-straight-rail-wood",   
	icon = "__Bio_Industries__/graphics/icons/straight-rail-wood.png",
    flags = {"placeable-neutral", "player-creation", "building-direction-8-way"},
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
    name = "bi_medium-electric-pole_for_rail",
    icon = "__Bio_Industries__/graphics/icons/Bio_Farm_Cabeling.png",
	--flags = {"placeable-neutral", "player-creation", "placeable-off-grid", "not-repairable", "not-on-map"},
	flags = {"placeable-neutral", "placeable-off-grid", "not-repairable", "not-on-map"},
	selectable_in_game = false,
    max_health = 1,
    resistances = {{type = "fire", percent = 100}},
    collision_box = {{-0, -0}, {0, 0}},
	collision_mask = {},
    maximum_wire_distance = 8,
    supply_area_distance = 5,
 
    pictures =
    {
      filename = "__Bio_Industries__/graphics/icons/empty.png",
      priority = "low",
      width = 0,
      height = 0,
	  frame_count = 1,
      axially_symmetrical = false,
      direction_count = 4,
	  shift = {0.75, 0},
    },
	 connection_points =
    {
      {
        shadow =
        {

        },
        wire =
        {
          copper_wire_tweak = {-0, -0},

        }
      },
      {
        shadow =
        {

        },
        wire =
        {
          copper_wire_tweak = {-0, -0},

        }
      },
      {
        shadow =
        {

        },
        wire =
        {
          copper_wire_tweak = {-0, -0},

        }
      },
      {
        shadow =
        {

        },
        wire =
        {
          copper_wire_tweak = {-0, -0},

        }
      }
    },
	--[[
    connection_points =
    {
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      },
      {
        shadow =
        {

        },
        wire =
        {

        }
      }
    },
	]]
	
    radius_visualisation_picture =
    {
      filename = "__Bio_Industries__/graphics/icons/empty.png",
      width = 0,
      height = 0,
      priority = "low"
    },
  },

})
