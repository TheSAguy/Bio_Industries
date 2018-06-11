
require ("util")



data:extend({

  	--- 	Bio Drill
  --- Radar for Drill (Drill-Bit)
  {
    type = "radar",
    name = "bi-drill-radar",
    icon = "__Bio_Industries__/graphics/icons/bi_drill_icon.png",
	icon_size = 32,	
	flags = {"not-blueprintable", "not-deconstructable", "placeable-off-grid", "not-on-map", "not-repairable"},
    corpse = "small-remnants",
	dying_explosion = "medium-explosion",
	order = "y[bi]-a[bi-drill]",
	render_no_power_icon = true,
	minable = nil, 
	max_health = 250,

	resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 1.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 1.5}},
    energy_per_sector = "4MJ",
    max_distance_of_nearby_sector_revealed = 2,
    max_distance_of_sector_revealed = 5,
    energy_per_nearby_scan = "200kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
	  --emissions = 0.15, 
    },
    energy_usage = "150kW",
--[[
	pictures =
    {

        layers =
        {
          {
            priority = "high",
            width = 87,
            height = 95,
            line_length = 4,
            shift = util.by_pixel(2.5, 0.5),
            filename = "__base__/graphics/entity/burner-mining-drill/burner-mining-drill-N.png",
            frame_count = 32,
			direction_count = 32,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			scale = 0.5,
            hr_version = {
              priority = "high",
              width = 173,
              height = 188,
              line_length = 4,
              shift = util.by_pixel(2.75, 0.5),
              filename = "__base__/graphics/entity/burner-mining-drill/hr-burner-mining-drill-N.png",
              frame_count = 32,
			  direction_count = 32,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              scale = 0.25,
            },
          },
        },
    },
	]]
	
	pictures =
    {
      layers =
        {
   
       {
            priority = "high",
            width = 32,
            height = 32,
            line_length = 1,
            --shift = util.by_pixel(2.5, 0.5),
            filename = "__Bio_Industries__/graphics/entities/bio_drill/empty.png",
            frame_count = 1,
			direction_count = 1,
            animation_speed = 0.5,
            run_mode = "forward-then-backward",
			--scale = 0.5,
            hr_version = {
              priority = "high",
              width = 32,
              height = 32,
              line_length = 1,
              --shift = util.by_pixel(2.75, 0.5),
              filename = "__Bio_Industries__/graphics/entities/bio_drill/empty.png",
              frame_count = 1,
			  direction_count = 1,
              animation_speed = 0.5,
              run_mode = "forward-then-backward",
              --scale = 0.25,
            },
          },
		},
    },
	
  },

  
	--- Assembling-Machine Drill
 {
    type = "assembling-machine",
    name = "bi-drill-base",
    icon = "__Bio_Industries__/graphics/icons/bi_drill_icon.png",
	icon_size = 32,
	flags = {"placeable-neutral", "player-creation"},
    order = "x[bi]-a[bi-drill]",
	minable = {hardness = 0.2, mining_time = 0.5, result = "bi-drill-base"},
    max_health = 250,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    alert_icon_shift = util.by_pixel(-3, -12),
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -2} }},
        secondary_draw_orders = { north = -1 }
      },
      {
        production_type = "output",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 2} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    },
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
	collision_mask = { "water-tile","resource-layer" },
    fast_replaceable_group = "assembling-machine",
