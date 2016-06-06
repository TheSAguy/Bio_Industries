data:extend({
	--- Seedling
	{
		type = "recipe",
		name = "bi-seedling",
		enabled = "false",
		subgroup = "raw-material",
		energy_required = 0.5,
		icon = "__Bio_Industries__/graphics/icons/Seedling.png",
		ingredients = {{"raw-wood",1}},
		results=
		{
		  {type="item", name="bi-seedling", amount=2},
		  {type="item", name="bi-woodpulp", amount=1}
		},
	},
	--- Bio Farm
	{
		type = "recipe",
		name = "bi_bio_farm",
		enabled = "false",
		ingredients = 
		{
		  {"iron-stick",20},
		  {"copper-cable",10},
		  {"stone",20},
		  {"small-lamp",10}
		},
		result = "bi_bio_farm"
	},
	
		--- Raw Wood from Water
	{
		type = "recipe",
		name = "bi-Logs_Mk1",
		category = "biofarm-mod-dummy",
		enabled = "false",
		energy_required = 500,
		ingredients =
		{
		  {type="item", name="bi-seedling", amount=20},     
		  {type="fluid", name="water", amount=100},
		},
		result_count = 40,
		result = "raw-wood"
	},
	
		--- Raw Wood from Water & Fertilizer
	{
    type = "recipe",
    name = "bi-Logs_Mk2",
    category = "biofarm-mod-dummy",
    enabled = "false",
    energy_required = 350,
	ingredients =
    {
      {type="item", name="bi-seedling", amount=30},     
	  {type="item", name="bi-fertilizer", amount=10},     
      {type="fluid", name="water", amount=100},
    },
    result_count = 75,
    result = "raw-wood"
	},
	
		
		--- Raw Wood from Fertilizer & NE_enhanced-nutrient-solution (Natural Evolution Mod)
	{
    type = "recipe",
    name = "bi-Logs_Mk3",
    category = "biofarm-mod-dummy",
    enabled = "false",
    energy_required = 200,
	ingredients =
    {
      {type="item", name="bi-seedling", amount=50},     
      {type="fluid", name="water", amount=100},
	  --{type="item", name="bi-adv-fertilizer", amount=5},     -- Will be added if you have Natural Evolution Buildings Mod installed.
    },
    result_count = 150,
    result = "raw-wood"
	},
	
	
		-- Advanced FERTILIZER --
	{
		type = "recipe",
		name = "bi-adv-fertilizer",
		category = "chemistry",
		energy_required = 125,
		icon = "__Bio_Industries__/graphics/icons/advanced_fertilizer_32.png",
		ingredients =
		{
			{type="item", name="bi-fertilizer", amount=25},
			{type="item", name="bi-woodpulp", amount=50},
			--{type="fluid", name="NE_enhanced-nutrient-solution", amount=5}, -- Will be added if you have Natural Evolution Buildings Mod installed.
		},
		results=
		{
			{type="item", name="bi-adv-fertilizer", amount=50}
		},
		enabled = "false"
	},
	
})

