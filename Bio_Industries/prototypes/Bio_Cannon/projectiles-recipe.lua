data:extend({

  -- Hive Buster Ammo
 {
    type= "recipe",
    name= "bi_recipe_bio_cannon_basic_ammo",
    enabled = false,
	energy_required = 4,
	ingredients = {{"iron-plate", 10}, {"rocket", 10}},
    result = "Bio_Cannon_Basic_Ammo",
	result_count = 1,
 },
 {
    type= "recipe",
    name= "bi_recipe_bio_cannon_poison_ammo",
    enabled = false,
	energy_required = 8,
	ingredients = {{"Bio_Cannon_Basic_Ammo", 1},{"poison-capsule", 5}, {"explosive-rocket", 5}},
    result = "Bio_Cannon_Poison_Ammo",
	result_count = 1,
 },

 })