--[[
	animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2.png",
          priority = "high",
          width = 108,
          height = 110,
          frame_count = 32,
          line_length = 8,
          shift = util.by_pixel(0, 4),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2.png",
            priority = "high",
            width = 214,
            height = 218,
            frame_count = 32,
            line_length = 8,
            shift = util.by_pixel(0, 4),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/assembling-machine-2/assembling-machine-2-shadow.png",
          priority = "high",
          width = 98,
          height = 82,
          frame_count = 32,
          line_length = 8,
          draw_as_shadow = true,
          shift = util.by_pixel(12, 5),
          hr_version =
          {
            filename = "__base__/graphics/entity/assembling-machine-2/hr-assembling-machine-2-shadow.png",
            priority = "high",
            width = 196,
            height = 163,
            frame_count = 32,
            line_length = 8,
            draw_as_shadow = true,
            shift = util.by_pixel(12, 4.75),
            scale = 0.5
          }
        },
      },
    },
	]]
	
	animation =
    {
      layers =
        {
		{
				width = 150,
				height = 144,
				line_length = 4,
				filename = "__Bio_Industries__/graphics/entities/bio_drill/bio_drill_entity.png",
				frame_count = 16,
				direction_count = 1,
				animation_speed = 0.5,
				run_mode = "forward-then-backward",
				shift =  {x=28/32, y=-21/32},
				scale = 1,
          hr_version =
          {
				width = 150,
				height = 144,
				line_length = 4,
				filename = "__Bio_Industries__/graphics/entities/bio_drill/bio_drill_entity.png",
				frame_count = 16,
				direction_count = 1,
				animation_speed = 0.5,
				run_mode = "forward-then-backward",
				shift =  {x=28/32, y=-21/32},
				scale = 1,
	
          }
        },
		},
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"bi-drill"},
    crafting_speed = 0.5,
    energy_source =
	{
      type = "electric",
      usage_priority = "primary-input",
	  --drain = "5W",
	  emissions = 0.05, 
    },	
    energy_usage = "150kW",
    ingredient_count = 2,
	module_specification =
    {
      module_slots = 2
    },
    allowed_effects = {"speed", "pollution"},

  },	


  {
    type = "mining-drill",
    name = "bi-burner-pump",
    icon = "__Bio_Industries__/graphics/icons/bi_basic_pumpjack.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "bi-burner-pump"},
    resource_categories = {"basic-fluid"},
    max_health = 200,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{ -1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{ -1.5, -1.5}, {1.5, 1.5}},
    drawing_box = {{-1.6, -2.5}, {1.5, 1.6}},
    energy_source =
    {
      type = "burner",
      fuel_category = "chemical",
      effectivity = 1,
      fuel_inventory_size = 1,
      emissions = 0.1 / 3,
      smoke =
      {
        {
          name = "smoke",
          deviation = {0.1, 0.1},
          frequency = 3
        }
      }
    },
    output_fluid_box =
    {
      base_area = 1,
      base_level = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        {
          positions = { {1, -2}, {2, -1}, {-1, 2}, {-2, 1} }
        }
      },
    },
    energy_usage = "150kW",
    mining_speed = 1,
    mining_power = 2,
    resource_searching_radius = 0.49,
    vector_to_place_result = {0, 0},
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/pumpjack/pumpjack-radius-visualization.png",
      width = 12,
      height = 12
    },
    monitor_visualization_tint = {r=78, g=173, b=255},
    base_render_layer = "lower-object-above-shadow",
    base_picture =
    {
      sheets =
      {
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base.png",
          priority = "extra-high",
		  tint = {r = 0.5, g = 0.5, b = 0.5},
          width = 131,
          height = 137,
          shift = util.by_pixel(-2.5, -4.5),
          hr_version = 
          {
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base.png",
            priority = "extra-high",
			tint = {r = 0.5, g = 0.5, b = 0.5},
            width = 261,
            height = 273,
            shift = util.by_pixel(-2.25, -4.75),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/pumpjack/pumpjack-base-shadow.png",
          priority = "extra-high",
          width = 110,
          height = 111,
          draw_as_shadow = true,
          shift = util.by_pixel(6, 0.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-base-shadow.png",
            width = 220,
            height = 220,
            scale = 0.5,
            draw_as_shadow = true,
            shift = util.by_pixel(6, 0.5)
          }
        }
      }
    },
    animations =
    {
      north =
      {
        layers = 
        {
          {
            priority = "high",
            filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead.png",
			tint = {r = 0.5, g = 0.5, b = 0.5},
            line_length = 8,
            width = 104,
            height = 102,
            frame_count = 40,
            shift = util.by_pixel(-4, -24),
            animation_speed = 0.5,
            hr_version = 
            {
              priority = "high",
              filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead.png",
			  tint = {r = 0.5, g = 0.5, b = 0.5},
              animation_speed = 0.5,
              scale = 0.5,
              line_length = 8,
              width = 206,
              height = 202,
              frame_count = 40,
              shift = util.by_pixel(-4, -24)
            }
          },
          {
            priority = "high",
            filename = "__base__/graphics/entity/pumpjack/pumpjack-horsehead-shadow.png",
			tint = {r = 0.5, g = 0.5, b = 0.5},
            animation_speed = 0.5,
            draw_as_shadow = true,
            line_length = 8,
            width = 155,
            height = 41,
            frame_count = 40,
            shift = util.by_pixel(17.5, 14.5),
            hr_version = 
            {
              priority = "high",
              filename = "__base__/graphics/entity/pumpjack/hr-pumpjack-horsehead-shadow.png",
			  tint = {r = 0.5, g = 0.5, b = 0.5},
              animation_speed = 0.5,
              draw_as_shadow = true,
              line_length = 8,
              width = 309,
              height = 82,
              frame_count = 40,
              scale = 0.5,
              shift = util.by_pixel(17.75, 14.5)
            }
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/pumpjack.ogg" },
      apparent_volume = 1.5,
    },
    fast_replaceable_group = "pumpjack",
    
    circuit_wire_connection_points = circuit_connector_definitions["pumpjack"].points,
    circuit_connector_sprites = circuit_connector_definitions["pumpjack"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  
 
  })
