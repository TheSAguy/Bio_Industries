 data:extend({
 
  {
    type = "noise-layer",
    name = "ground-water"
  },
  
  {
    type = "autoplace-control",
    name = "ground-water",
    richness = true,
    order = "a",
    category = "resource",
  },

  
	--- Ground Water
  {
	  type = "resource",
	  name = "ground-water",
	  icon = "__base__/graphics/icons/fluid/water.png",
	  icon_size = 32,
	  flags = {"placeable-neutral"},
	  order = "a[fluid]-a[water]",
	  category = "basic-fluid",
	  infinite = false,
	  highlight = true,
	  starting = {richness=1000, size=4, probability=1},
	  minimum = 1000,
	  normal = 1000,
	  resource_patch_search_radius = 12,
	  tree_removal_probability = 0.7,
      tree_removal_max_distance = 32 * 32,
	  minable =
	  {
		  hardness = 1,
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "water",
			  amount_min = 10,
			  amount_max = 10,
			  probability = 1
			}
		  }
	  },	  
	  collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
	  selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	  particle = nil,
	  stage_counts = {0},
	  stages =
	  {
		sheet =
			{
			filename = "__Bio_Industries__/graphics/resources/bi_fluid_resource.png",
			priority = "extra-high",
			width = 75,
			height = 61,
			frame_count = 4,
			tint = {r = 0.2, g = 0.8, b = 1},
			variation_count = 1
			},
	  },
	  map_color = {r = 0.2, g = 0.8, b = 1},
	  disable_map_grid = true,
	  map_grid = false,
	  enabled = true,

	  autoplace =
	  {
			order = "b",
			control = "ground-water",
			sharpness = 0.99,
			max_probability = 0.02,
			richness_base = 1000,
			richness_multiplier = 2000,
			richness_multiplier_distance_bonus = 1500,
			coverage = 0.001 / 3,
			peaks =
			{
			  {
				noise_layer = "ground-water",
				noise_octaves_difference = -0.5,
				noise_persistence = 0.4,
			  }
			},
		  
			starting_area_size = 100,
			starting_area_amount = 4,
		},
  },
  
--- Steam
  {
	  type = "resource",
	  name = "bi-ground-steam",
	  icon = "__base__/graphics/icons/fluid/steam.png",
	  icon_size = 32,
	  flags = {"placeable-neutral"},
	  order = "a[fluid]-b[steam]",
	  category = "basic-fluid",
	  infinite = false,
	  highlight = true,
	  minimum = 2000,
	  normal = 5000,
	  starting = {richness=1000, size=10, probability=10},
	  resource_patch_search_radius = 12,
	  tree_removal_probability = 0.7,
      tree_removal_max_distance = 32 * 32,
	  minable =
	  {
		  hardness = 1,
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "steam",
			  amount_min = 10,
			  amount_max = 10,
			  probability = 1
			}
		  }
	  },	  
	  collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
	  selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	  particle = nil,
	  stage_counts = {0},
	  stages =
	  {
		sheet =
			{
			filename = "__Bio_Industries__/graphics/resources/bi_fluid_resource.png",
			priority = "extra-high",
			width = 75,
			height = 61,
			frame_count = 4,
			tint = {r = 0.5, g = 0.5, b = 0.5},
			variation_count = 1
			},
	  },
	  map_color = {r = 0.5, g = 0.5, b = 0.5},
	  disable_map_grid = true,
	  map_grid = false,
	  enabled = false,
	  --autoplace = {},
  },


