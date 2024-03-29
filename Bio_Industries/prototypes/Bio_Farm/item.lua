local BioInd = require('common')('Bio_Industries')

local ICONPATH = BioInd.modRoot .. "/graphics/icons/"
local ICONPATHMIPS = BioInd.modRoot .. "/graphics/icons/mips/"

data:extend(
{
  ---- Seed
  {
    type = "item",
    name = "bi-seed",
    icon = ICONPATH .. "bio_seed.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "bio_seed.png",
        icon_size = 64,
      }
    },
    icon_mipmaps = 4,
    pictures = {
      --~ { size = 64, filename = ICONPATHMIPS.."bio_seed_1.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."bio_seed_2.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."bio_seed_3.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."bio_seed_4.png", scale = 0.25, mipmap_count = 1 }
      { size = 64, filename = ICONPATHMIPS.."bio_seed_1.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."bio_seed_2.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."bio_seed_3.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."bio_seed_4.png", scale = 0.25 }
    },
    category = "biofarm-mod-greenhouse",
    subgroup = "bio-bio-farm",
    order = "x[bi]-a[bi-seed]",
    fuel_value = "0.5MJ",
    fuel_category = "chemical",
    stack_size= 800
  },

  ---- Seedling
  {
    type = "item",
    name = "seedling",
    localised_name = {"entity-name.seedling"},
    localised_description = {"entity-description.seedling"},
    icon = ICONPATH .. "Seedling.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "Seedling.png",
        icon_size = 64,
      }
    },
        icon_mipmaps = 9,
    pictures = {
      --~ { size = 64, filename = ICONPATHMIPS.."Seedling_1.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Seedling_2.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Seedling_3.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Seedling_4.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Seedling_5.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Seedling_6.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Seedling_7.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Seedling_8.png", scale = 0.25, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Seedling_9.png", scale = 0.25, mipmap_count = 1 }
      { size = 64, filename = ICONPATHMIPS.."Seedling_1.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."Seedling_2.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."Seedling_3.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."Seedling_4.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."Seedling_5.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."Seedling_6.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."Seedling_7.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."Seedling_8.png", scale = 0.25 },
      { size = 64, filename = ICONPATHMIPS.."Seedling_9.png", scale = 0.25 }
    },
    subgroup = "bio-bio-farm",
    order = "x[bi]-b[bi-seedling]",
    place_result = "seedling",
    fuel_value = "0.5MJ",
    fuel_category = "chemical",
    stack_size= 400
  },

  ----Bio Farm
  {
    type= "item",
    name= "bi-bio-farm",
    localised_name = {"entity-name.bi-bio-farm"},
    localised_description = {"entity-description.bi-bio-farm"},
    icon = ICONPATH .. "Bio_Farm_Icon.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "Bio_Farm_Icon.png",
        icon_size = 64,
      }
    },
    subgroup = "production-machine",
    order = "x[bi]-ab[bi-bio-farm]",
    place_result = "bi-bio-farm",
    stack_size= 10,
  },

  ----Bio Greenhouse (Nursery)
  {
    type= "item",
    name= "bi-bio-greenhouse",
    localised_name = {"entity-name.bi-bio-greenhouse"},
    localised_description = {"entity-description.bi-bio-greenhouse"},
    icon = ICONPATH .. "bio_greenhouse.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "bio_greenhouse.png",
        icon_size = 64,
      }
    },
    subgroup = "production-machine",
    order = "x[bi]-aa[bi-bio-greenhouse]",
    place_result = "bi-bio-greenhouse",
    stack_size= 10,
  },

  --- Cokery
  {
    type = "item",
    name = "bi-cokery",
    icon = ICONPATH .. "cokery.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "cokery.png",
        icon_size = 64,
      }
    },
    subgroup = "production-machine",
    order = "x[bi]-b[bi-cokery]",
    place_result = "bi-cokery",
    stack_size = 10
  },

  --- Stone Crusher
  {
    type = "item",
    name = "bi-stone-crusher",
    localised_name = {"entity-name.bi-stone-crusher"},
    localised_description = {"entity-description.bi-stone-crusher"},
    icon = ICONPATH .. "stone_crusher.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "stone_crusher.png",
        icon_size = 64,
      }
    },
    subgroup = "production-machine",
    order = "x[bi]-c[bi-stone-crusher]",
    place_result = "bi-stone-crusher",
    stack_size = 10
  },

  --- Wood Pulp
  {
    type = "item",
    name = "bi-woodpulp",
    icon = ICONPATH .. "woodpulp_64.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "woodpulp_64.png",
        icon_size = 64,
      }
    },
    icon_mipmaps = 4,
    pictures = {
      --~ { size = 64, filename = ICONPATHMIPS.."Woodpulp_1.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Woodpulp_2.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Woodpulp_3.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Woodpulp_4.png", scale = 0.2, mipmap_count = 1 }
      { size = 64, filename = ICONPATHMIPS.."Woodpulp_1.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Woodpulp_2.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Woodpulp_3.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Woodpulp_4.png", scale = 0.2 }
    },
    fuel_value = "1MJ",
    fuel_category = "chemical",
    subgroup = "raw-material",
    order = "a-b[bi-woodpulp]",
    stack_size = 800
  },

  --- Wood Bricks
  {
    type = "item",
    name = "wood-bricks",
    icon = ICONPATH .. "Fuel_Brick.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "Fuel_Brick.png",
        icon_size = 64,
      }
    },
    subgroup = "bio-bio-farm-raw",
    order = "a[bi]-a-bx[bi-woodbrick]",
    fuel_category = "chemical",
    fuel_value = "20MJ",
    stack_size = 200
  },


  --- Ash
  {
    type = "item",
    name = "bi-ash",
    icon = ICONPATH .. "ash.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "ash.png",
        icon_size = 64,
      }
    },
    icon_mipmaps = 4,
    pictures = {
      --~ { size = 64, filename = ICONPATHMIPS.."Ash_1.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Ash_2.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Ash_3.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Ash_4.png", scale = 0.2, mipmap_count = 1 }
      { size = 64, filename = ICONPATHMIPS.."Ash_1.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Ash_2.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Ash_3.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Ash_4.png", scale = 0.2 }
    },
    --~ fuel_value = "1MJ",
    --~ fuel_category = "chemical",
    subgroup = "raw-material",
    order = "a[bi]-a-b[bi-ash]",
    stack_size = 400
  },

  --- Charcoal
  {
    type = "item",
    name = "wood-charcoal",
    icon = ICONPATH .. "charcoal.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "charcoal.png",
        icon_size = 64,
      }
    },
    icon_mipmaps = 4,
    pictures = {
      --~ { size = 64, filename = ICONPATHMIPS.."Charcoal_1.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Charcoal_2.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Charcoal_3.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Charcoal_4.png", scale = 0.2, mipmap_count = 1 }
      { size = 64, filename = ICONPATHMIPS.."Charcoal_1.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Charcoal_2.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Charcoal_3.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Charcoal_4.png", scale = 0.2 }
    },
    fuel_value = "6MJ",
    fuel_category = "chemical",
    subgroup = "raw-material",
    order = "a[bi]-a-c[charcoal]",
    stack_size = 400
  },

  --- Coke Coal / Pellet Coke for Angels
  {
    type = "item",
    name = "pellet-coke",
    icon = ICONPATH .. "coke-coal.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "coke-coal.png",
        icon_size = 64,
      }
    },
    fuel_value = "28MJ",
    fuel_category = "chemical",
    fuel_acceleration_multiplier = 1.2,
    fuel_top_speed_multiplier = 1.1,
    subgroup = "raw-material",
    order = "a[bi]-a-g[bi-coke-coal]",
    stack_size = 400
  },


  --- Crushed Stone
  {
    type = "item",
    name = "stone-crushed",
    icon = ICONPATH .. "crushed-stone.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "crushed-stone.png",
        icon_size = 64,
      }
    },
    icon_mipmaps = 4,
    pictures = {
      --~ { size = 64, filename = ICONPATHMIPS.."Crush_1.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Crush_2.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Crush_3.png", scale = 0.2, mipmap_count = 1 },
      --~ { size = 64, filename = ICONPATHMIPS.."Crush_4.png", scale = 0.2, mipmap_count = 1 }
      { size = 64, filename = ICONPATHMIPS.."Crush_1.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Crush_2.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Crush_3.png", scale = 0.2 },
      { size = 64, filename = ICONPATHMIPS.."Crush_4.png", scale = 0.2 }
    },
    subgroup = "raw-material",
    order = "a[bi]-a-z[stone-crushed]",
    -- Changed for 0.18.34/1.1.4
    --~ stack_size = 800
    stack_size = 400
  },


  --- Seeb Bomb - Basic
  {
    type = "ammo",
    name = "bi-seed-bomb-basic",
    icon = ICONPATH .. "Seed_bomb_icon_b.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "Seed_bomb_icon_b.png",
        icon_size = 64,
      }
    },
    ammo_type = {
      range_modifier = 3,
      cooldown_modifier = 3,
      target_type = "position",
      category = "rocket",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "seed-bomb-projectile-1",
          starting_speed = 0.05,
        }
      }
    },
    subgroup = "ammo",
    order = "a[rocket-launcher]-x[seed-bomb]-a",
    stack_size = 10
  },


  --- Seeb Bomb - Standard
  {
    type = "ammo",
    name = "bi-seed-bomb-standard",
    icon = ICONPATH .. "Seed_bomb_icon_s.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "Seed_bomb_icon_s.png",
        icon_size = 64,
      }
    },
    ammo_type = {
      range_modifier = 3,
      cooldown_modifier = 3,
      target_type = "position",
      category = "rocket",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "seed-bomb-projectile-2",
          starting_speed = 0.05,
        }
      }
    },
    subgroup = "ammo",
    order = "a[rocket-launcher]-x[seed-bomb]-b",
    stack_size = 10
  },


  --- Seeb Bomb - Advanced
  {
    type = "ammo",
    name = "bi-seed-bomb-advanced",
    icon = ICONPATH .. "Seed_bomb_icon_a.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "Seed_bomb_icon_a.png",
        icon_size = 64,
      }
    },
    ammo_type = {
      range_modifier = 3,
      cooldown_modifier = 3,
      target_type = "position",
      category = "rocket",
      action = {
        type = "direct",
        action_delivery = {
          type = "projectile",
          projectile = "seed-bomb-projectile-3",
          starting_speed = 0.05,
        }
      }
    },
    subgroup = "ammo",
    order = "a[rocket-launcher]-x[seed-bomb]-c",
    stack_size = 10
  },

   --- Arboretum (Entity)
  {
    type= "item",
    name= "bi-arboretum-area",
    icon = ICONPATH .. "Arboretum_Icon.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "Arboretum_Icon.png",
        icon_size = 64,
      }
    },
    subgroup = "production-machine",
    order = "x[bi]-a[bi-arboretum]",
    place_result = "bi-arboretum-area",
    stack_size= 10,
  },

   --- Arboretum Hidden Recipe
  {
    type = "item",
    name = "bi-arboretum-r1",
    icon = ICONPATH .. "Seedling_b.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "Seedling_b.png",
        icon_size = 64,
      }
    },
    flags = {"hidden"},
    subgroup = "terrain",
    order = "bi-arboretum-r1",
    stack_size = 1
  },

  --- Arboretum Hidden Recipe
  {
    type = "item",
    name = "bi-arboretum-r2",
    icon = ICONPATH .. "bi_change_1.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "bi_change_1.png",
        icon_size = 64,
      }
    },
    flags = {"hidden"},
    subgroup = "terrain",
    order = "bi-arboretum-r2",
    stack_size = 1
  },

   --- Arboretum Hidden Recipe
  {
    type = "item",
    name = "bi-arboretum-r3",
    icon = ICONPATH .. "bi_change_2.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "bi_change_2.png",
        icon_size = 64,
      }
    },
    flags = {"hidden"},
    subgroup = "terrain",
    order = "bi-arboretum-r3",
    stack_size = 1
  },

  --- Arboretum Hidden Recipe
  {
    type = "item",
    name = "bi-arboretum-r4",
    icon = ICONPATH .. "bi_change_plant_1.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "bi_change_plant_1.png",
        icon_size = 64,
      }
    },
    flags = {"hidden"},
    subgroup = "terrain",
    order = "bi-arboretum-r4",
    stack_size = 1
  },

  --- Arboretum Hidden Recipe
  {
    type = "item",
    name = "bi-arboretum-r5",
    icon = ICONPATH .. "bi_change_plant_2.png",
    icon_size = 64,
    icons = {
      {
        icon = ICONPATH .. "bi_change_plant_2.png",
        icon_size = 64,
      }
    },
     flags = {"hidden"},
    subgroup = "terrain",
    order = "bi-arboretum-r5",
    stack_size = 1
  },

})

