
--- Bio Drill Stuff
data:extend({


  --- Bio Drill (ENTITY)
	{
		type = "recipe",
		name = "bi_recipe_bio_drill",
		icon = "__Bio_Industries__/graphics/icons/bi_drill_icon.png",
		icon_size = 32,
		enabled = false,
		energy_required = 5,
		ingredients =
		{
		  {"pipe", 20},
		  {"electronic-circuit", 10},
		  {"assembling-machine-1", 4},
		},
		result = "bi-drill-base",
		subgroup = "bio-bio-drill-drill",
		order = "aa[bi]",	
	},
 
 
	--- Drill Fix
	{
		type = "recipe",
		name = "bi_recipe_drill_fix",
		icon = "__Bio_Industries__/graphics/icons/drill_bit_1_icon.png",
		icon_size = 32,
		order = "bi-drill_fix",
		subgroup = "bio-bio-drill-drill",
		enabled = false,
		energy_required = 2,
		ingredients =
		{
		  {type="item", name="bi-worn-drill-bit", amount=1},
		  {type="item", name="iron-gear-wheel", amount=15}, 
		},
		results=
		{
		  {type="item", name="bi-drill-bit-mk1", amount=1},
		},
	},
	
	
	 --- Drill Mk1
	{
		type = "recipe",
		name = "bi_recipe_drill_mk1",
		icon = "__Bio_Industries__/graphics/icons/drill_bit_1_icon.png",
		icon_size = 32,
		order = "bi-drill_mk1",
		subgroup = "bio-bio-drill-drill",
		enabled = false,
		energy_required = 4,
		ingredients =
		{
		  {type="item", name="pipe", amount=40},
		  {type="item", name="iron-gear-wheel", amount=25}, 
		},
		results=
		{
		  {type="item", name="bi-drill-bit-mk1", amount=1},
		},
	},

	 --- Drill Mk2
	{
		type = "recipe",
		name = "bi_recipe_drill_mk2",
		icon = "__Bio_Industries__/graphics/icons/drill_bit_2_icon.png",
		icon_size = 32,
		order = "bi-drill_mk2",
		subgroup = "bio-bio-drill-drill",
		enabled = false,
		energy_required = 6,
		ingredients =
		{
		  {type="item", name="bi-drill-bit-mk1", amount=1},
		  {type="item", name="steel-plate", amount=40}, 
		},
		results=
		{
		  {type="item", name="bi-drill-bit-mk2", amount=1},
		},
	},

	 --- Drill Mk3
	{
		type = "recipe",
		name = "bi_recipe_drill_mk3",
		icon = "__Bio_Industries__/graphics/icons/drill_bit_3_icon.png",
		icon_size = 32,
		order = "bi-drill_mk3",
		subgroup = "bio-bio-drill-drill",
		category = "advanced-crafting",
		enabled = false,
		energy_required = 8,
		ingredients =
		{
		  {type="item", name="bi-drill-bit-mk2", amount=1},
		  {type="item", name="advanced-circuit", amount=50}, 
		  {type="fluid", name="lubricant", amount=50}, 
		},
		results=
		{
		  {type="item", name="bi-drill-bit-mk3", amount=1},
		},
	},
		
	 --- Turn the lakes into usable water... Very expensive 
  {
    type = "recipe",
    name = "bi_recipe_fresh_water",
    icon = "__Bio_Industries__/graphics/icons/bi_water_1_icon.png",
    icon_size = 32,
    category = "chemistry",
    enabled = false,
    energy_required = 4,
    ingredients =
    {
      {type="fluid", name = "water-saline", amount = 100},
	  {type="item", name = "pellet-coke", amount = 8},
    },
    results=
    {
      {type="fluid", name = "water", amount = 100},
	  {type="item", name = "stone-crushed", amount = 5},
    },
	main_product = "water",
	subgroup = "bio-bio-farm-intermediate-product",
    order = "0aa",
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    }
  },

 	 --- Turn the lakes into usable water... Very expensive 
  {
    type = "recipe",
    name = "bi_recipe_fresh_water_2",
    icon = "__Bio_Industries__/graphics/icons/bi_water_2_icon.png",
    icon_size = 32,
    category = "chemistry",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {type="fluid", name = "water-saline", amount = 90},
	  {type="fluid", name = "liquid-air", amount = 10},
	  {type="item", name = "bi-charcoal", amount = 10},
	  {type="item", name = "stone-crushed", amount = 10},
    },
    results=
    {
      {type="fluid", name ="water", amount = 100},
	  --{type="item", name ="sodium-hydroxide", amount = 5}, will add if Bob or Angels
    },
	main_product = "water",
	subgroup = "bio-bio-farm-intermediate-product",
    order = "0ab",
    crafting_machine_tint =
    {
      primary = {r = 0.290, g = 0.027, b = 0.000, a = 0.000}, -- #49060000
      secondary = {r = 0.722, g = 0.465, b = 0.190, a = 0.000}, -- #b8763000
      tertiary = {r = 0.870, g = 0.365, b = 0.000, a = 0.000}, -- #dd5d0000
    }
  },

  
  
  	 --- Burner Pumpjack
	{
		type = "recipe",
		name = "bi_recipe_burner_pump",
		icon = "__Bio_Industries__/graphics/icons/bi_basic_pumpjack.png",
		icon_size = 32,
		order = "0aaa",
		subgroup = "bio-bio-drill-drill",
		enabled = true,
		energy_required = 4,
		ingredients =
		{
		  {type="item", name="pipe", amount=4}, 
		  {type="item", name="iron-gear-wheel", amount=4}, 
		},
		results=
		{
		  {type="item", name="bi-burner-pump", amount=1},
		},
	},

 }
)


