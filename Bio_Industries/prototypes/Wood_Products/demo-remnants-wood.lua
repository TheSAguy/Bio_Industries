
destroyed_rail_pictures_w = function()
  return rail_pictures_internal_w({{"metals", "metals-remnants", mipmap = true, variations = 3},
                                 {"backplates", "backplates-remnants", mipmap = true, variations = 3},
                                 {"ties", "ties-remnants", variations = 3},
                                 {"stone_path", "stone-path-remnants", variations = 3},
                                 {"stone_path_background", "stone-path-background-remnants", variations = 3}})
end

data:extend(
{

  {
    type = "rail-remnants",
    name = "straight-rail-remnants-wood",
    icon = "__base__/graphics/icons/straight-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "remnants",
    order="d[remnants]-b[rail]-a[straight]",
    selection_box = {{-0.6, -0.8}, {0.6, 0.8}},
    selectable_in_game = false,
    tile_width = 2,
    tile_height = 2,
    bending_type = "straight",
    --pictures = destroyed_rail_pictures_w(),
	pictures = destroyed_rail_pictures(),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },
  {
    type = "rail-remnants",
    name = "curved-rail-remnants-wood",
    icon = "__base__/graphics/icons/curved-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "remnants",
    order="d[remnants]-b[rail]-b[curved]",
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    selectable_in_game = false,
    tile_width = 4,
    tile_height = 8,
    bending_type = "turn",
    --pictures = destroyed_rail_pictures_w(),
	pictures = destroyed_rail_pictures(),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },

    {
    type = "rail-remnants",
    name = "straight-rail-remnants-wood-bridge",
    icon = "__base__/graphics/icons/straight-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "remnants",
    order="d[remnants]-b[rail]-a[straight]",
    selection_box = {{-0.6, -0.8}, {0.6, 0.8}},
    selectable_in_game = false,
    tile_width = 2,
    tile_height = 2,
    bending_type = "straight",
    --pictures = destroyed_rail_pictures_w(),
	pictures = destroyed_rail_pictures(),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },
  {
    type = "rail-remnants",
    name = "curved-rail-remnants-wood-bridge",
    icon = "__base__/graphics/icons/curved-rail-remnants.png",
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "remnants",
    order="d[remnants]-b[rail]-b[curved]",
    collision_box = {{-1, -1}, {1, 1}},
    selection_box = {{-1.7, -0.8}, {1.7, 0.8}},
    selectable_in_game = false,
    tile_width = 4,
    tile_height = 8,
    bending_type = "turn",
    --pictures = destroyed_rail_pictures_w(),
	pictures = destroyed_rail_pictures(),
    time_before_removed = 60 * 60 * 45,
    time_before_shading_off = 60 * 60 * 1
  },

 
}
)
