require "util"


local NE_Damage = 1
if data.raw["unit"]["small-biter-Mk2"] ~= nil and data.raw["unit"]["small-spitter-Mk2"] ~= nil then

	NE_Damage = 2
	
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
					damage = {amount = 100 * NE_Damage, type = "physical"}
					},
					{
					type = "damage",
					damage = {amount = 150 * NE_Damage, type = "explosion"}
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
					entity_name = "small-fire-cloud",
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
	light = {intensity = 0.8, size = 6},
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
    }
  },

  --- Poison
   {
    type = "projectile",
    name = "Bio_Cannon_Poison_Ammo",
    flags = {"not-on-map"},
    acceleration = 0.0005,
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
					damage = {amount = 100 * NE_Damage, type = "physical"}
					},
					{
					type = "damage",
					damage = {amount = 150 * NE_Damage, type = "explosion"}
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
					entity_name = "medium-fire-cloud",
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
	light = {intensity = 0.8, size = 6},
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
    }
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
            perimeter = 3,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 3, type = "fire"}
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
            perimeter = 4,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 4, type = "fire"}
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
            perimeter = 5,
            action_delivery =
            {
              type = "instant",
              target_effects =
              {
                type = "damage",
                damage = { amount = 5, type = "fire"}
              }
            }
          }
        }
      }
    },
    action_frequency = 30
  },
  

})