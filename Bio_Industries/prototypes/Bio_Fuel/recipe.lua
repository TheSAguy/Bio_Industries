

data:extend({

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
	
	

	
	----_______________________ NEW _______________________________
	
		-- CELLULOSE --
	{
		type = "recipe",
		name = "bi-cellulose-1",
		icon = "__Bio_Industries__/graphics/icons/cellulose.png",
		category = "chemistry",
		order = "[bi-cellulose-1]",
		energy_required = 20,
		ingredients =
		{
			{type="item", name="bi-woodpulp", amount=10},
			{type="fluid", name="sulfuric-acid", amount=10}, 
		},
		results=
		{
			{type="item", name="bi-cellulose", amount=10 }
		},
		enabled = false,
	},
	
	{
		type = "recipe",
		name = "bi-cellulose-2",
		icon = "__Bio_Industries__/graphics/icons/cellulose_2.png",
		category = "chemistry",
		order = "[bi-cellulose-2]",
		energy_required = 5,
		ingredients =
		{
			{type="fluid", name="steam", amount=10},
			{type="item", name="bi-woodpulp", amount=10},
			{type="fluid", name="sulfuric-acid", amount=20}, 
		},
		results=
		{
			{type="item", name="bi-cellulose", amount=10 }
		},
		enabled = false,
	},
	
	
		-- PLASTIC --
	{
		type = "recipe",
		name = "bi-plastic-1",
		icon = "__Bio_Industries__/graphics/icons/plastic_bar_1.png",
		category = "chemistry",
		subgroup = "raw-material",
		order = "g[plastic-bar-1]",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="steam", amount=10},
			{type="item", name="raw-wood", amount=10},
			{type="fluid", name="light-oil", amount=20},
		},
		results=
		{
			{type="item", name="plastic-bar", amount=2}
		},
		enabled = false,
	},
	
		{
		type = "recipe",
		name = "bi-plastic-2",
		icon = "__Bio_Industries__/graphics/icons/plastic_bar_2.png",
		category = "chemistry",
		subgroup = "raw-material",
		order = "g[plastic-bar-2]",
		energy_required = 1,
		ingredients =
		{
			{type="item", name="bi-cellulose", amount=1},
			{type="fluid", name="petroleum-gas", amount=10},
		},
		results=
		{
			{type="item", name="plastic-bar", amount=2}
		},
		enabled = false,
	},
	

			-- BIOMASS --
	{
		type = "recipe",
		name = "bi-biomass-1",
		icon = "__Bio_Industries__/graphics/icons/biomass_1.png",
		category = "biofarm-mod-bioreactor",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="water", amount=90},
			{type="fluid", name="liquid-air", amount=10},
			{type="fluid", name="bi-biomass", amount=10},
			--{type="item", name="bi-cellulose", amount=10}
		},
		results=
		{
			{type="fluid", name="bi-biomass", amount=50},
		},
		enabled = false,
		subgroup = "fluid-recipes",
		order = "x[oil-processing]-z1[bi-biomass]"
	},	
	
	{
		type = "recipe",
		name = "bi-biomass-2",
		icon = "__Bio_Industries__/graphics/icons/biomass_2.png",
		category = "biofarm-mod-bioreactor",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="water", amount=90},
			{type="fluid", name="liquid-air", amount=10},
			{type="fluid", name="bi-biomass", amount=10},
			--{type="item", name="bi-cellulose", amount=10},
			{type="item", name="bi-ash", amount=10},		
		},
		results=
		{
			{type="fluid", name="bi-biomass", amount=100},
		},
		enabled = false,
		subgroup = "fluid-recipes",
		order = "x[oil-processing]-z2[bi-biomass]"
	},	
	
	{
		type = "recipe",
		name = "bi-biomass-3",
		icon = "__Bio_Industries__/graphics/icons/biomass_3.png",
		category = "biofarm-mod-bioreactor",
		energy_required = 60,
		ingredients =
		{
			{type="fluid", name="water", amount=100},
			{type="item", name="fertiliser", amount=10},
		},
		results=
		{
			{type="fluid", name="bi-biomass", amount=10},
		},
		enabled = false,
		subgroup = "fluid-recipes",
		order = "x[oil-processing]-z3[bi-biomass]"
	},	
	
	---- Biomass to Light-oil

  {
    type = "recipe",
    name = "bi-biomass_conversion-1",
	icon = "__Bio_Industries__/graphics/icons/bio_conversion_1.png", 
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
		{type="fluid", name="bi-biomass", amount=100},
		{type="fluid", name="water", amount=10},
    },
    results=
    {
	    {type="item", name="bi-cellulose", amount=2},
		{type="fluid", name="light-oil", amount=80},
    },
    
    subgroup = "fluid-recipes",  
	order = "a[oil-processing]-b[advanced-oil-processing]-y[bi-Fuel_Conversion]",
  },

  	---- Biomass to PG

  {
    type = "recipe",
    name = "bi-biomass_conversion-2",
	icon = "__Bio_Industries__/graphics/icons/bio_conversion_2.png", 
    category = "oil-processing",
    enabled = false,
    energy_required = 5,
    ingredients =
    {
		{type="fluid", name="bi-biomass", amount=10},
		{type="fluid", name="water", amount=10},
    },
    results=
    {
	    {type="fluid", name="petroleum-gas", amount=20}
    },
    
    subgroup = "fluid-recipes",  
	order = "a[oil-processing]-b[advanced-oil-processing]-y[bi-Fuel_Conversion]",
  },

  --- Bio Battery
  	
	{
		type = "recipe",
		name = "bi-battery",
		icon = "__Bio_Industries__/graphics/icons/bio_battery.png",
		category = "chemistry",
		energy_required = 5,
		ingredients =
		{
			{type="item", name="plastic-bar", amount=1},
			{type="fluid", name="bi-biomass", amount=10},
			{type="item", name="bi-cellulose", amount=1},	
		},
		results=
		{
			{type="item", name="battery", amount=1},	
		},
		enabled = false,
		crafting_machine_tint =
		{
			primary = {r = 0.970, g = 0.611, b = 0.000, a = 0.000}, -- #f79b0000
			secondary = {r = 0.000, g = 0.680, b = 0.894, a = 0.357}, -- #00ade45b
			tertiary = {r = 0.430, g = 0.805, b = 0.726, a = 0.000}, -- #6dcdb900
		}
	},	
	
	  --- Bio Acid
  	
	{
		type = "recipe",
		name = "bi-acid",
		icon = "__Bio_Industries__/graphics/icons/bio_acid.png",
		category = "chemistry",
		energy_required = 10,
		ingredients =
		{
			{type="fluid", name="water", amount=90},
			{type="fluid", name="bi-biomass", amount=10},
			{type="item", name="bi-cellulose", amount=5},
		},
		results=
		{
			{type="fluid", name="sulfuric-acid", amount=50}, 
		},
		enabled = false,
		subgroup = "fluid-recipes",
		crafting_machine_tint =
		{
			primary = {r = 0.875, g = 0.735, b = 0.000, a = 0.000}, -- #dfbb0000
			secondary = {r = 0.103, g = 0.940, b = 0.000, a = 0.000}, -- #1aef0000
			tertiary = {r = 0.564, g = 0.795, b = 0.000, a = 0.000}, -- #8fca0000
		}

	},	
	
		-- Sulfuric acid to Sulfur --
	{
		type = "recipe",
		name = "bi-sulfur",
		icon = "__Bio_Industries__/graphics/icons/bio_sulfur.png",
		category = "chemistry",
		energy_required = 10,		
		ingredients =
		{
			{type="fluid", name="sulfuric-acid", amount=10}, 
			{type="item", name="bi-ash", amount=10},
		},
		results=
		{
			{type="item", name="sulfur", amount=10}
		},
		enabled = false,
	},
	
			-- Sulfuric acid to Sulfur --IF ANGELS INSTALLED
	{
		type = "recipe",
		name = "bi-sulfur_angels",
		icon = "__Bio_Industries__/graphics/icons/bio_sulfur.png",
		category = "chemistry",
		energy_required = 10,		
		ingredients =
		{
			{type="fluid", name="sulfuric-acid", amount=50}, 
			{type="item", name="bi-ash", amount=10},
		},
		results=
		{
			{type="item", name="sulfur", amount=10}
		},
		enabled = false,
	},
	
	
})