data:extend(
{

	-- CHARCOAL 1
	{
		type = "recipe",
		name = "bi-charcoal",
		icon = "__Bio_Industries__/graphics/icons/charcoal.png",
		subgroup = "raw-material",
		order = "b[charcoal]",
		category = "biofarm-mod-smelting",
		energy_required = 36,
		ingredients = {{"bi-woodpulp",40}},
		result = "bi-charcoal",
		result_count = 18,
		enabled = "false"
	},
	-- CHARCOAL 2
	{
		type = "recipe",
		name = "bi-charcoal-2",
		icon = "__Bio_Industries__/graphics/icons/charcoal.png",
		subgroup = "raw-material",
		order = "b[charcoal]",
		category = "biofarm-mod-smelting",
		energy_required = 36,
		ingredients = {{"raw-wood",20}},
		result = "bi-charcoal",
		result_count = 18,
		enabled = "false"
	},	
	-- COAL 1 --
	{
		type = "recipe",
		name = "bi-coal",
		category = "biofarm-mod-smelting",
		subgroup = "raw-material",
		energy_required = 18,
		ingredients = {{"bi-charcoal",12}},
		result = "coal",
		result_count = 8,
		enabled = "false"
	},
	-- COAL 2 --
	{
		type = "recipe",
		name = "bi-coal-2",
		category = "biofarm-mod-smelting",
		subgroup = "raw-material",
		energy_required = 18,
		ingredients = {{"bi-charcoal",12}},
		result = "coal",
		result_count = 10,
		enabled = "false"
	},
	-- COKE-COAL --
	{
		type = "recipe",
		name = "bi-coke-coal",
		category = "biofarm-mod-smelting",
		energy_required = 25,
		ingredients = {{"coal",15}},
		result = "bi-coke-coal",
		result_count = 10,
		enabled = "false"
	},
	-- ASH --
	{
		type = "recipe",
		name = "bi-ash",
		category = "biofarm-mod-smelting",
		energy_required = 10,
		ingredients = {{"raw-wood",5}},
		result = "bi-ash",
		result_count = 10,
		enabled = "false"
	},   
	-- ASH 2--
	{
		type = "recipe",
		name = "bi-ash-2",
		category = "biofarm-mod-smelting",
		energy_required = 5,
		ingredients = {{"bi-woodpulp",10}},
		result = "bi-ash",
		result_count = 10,
		enabled = "false"
	},  
	-- CRUSHED STONE --
	{
		type = "recipe",
		name = "bi-crushed-stone",
		category = "biofarm-mod-crushing",
		energy_required = 5,
		ingredients = {{"stone",1}},
		result = "bi-crushed-stone",
		result_count = 3,
		enabled = "false"
	},
	-- LIQUID-AIR --
	{
		type = "recipe",
		name = "bi-liquid-air",
		category = "chemistry",
		subgroup = "intermediate-product",
		energy_required = 1,
		ingredients = {},
		results=
		{
			{type = "fluid", name = "liquid-air", amount = 10}
		},
		enabled = "false"
	},
	-- -NITROGEN --
	{
		type = "recipe",
		name = "bi-nitrogen",
		category = "chemistry",
		subgroup = "intermediate-product",
		energy_required = 10,
		ingredients ={{type="fluid", name="liquid-air", amount=2}},
		results=
		{
			{type="fluid", name="nitrogen", amount=2}
		},
		enabled = "false"
	},
	-- LIQUID CO2
	{
		type = "recipe",
		name = "bi-liquid-co2",
		category = "chemistry",
		subgroup = "intermediate-product",
		energy_required = 10,
		ingredients ={{type="fluid", name="liquid-air", amount=1}},
		results=
		{
			{type="fluid", name="bi-liquid-co2", amount=1}
		},
		enabled = "false"
	},
	-- FERTILIZER--
	{
		type = "recipe",
		name = "bi-fertilizer",
		category = "chemistry",
		energy_required = 5,
		icon = "__Bio_Industries__/graphics/icons/fertilizer_32.png",
		ingredients =
		{
			{type = "item", name = "sulfur", amount = 1},
			{type="item", name="bi-crushed-stone", amount=5},
			{type="fluid", name="nitrogen", amount=1},
			{type="item", name="bi-ash", amount=5}
		},
		results=
		{
			{type="item", name="bi-fertilizer", amount=5}
		},
		enabled = "false"
	},
	-- BIOMASS --
	{
		type = "recipe",
		name = "bi-biomass-0",
		icon = "__Bio_Industries__/graphics/icons/biomass.png",
		subgroup = "intermediate-product",
		category = "biofarm-mod-bioreactor",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="water", amount=10},
			{type="fluid", name="bi-liquid-co2", amount=1},
			{type="item", name="bi-fertilizer", amount=1}
		},
		results=
		{
			{type="fluid", name="bi-biomass", amount=2},
		},
		enabled = "false"
	},	
	-- CELLULOSE --
	{
		type = "recipe",
		name = "bi-cellulose",
		category = "chemistry",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="bi-biomass", amount=1.6}
		},
		results=
		{
			{type="item", name="bi-cellulose", amount=1 }
		},
		enabled = "false"
	},
	-- PLASTIC --
	{
		type = "recipe",
		name = "bi-platic",
		category = "chemistry",
		subgroup = "raw-material",
		order = "g[plastic-bar]",
		energy_required = 1,
		ingredients =
		{
			{type="item", name="bi-cellulose", amount=2}
		},
		results=
		{
			{type="item", name="plastic-bar", amount=1}
		},
		enabled = "false"
	},
	-- COKERY --
	{
		type = "recipe",
		name = "bi-cokery",
		ingredients = {{"stone-furnace",3},{"steel-plate",10}},
		result = "bi-cokery",
		result_count = 1,
		enabled = "false"
	},
	-- STONE CRUSHER --
	{
		type = "recipe",
		name = "bi-stone-crusher",
		ingredients = {{"iron-plate",10},{"steel-plate",10},{"copper-cable",5},{"iron-gear-wheel",5}},
		result = "bi-stone-crusher",
		enabled = "false",
		result_count = 1
	},
	-- BIO Reactor --
	{
		type = "recipe",
		name = "bi-bioreactor",
		ingredients = {{"assembling-machine-1",1},{"steel-plate",5},{"electronic-circuit",5}},
		result = "bi-bioreactor",
		enabled = "false",
		result_count = 1
	},

})
