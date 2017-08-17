require "util"
require ("libs.detectmod") --Detect supported Mods, currently DyTechWar and Bob's Enemies and others


if BI_Config.mod.NEEnemies or data.raw["logistic-container"]["Artifact-collector-area"] or data.raw["ammo"]["Biological-bullet-magazine"] then
	NE_Damage = 2
else
	NE_Damage = 1
end


data:extend({
	--Projectile

 -- Have Buster Ammo
 -- Basic
   {
    type = "projectile",
    name = "Bio_Cannon_Basic_Ammo",
    flags = {"not-on-map"},
    acceleration = 0.0005,
	action =
	{
		{
			type = "area",
			perimeter = 8,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
					type = "damage",
					damage = {amount = 120 * NE_Damage, type = "physical"}
					},
					{
					type = "damage",
					damage = {amount = 180 * NE_Damage, type = "explosion"}
					},
					
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					{
					type = "create-entity",
					entity_name = "bio-cannon-explosion",
					check_buildability = true
					},
					{
					type = "create-entity",
					entity_name = "small-fire-cloud",
					check_buildability = true
					},
					{
					type = "create-entity",
					entity_name = "fire-flame",
					check_buildability = true
					},
				}
				
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					{
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
					},
				}
			}
		}
	},
	light = {intensity = 0.7, size = 6},
    animation =
    {
        filename = "__Bio_Industries__/graphics/entities/biocannon/projectiles/Bio_Cannon_Basic_Ammo.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
    shadow =
    {
        filename = "__Bio_Industries__/graphics/entities/biocannon/projectiles/Bio_Cannon_Ammo-shadow.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
	--[[
	sound =
	{
		{
			filename = "__Bio_Industries__/sound/launch.ogg",
			volume = 4.0
		},
	},
	]]
  },

  --- Poison
   {
    type = "projectile",
    name = "Bio_Cannon_Poison_Ammo",
    flags = {"not-on-map"},
    acceleration = 0.0006,
	action =
	{
		{
			type = "area",
			perimeter = 12,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
					type = "damage",
					damage = {amount = 120 * NE_Damage, type = "physical"}
					},
					{
					type = "damage",
					damage = {amount = 180 * NE_Damage, type = "explosion"}
					},
					{
					type = "damage",
					damage = {amount = 250 * NE_Damage, type = "poison"}
					},
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					{
					type = "create-entity",
					entity_name = "bio-cannon-explosion",
					check_buildability = true
					},
					{
					type = "create-entity",
					entity_name = "medium-fire-cloud",
					check_buildability = true
					},
					{
					type = "create-entity",
					entity_name = "fire-flame",
					check_buildability = true
					},
				}
			}
		},
		{
			type = "direct",
			action_delivery = 
			{
				type = "instant",
				target_effects =
				{
					{
					type = "create-entity",
					entity_name = "small-scorchmark",
					check_buildability = true
					},
				}
			}
		}
	},
	light = {intensity = 0.8, size = 7},
    animation =
    {
        filename = "__Bio_Industries__/graphics/entities/biocannon/projectiles/Bio_Cannon_Poison_Ammo.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
    shadow =
    {
        filename = "__Bio_Industries__/graphics/entities/biocannon/projectiles/Bio_Cannon_Ammo-shadow.png",
        priority = "extra-high",
        width = 18,
        height = 47,
        frame_count = 1
    },
	--[[
	sound =
	{
		{
			filename = "__Bio_Industries__/sound/launch.ogg",
			volume = 4.0
		},
	},
	]]
  },

   
  ----- Fire Clouds. 
  ---- Small Fire Cloud
   {
    type = "smoke-with-trigger",
    name = "small-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__Bio_Industries__/graphics/entities/biocannon/projectiles/fire.png",
      priority = "low",
      width = 30,
      height = 50,
      frame_count = 30,
      animation_speed = 1,
      line_length = 30,
      scale = 3,
    },
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 8,
    fade_away_duration = 2 * 60,
    spread_duration = 8,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            perimeter = 6,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 6, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
  --- medium File Cloud
    {
    type = "smoke-with-trigger",
    name = "medium-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__Bio_Industries__/graphics/entities/biocannon/projectiles/fire.png",
      priority = "low",
      width = 30,
      height = 50,
      frame_count = 30,
      animation_speed = 1,
      line_length = 30,
      scale = 3,
    },
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 10,
    fade_away_duration = 2 * 60,
    spread_duration = 10,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            perimeter = 10,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 8, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
   --- big File Cloud
    {
    type = "smoke-with-trigger",
    name = "big-fire-cloud",
    flags = {"not-on-map"},
    show_when_smoke_off = true,
    animation =
    {
      filename = "__Bio_Industries__/graphics/entities/biocannon/projectiles/fire.png",
      priority = "low",
      width = 30,
      height = 50,
      frame_count = 30,
      animation_speed = 1,
      line_length = 30,
      scale = 3,
    },
    slow_down_factor = 0,
    affected_by_wind = false,
    cyclic = true,
    duration = 60 * 12,
    fade_away_duration = 2 * 60,
    spread_duration = 12,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          type = "nested-result",
          action =
          {
            type = "area",
            perimeter = 12,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 10, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  
  	{
		type = "smoke-with-trigger",
		name = "bio-cannon-explosion",
		flags = {"not-on-map"},
		show_when_smoke_off = true,
		animation =
		{
			filename = "__Bio_Industries__/graphics/entities/biocannon/projectiles/explosion.png",
			priority = "low",
			width = 256,
			height = 128,
			frame_count = 12,
			animation_speed = 0.2,
			line_length = 3,
			scale = 2,
		},
		sound =
		{
		{
			filename = "__Bio_Industries__/sound/boom.ogg",
			volume = 4.0
		},
		},
		slow_down_factor = 0,
		affected_by_wind = false,
		cyclic = false,
		duration = 60 * 5,
		spread_duration = 10,
	},

  

})