--- Fertilizer can change terrain to better terrain
--~ if BioInd.AB_tiles() then
  data:extend({
    --- fertilizer
    {
      type = "item",
      name = "fertilizer",
      icon = ICONPATH .. "fertilizer_64.png",
      icon_size = 64,
      icons = {
        {
          icon = ICONPATH .. "fertilizer_64.png",
          icon_size = 64,
        }
      },
      subgroup = "intermediate-product",
      order = "b[fertilizer]",
      stack_size = 200,
      -- 0.18.31/1.1.1: Moved to data-final-fixes.lua because we changed the name
      -- fron "fertiliser" to "fertilizer" and now PyAlienLife removes place_as_tile!
      --~ place_as_tile = {
        --~ result = "vegetation-green-grass-3",
        --~ condition_size = 1,
        --~ condition = { "water-tile" }
      --~ },
    },

    --- Adv fertilizer
    {
      type = "item",
      name = "bi-adv-fertilizer",
      icon = ICONPATH .. "advanced_fertilizer_64.png",
      icon_size = 64,
      icons = {
        {
          icon = ICONPATH .. "advanced_fertilizer_64.png",
          icon_size = 64,
        }
      },
      subgroup = "intermediate-product",
      order = "b[fertilizer]-b[bi-adv-fertilizer]",
      stack_size = 200,
      -- 0.18.31/1.1.1: Moved to data-final-fixes.lua because we changed the name
      -- from "bi-adv-fertiliser" to "bi-adv-fertilizer" and now PyAlienLife removes
      -- place_as_tile!
      --~ place_as_tile = {
        --~ result = "vegetation-green-grass-1",
        --~ condition_size = 1,
        --~ condition = { "water-tile" }
      --~ },
    },
  })

