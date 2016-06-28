function thxbob.lib.basic_item(inputs)
  return thxbob.lib.item.basic_item(inputs)
end

--[[ Cannot be used in legacy, due to new group conflict.
function thxbob.lib.item(inputs)
  return thxbob.lib.item.item(inputs)
end
]]--

function thxbob.lib.get_item_type(name)
  return thxbob.lib.item.get_type(name)
end

function thxbob.lib.get_basic_item_type(name)
  return thxbob.lib.item.get_basic_type(name)
end

function thxbob.lib.combine_items(item1_in, item2_in)
  return thxbob.lib.item.combine(item1_in, item2_in)
end

function thxbob.lib.add_item(list, item_in)
  thxbob.lib.item.add(list, item_in) --increments amount if exists
end

function thxbob.lib.add_new_item(list, item_in)
  thxbob.lib.item.add_new(list, item_in) --ignores if exists
end

function thxbob.lib.remove_item(list, item)
  thxbob.lib.item.remove(list, item)
end



function thxbob.lib.replace_science_pack (technology, old, new)
  thxbob.lib.tech.replace_science_pack (technology, old, new)
end

function thxbob.lib.add_new_science_pack (technology, pack, amount)
  thxbob.lib.tech.add_new_science_pack (technology, pack, amount)
end

function thxbob.lib.add_science_pack (technology, pack, amount)
  thxbob.lib.tech.add_science_pack (technology, pack, amount)
end

function thxbob.lib.remove_science_pack (technology, pack)
  thxbob.lib.tech.remove_science_pack (technology, pack)
end

function thxbob.lib.add_technology_recipe (technology, recipe)
  thxbob.lib.tech.add_recipe_unlock (technology, recipe)
end

function thxbob.lib.remove_technology_recipe (technology, recipe)
  thxbob.lib.tech.remove_recipe_unlock (technology, recipe)
end

function thxbob.lib.replace_technology_prerequisite (technology, old, new)
  thxbob.lib.tech.replace_prerequisite (technology, old, new)
end

function thxbob.lib.add_technology_prerequisite (technology, prerequisite)
  thxbob.lib.tech.add_prerequisite (technology, prerequisite)
end

function thxbob.lib.remove_technology_prerequisite (technology, prerequisite)
  thxbob.lib.tech.remove_prerequisite (technology, prerequisite)
end



function thxbob.lib.add_productivity_limitation(intermediate)
  thxbob.lib.module.add_productivity_limitation(intermediate)
end

function thxbob.lib.add_productivity_limitations(intermediates)
  thxbob.lib.module.add_productivity_limitations(intermediates)
end



function thxbob.lib.replace_recipe_item (recipe, old, new)
  thxbob.lib.recipe.replace_ingredient(recipe, old, new)
end

function thxbob.lib.replace_recipe_item_crude (recipe, old, new)
  thxbob.lib.recipe.replace_ingredient_crude(recipe, old, new)
end

function thxbob.lib.replace_item_all_recipes (old, new)
  thxbob.lib.recipe.replace_ingredient_in_all(old, new)
end

function thxbob.lib.remove_recipe_item (recipe, item)
  thxbob.lib.recipe.remove_ingredient(recipe, item)
end

function thxbob.lib.add_new_recipe_item (recipe, item)
  thxbob.lib.recipe.add_new_ingredient(recipe, item)
end

function thxbob.lib.add_recipe_item (recipe, item)
  thxbob.lib.recipe.add_ingredient(recipe, item)
end

function thxbob.lib.add_recipe_result(recipe, item)
  thxbob.lib.recipe.add_result(recipe, item)
end

function thxbob.lib.remove_recipe_result(recipe, item)
  thxbob.lib.recipe.remove_result(recipe, item)
end



function thxbob.lib.create_autoplace(inputs)
  return thxbob.lib.resource.create_autoplace(inputs)
end

function thxbob.lib.autoplace_peak(inputs)
  return thxbob.lib.resource.autoplace_peak(inputs)
end

function thxbob.lib.add_autoplace_peak(inputs)
  thxbob.lib.resource.add_autoplace_peak(inputs)
end

function thxbob.lib.add_item_to_resource(resource, item)
  thxbob.lib.resource.add_result(resource, item)
end

function thxbob.lib.remove_item_from_resource(resource, item)
  thxbob.lib.resource.remove_result(resource, item)
end

function thxbob.lib.stage_counts(stages, mult)
  return thxbob.lib.resource.stage_counts(stages, mult)
end

function thxbob.lib.ore_sprite(inputs)
  return thxbob.lib.resource.sprite(inputs)
end

function thxbob.lib.create_ore_item(inputs)
  thxbob.lib.resource.create_item(inputs)
end

function thxbob.lib.create_ore_resource(inputs)
  thxbob.lib.resource.create(inputs)
end

function thxbob.lib.create_ore_particle(inputs)
  thxbob.lib.resource.create_particle(inputs)
end

function thxbob.lib.generate_ore_data_stage(inputs)
  thxbob.lib.resource.generate_data_stage(inputs)
end

function thxbob.lib.generate_ore_updates_stage(inputs)
  thxbob.lib.resource.generate_updates_stage(inputs)
end

function thxbob.lib.generate_ore(inputs)
  thxbob.lib.resource.generate(inputs)
end



function thxbob.lib.machine_has_category(machine, category_in)
  return thxbob.lib.machine.has_category(machine, category_in)
end

function thxbob.lib.machine_add_category(machine, category)
  thxbob.lib.machine.add_category(machine, category)
end

function thxbob.lib.machine_type_if_category_add_category(machine_type, category, category_to_add)
  thxbob.lib.machine.type_if_add_category(machine_type, category, category_to_add)
end



