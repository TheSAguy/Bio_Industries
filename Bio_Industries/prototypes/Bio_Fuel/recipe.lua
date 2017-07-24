

data:extend({

  ---- Bio Fuel
  {
    type = "recipe",
    name = "bi-Bio_Fuel",
	icon = "__Bio_Industries__/graphics/icons/bio-fuel.png",
	category = "biofarm-mod-bioreactor",
    energy_required = 10,
    enabled = false,
    ingredients =
    {
		{type="item", name="bi-cellulose", amount=2},
      --{type="fluid", name="NE_revitalization-solution", amount=10} <-- Will be added if you are using NE Buildings
    },
    results=
    {
      {type="fluid", name="bi-Bio_Fuel", amount=30},
    },
	subgroup = "fluid-recipes",
	order = "a[oil-processing]-z[bi-Bio_Fuel]",
  },
  
  
  -- Bio Fuel conversion to Oil products    
  {
    type = "recipe",
    name = "bi-Fuel_Conversion-1",
	icon = "__Bio_Industries__/graphics/icons/bio_conversion.png",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
		{type="fluid", name="steam", amount=50},
		{type="fluid", name="bi-Bio_Fuel", amount=70},
    },
    results=
    {
	    {type="fluid", name="heavy-oil", amount=35},
		{type="fluid", name="light-oil", amount=15},
		{type="fluid", name="petroleum-gas", amount=20}

    },
    
    subgroup = "fluid-recipes",  
	order = "a[oil-processing]-b[advanced-oil-processing]-y[bi-Fuel_Conversion]",
  },

  
  
  {
    type = "recipe",
    name = "bi-Fuel_Conversion-2",
	icon = "__Bio_Industries__/graphics/icons/bio_conversion_2.png",
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
		{type="fluid", name="water", amount=50},
		{type="fluid", name="bi-Bio_Fuel", amount=75},
		{type="item", name="coal", amount=25},
    },
    results=
    {
	    {type="fluid", name="heavy-oil", amount=10},
		{type="fluid", name="light-oil", amount=25},
		{type="fluid", name="crude-oil", amount=65},

    },

    subgroup = "fluid-recipes",  
	order = "a[oil-processing]-b[advanced-oil-processing]-z[bi-Fuel_Conversion]",
  },




	--- Bio Boiler ---

	{
		type = "recipe",
		name = "bio_boiler",
		normal =
		{
			enabled = false,
			energy_required = 10,
			ingredients = 
			{
			  {"boiler",1},
			  {"steel-plate",5},
			  {"concrete",5},
			},
			result = "bio_boiler",
			result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 15,
			ingredients = 
			{
			  {"boiler",2},
			  {"steel-plate",5},
			  {"concrete",5},
			},
			result = "bio_boiler",
			result_count = 1,
		},
		
	},
  
	-- BIO Reactor --
	{
		type = "recipe",
		name = "bi-bioreactor",
		normal =
		{
			enabled = false,
			energy_required = 20,
			ingredients = 
			{
			  {"assembling-machine-1",1},
			  {"steel-plate",5},
			  {"electronic-circuit",5},
			},
			result = "bi-bioreactor",
			result_count = 1,
		},
		expensive =
		{
			enabled = false,
			energy_required = 30,
			ingredients = 
			{
			  {"assembling-machine-1",2},
			  {"steel-plate",5},
			  {"electronic-circuit",5},
			},
			result = "bi-bioreactor",
			result_count = 1,
		},
		
	},
	
		-- PLASTIC 1 --
	{
		type = "recipe",
		name = "bi-plastic",
		category = "chemistry",
		subgroup = "raw-material",
		order = "g1[plastic-bar]",
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
	
		{
		type = "recipe",
		name = "bi-plastic-2",
		category = "chemistry",
		subgroup = "raw-material",
		order = "g2[plastic-bar]",
		energy_required = 2,
		ingredients =
		{
			{type="fluid", name="steam", amount=50},
			{type="item", name="bi-woodpulp", amount=10},
			{type="fluid", name="light-oil", amount=40},
		},
		results=
		{
			{type="item", name="plastic-bar", amount=10}
		},
		enabled = false,
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
			{type="fluid", name="liquid-air", amount=10},
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
		order = "[bi-cellulose-1]",
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
	{
		type = "recipe",
		name = "bi-cellulose-2",
		category = "chemistry",
		order = "[bi-cellulose-2]",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="steam", amount=50},
			{type="item", name="bi-woodpulp", amount=5},
			{type="fluid", name="sulfuric-acid", amount=50}, 
		},
		results=
		{
			{type="item", name="bi-cellulose", amount=15 }
		},
		enabled = false,
	},
})