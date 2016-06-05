function bobmods.lib.replace_recipe_item (recipe, old, new)
  if data.raw.recipe[recipe] then
    local amount = 0
    for i, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
      if ingredient[1] == old then
        amount = ingredient[2] + amount
      end
      if ingredient.name == old then
        amount = ingredient.amount + amount
      end
    end
    if amount > 0 then
      bobmods.lib.remove_recipe_item (recipe, old)
      bobmods.lib.add_recipe_item (recipe, {new, amount})
    end
  end
end

function bobmods.lib.replace_recipe_item_crude (recipe, old, new)
  if data.raw.recipe[recipe] then
    for i, ingredient in pairs(data.raw.recipe[recipe].ingredients) do
      if ingredient[1] == old or ingredient.name == old then
        local item = bobmods.lib.basic_item(ingredient)
        item.name = new
        item.type = bobmods.lib.get_basic_item_type(new)
        ingredient = item
      end
    end
  end
end

function bobmods.lib.replace_item_all_recipes (old, new)
  for i, recipe in pairs(data.raw.recipe) do
    bobmods.lib.replace_recipe_item (recipe.name, old, new)
  end
end

function bobmods.lib.remove_recipe_item (recipe, item)
  if data.raw.recipe[recipe] then
    bobmods.lib.remove_item(data.raw.recipe[recipe].ingredients, item)
  end
end

function bobmods.lib.add_new_recipe_item (recipe, item)
  if data.raw.recipe[recipe] then
    bobmods.lib.add_new_item(data.raw.recipe[recipe].ingredients, bobmods.lib.basic_item(item))
  end
end

function bobmods.lib.add_recipe_item (recipe, item)
  if data.raw.recipe[recipe] then
    bobmods.lib.add_item(data.raw.recipe[recipe].ingredients, bobmods.lib.basic_item(item))
  end
end


function bobmods.lib.add_recipe_result(recipe, item)
  if data.raw.recipe[recipe] then
    bobmods.lib.result_check(data.raw.recipe[recipe])
    bobmods.lib.add_item(data.raw.recipe[recipe].results, item)
  end
end

function bobmods.lib.remove_recipe_result(recipe, item)
  if data.raw.recipe[recipe] then
    bobmods.lib.result_check(data.raw.recipe[recipe])
    bobmods.lib.remove_item(data.raw.recipe[recipe].results, item)
  end
end



