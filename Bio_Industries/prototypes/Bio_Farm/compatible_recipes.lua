

data:extend({
	{
		type = "recipe",
		name = "bi_recipe_pellete_coal_2",
		icon = "__Bio_Industries__/graphics/icons/pellet_coke_b.png",
		icon_size = 32,
		category = "biofarm-mod-smelting",
		subgroup = "bio-bio-farm-raw",
		order = "a[bi]-a-e[bi-coke-coal]-2",
		energy_required = 4,
		ingredients = {},
		result = "pellet-coke",
		result_count = 1,
		enabled = false,
	},
	
	-- fertiliser from sodium-hydroxide--
	{
		type = "recipe",
		name = "bi_recipe_fertiliser_2",
		icon = "__Bio_Industries__/graphics/icons/fertiliser_sodium_hydroxide.png",
		icon_size = 32,
		category = "chemistry",
		energy_required = 5,	
		ingredients =
		{
			{type="fluid", name="nitrogen", amount=10},
			{type="item", name="bi-ash", amount=10}
		},
		results=
		{
			{type="item", name="fertiliser", amount=5}
		},
		enabled = false,
		subgroup = "bio-bio-farm-intermediate-product",
		order = "b[fertiliser]",
	},

})


--update crushed stone icon
data.raw.item["stone-crushed"].icon = "__Bio_Industries__/graphics/icons/crushed-stone.png"
	
	
	
 -- Pellet-Coke from Carbon - Bobs & Angels
if data.raw.item["solid-carbon"] and mods["angelspetrochem"] then
	
	thxbob.lib.recipe.add_new_ingredient ("bi_recipe_pellete_coal_2", {type="item", name="solid-carbon", amount=8})
	data.raw.recipe["bi_recipe_pellete_coal_2"].icon = "__Bio_Industries__/graphics/icons/pellet_coke_a.png"
	thxbob.lib.tech.add_recipe_unlock("bi-tech-coal-processing-2", "bi_recipe_pellete_coal_2")
	
elseif data.raw.item["carbon"] and mods["bobplates"] then

	thxbob.lib.recipe.add_new_ingredient ("bi_recipe_pellete_coal_2", {type="item", name="carbon", amount=8})
	data.raw.recipe["bi_recipe_pellete_coal_2"].icon = "__Bio_Industries__/graphics/icons/pellet_coke_b.png"
	thxbob.lib.tech.add_recipe_unlock("bi-tech-coal-processing-2", "bi_recipe_pellete_coal_2")
		
end

--- Add fertiliser recipes if bob's or Angels
if data.raw.item["solid-sodium-hydroxide"] and mods["angelspetrochem"] then

	thxbob.lib.recipe.add_new_ingredient ("bi_recipe_fertiliser_2", {type="item", name="solid-sodium-hydroxide", amount=10})
	data.raw.recipe["bi_recipe_fertiliser_2"].icon = "__Bio_Industries__/graphics/icons/fertiliser_solid_sodium_hydroxide.png"
	thxbob.lib.tech.add_recipe_unlock("bi_tech_fertiliser", "bi_recipe_fertiliser_2")

elseif data.raw.item["sodium-hydroxide"] and mods["bobplates"] then

	thxbob.lib.recipe.add_new_ingredient ("bi_recipe_fertiliser_2", {type="item", name="sodium-hydroxide", amount=10})
	thxbob.lib.tech.add_recipe_unlock("bi_tech_fertiliser", "bi_recipe_fertiliser_2")
	
end	

-- If Angels, replace nitrogen with gas-nitrogen
if data.raw.item["gas-nitrogen"] and mods["angelspetrochem"] then

	thxbob.lib.recipe.replace_ingredient("bi_recipe_nitrogen", "nitrogen", "gas-nitrogen")

end

-- If Angels, replace liquid-air with gas-compressed-air
if data.raw.item["gas-nitrogen"] and mods["angelspetrochem"] then

	thxbob.lib.recipe.replace_ingredient("bi_recipe_liquid_air", "liquid-air", "gas-compressed-air")

end


--- Make Bio Farm use glass if Bob's
if data.raw.item.glass  then
	thxbob.lib.recipe.replace_ingredient("bi_recipe_bio_farm", "copper-cable", "glass")
end


--- Bio Drill Updates
if data.raw.item["steel-gear-wheel"]  and data.raw.recipe["bi_recipe_drill_mk2"] then
	thxbob.lib.recipe.replace_ingredient("bi_recipe_drill_mk2", "steel-plate", "steel-gear-wheel")
end

if data.raw.item["titanium-plate"]  and data.raw.recipe["bi_recipe_drill_mk3"] then
	thxbob.lib.recipe.replace_ingredient("bi_recipe_drill_mk3", "advanced-circuit", "titanium-plate")
end



--- Adding in some recipe's to use up Wood Pulp (Ash and Charcoal) and Crushed Stone
if mods["angelsrefining"] then 

data:extend({
	
		-- Charcoal and Crushed Stone Sink
		{
			type = "recipe",
			name = "bi_recipe_mineralized_sulfuric_waste",
			icon = "__Bio_Industries__/graphics/icons/bi_mineralized_sulfuric.png",
			icon_size = 32,
			category = "liquifying",
			subgroup = "water-treatment",
			energy_required = 2,	
			ingredients =
			{
				{type="fluid", name="water-purified", amount=100},
				{type="item", name="stone-crushed", amount=90},
				{type="item", name="bi-charcoal", amount=30},
			},
			results=
			{
				{type="fluid", name="water-yellow-waste", amount=40},
				{type="fluid", name="water-mineralized", amount=60},
			},
			enabled = false,
			order = "a[water-water-mineralized]-2",
		},

		-- Ash and Crushed Stone Sink
		{
			type = "recipe",
			name = "bi_recipe_slag_slurry",
			icon = "__Bio_Industries__/graphics/icons/bi_slurry.png",
			icon_size = 32,
			category = "liquifying",
			subgroup = "liquifying",
			energy_required = 4,	
			ingredients =
			{
				{type="fluid", name="water-saline", amount=50},
				{type="item", name="stone-crushed", amount=90},
				{type="item", name="bi-ash", amount=40},
			},
			results=
			{
				{type="fluid", name="slag-slurry", amount=100},
			},
			enabled = false,
			order = "i [slag-processing-dissolution]-2",
		},
	})

	thxbob.lib.tech.add_recipe_unlock("water-treatment", "bi_recipe_mineralized_sulfuric_waste")
	thxbob.lib.tech.add_recipe_unlock("slag-processing-1", "bi_recipe_slag_slurry")
	
end