--- Ground Sulfuric-acid
  {
	  type = "resource",
	  name = "bi-ground-sulfuric-acid",
	  icon = "__base__/graphics/icons/fluid/sulfuric-acid.png",
	  icon_size = 32,
	  flags = {"placeable-neutral"},
	  order = "a[fluid]-f[sulfuric-acid]",
	  category = "basic-fluid",
	  infinite = false,
	  highlight = true,
	  minimum = 2000,
	  normal = 5000,
	  starting = {richness=1000, size=10, probability=10},
	  resource_patch_search_radius = 12,
	  tree_removal_probability = 0.7,
      tree_removal_max_distance = 32 * 32,
	  minable =
	  {
		  hardness = 1,
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "sulfuric-acid",
			  amount_min = 10,
			  amount_max = 10,
			  probability = 1
			}
		  }
	  },	  
	  collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
	  selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	  particle = nil,
	  stage_counts = {0},
	  stages =
	  {
		sheet =
			{
			filename = "__Bio_Industries__/graphics/resources/bi_fluid_resource.png",
			priority = "extra-high",
			width = 75,
			height = 61,
			frame_count = 4,
			tint = {r = 0.75, g =0.65,  b= 0.1},
			variation_count = 1
			},
	  },
	  map_color = {r = 0.75, g =0.65,  b= 0.1},
	  disable_map_grid = true,
	  map_grid = false,
	  enabled = false,
	  --autoplace = {},
  },
  
  
 })
 
 
 --[[
  if settings.startup["bobmods-plates-purewater"] and settings.startup["bobmods-plates-purewater"].value == true then
   data:extend({
   
    
  {
    type = "noise-layer",
    name = "bi-ground-water"
  },
  
  {
    type = "autoplace-control",
    name = "bi-ground-water",
    richness = true,
    order = "a",
    category = "resource",
  },

 
 
  --- Ground-water if Pure Water is Enabled
  {
	  type = "resource",
	  name = "bi-ground-water",
	  icon = "__base__/graphics/icons/fluid/water.png",
	  icon_size = 32,
	  flags = {"placeable-neutral"},
	  order = "a[fluid]-a[water]",
	  category = "basic-fluid",
	  infinite = false,
	  highlight = true,
	  starting = {richness=1000, size=4, probability=1},
	  minimum = 1000,
	  normal = 1000,
	  resource_patch_search_radius = 12,
	  tree_removal_probability = 0.7,
      tree_removal_max_distance = 32 * 32,
	  minable =
	  {
		  hardness = 1,
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "water",
			  amount_min = 10,
			  amount_max = 10,
			  probability = 1
			}
		  }
	  },	  
	  collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
	  selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	  particle = nil,
	  stage_counts = {0},
	  stages =
	  {
		sheet =
			{
			filename = "__Bio_Industries__/graphics/resources/bi_fluid_resource.png",
			priority = "extra-high",
			width = 75,
			height = 61,
			frame_count = 4,
			tint = {r = 0.2, g = 0.8, b = 1},
			variation_count = 1
			},
	  },
	  map_color = {r = 0.2, g = 0.8, b = 1},
	  disable_map_grid = true,
	  map_grid = false,
	  enabled = true,

	  autoplace =
	  {
			order = "b",
			control = "bi-ground-water",
			sharpness = 0.99,
			max_probability = 0.02,
			richness_base = 1000,
			richness_multiplier = 2000,
			richness_multiplier_distance_bonus = 1500,
			coverage = 0.001 / 3,
			peaks =
			{
			  {
				noise_layer = "bi-ground-water",
				noise_octaves_difference = -0.5,
				noise_persistence = 0.4,
			  }
			},
		  
			starting_area_size = 100,
			starting_area_amount = 4,
		},
  },
	})
  else
  
  data:extend({
    --- Ground-water if Pure Water is not Enabled
  {
	  type = "resource",
	  name = "ground-water",
	  icon = "__base__/graphics/icons/fluid/water.png",
	  icon_size = 32,
	  flags = {"placeable-neutral"},
	  order = "a[fluid]-a[water]",
	  category = "basic-fluid",
	  infinite = false,
	  highlight = true,
	  starting = {richness=1000, size=4, probability=1},
	  minimum = 1000,
	  normal = 1000,
	  resource_patch_search_radius = 12,
	  tree_removal_probability = 0.7,
      tree_removal_max_distance = 32 * 32,
	  minable =
	  {
		  hardness = 1,
		  mining_time = 1,
		  results =
		  {
			{
			  type = "fluid",
			  name = "water",
			  amount_min = 10,
			  amount_max = 10,
			  probability = 1
			}
		  }
	  },	  
	  collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
	  selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
	  particle = nil,
	  stage_counts = {0},
	  stages =
	  {
		sheet =
			{
			filename = "__Bio_Industries__/graphics/resources/bi_fluid_resource.png",
			priority = "extra-high",
			width = 75,
			height = 61,
			frame_count = 4,
			tint = {r = 0.2, g = 0.8, b = 1},
			variation_count = 1
			},
	  },
	  map_color = {r = 0.2, g = 0.8, b = 1},
	  disable_map_grid = true,
	  map_grid = false,
	  enabled = true,

	  autoplace =
	  {
			order = "b",
			control = "ground-water",
			sharpness = 0.99,
			max_probability = 0.02,
			richness_base = 1000,
			richness_multiplier = 2000,
			richness_multiplier_distance_bonus = 1500,
			coverage = 0.001 / 3,
			peaks =
			{
			  {
				noise_layer = "ground-water",
				noise_octaves_difference = -0.5,
				noise_persistence = 0.4,
			  }
			},
		  
			starting_area_size = 100,
			starting_area_amount = 4,
		},
  },

  })
  
  end
  ]]