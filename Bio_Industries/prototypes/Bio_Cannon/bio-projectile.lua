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
  --- Bio
  {
    type = "projectile",
    name = "Bio_Cannon_Bio_Ammo",
    flags = {"not-on-map"},
    acceleration = 0.0007,
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
					damage = {amount = 120 * NE_Damage, type = "physical"}
					},
					{
					type = "damage",
					damage = {amount = 180 * NE_Damage, type = "explosion"}
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
					entity_name = "bio-cannon-explosion",
					check_buildability = true
					},
					{
					type = "create-entity",
					entity_name = "big-fire-cloud",
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
	light = {intensity = 0.9, size = 8},
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
						max_range = 85
					}
				}
			}
		},
		subgroup = "ammo",
		order = "z[Bio_Cannon_Ammo]-c[Bio]",
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
	category = "crafting-with-fluid",
    enabled = false,
	energy_required = 8,

	ingredients =
		{
			{type="item", name="Bio_Cannon_Basic_Ammo", amount=1},
			{type="item", name="explosive-rocket", amount=10},
			--{type="item", name="alien-artifact", amount=5},
			{type="fluid", name="NE_alien_toxin", amount=50},
			--{type="fluid", name="sulfuric-acid", amount=20},     

		},
	
	
    result = "Bio_Cannon_Bio_Ammo",
	result_count = 1,
 },

 })
