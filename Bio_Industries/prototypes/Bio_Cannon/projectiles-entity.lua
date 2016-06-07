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


})