infinite_fluids = require("prototypes.Bio_Drill.supported-resources")

local x = 1
local y = 1
local z = 1
local mk1 = {}
local mk2 = {}
local mk3 = {}


--- Mk1 Recipies
for _, resource in pairs(infinite_fluids) do
  local order = ""
  local default_value = false

  if x < 10 then
    order = "bi-prospecting-mk1-0" .. x
  else
    order = "bi-prospecting-mk1-" .. x
  end

  if resource.default ~= nil then
    default_value = resource.default
  end

  if mods[resource.dependency] and default_value then

	table.insert(mk1, 
    {
		type = "recipe",
		name = "bi_recipe_mk1_" .. resource.fluid,
		icon = "__Bio_Industries__/graphics/icons/prospect_mk1_" .. resource.fluid .. ".png",
		icon_size = 32,
		order = resource.fluid .. order,
		category = "bi-drill",
		subgroup = "bio-bio-drill-mk1",
		enabled = false,
		energy_required = 7,
		ingredients =
		{
		  {type="item", name="bi-drill-bit-mk1", amount=1},
		},
		results=
		{
		  {type="item", name="bi-worn-drill-bit", amount=1},
		},
		localised_name = {"recipe-name.bi_recipe_mk1_" .. resource.fluid},
		localised_description = {"recipe-description.bi_recipe_mk1_" .. resource.fluid},
    })

    x = x + 1
  end
  
end

--- Mk2 Recipies
for _, resource in pairs(infinite_fluids) do
  local order = ""
  local default_value = false

  if y < 10 then
    order = "bi-prospecting-mk2-0" .. y
  else
    order = "bi-prospecting-mk2-" .. y
  end

  if resource.default ~= nil then
    default_value = resource.default
  end

  if mods[resource.dependency] and default_value then

	table.insert(mk2, 
    {
		type = "recipe",
		name = "bi_recipe_mk2_" .. resource.fluid,
		icon = "__Bio_Industries__/graphics/icons/prospect_mk2_" .. resource.fluid .. ".png",
		icon_size = 32,
		order = resource.fluid .. order,
		category = "bi-drill",
		subgroup = "bio-bio-drill-mk2",
		enabled = false,
		energy_required = 20,
		ingredients =
		{
		  {type="item", name="bi-drill-bit-mk2", amount=1},
		},
		results=
		{
		  {type="item", name="bi-worn-drill-bit", amount=1},
		},
		localised_name = {"recipe-name.bi_recipe_mk2_" .. resource.fluid},
		localised_description = {"recipe-description.bi_recipe_mk2_" .. resource.fluid},  
    })

    y = y + 1
  end
  
end

--- Mk3 Recipies
for _, resource in pairs(infinite_fluids) do
  local order = ""
  local default_value = false

  if z < 10 then
    order = "bi-prospecting-mk3-0" .. z
  else
    order = "bi-prospecting-mk3-" .. z
  end

  if resource.default ~= nil then
    default_value = resource.default
  end

  if mods[resource.dependency] and default_value then

	table.insert(mk3, 
    {
		type = "recipe",
		name = "bi_recipe_mk3_" .. resource.fluid,
		icon = "__Bio_Industries__/graphics/icons/prospect_mk3_" .. resource.fluid .. ".png",
		icon_size = 32,
		order = resource.fluid .. order,
		category = "bi-drill",
		subgroup = "bio-bio-drill-mk3",
		enabled = false,
		energy_required = 35,
		ingredients =
		{
		  {type="item", name="bi-drill-bit-mk3", amount=1},
		},
		results=
		{
		  {type="item", name="bi-worn-drill-bit", amount=1},
		},
		localised_name = {"recipe-name.bi_recipe_mk3_" .. resource.fluid},
		localised_description = {"recipe-description.bi_recipe_mk3_" .. resource.fluid},	  
    })

    z = z + 1
  end
  
end

data:extend(mk1)
data:extend(mk2)
data:extend(mk3)
