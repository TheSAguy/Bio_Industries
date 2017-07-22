require "util"

inv_extension =
{
	filename = "__Bio_Industries__/graphics/entities/biocannon/bio_cannon_open.png",
	priority = "low",
	scale = 1,
	width = 384,
	height = 384,
	direction_count = 1,
	frame_count = 1,
	axially_symmetrical = false,
	shift = {1.125, -1.625}
}

inv_extension2 =
{
	filename = "__Bio_Industries__/graphics/entities/biocannon/bio_cannon_closed.png",
	priority = "extra-high",
	scale = 1,
	width = 384,
	height = 384,
	direction_count = 1,
	frame_count = 1,
	axially_symmetrical = false,
	shift = {1.125, -1.625}
}


data:extend({

	-- Bio Cannon Artillery Range Overlay
	{
		type = "ammo-turret",
		name = "Bio_Cannon_Area",
		icon = "__Bio_Industries__/graphics/icons/biocannon_icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		max_health = 600,
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		automated_ammo_count = 10,
		resistances = {},
		collision_box = {{-4.25, -4.25}, {4.25, 4.25}},
		selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
		order = "i[items][Bio_Cannon]",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "Bio_Cannon_Ammo",
			cooldown = 2,
			range = 85,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,

		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension2)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension2)
                          res.run_mode = "backward"
                          return res
                       end)(),
		call_for_help_radius = 40			   

	},
	
	-- Bio Cannon Artillery
   {
		type = "container",
		name = "Bio_Cannon",
		icon = "__Bio_Industries__/graphics/icons/biocannon_icon.png",
		flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable", "not-blueprintable"},
		selectable_in_game = false,
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = {mining_time = 10, result = "Bio_Cannon_Area"},
		max_health = 600,
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		resistances = {},
		collision_box = {{0, 0}, {0, 0}},
		selection_box = {{0, 0}, {0, 0}},
		collision_mask = {},
		order = "i[items][Bio_Cannon]",
		inventory_size = 1,
		picture =
		{
			filename = "__Bio_Industries__/graphics/entities/biocannon/bio_cannon_open.png",
			priority = "extra-high",
			scale = 1,
			width = 384,
			height = 384,
			shift = {1.125, -1.625}
		}
	},
	--Inventory

	{
		type = "ammo-turret",
		name = "Bio_Cannoni",
		icon = "__Bio_Industries__/graphics/icons/biocannon_icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		minable = {mining_time = 10, result = "Bio_Cannon_Area"},
		max_health = 600,
		corpse = "big-remnants",
		dying_explosion = "massive-explosion",
		automated_ammo_count = 10,
		resistances = {},
		collision_box = {{-4.20, -4.20}, {4.20, 4.20}},
		selection_box = {{-4.5, -4.5}, {4.5, 4.5}},
		order = "i[items][Bio_Cannon]",
		inventory_size = 1,
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "Bio_Cannon_Ammo",
			cooldown = 2,
			range = 0,
			projectile_creation_distance = 1.8,
			action ={}
		},
		folding_speed = 0.08,
		folded_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.frame_count = 1
                          res.line_length = 1
                          return res
                       end)(),
		folding_animation = (function()
                          local res = util.table.deepcopy(inv_extension)
                          res.run_mode = "backward"
                          return res
                       end)(),
		call_for_help_radius = 40			   

	},
		---- Radar
  {
    type = "radar",
    name = "Bio_Cannonr",
    icon = "__Bio_Industries__/graphics/icons/biocannon_icon.png",
	flags = {"not-deconstructable", "not-on-map", "placeable-off-grid", "not-repairable", "not-blueprintable"},
	selectable_in_game = false,
    minable = {mining_time = 5, result = "Bio_Cannon_Area"},
	max_health = 600,
	corpse = "big-remnants",
	dying_explosion = "massive-explosion",
	resistances = {},
	collision_box = {{-4.0, -4.0}, {4.0, 4.0}},
	selection_box = {{-4.25, -4.25}, {4.25, 4.25}},
	collision_mask = {},
	order = "i[items][Bio_Cannon]",
    energy_per_sector = "22MJ",
    max_distance_of_nearby_sector_revealed = 5,
    max_distance_of_sector_revealed = 5,
    energy_per_nearby_scan = "400kW",
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "6kW",
    pictures =
	
    {
      filename = "__Bio_Industries__/graphics/icons/biocannon_icon.png",
      priority = "low",
      width = 1,
      height = 1,
      axially_symmetrical = false,
      apply_projection = false,
      direction_count = 1,
      line_length = 1,
      shift = {0, -0}
    },

  },
  
	
	
	
})