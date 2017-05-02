

data:extend({

  ---- Bio Fuel
  {
    type = "recipe",
    name = "bi-Bio_Fuel",
    --category = "chemistry",
	category = "biofarm-mod-bioreactor",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
		{type="item", name="bi-cellulose", amount=2},
	  --{type="fluid", name="sulfuric-acid", amount=10},
      --{type="fluid", name="NE_revitalization-solution", amount=10} <-- Will be added if you are using NE Buildings
    },
    results=
    {
      {type="fluid", name="bi-Bio_Fuel", amount=30},
    },
    --subgroup = "Evolution-fluids",
	subgroup = "fluid-recipes",
	order = "a[oil-processing]-z[bi-Bio_Fuel]",
  },
  -- Bio Fuel conversion to Oil products 
  {
    type = "recipe",
    name = "bi-Fuel_Conversion",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
		{type="fluid", name="bi-Bio_Fuel", amount=70},
		{type="fluid", name="crude-oil", amount=30},
    },
    results=
    {
		{type="fluid", name="light-oil", amount=35},  
		{type="fluid", name="heavy-oil", amount=20},
        {type="fluid", name="petroleum-gas", amount=45},
    },
    icon = "__Bio_Industries__/graphics/icons/bio_conversion.png",
    subgroup = "fluid-recipes",  
	order = "a[oil-processing]-b[advanced-oil-processing]-y[bi-Fuel_Conversion]",
  },

})

--- Plastics
data:extend({

	-- BIO Reactor --
	{
		type = "recipe",
		name = "bi-bioreactor",
		energy_required = 20,
		ingredients = {{"assembling-machine-1",1},{"steel-plate",5},{"electronic-circuit",5}},
		result = "bi-bioreactor",
		enabled = false,
		result_count = 1
	},
	
		-- PLASTIC --
	{
		type = "recipe",
		name = "bi-plastic",
		category = "chemistry",
		subgroup = "raw-material",
		order = "g[plastic-bar]",
		energy_required = 2,
		ingredients =
		{
			{type="item", name="bi-cellulose", amount=2}
		},
		results=
		{
			{type="item", name="plastic-bar", amount=4}
		},
		enabled = false,
	},
	
		
	-- LIQUID CO2
	{
		type = "recipe",
		name = "bi-liquid-co2",
		category = "chemistry",	
		energy_required = 5,
		ingredients ={{type="fluid", name="liquid-air", amount=10}},
		results=
		{
			{type="fluid", name="bi-liquid-co2", amount=10}
		},
		enabled = false,
		subgroup = "fluid-recipes",
		order = "x[oil-processing]-z[bi-liquid-co2]"
	},
	
		-- BIOMASS --
	{
		type = "recipe",
		name = "bi-biomass-0",
		icon = "__Bio_Industries__/graphics/icons/biomass.png",
		category = "biofarm-mod-bioreactor",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="water", amount=10},
			{type="fluid", name="bi-liquid-co2", amount=10},
			{type="item", name="fertiliser", amount=1}
		},
		results=
		{
			{type="fluid", name="bi-biomass", amount=30},
		},
		enabled = false,
		subgroup = "fluid-recipes",
		order = "x[oil-processing]-z[bi-biomass]"
	},	
	
	-- CELLULOSE --
	{
		type = "recipe",
		name = "bi-cellulose",
		category = "chemistry",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="bi-biomass", amount=20},
			{type="item", name="seedling", amount=25},
		},
		results=
		{
			{type="item", name="bi-cellulose", amount=1 }
		},
		enabled = false,
	},

})