if BI.Settings.Bio_Cannon then

	data:extend({

	  -- Prototype Artillery Proto Ammo
	 {
		type= "recipe",
		name= "bi_recipe_bio_cannon_proto_ammo",
		enabled = false,
		energy_required = 2,
		ingredients = {{"iron-plate", 10}, {"explosives", 10}},
		result = "bi-bio-cannon-proto-ammo",
		result_count = 1,
	 },

	 -- Prototype Artillery Basic Ammo
	 {
		type= "recipe",
		name= "bi_recipe_bio_cannon_basic_ammo",
		enabled = false,
		energy_required = 4,
		ingredients = {{"bi-bio-cannon-proto-ammo", 1}, {"rocket", 10}},
		result = "bi-bio-cannon-basic-ammo",
		result_count = 1,
	 },
	 
	 -- Prototype Artillery Poison Ammo
	 {
		type= "recipe",
		name= "bi_recipe_bio_cannon_poison_ammo",
		enabled = false,
		energy_required = 8,
		ingredients = {{"bi-bio-cannon-basic-ammo", 1},{"poison-capsule", 5}, {"explosive-rocket", 5}},
		result = "bi-bio-cannon-poison-ammo",
		result_count = 1,
	 },

	 })
 
 end