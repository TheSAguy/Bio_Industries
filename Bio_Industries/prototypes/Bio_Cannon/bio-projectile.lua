require "util"

---- Doubles damage if you're playing with NE Enemies
local NE_Damage = 1

if data.raw["unit"]["small-biter-Mk2"] ~= nil and data.raw["unit"]["small-spitter-Mk2"] ~= nil then

	NE_Damage = 2
	
end



data:extend({
	--Projectile

 -- Have Buster Ammo
  --- Bio
  {
    type = "projectile",
    name = "Bio_Cannon_Bio_Ammo",
    flags = {"not-on-map"},
    acceleration = 0.0005,
	action =
	{
		{
			type = "area",
			perimeter = 15,
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
					damage = {amount = 100 * NE_Damage, type = "explosion"}
					},
					{
					type = "damage",
					damage = {amount = 350 * NE_Damage, type = "Biological"}
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
					entity_name = "big-fire-cloud",
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
        filename = "__Bio_Industries__/graphics/entities/biocannon/projectiles/Bio_Cannon_Bio_Ammo.png",
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


data:extend({

	-- Hive Buster Bio Ammo
	{
		type = "ammo",
		name = "Bio_Cannon_Bio_Ammo",
		icon = "__Bio_Industries__/graphics/entities/biocannon/projectiles/Bio_Cannon_Bio_Ammo_Icon.png",
		flags = { "goes-to-main-inventory" },
		ammo_type =
		{
			category = "Bio_Cannon_Ammo",
			target_type = "direction",
			action =
			{
				{
					type = "direct",
					action_delivery =
					{				
						type = "projectile",
						projectile = "Bio_Cannon_Bio_Ammo",
						starting_speed = 1,
						direction_deviation = 0.8,
						range_deviation = 0.8,
						max_range = 75
					}
				}
			}
		},
		subgroup = "ammo",
		order = "a[Bio_Cannon_Ammo]-c[Bio]",
		stack_size = 50,
	},


})


--- Recipe
data:extend({

  -- Hive Buster Ammo
  -- Bio

 {
    type= "recipe",
    name= "Bio_Cannon_Bio_Ammo",
    enabled = false,
	energy_required = 8,
	ingredients = {{"Bio_Cannon_Basic_Ammo", 1},{"alien-artifact", 2}, {"explosive-rocket", 10}},
    result = "Bio_Cannon_Bio_Ammo",
	result_count = 2,
 },

 })
